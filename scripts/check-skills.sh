#!/bin/bash
# Validate the shared skill store: every skill has a SKILL.md whose frontmatter
# name matches its directory and which carries a non-empty description.
set -uo pipefail

SKILLS_DIR="${1:-$HOME/.dotfiles/skills}"
fail=0

for d in "$SKILLS_DIR"/*/; do
    n=$(basename "$d")
    f="$d/SKILL.md"

    if [[ ! -f "$f" ]]; then
        echo "✗ $n: no SKILL.md"
        fail=1
        continue
    fi

    name=$(sed -n 's/^name: *//p' "$f" | head -1 | tr -d '"')
    desc=$(sed -n 's/^description: *//p' "$f" | head -1 | tr -d '"')

    if [[ "$name" != "$n" ]]; then
        echo "✗ $n: frontmatter name is '$name'"
        fail=1
    fi

    if [[ -z "$desc" ]]; then
        echo "✗ $n: no description"
        fail=1
    fi
done

count=$(ls -d "$SKILLS_DIR"/*/ 2>/dev/null | wc -l | tr -d ' ')
if [[ $fail -eq 0 ]]; then
    echo "✅ $count skills OK"
else
    echo "❌ problems found in $count skills"
fi
exit $fail
