_This is the first of a series of posts explaining_ **_Product Command_**_._

**_Product command_** _is a coordination model for centralizing intent (the why, success conditions, and constraints), decentralizing execution (letting coworkers decide the less crucial detail), and aligning both through explicit verification steps._

_This contrasts with a command and control coordination model, where a commander is responsible for making decisions, and subordinates are responsible for execution._

_The end result is outputs (products) that require less effort to achieve better quality._

_This post focuses on the background of Product Command. The theory and tactical posts will follow shortly._

---

If you take anything away from this post… use this template with Codex or Claude Code before you ask it to build anything.

`Can you fill out these blanks before we start building so we can be on the same page?`

`Purpose:   End State:   Constraints:   Tradeoffs:   Allowed Changes:   Risk Tolerance:   When to escalate:   Testing + Verification plan:`

That prompt is copy / paste-able, and will save you more headaches when building with AI than anything else I’ve discovered.

---

## LLMs are a communication problem, not a computer science problem.

I haven’t written any code in 6 months. In the last month, I’ve been able to let Codex run unattended for 20-60m and get a feature right the first time.

The key? Quality communication. I’m a startup founder and software engineer, but I started my career as a journalist. That means I actually studied [Communication in college](https://www.weber.edu/communication/), not computer science.

CS and Comm might not be as divergent as you think. Weirdly these two fields have a shared heritage and patron saint: Claude Shannon.

Shannon describes a scientific definition for communication called [A Mathematical Theory of Communication](https://people.math.harvard.edu/~ctm/home/text/others/shannon/entropy/entropy.pdf). CS focuses on the math, communication studies focus on [the mechanisms](https://www.communicationtheory.org/shannon-and-weaver-model-of-communication/).

Computers are obviously a Computer Science problem. From 1950 to 2015, communication mechanisms were literal. Machine learning means [Bayesian regression](https://en.wikipedia.org/wiki/Bayesian_linear_regression). That means math, not words.

LLMs are different. Training time is still all math and builds the instincts of the model. But the intelligence part of artificial intelligence happens at inference time, not training time.

And inference time is communicated in words, not math.

Thanks for reading randallb.com! This post is public so feel free to share it.

[Share](%%share_url%%)

## Inference engineering

I’d like to introduce a new term: **Inference engineer**. An inference engineer is someone who manages both sides of Claude Shannon’s model... both the math and the mechanics. That means, yes, writing great prompts, but more importantly it means clear communication between the person using the AI, and the AI implementing it.

A few years back, I left Facebook to build a startup with my best friends. [Our startup](https://boltfoundry.com) helped take long videos and turn them into short ones using LLMs.

As we started to scale, the quality of our AI implementation didn’t. Our company’s biggest hurdle ended up being humans reviewing the quality of clips, not developing our product or marketing.

If AI is supposed to save time, it has to actually do that. And if it doesn’t, humans-in-the-loop behind the scenes have to cover for it. Our LLM wasn’t good enough, and so our business couldn’t scale without people. That made our team ask more fundamental questions.

How can we actually know something is reliable? How do we communicate our preferences to the AI? How can we communicate our users’ preferences to the AI?

[Sean Grove is one of the smartest people in this area](https://www.youtube.com/watch?v=8rABwKRsec4), and he turned me onto [Model Spec](https://model-spec.openai.com/2025-12-18.html), [Constitutional AI](https://www.anthropic.com/research/constitutional-ai-harmlessness-from-ai-feedback), and other concepts about how to align and verify model behavior.

He gave me the words to communicate what I was feeling: Communication with models defines success with AI. Specs are permanent, code is an artifact of a spec.

Programming will go away, specs will not.

## Learning -> building

We took this idea and tried to figure out a practical application. For the last year, t[our team](https://boltfoundry.com) has been working as sort of consultants... circling around ideas like [fine tuning](https://en.wikipedia.org/wiki/Fine-tuning_\(deep_learning\)), [evals](https://github.com/openai/evals), [execution frameworks](https://mastra.ai/), and [communication theories](https://contexteng.ai/p/context-engineering-101-the-hourglass) to fill a growing trust gap between model performance and consistent outputs.

We’ve worked with some great teams, and were always able to close their trust gaps in surprising ways. (I’ll be posting about those ways! Like and subscribe!)

Finally, we’ve figured out how to explain it. We call it **product command**.

**Product command is a coordination methodology** designed to create an environment for an agent **to discover the right information at precisely the right moment**.

That means agents, rather than humans tell agents precisely what to do. Humans instead describe their intent and leave the AI to build its own context windows sufficiently to do a task.

People (or other parent agents) are responsible for specifying what the goal is of the next interaction, and the agent is responsible for execution. People shouldn’t be digging in to see which tool calls were made, they should be specifying an intent and then ensuring that intent was met.

The most basic implementation is creating artifacts that say precisely the right amount of information to execute a plan, let agents execute that plan mostly unattended, and then learn from the execution to improve the loop. We’ll have more tactics and info as we go, but I want to take a second to explain why this works, and why human institutions don’t fundamentally get more effective as they scale.

## Product command is systematic Founder Mode

Any plan is created with incomplete or out-of-date information. No matter how thorough the planning, by the time it gets executed, new information will exist, and plans will be subject to changes. If a plan is flexible enough, it could achieve the goal, but too flexible and you won’t actually specify the goal well enough to achieve it in the first place.

Smaller companies get around this by minimizing the cycles between execution and strategy. But as they grow, the attention one person is able to devote to execution and strategy diminishes. Large organizations need coordinated strategy, but large organizations tend to execute bigger projects, more slowly and annoyingly than small organizations.

> As Airbnb grew, well-meaning people advised [Airbnb CEO Brian Chesky] that he had to run the company in a certain way for it to scale. Their advice could be optimistically summarized as “hire good people and give them room to do their jobs.” He followed this advice and the results were disastrous.[…]
> 
> The way managers are taught to run companies seems to be like modular design in the sense that you treat subtrees of the org chart as black boxes. You tell your direct reports what to do, and it's up to them to figure out how. But you don't get involved in the details of what they do. That would be micromanaging them, which is bad.[…]
> 
> [W]hat this often turns out to mean is: hire professional fakers and let them drive the company into the ground.

PG calls this distinction manager mode and its antethesis [Founder mode](https://paulgraham.com/foundermode.html).

Brian Chesky cites Steve Jobs as someone running a large company in founder mode. To avoid fakers in the middle, he [held an annual retreat](https://www.surfoffice.com/blog/steve-jobs-and-the-company-retreats-how-he-took-his-company-to-the-next-level) where he brought the most influential 100 people in the company together. These people were not the most senior 100, or highest org chart 100, they were the most influential.

The retreat is the tactic, but the strategy behind it is raising the [signal / noise ratio](https://en.wikipedia.org/wiki/Shannon%E2%80%93Hartley_theorem) (Claude Shannon’s term, might I add!) by getting the highest signal creators physically in the same area. This makes information flow quickly and at a high bandwidth.

The higher quality the information, obviously the more informed strategy.

I recently read this description of a president of Papermate in the 1970s.

> One of his strengths as a businessman was being able to synthesize both financial data and a strong sense of where the market was going from interacting with it as much as possible. His presentations of new products and marketing approaches were presented in ways that to some seemed like painting ideas. -- [Robert D Hales, Wikipedia](https://en.wikipedia.org/wiki/Robert_D._Hales#cite_ref-Eaton-and-Eyring_5-0:~:text=One%20of%20his,like%20painting%20ideas.)

Founder mode isn’t because somebody is micromanaging, or someone is in a small company, or that they founded the company… it’s that their flow of information is high enough to make the right decision, rather than prioritizing maintaining bureaucracy.

The constant of founder mode is not that there’s no hierarchy, it’s that the hierarchy cannot be allowed to obscure information flow.

The top of the pyramid, and the bottom of the pyramid, need to be eventually consistent, and the longer “eventually” is, the more disastrous the result.

[Subscribe now](%%checkout_url%%)

## George Washington’s original Founder Mode

What’s the best way to command troops? I’m not a military expert or historian, but my layman’s knowledge points toward founder mode as being an effective strategy. Notably, George Washington’s insurgency-turned-army was more founder mode than the Brits, and had a better outcome.

The [Byzantine generals’ problem](https://en.wikipedia.org/wiki/Byzantine_fault) isn’t just an academic theory, it was lived experience. In the 19th century, taking inspiration from Napoleon, the Prussian high command implemented a strategy that’s come to be known as [mission command](https://en.wikipedia.org/wiki/Mission_command).

> **Mission command** [...] combines centralized intent with decentralized execution [subsidiarity](https://en.wikipedia.org/wiki/Subsidiarity), and promotes freedom and speed of action, and initiative within defined constraints. Subordinates, understanding the commander’s intentions, their own missions, and the context of those missions, are told what effect they are to achieve and the reason that it needs to be achieved. Subordinates then decide within their delegated freedom of action how best to achieve their missions. -- [wikipedia](https://en.wikipedia.org/wiki/Mission_command)

The bad advice that permeates silicon valley is, “hire good people and give them room to work.” It sounds a lot like mission command. But I’d argue that advice generalizes the wrong lessons from mission command.

## Mission command is not manager mode

The goal of mission command is to prevent micromanagement because the outcomes from micromanaging military troops are disastrous. Militaries locked into specific tactics can’t react to on-the-ground pressures, and will lose more battles than they’ll win if decision tempo is sacrificed for information quality or bureaucratic latency.

But big companies explicitly sacrifice tempo for “chain of command,” aka bureaucracy maintenance. That’s why end up with the worst of both worlds: Strategy passed down from on high, filtered through self serving middle managers until an individual contributor executes some watered down version of the strategy.

Then, rather than information flowing back up quickly, the same middle managers are required to perform laborious reviews, which often take as much (or more) time than the actual implementation took in the first place. The cycles between front-line execution and strategic choices are practically infinite.

Metrics provide some verification at a much lower latency, but also at a much lower bandwidth. Intent and execution aren’t directly correlated, and that’s how you end up with [a/b testing yourself into 41 different shades of blue](https://medium.com/accredian/googles-41-shades-of-blue-a-b-testing-impact-185c6067f3c9).

## Product command is mission command for non-military use.

Product command is the opposite of silicon valley manager mode: Centralize intent, distribute execution and standardize verification + learning without sacrificing tempo.

Good: making strategic plans, being thoughtful, having organizations larger than [Dunbar’s number](https://en.wikipedia.org/wiki/Dunbar%27s_number).

Bad: Draconian reviews, slow information flow, and unclear intent.

If successful, an unlimited number of independent agents should be able to solve a problem together. Coordination costs shouldn’t dictate scale or quality, only communication quality should.