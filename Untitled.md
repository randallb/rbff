
gambit run code/gambit/decks/codex-bridge.deck.md \
    --context '"Summarize what this rbff repo is for and suggest next steps."' --stream

/Users/randallb/code/bolt-foundry/bfmono/infra/bin/gambit run code/gambit/decks/actions/codex_run.deck.ts \
    --context '{"prompt":"Reply with exactly: ok","workingDirectory":"/Users/randallb/code/rbff"}'

/Users/randallb/code/bolt-foundry/bfmono/infra/bin/gambit run code/gambit/decks/openrouter-codex-assist.deck.md \
    --context '"Figure out what rbff is, then ask Codex to list the top 5 files I should read first."' --stream