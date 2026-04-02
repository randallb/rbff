# rbff-scripts

This folder defines optional rbff subcommands.

## How it works

- Each command lives in `rbff-scripts/commands/<name>.ts`.
- Each command module must export `command`:

  - `name`: CLI name
  - `description`: one-line help
  - `run(args: string[], ctx: { repoRoot: string })`: handler

- `rbff doctor` regenerates `code/bin/rbff.commands.gen.ts` by scanning
  `rbff-scripts/commands/`.

## Notes

- The generated file is not meant to be edited by hand.
- Keep command modules small and predictable.
