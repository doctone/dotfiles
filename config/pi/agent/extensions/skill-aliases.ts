import { readFile } from "node:fs/promises";
import { homedir } from "node:os";
import type { ExtensionAPI, ExtensionCommandContext } from "@earendil-works/pi-coding-agent";

interface SkillAlias {
	command: string;
	skillName: string;
	skillPath: string;
	description: string;
	noArgsPrompt: string;
}

const dotfiles = `${homedir()}/.dotfiles`;

const aliases: SkillAlias[] = [
	{
		command: "superpowers",
		skillName: "superpowers",
		skillPath: `${dotfiles}/config/pi/agent/skills/superpowers/SKILL.md`,
		description: "Use the Superpowers skill to choose the right workflow",
		noArgsPrompt: "Apply the Superpowers workflow to the current conversation and ask what to do next if needed.",
	},
	{
		command: "tdd",
		skillName: "tdd",
		skillPath: `${dotfiles}/config/opencode/skills/tdd/SKILL.md`,
		description: "Use the TDD skill for test-first implementation",
		noArgsPrompt: "Ask what behavior we should implement or change with TDD.",
	},
	{
		command: "grill-me",
		skillName: "grill-me",
		skillPath: `${dotfiles}/config/claude/skills/grill-me/SKILL.md`,
		description: "Use the Grill Me skill to interrogate a plan or design",
		noArgsPrompt: "Ask for the plan or design to grill, then proceed one question at a time.",
	},
];

export default function skillAliases(pi: ExtensionAPI) {
	for (const alias of aliases) {
		pi.registerCommand(alias.command, {
			description: alias.description,
			handler: async (args, ctx) => {
				await invokeSkillAlias(pi, alias, args, ctx);
			},
		});
	}
}

async function invokeSkillAlias(
	pi: ExtensionAPI,
	alias: SkillAlias,
	args: string,
	ctx: ExtensionCommandContext,
): Promise<void> {
	let skillContent: string;

	try {
		skillContent = await readFile(alias.skillPath, "utf8");
	} catch (error: unknown) {
		const message = error instanceof Error ? error.message : String(error);
		ctx.ui.notify(`Could not load ${alias.skillName} skill: ${message}`, "error");
		return;
	}

	const request = args.trim() || alias.noArgsPrompt;
	const message = [
		`The user invoked /${alias.command}. Execute the ${alias.skillName} skill now.`,
		`Skill file: ${alias.skillPath}`,
		`<skill name="${alias.skillName}">`,
		skillContent,
		"</skill>",
		"User request:",
		request,
	].join("\n\n");

	if (ctx.isIdle()) {
		pi.sendUserMessage(message);
		return;
	}

	pi.sendUserMessage(message, { deliverAs: "steer" });
	ctx.ui.notify(`Queued /${alias.command}`, "info");
}
