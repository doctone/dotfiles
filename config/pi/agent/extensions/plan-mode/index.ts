import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";
import { buildPlanModeSystemPrompt, parsePlanModeAction } from "./utils.ts";

interface PlanModeState {
	enabled: boolean;
}

export default function planModeExtension(pi: ExtensionAPI): void {
	let enabled = false;

	pi.registerFlag("plan", {
		description: "Start in plan mode",
		type: "boolean",
		default: false,
	});

	function persistState(): void {
		pi.appendEntry("plan-mode-state", { enabled } satisfies PlanModeState);
	}

	function updateStatus(ctx: ExtensionContext): void {
		if (enabled) {
			ctx.ui.setStatus("plan-mode", ctx.ui.theme.fg("accent", "plan:on"));
		} else {
			ctx.ui.setStatus("plan-mode", undefined);
		}
	}

	function setPlanMode(nextEnabled: boolean, ctx: ExtensionContext, options?: { quiet?: boolean }): void {
		if (nextEnabled === enabled) {
			updateStatus(ctx);
			if (!options?.quiet && ctx.hasUI) {
				ctx.ui.notify(`Plan mode already ${enabled ? "enabled" : "disabled"}.`, "info");
			}
			return;
		}

		enabled = nextEnabled;
		updateStatus(ctx);
		persistState();

		if (!options?.quiet && ctx.hasUI) {
			ctx.ui.notify(`Plan mode ${enabled ? "enabled" : "disabled"}.`, "info");
		}
	}

	function togglePlanMode(ctx: ExtensionContext): void {
		setPlanMode(!enabled, ctx);
	}

	pi.registerCommand("plan", {
		description: "Toggle plan mode, or use /plan on, /plan off, /plan status",
		handler: async (args, ctx) => {
			const action = parsePlanModeAction(args);
			if (action === "on") {
				setPlanMode(true, ctx);
				return;
			}
			if (action === "off") {
				setPlanMode(false, ctx);
				return;
			}
			if (action === "status") {
				ctx.ui.notify(`Plan mode is ${enabled ? "enabled" : "disabled"}.`, "info");
				return;
			}
			if (action === "toggle") {
				togglePlanMode(ctx);
				return;
			}

			ctx.ui.notify(`Unknown /plan argument: ${args}. Use on, off, or status.`, "warning");
		},
	});

	pi.registerShortcut("ctrl+alt+p", {
		description: "Toggle plan mode",
		handler: async (ctx) => togglePlanMode(ctx),
	});

	pi.on("before_agent_start", async (event) => {
		if (!enabled) return undefined;

		return {
			systemPrompt: buildPlanModeSystemPrompt(event.systemPrompt),
		};
	});

	pi.on("session_start", async (_event, ctx) => {
		const entries = ctx.sessionManager.getEntries();
		const stateEntry = entries
			.filter((entry: { type: string; customType?: string }) => {
				return entry.type === "custom" && entry.customType === "plan-mode-state";
			})
			.pop() as { data?: PlanModeState } | undefined;

		const flagEnabled = pi.getFlag("plan") === true;
		const restoredEnabled = stateEntry?.data?.enabled === true;
		if (flagEnabled || restoredEnabled) {
			setPlanMode(true, ctx, { quiet: true });
		} else {
			updateStatus(ctx);
		}
	});
}
