import assert from "node:assert/strict";
import test from "node:test";
import { assessBashCommand, isProtectedPath } from "./utils.ts";

test("auto mode allows routine development commands", () => {
	for (const command of ["npm test", "git status", "rg TODO src", "npm run check"]) {
		assert.equal(assessBashCommand(command).allowed, true, command);
	}
});

test("auto mode blocks high-risk shell commands", () => {
	for (const command of ["sudo rm -rf /", "git push origin main", "git reset --hard HEAD~1", "chmod -R 777 ."]) {
		const result = assessBashCommand(command);
		assert.equal(result.allowed, false, command);
		assert.match(result.reason ?? "", /auto mode/i);
	}
});

test("auto mode protects obvious secret files", () => {
	assert.equal(isProtectedPath(".env"), true);
	assert.equal(isProtectedPath("config/.env.local"), true);
	assert.equal(isProtectedPath("src/app.ts"), false);
});
