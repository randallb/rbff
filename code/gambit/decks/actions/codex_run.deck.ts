import { defineDeck } from "jsr:@bolt-foundry/gambit";
import { z } from "npm:zod";
import { Codex } from "npm:@openai/codex-sdk";

// Action deck: expose a minimal "run a Codex turn" tool to Gambit.
// This intentionally relies on the local Codex CLI login/session (~/.codex/*).
export default defineDeck({
  label: "codex_run",
  inputSchema: z.object({
    prompt: z.string().describe("The instruction to send to Codex."),
    workingDirectory: z.string().optional().describe(
      "Working directory for Codex. Defaults to current working directory.",
    ),
    sandboxMode: z.enum(["read-only", "workspace-write", "danger-full-access"])
      .optional()
      .describe("Codex sandbox mode. Default: read-only."),
    networkAccessEnabled: z.boolean().optional().describe(
      "Whether Codex can access the network for tools. Default: false.",
    ),
    webSearchEnabled: z.boolean().optional().describe(
      "Whether Codex can use web search. Default: false.",
    ),
    approvalPolicy: z.enum(["never", "on-request", "on-failure", "untrusted"])
      .optional()
      .describe("Codex approval policy. Default: never."),
    model: z.string().optional().describe(
      "Optional Codex model override. If omitted, Codex uses its default for the current account.",
    ),
  }),
  outputSchema: z.object({
    status: z.number(),
    threadId: z.string().optional(),
    finalResponse: z.string().optional(),
    items: z.any().optional(),
    error: z.string().optional(),
  }),
  async run(ctx) {
    try {
      const codex = new Codex();

      const thread = codex.startThread({
        workingDirectory: ctx.input.workingDirectory,
        skipGitRepoCheck: true,
        sandboxMode: ctx.input.sandboxMode ?? "read-only",
        networkAccessEnabled: ctx.input.networkAccessEnabled ?? false,
        webSearchEnabled: ctx.input.webSearchEnabled ?? false,
        approvalPolicy: ctx.input.approvalPolicy ?? "never",
        model: ctx.input.model,
      });

      const turn = await thread.run(ctx.input.prompt);

      return {
        status: 200,
        threadId: thread.id ?? undefined,
        finalResponse: turn.finalResponse,
        items: turn.items,
      };
    } catch (err) {
      return {
        status: 500,
        error: err instanceof Error ? err.message : String(err),
      };
    }
  },
});
