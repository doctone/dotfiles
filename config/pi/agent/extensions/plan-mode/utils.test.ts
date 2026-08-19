import assert from "node:assert/strict";
import test from "node:test";
import { buildPlanModeSystemPrompt } from "./utils.ts";

test("plan mode injects superpowers discipline without replacing the existing system prompt", () => {
	const prompt = buildPlanModeSystemPrompt("base prompt");

	assert.match(prompt, /^base prompt/);
	assert.match(prompt, /PLAN MODE ACTIVE/);
	assert.match(prompt, /\/skill:superpowers/);
	assert.match(prompt, /Before responding or acting, check whether any skill applies/);
});
