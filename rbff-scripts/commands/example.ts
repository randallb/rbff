export type RbffContext = {
  repoRoot: string;
};

export type RbffCommand = {
  name: string;
  description: string;
  run: (args: string[], ctx: RbffContext) => Promise<void> | void;
};

export const command: RbffCommand = {
  name: "example",
  description: "example command (prints repo root)",
  run(_args, ctx) {
    console.log(`rbff repo root: ${ctx.repoRoot}`);
  },
};
