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
	return `${systemPrompt}\n\n[PLAN MODE ACTIVE]\nYou are in plan mode. Before responding or acting, check whether any skill applies by using /skill:superpowers discipline. If there is even a small chance a skill applies, follow that skill before gathering files, asking clarifying questions, or proposing implementation.\n\nIn plan mode, prefer deliberate planning before edits: clarify the intended outcome, inspect only what is needed, identify relevant tests or validation, and present a concise plan before making behavior-changing code edits unless the user explicitly asks you to execute immediately. Normal mode does not require this superpowers-first discipline unless the user explicitly asks for it or project instructions require it.`;
}
