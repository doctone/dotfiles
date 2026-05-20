export const AUTO_MODE_TOOLS = ["read", "bash", "edit", "write", "grep", "find", "ls"] as const;

export interface CommandAssessment {
	allowed: boolean;
	reason?: string;
}

const HIGH_RISK_BASH_PATTERNS: Array<{ pattern: RegExp; label: string }> = [
	{ pattern: /\bsudo\b/i, label: "sudo" },
	{ pattern: /\bsu\b/i, label: "su" },
	{ pattern: /\brm\s+[^\n;|&]*(-rf|-fr|--recursive)/i, label: "recursive removal" },
	{ pattern: /\brm\s+[^\n;|&]*(\/|~|\$HOME)(\s|$)/i, label: "broad removal target" },
	{ pattern: /\bgit\s+push\b/i, label: "git push" },
	{ pattern: /\bgit\s+reset\s+--hard\b/i, label: "git reset --hard" },
	{ pattern: /\bgit\s+clean\s+(-[^\n;|&]*f|[^\n;|&]*-[^\n;|&]*f)/i, label: "git clean force" },
	{ pattern: /\bchmod\s+[^\n;|&]*-R[^\n;|&]*777\b/i, label: "recursive chmod 777" },
	{ pattern: /\bchown\s+[^\n;|&]*-R\b/i, label: "recursive chown" },
	{ pattern: /\b(shutdown|reboot|halt)\b/i, label: "system shutdown" },
	{ pattern: /\b(killall|pkill)\b/i, label: "process killing" },
	{ pattern: /\b(systemctl|service)\s+\S+\s+(stop|restart|disable)\b/i, label: "service mutation" },
];

const PROTECTED_PATH_PATTERNS = [
	/(^|\/)\.env(\.|$)/i,
	/(^|\/)\.env$/i,
	/(^|\/)\.npmrc$/i,
	/(^|\/)\.pypirc$/i,
	/(^|\/)id_rsa$/i,
	/(^|\/)id_ed25519$/i,
	/(^|\/)\.ssh\//i,
];

export function assessBashCommand(command: string): CommandAssessment {
	const match = HIGH_RISK_BASH_PATTERNS.find(({ pattern }) => pattern.test(command));
	if (!match) return { allowed: true };

	return {
		allowed: false,
		reason: `Auto mode blocked high-risk command (${match.label}). Run it manually if you really intend to.`,
	};
}

export function isProtectedPath(path: string): boolean {
	return PROTECTED_PATH_PATTERNS.some((pattern) => pattern.test(path));
}
