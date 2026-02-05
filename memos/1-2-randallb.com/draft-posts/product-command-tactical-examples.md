# Product Command in practice: Decks, tactics, and examples

Let's move from theory to tactics. Like I said earlier, I'm pretty sure this methodology applies to multiple domains, but we're going to focus exclusively on its application in agentic product creation.

We call the grouping of files a Deck. It's simplest to think of it as a gathering of individual documents (cards) into something that can be easily shared (a deck.) For our scenario, I'll be building a chatbot that gives someone startup advice.

## Four files (a Deck)

### INTENT.md

The most important part of the deck is the INTENT.md file. Our INTENT.md files have precisely this format:

```
# {{Title of intent}}

<Use this template to create new `INTENT.md` files. Copy the sections into the
target scope. Remove anything in angle brackets. Replace the title at the top.>

## Purpose

- <Why this scope exists.>

## End State

- <Conditions that define success; not feature lists.>

## Constraints

- <What must not happen.>

## Tradeoffs

- <Prioritized list of decisions already made (this over that).>

## Risk tolerance

- <How bold we can be.>

## Escalation conditions

- <When to pause or escalate.>

## Verification steps

- <Signals/metrics/commands that prove success.>

## Activation / revalidation

- <When should this intent start governing decisions? What must be true?>
- <When should this intent stop governing decisions? What condition ends or
  supersedes it?>
- <What should trigger a deliberate review/revalidation of this intent?>

## Appendix <optional>

### Inputs

- <Upstream intents, policies, or resources that informed this intent.>

### Related

- <Nearby projects or docs worth linking.>

```

_To be clear, we are NEVER writing a deck by hand. We always talk to LLMs and have them author and update the deck. (I'll explain why in a future post.)_

If all of the sections are filled in sufficiently, anyone (AI or otherwise) should be able to clearly understand the goal of the intent, and be able to operate independently to achieve the goal.

This INTENT.md file is the document of record for everyone who is executing on a project. Often times we'll create a companion README for the deck that keeps the status intact, but the INTENT is the only binding document.

The product command repo has some examples.

### PROMPT.md

The next document I build out is the PROMPT.md. In our case, this is going to be the "brains" of our chatbot. We'll be using the Gambit framework, but this isn't tooling specific. The idea is you need to describe the frame of mind you want your AI to be in, and not focus on specifics of how to act or how to behave.

Ideally, you're describing your assistant's persona, and then trying to give it a general sense of the user's persona that it will be working with generally.

### POLICY.md

POLICY.md is where you put your non building / intent bound information that should drive decision making. "Always do x", "never do x", "when confronted with situation x, response y is the best response."

This is the company handbook. This defines the non negotiable behaviors that your bot needs to have, and gives you a baseline to learn from. This is the "long-term memory". Any policy added introduces additional context, which means it should be thought of carefully. Policies should be thought of as long-lived, and changing prior policies results in more knock on effects, so ensuring they're up to date but not draconian (a challenge in most organizations) is key.

### AAR.md

AAR is **after action report**, directly modeled after the military 1:1. A fresh AAR signals the end of a cycle. In the case of projects, an AAR often can signal completion. In a bot, like we'll be building, an AAR is a periodic review that explains the behavior that is observed, and the changes / updates that should be made.

In a long-running project (our startup advice bot, for instance), it would be weird if the INTENT drastically updated after each AAR. Early on, the POLICY might be entirely blank, and each AAR drives the creation of the policy, but the INTENT is probably hopefully clear up front, and the AAR would be updating the intent to reduce ambiguity (ie introduce newly discovered tradeoffs).

## Five execution tactics

### Building projects

In practice, I usually follow a simple process.

1. I have the agent (Codex in medium mode in my case) go gather information about product command and the parent intents that our next project will relate to.
2. I give it a rough idea of what I'm trying to accomplish, without providing any detail.
3. It generally goes and creates a template draft
4. I read the draft thoroughly, and any single word I disagree with, I tell the LLM and it updates the intent so we agree explicitly on each word.
5. I shift my agent into xhigh, and I have it go look for potential ambiguity within the document.
6. I shift back into medium, clear up any remaining ambiguity, and commit / submit the document.

### Roadmapping

### README.md

### Long-lived INTENTs

### AAR as a method to reinforce behavior at inference time

## Outcomes

### Write less, ship more.

### Prompt less, ship more.

### Forget less, ship more.

### Blame less, ship more.

### Push the tempo, ship more

## Real world examples

### A monorepo

### A feature I built this morning

### Gambit: Our Product Command runtime

pete invented the term gambit

Why are policies separate from prompts?
