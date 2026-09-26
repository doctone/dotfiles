import assert from "node:assert/strict";
import test from "node:test";
import { buildPlanModeSystemPrompt } from "./utils.ts";

test("plan mode preserves the base prompt and adds proportional planning guidance", () => {
 const prompt = buildPlanModeSystemPrompt("base prompt");
 assert.match(prompt, /^base prompt/);
 assert.match(prompt, /PLAN MODE ACTIVE/);
 assert.match(prompt, /present a concise plan/);
 assert.match(prompt, /unless the user explicitly asks you to execute immediately/);
 assert.doesNotMatch(prompt, /superpowers|\/skill:/i);
});
