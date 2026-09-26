import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const agentsPath = new URL("../../AGENTS.md", import.meta.url);

test("agent instructions preserve the user's removal preference", async () => {
 const agents = await readFile(agentsPath, "utf8");
 assert.match(agents, /Do not install, restore, invoke, or recommend Superpowers/);
 const aliases = await readFile(new URL("../skill-aliases.ts", import.meta.url), "utf8");
 assert.doesNotMatch(aliases, /superpowers/i);
});
