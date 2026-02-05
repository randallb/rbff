# Build less, ship more: Use Product Command to build high quality output with agentic coworkers

>Product command is a coordination model for centralizing intent (the why, success conditions, and constraints), decentralizing execution (letting coworkers decide the less crucial detail), and aligning both through explicit verification steps.
>
>This contrasts with a command and control coordination model, where a commander is responsible for making decisions, and subordinates are responsible for execution.
>
>The end result is higher quality output (products) that require less effort to achieve higher quality.

If you take anything away from this conversation make it this:

```
Can you fill out these blanks before we start building so we can be on the same page?

Purpose:
End State:
Constraints:
Tradeoffs:
Allowed Changes:
Risk Tolerance:
When to escalate:
Testing + Verification plan:
```

That prompt is copy / pasteable, and will save you more headaches when building with AI than anything else I've discovered.

## LLMs are a communication problem, not a computer science problem.

I haven't written any code in 6 months. In the last month, I've been able to let Codex run unattended for 20-60m and get a feature right the first time.

The key? Quality communication. I'm a startup founder and software engineer, but I started my career as a journalist. That means I actually studied [Communication in college](https://www.weber.edu/communication/), not computer science.

They might not be as divergent as you think. Humanities vs math seems like a big leap, but weirdly they have a shared heritage and patron saint: Claude Shannon. He describes a scientific definition for communication called [A Mathematical Theory of Communication](https://people.math.harvard.edu/~ctm/home/text/others/shannon/entropy/entropy.pdf). While CS focuses on the math, communication students flip that and study [the mechanisms as the primary focus](https://www.communicationtheory.org/shannon-and-weaver-model-of-communication/).

Until LLMs, AI was decidedly a computer science problem. Figuring out tensors, embeddings, and all of the [basics of AI](https://course.fast.ai/) meant machine learning. Machine learning means [Bayesian regression](https://en.wikipedia.org/wiki/Bayesian_linear_regression) normally. That means math and CS, no communication.

LLMs are tricky though. Since you talk to them the same way you talk to any person, the communication mechanisms are now just as important when using LLMs as the math. Training time is for math, and builds the instincts of the model, but inference time is for communication, and builds the "mindset" of the model.

Most of the LLM work I see in papers and around hacker news is focused on the math side, and it feels like "prompt engineering" has is a pejorative, where you trick a model into doing something it wasn't designed for, or trick it into giving your intended output.

## Inference engineering

I'd like to introduce a new term: Inference engineer. An inference engineer is someone who manages both sides of Claude Shannon's model... both the math and the mechanics. That means, yes, writing great prompts, but more importantly it means communicating clearly with the AI and anyone who needs to work with it.

Previously, our startup helped take long videos and turn them into short ones. As we started to scale, the biggest hurdle was the human-in-the-loop time. If AI is supposed to save time, it has to actually do that. And if it doesn't, humans-in-the-loop behind the scenes have to cover for it.

Our team started asking a lot more fundamental questions: How can we actually know something is reliable? How do we communicate our preferences to the AI? How can we communicate our users' preferences to the AI?

[Sean Grove is one of the foremost thought leaders in this area](https://www.youtube.com/watch?v=8rABwKRsec4), as far as I can tell. Luckily, I've known him for like a decade, and randomly, I checked in with him about some of these ideas I was thinking through. Randomly, he had started working at OpenAI, and worked on [Model Spec](https://model-spec.openai.com/2025-12-18.html) among other things.

He had already put into words the thing I was feeling: Communication with models defines success with AI. Programming will go away, specs will not.

## Learning -> building

For the last year, the Bolt Foundry team has been working as sort of consultants... circling around ideas like fine tuning, evals, execution frameworks, and communication theories. We've worked with some great teams, and were always able to drive their reliability in surprising ways. (I'll be posting about those ways! Like and subscribe!)

Now we've got it: We've finally combined the theories together into a single idea, we call **product command**. Product command is designed to create an environment for an agent to discover the right information at precisely the right moment, so it build its own context window in alignment with the person (or other agent) who it's working with.

At the core of product command is a simple premise: Create artifacts that say precisely the right amount of information to execute a plan, let agents execute that plan mostly unattended, and then learn from the execution to improve the loop.

## Product command is systematic Founder Mode

Any plan is created with incomplete or out of date information. No matter how thorough the planning, by the time it gets executed, new information will exist, and plans immediately change.

Startup founders get around this by being the ones coming up with strategy and executing at the same time. [Founder mode](https://paulgraham.com/foundermode.html) limits the number of cycles between execution and developing strategy.

>As Airbnb grew, well-meaning people advised him that he had to run the company in a certain way for it to scale. Their advice could be optimistically summarized as "hire good people and give them room to do their jobs." He followed this advice and the results were disastrous. So he had to figure out a better way on his own, which he did partly by studying how Steve Jobs ran Apple.

This is directionally correct, but ambiguous. Is PG advocating for micro-managment? Surely, this doesn't scale. Steve Jobs, notorious for micromanagement and being an "asshole", was one of a kind and while we can learn lessons, if most companies ran like mid 2000s Apple without a Steve Jobs, you'd get 2020s Apple, just without the iPhone.

No, I think the key here is reducing the cycles by getting in the weeds. I recently read this description of a president of Papermate in the 1970s.

>One of his strengths as a businessman was being able to synthesize both financial data and a strong sense of where the market was going from interacting with it as much as possible. His presentations of new products and marketing approaches were presented in ways that to some seemed like painting ideas. -- [Robert D Hales, Wikipedia](https://en.wikipedia.org/wiki/Robert_D._Hales#cite_ref-Eaton-and-Eyring_5-0:~:text=One%20of%20his,like%20painting%20ideas.)

So it seems to me, the micro management part isn't the important part... it's removing friction between understanding and strategy.

## The military invented founder mode

What's the best way to command troops? I'm not a military expert or historian, but my layman's knowledge points toward founder mode as being an effective strategy. Notably, George Washington's insurgency-turned-army was more founder mode than the Brits, and had a better outcome.

The [Byzantine generals' problem](https://en.wikipedia.org/wiki/Byzantine_fault) wasn't just an academic theory, it was lived experience. In the 19th century, taking inspiration from Napoleon, the Prussian high command implemented a strategy that's come to be known as [mission command](https://en.wikipedia.org/wiki/Mission_command).

>**Mission command** [...] combines centralized intent with decentralized execution [subsidiarity](https://en.wikipedia.org/wiki/Subsidiarity "Subsidiarity"), and promotes freedom and speed of action, and initiative within defined constraints. Subordinates, understanding the commander's intentions, their own missions, and the context of those missions, are told what effect they are to achieve and the reason that it needs to be achieved. Subordinates then decide within their delegated freedom of action how best to achieve their missions. -- [wikipedia](https://en.wikipedia.org/wiki/Mission_command)

Founder mode makes it so the commander's intentions are built and executed in real-time, but when coordinating thousands of people, eventually intent has to trickle down into [Dunbar's number](https://en.wikipedia.org/wiki/Dunbar%27s_number) sized groups.

**Product Command** is Mission Command applied to building products.
