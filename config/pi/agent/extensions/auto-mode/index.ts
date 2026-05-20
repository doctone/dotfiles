import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";
import { assessBashCommand, AUTO_MODE_TOOLS, isProtectedPath } from "./utils.ts";

interface AutoModeState {
	enabled: boolean;
}

function getStringProperty(input: unknown, key: string): string | undefined {
	if (typeof input !== "object" || input === null) return undefined;
	const value = (input as Record<string, unknown>)[key];
	return typeof value === "string" ? value : undefined;
}

export default function autoModeExtension(pi: ExtensionAPI): void {
	let enabled = false;
	let originalTools: string[] | undefined;

	pi.registerFlag("auto", {
		description: "Start in auto mode (looser command execution with a small safety blocklist)",
		type: "boolean",
		default: false,
	});

	function persistState(): void {
		pi.appendEntry("auto-mode-state", { enabled } satisfies AutoModeState);
	}

	function updateStatus(ctx: ExtensionContext): void {
		if (enabled) {
			ctx.ui.setStatus("auto-mode", ctx.ui.theme.fg("accent", "auto:on"));
		} else {
			ctx.ui.setStatus("auto-mode", undefined);
		}
	}

	function setAutoMode(nextEnabled: boolean, ctx: ExtensionContext, options?: { quiet?: boolean }): void {
		if (nextEnabled === enabled) {
			updateStatus(ctx);
			if (!options?.quiet && ctx.hasUI) {
				ctx.ui.notify(`Auto mode already ${enabled ? "enabled" : "disabled"}.`, "info");
			}
			return;
		}

		if (nextEnabled) {
			originalTools = pi.getActiveTools();
			const availableToolNames = new Set(pi.getAllTools().map((tool) => tool.name));
			const activeAutoTools = AUTO_MODE_TOOLS.filter((tool) => availableToolNames.has(tool));
			pi.setActiveTools(activeAutoTools);
			enabled = true;
			if (!options?.quiet && ctx.hasUI) {
				ctx.ui.notify(`Auto mode enabled. Active tools: ${activeAutoTools.join(", ")}`, "info");
			}
		} else {
			enabled = false;
			pi.setActiveTools(originalTools ?? ["read", "bash", "edit", "write"]);
			if (!options?.quiet && ctx.hasUI) {
				ctx.ui.notify("Auto mode disabled. Restored previous tools.", "info");
			}
		}

		updateStatus(ctx);
		persistState();
	}

	function toggleAutoMode(ctx: ExtensionContext): void {
		setAutoMode(!enabled, ctx);
	}

	pi.registerCommand("auto", {
		description: "Toggle auto mode, or use /auto on, /auto off, /auto status",
		handler: async (args, ctx) => {
			const action = args.trim().toLowerCase();
			if (action === "on" || action === "enable" || action === "enabled") {
				setAutoMode(true, ctx);
				return;
			}
			if (action === "off" || action === "disable" || action === "disabled") {
				setAutoMode(false, ctx);
				return;
			}
			if (action === "status") {
				ctx.ui.notify(`Auto mode is ${enabled ? "enabled" : "disabled"}.`, "info");
				return;
			}
			if (action.length > 0) {
				ctx.ui.notify(`Unknown /auto argument: ${args}. Use on, off, or status.`, "warning");
				return;
			}
			toggleAutoMode(ctx);
		},
	});

	pi.registerShortcut("ctrl+alt+a", {
		description: "Toggle auto mode",
		handler: async (ctx) => toggleAutoMode(ctx),
	});

	pi.on("before_agent_start", async (event) => {
		if (!enabled) return undefined;

		return {
			systemPrompt: `${event.systemPrompt}\n\n[AUTO MODE ACTIVE]\nAct more autonomously for routine coding work. Use available tools to inspect files, edit files, and run ordinary validation commands without asking for confirmation first. Do not ask whether to run obvious checks like tests, type checks, linters, git status, or local read-only inspection commands; run them when useful.\n\nStill be careful: do not perform destructive, irreversible, external, privilege-escalating, or secret-modifying actions unless the user explicitly asks. If a command is blocked by auto mode, explain the risk and ask the user to run it manually or explicitly approve a safer alternative.`,
		};
	});

	pi.on("tool_call", async (event, ctx) => {
		if (!enabled) return undefined;

		if (event.toolName === "bash") {
			const command = getStringProperty(event.input, "command");
			if (!command) return undefined;

			const assessment = assessBashCommand(command);
			if (!assessment.allowed) {
				return { block: true, reason: assessment.reason };
			}
		}

		if (event.toolName === "write" || event.toolName === "edit") {
			const path = getStringProperty(event.input, "path");
			if (path && isProtectedPath(path)) {
				if (ctx.hasUI) ctx.ui.notify(`Auto mode blocked secret-like path: ${path}`, "warning");
				return {
					block: true,
					reason: `Auto mode blocked edits to protected path ${path}. Ask explicitly or edit it manually.`,
				};
			}
		}

		return undefined;
	});

	pi.on("session_start", async (_event, ctx) => {
		const entries = ctx.sessionManager.getEntries();
		const stateEntry = entries
			.filter((entry: { type: string; customType?: string }) => {
				return entry.type === "custom" && entry.customType === "auto-mode-state";
			})
			.pop() as { data?: AutoModeState } | undefined;

		const flagEnabled = pi.getFlag("auto") === true;
		const restoredEnabled = stateEntry?.data?.enabled === true;
		if (flagEnabled || restoredEnabled) {
			setAutoMode(true, ctx, { quiet: true });
		} else {
			updateStatus(ctx);
		}
	});
}
