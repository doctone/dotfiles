# Auto Mode Extension

Looser execution mode for Pi, similar in spirit to Claude Code auto-mode.

## Usage

- `/auto` - toggle auto mode
- `/auto on` - enable auto mode
- `/auto off` - disable auto mode
- `/auto status` - show current status
- `Ctrl+Alt+A` - toggle auto mode
- `pi --auto` - start with auto mode enabled

After adding or changing this extension, run `/reload` in Pi.

## Behavior

When enabled, auto mode:

- enables common coding tools: `read`, `bash`, `edit`, `write`, `grep`, `find`, `ls`
- adds system instructions telling the model to run routine inspections, edits, tests, type checks, and linters without asking first
- shows `auto:on` in the footer
- restores the previous active tools when disabled

## Safety blocklist

Auto mode still blocks high-risk commands such as:

- `sudo ...`
- recursive/broad `rm` commands
- `git push`
- `git reset --hard`
- forced `git clean`
- recursive `chmod 777` / `chown`
- shutdown/reboot/service mutation commands

It also blocks writes/edits to obvious secret-like paths such as `.env`, `.npmrc`, `.pypirc`, and `.ssh/*`.
