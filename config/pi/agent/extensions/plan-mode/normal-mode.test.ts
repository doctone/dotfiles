import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const agentsPath = new URL("../../AGENTS.md", import.meta.url);

test("normal mode AGENTS instructions do not require superpowers at the start of every task", async () => {
	const agents = await readFile(agentsPath, "utf8");

	assert.doesNotMatch(agents, /Use the Superpowers discipline\. At the start of each task/i);
	assert.doesNotMatch(agents, /check whether a skill applies before responding or acting/i);
});
