export type PlanModeAction = "toggle" | "on" | "off" | "status";

export function parsePlanModeAction(args: string): PlanModeAction | undefined {
	const action = args.trim().toLowerCase();
	if (action.length === 0) return "toggle";
	if (action === "on" || action === "enable" || action === "enabled") return "on";
	if (action === "off" || action === "disable" || action === "disabled") return "off";
	if (action === "status") return "status";
	return undefined;
}

export function buildPlanModeSystemPrompt(systemPrompt: string): string {
	return `${systemPrompt}\n\n[PLAN MODE ACTIVE]\nYou are in plan mode. Clarify the intended outcome, inspect what is needed, identify relevant validation, and present a concise plan before behavior-changing edits unless the user explicitly asks you to execute immediately. Keep the process proportional to the task.`;
}
