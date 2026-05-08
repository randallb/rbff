# MT Standup - May 8, 2026

Source: Granola meeting notes, `MT Standup`, May 8, 2026 11:30 AM EDT.

Granola meeting ID: `2057ed8c-09e7-42bc-8803-e16a13f9cd89`

Known participants:

- Randall Bennett (note creator) from Boltfoundry <randall@boltfoundry.com>
- Josh LeVitre <josh@boltfoundry.com>
- Justin Carter <justin@boltfoundry.com>
- Dan Sisco from Boltfoundry <dan@boltfoundry.com>
- Mofe <mofe@boltfoundry.com>

## Core Capture

### Personal / Relationship Context

- Josh met a software engineer at a Mid Coast Maine happy hour.
- The person had grown up Christian Scientist and no longer is.
- Josh connected this to Will Bleakly, formerly around CrowdTangle, now CEO of a local Maine newspaper / cafe hybrid.
- Randall shared context on old LA / media / celebrity stories:
  - Code Jam in Santa Monica
  - Robin Williams / gaming / Spore interview
  - Shigeru Miyamoto
  - Jeff Garlin
  - missed Beastie Boys interview because of the G train

### Coworker Demo

- Randall demoed a new coworker affordance.
- Current coworker creation starts with people first.
- Future coworker types:
  - people
  - agents
  - services
- People-first coworker modeling makes access and grants easier to reason about.
- Example: how to give a personal assistant precise access to the intended resources.
- Coworker affordances shown / discussed:
  - create coworker
  - set a person active
  - completed task creates a worktree
  - open worktree in WorkLoop file browser
  - open worktree in Finder
  - open in VS Code
  - open in Codex
- `create task` affordance still needed / being finished.
- Task authority had landed the night before.

### WorkLoop / Linear / File System Model

- Linear has become essential because it enables back-burner work:
  - capture side quests
  - choose the most important work
  - avoid doing whatever is immediately top of mind
- WorkLoop and Linear are expected to collapse into the same thing over time.
- File system should not be where tasks are managed.
- File system should manage files and company state.
- Company state analogy: laws become part of state once passed.
- Tasks should move toward app state / tool calls rather than file projections.
- File projections are still useful for compatibility, but can create stale-state confusion.
- Create-task buttons should become:
  - UI controls for people
  - mutations / tool calls for agents and services
  - library calls where appropriate
- Every coworker should have the same function set, exposed in the right interface for that coworker type.

### Taxo / Company Operations

- Taxo hired a new CTO:
  - from Egypt / DC
  - moving to New York
  - traveling to Egypt for ~3 weeks for a wedding
  - will work remote during that period
  - described as a very strong fit
- Randall's Taxo role should shift toward support/backstop rather than day-to-day operations.
- Need a better system for drawing down retainer hours.
- Taxo may be asked to help float the next payroll, but that should not remain the operating pattern.
- Desired shift: Dan should run day-to-day company operations in a Gwen Shotwell / SpaceX-like role while Randall focuses on high-level structure, fundraising, and core product thinking.

### Fundraising Strategy

- Randall should run the fundraise rather than Dan.
- Prior fundraise mode did not work:
  - Dan set meetings / managed setup
  - Randall joined and pitched
  - closes did not happen
- Diagnosis:
  - story was not necessarily the issue
  - lack of urgency and lack of direct closing were the issue
  - customer growth can create urgency
- Investor urgency:
  - get in before valuation rises
  - upward customer curve creates FOMO
- Plan:
  - identify targets today
  - friendly meetings Monday/Tuesday/Wednesday
  - real fundraising meetings the week of May 19
  - Randall runs the full fundraise, including emails
- Rebrand around WorkLoop:
  - prior Boltfoundry conversations can be treated as old history
  - pitch can just be WorkLoop
  - deck/site may be enough; bot demo not required initially
- Goal before fundraising:
  - get to 10 customers if possible
  - current count around 4 realtors
  - need ~6 more
  - half of current customers may be fired / churned, but if fundraise happens before contract expiry, they may still count in the growth story

### Product Requirements Before Fundraise

- Needed product capability before Randall can switch to fundraising:
  - intake email
  - do a thing in the browser
  - output email
- Proposed implementation:
  - use Inbox API for inbound and outbound
  - no direct Gmail dependency in the core flow
  - use existing grant infrastructure
  - browser grants move to runtime scope instead of task scope initially
  - later narrow browser grants over time
- Security policy direction:
  - either anonymous public web access or logged-in scoped access
  - avoid mixing broad web search with logged-in sensitive session access
- Worst-case browser grant concern:
  - prompt injection in logged-in session
  - exfiltration of sensitive data from a site the user is logged into

### Realtor / Customer Workflow

- Dan's realtor workflow need:
  - email comes in
  - documents / attachments are extracted
  - folder created in inbox with timestamp and person name
  - `email.md` stores email body
  - attachments folder stores files
  - task created for classifying / routing the email
  - routes to document upload, database addition, etc.
  - browser agent uploads documents or performs the website action
  - status / writeback is written into the original inbox structure
  - reviewer determines whether work is satisfactory
  - if satisfactory, move to vault and send email
  - otherwise figure out next action
- Suggested organization:
  - this belongs in an area, e.g. transaction coordination
  - purpose-specific coworkers live inside that area
- For now, true email in/out is not strictly required:
  - Dan can receive email externally
  - script can import into the folder/system
  - manual folder creation is acceptable while volume is low
- Inbox API becomes more important with customer count / workflow volume.

### Plugins / Services / Triggers

- Receptionists are likely plugin-triggered coworkers.
- Inbox API should become a plugin.
- Inbox API plugin can define:
  - reception callback
  - dispatch callback
- Browser should become a plugin / host integration.
- File-system triggers should be handled by a file-system plugin/service:
  - watch folder
  - react to status JSON changing to `ready`
  - trigger appropriate coworkers
- Other future plugins:
  - clock / cron / heartbeat
  - Gmail
  - Slack
  - browser
  - file system
- Plugins may themselves trend toward being services/coworkers.
- Coworkers can register activation criteria with plugins.
- Managers eventually determine which coworkers are allowed to subscribe to or be triggered by which events.

### Writebacks / Review / Consensus

- Tasks need a way to specify reviewers.
- Reviewers are different from managers.
- Some work may need multiple reviewer dimensions:
  - code reviewer
  - style reviewer
  - comms reviewer
  - HR reviewer
  - policy reviewer
- Consensus model:
  - multiple agents review
  - if consensus says ready, promote result upward
  - if consensus rejects, redo the task
  - if hung jury, rerun / retry
- Writeback should not land globally until review consensus reaches the top.
- After global writeback, callbacks and follow-up tasks can happen.

### Memos / Company Reset

- Need a `memos` folder in BF mono because `work loops` naming is confusing.
- Team should reset the memos/company structure now that the model is clearer.
- Rebuild:
  - initial company intents
  - areas
  - coworkers / people folders
  - services
  - resources
- The reset should model using WorkLoop internally before WorkLoop has native collaboration:
  - today collaboration happens via Linear, Git, Slack, etc.
  - later collaboration happens natively in WorkLoop
- Git is the first writeback mechanism for now.
- Future writebacks may use append-only logs / peer-to-peer structures.
- Need team-wide fine-tooth-comb review of initial intents.

### Positioning / Differentiation

- Investor answer to “how is this different?”:
  - coordination is the differentiator
  - security and collaboration matter
  - realtor vertical is the wedge
  - WorkLoop is the operating system underneath
- Pitch can be:
  - vertical SaaS / AI-enabled services for realtors
  - real estate TAM as wedge
  - then reveal much larger operating-system opportunity
- Real estate technology market was discussed as around $5B, but real estate labor market makes the broader opportunity much larger.
- Customer-facing transition does not need to be abrupt:
  - start as AI-enabled services
  - customers continue emailing
  - product gradually increases fidelity, speed, and customization
  - app onboarding can come later

### App Issues / Product Debt

- Current app issue:
  - after one task, user often needs to restart app before another task
  - app can confuse old task state with new task state
  - tasks can take 2-7 minutes before doing simple things
  - tasks sometimes crash / die
- Fix direction:
  - tasks and pickups move to app state
  - reduce file-system task projection confusion
  - expose task creation as a tool call / mutation for agents
- Justin created Linear tasks from frustration cases instead of pushing PRs.
- This is useful because clustered small bugs can point toward broader architecture needs, such as plugins.

### Brand / Design

- Logo should not be yellow because it reads like a warning / street closure sign.
- Blue / Depresso Blue direction works better across light and dark mode.
- Existing overrides to prevent yellow text on white can be simplified with blue.

### David / Pitch Deck

- Dan should book with David for Monday afternoon.
- Desired goal: show David an actual good pitch deck.
- Half hour vs full hour was discussed but not settled in the captured notes.
- Plan after the 1 PM palate-cleanser meeting: regroup for a long working session.

## Action Items

- Randall: finish `create task` affordance.
- Randall: finish coworker demo / person coworker flow.
- Randall: finish or stabilize task authority / task lifecycle.
- Randall: move task pickup / creation fully toward app state and tool calls.
- Randall: dump Granola notes from this meeting into Linear tasks and organize them.
- Randall: reset / rebuild BF mono `memos` structure around actual WorkLoop company operation.
- Randall/team: redo company intents together.
- Randall/team: build initial areas, coworkers, services, and resources for new WorkLoop memos structure.
- Randall: run the fundraise directly.
- Dan: keep selling and making customer growth graph go up.
- Dan: book David for Monday afternoon.
- Team: prepare a real pitch deck for David.
- Team: get to 10 customers if possible before fundraise push.
- Team: implement email in -> browser action -> email out workflow.
- Team: treat Inbox API as first plugin forcing function.
- Team: model browser, file system, clock, Gmail, Slack as plugins/services over time.
- Team: change logo/theme away from yellow toward blue.

## Transcript

Granola returned a transcript for this meeting. The connector response was very long and included a short clipped span in the middle of the browser-security/email-intake discussion; that clipped point is marked inline.

```text
Them: Hey, sorry.
Me: Why are you sorry? You're fine.
Them: I didn't receive that you were here. And then and I did and then I couldn't find my airpods and it was all.
Me: It's fine. I just started because, like, I just was gonna just start. It's not. There was no urgency to you joining. It's fine. How are you?
Them: Good. I just made a friend. So that's good.
Me: Important thing for you.
Them: It is important. He's a software engineer and we have many things in common. He actually used to be a Christian scientist. He like grew up in Christian scientism. What?
Me: Like, the people who do the reading rooms.
Them: I think so.
Me: Yeah.
Them: Right?
Me: Anything about them other than the reading rooms.
Them: There, very little. But he is no longer. That. Anyway he's a software engineer and I just met him at that. Mid coast main happy hour thing that I go to. And then I was like hey we should like get coffee or breakfast or whatever. Actually you know what? Here's a random connection. Do you remember will wheatley from crowd tangle? We sat next to him in 46 when we first started at Facebook like across from him.
Me: That's not will Wheatley.
Them: Wait yeah it is.
Me: Like the. Co-founder of crowd tangle.
Them: No he worked at crowd tangle though.
Me: Oh, I don't know anyone at crown tangle except for. Brandon and the other guy. And his brother.
Them: Sorry it's will bleakly. Not I think I'm confused. I'm mixing him and will weeden or whatever star trek.
Me: I have a funny will.
Them: It's.
Me: Anyway.
Them: Wait let me really quickly will bleakly worked at crowd tangle. We sat like in that same pod as him but now he lives in portland, main and he's the CEO of news company. And he owns the mid coast villager, which is a newspaper that is based here in my it's like covers the most local paper. And so I went to the villager cafe in Camden, Maine, the like company has a cafe where they like have food and stuff, but it's the newspaper anyway.
Me: Yeah.
Them: Very random.
Me: I love it. Everything about that. That's the coolest. Like, that's like how town, small towns should be. That's.
Them: Yeah.
Me: Like main's best case scenario you just described anyway.
Them: It's very cool. I wish I could afford to subscribe to the villager. It's very good.
Me: A newspaper that runs a cafe is such a good idea because then your newspaper doesn't have to be as profitable.
Them: Exactly.
Me: Oh, my gosh. That's such a good idea. Holy crap. Because then you can basically slush fund a reporter. And you might only have one, but. Like, that's all you need. Cool.
Them: They have one ace reporter his name is Stephen Betts and he gets all the good scoops.
Me: Yeah.
Them: Of freaking love Steven bets.
Me: That's all you need. I mean, like journalists.
Them: Yeah.
Me: Basically use the information. And, like, The information is basically our small town paper.
Them: Yeah. It's true.
Me: The information should open a cafe anyway. Sorry.
Them: Anyway what's your will weeden story?
Me: Tell me. Oh. So. I hate La. Like, I hate La. And Jason calicanis loves La. So we used to do code gem in La in Santa monica. Like, remember how I said we should do code? Code jam is our name. Like, so code Jam is a Jason calcanus. Actually, it's a brian obi thing. Brian came up with it. But so. We used to do code jam in Santa monica very frequently.
Them: And what is it it's like a hackathon or what?
Me: It's like, it's the same thing we do where we just, like, go work for a week synchronously in the same place.
Them: Oh I got it okay yeah.
Me: So we would do code jam and, Jason, because he's JSON would be like, okay, we're gonna say the viceroy, which is this, like, celebrities stay their hotel. It's, like, super fancy. Like, while we were there, like, one of the, the. Michelle Rodriguez from Fast and the Furious was doing, like, a photo shoot, like, outside of our window and, like, it was weird anyway. So I hated that. I hate that. I hate La. I hate. It. S just whatever. And Jason's obsessed with La and famous people, and he wants to be famous. And anyway. Like, he knows will Wheaton somehow. And so will Wheaton hung out with us for, like, a day. It was weird. It was like, I mean, I've had so many weird celebrity experiences in La. And, like, not so many. Just, like, enough that I feel, like, so weird about it. Like. I'm at, like, I interviewed Robin Williams. I. Like.
Them: First seen it or something?
Me: No before when I was at weblogs, Inc. And then. I worked it because I worked for this thing joystick. It's a gaming publication. I went to E3 anyway. And then. I.
Them: Oh you talked to Robin Williams about gaming because he was like he's into gaming.
Me: Yeah, he was, like, doing spore. He was, like, at this, like.
Them: Oh yeah.
Me: He's at this, like, event, and anyway, it was whack.
Them: On dreamcast.
Me: No spor was on a PC.
Them: Wait I think we've had this conversation and I think I made the same confusion seaman.
Me: Yeah. You were thinking about. Which slender Nimoy, which is valid. Anyway. So, yeah, then. What are my other la experiences? I got to meet shigeru Miyamoto. That's pretty cool.
Them: I don't know who that is.
Me: The creator of Mario.
Them: Oh that's insane what the heck?
Me: Yeah. And Zelda and Pikmin and everything. I'm trying to think Comic-Con. Kevin Smith. Who's the woman who plays a shotano? You know what I'm talking about? She's like a super nerd. And she was in, like, sin City.
Them: Oh wait from star wars you're talking about that Jedi star wars show yeah I do know what you're talking about that gets her name.
Me: She's, like, in a bunch of teen movies in the.
Them: Yeah.
Me: 2000s.
Them: I can't think of it but you said it I would it would click.
Me: Anyway.
Them: Anyway.
Me: So those are my, like, La stories. I guess hyphen San Diego. Oh, and, you know, Jeff Garland.
Them: Yeah of course from curb.
Me: He's. Yeah.
Them: Love him.
Me: I interviewed him in New York, actually.
Them: See cool he seems like he might be a dick in real life.
Me: And no, super cool. Like the coolest. Way cool.
Them: Really.
Me: Like, he's, like, one of those, like, makes you feel super comfortable people where you, like, are interviewing him, and he just makes you feel like you're like, he does the same thing that I do to people, but he did it to me, which is weird.
Them: Cool.
Me: So, like, you know how, like, if I meet you, I can make you feel like a million bucks and, like, whatever. He does that thing, but, like. He's like, you know. A BFD. You know who I didn't get to interview? And I'm still pissed about. Beastie Boys still pissed.
Them: Oh no.
Me: I took the G to go to Queen. Which was. Or to go to Brooklyn from Queens. That was my biggest mistake of my life.
Them: Because what happened you like missed them just fine?
Me: Yeah, I just didn't get to interview them. The G sucks because they had a movie called. They had to, like, think about how cool this was. This is like 2008. So, like, right as YouTube's coming out. They had a movie called awesome I shot that. Where they a Beastie Boys concert and they took all the videos from people's, like, VHS recorders and made a movie out of it. Which, like, now you could just do with phones and it'd be so cool. But, yeah, it's called awesome. I shot that, which is such a cool name anyway.
Them: Yeah. Nice.
Me: Yeah, that's my celebrity stories for the day.
Them: Justin welcome.
Me: Do you guys want to see a really sick demo?
Them: Of course.
Me: This is wallpaper. Just kidding. My friend had this, like, treasure Trove of wallpaper, and I sorted it by color. And so then I just put the wall on my computer. It's like some python thing that he made saki, and I was, like, annoyed. And I was like, I'm just gonna build it so that it's better anyway. So I built it so it's better. Okay, so. This isn't landed yet, but it's coming. So. There's a new co-worker affordance. If you get a co-workers you can click. You can click new co-worker. And then the co-workers are just. They're just people right now.
Them: Finally.
Me: But the idea you'll have agents and services and the agents will be like a. Like a bot thing. Like, you'll do, like, a back and forth.
Them: Oh. This is what you were talking about yesterday so Amy is a human.
Me: Yeah, exactly. And then it picks the name Amy, which is hilarious because it just, like, read about your sister and was like, Amy.
Them: Dog.
Me: So right now you can do this thing called active. Oh. Oh, yeah. So you set people as active, which doesn't do anything actively yet except for just. Like it updates the dashboard to say, like, who's active or it's supposed to. It doesn't even do that right now. Okay. But.
Them: If you refreshed.
Me: Oh, that might be true. Which would be annoying.
Them: You can just hit command. R.
Me: Oh, yeah, you fixed that. Okay, so.
Them: Oh wait not maybe not from in here.
Me: Yeah. So, I mean, probably from in here because it probably just does that one anyway. Okay, so then I don't have create task yet. I'll just have it finished that. Create task affordance. As well.
Them: Yes I want that.
Me: So then. So Amy's already completed a task. And it creates a work tree. So you can open the work tree in work loop, which is just the file browser. Or you can open the work tree in finder. Or.
Them: Sweet I was gonna add that. Was it doing VS code? Just shows.
Me: It's like.
Them: The got it.
Me: All files. And then you can also do your open in codex, which is fractal right now. So. Oh, you don't see this because it's on the wrong screen. Anyway, open in VS code. And then open in codex, which is fractal and hilarious. So. Yeah, it's pretty cool, though. So the right back stuff. I don't know if I have any. I'll just have it do a right back preview in just a sec. So hold on. So the thing that I figured out is that if I make co-workers people first, it's, like, way easier to reason about everything. Like, how do I make a browser Grant? So that a person can access it? Like, basically, how can I make it so that I can have a personal assistant who has access to precisely the things that I want? It's, like, way easier to consider that way. And then also, like.
Them: Yeah.
Me: If you think about it, too, it's like you probably want to organize stuff with projects and whatever. Like. Like, the thing that I've learned over the last two weeks is that. Is the most important application that we currently use. Because the thing that lets me do is back burner stuff. Because, like, the thing I couldn't do before was be like, well, I'll work on that in the future because it'll just get lost. I would just, like, work on whatever I'm thinking about working on immediately. Right. And as we've really adopted linear, it's made it way easier to be like, okay, what is the most important thing to work on? And necessarily because I was overloading, I had to be, like, extremely more careful with my time. Right. And so, like. That overloading created this forcing function where it's like, okay, you only can work on the most important thing. And that's where, like, I did the EA stuff. Like, that's where I did, like, a bunch of this stuff, right? Because it just, like, it became this, like, forcing function of just like, okay. If you have no time to screw around, what, how are you going to do that? Right? And so now, like, I'm pretty clear. This pops up still, but there's no more dock icon for it anyway.
Them: Where does it go?
Me: It just disappears. I have no idea. I think it just stays open, but you can't see it or something. I have no idea. So. Yeah. The result is that, like. We've already. I've already said that work loop and linear are going to, like, collapse into the same thing, obviously. Now I have the model in my head that's a lot clearer. So, like, the file system is not where you manage tasks. The file system is where you manage files. Obviously, and files are instances of, of, like, company state. So, like. You know, you have. Company state is. Like, imagine it's like the law. And essentially, like, when a law passes, it becomes part of the work Loop company state. Right. So the trick is that, like. These workflows. So you have each of these, like, it might end up calling loops or something. I don't know. It's like a thing I'm workshopping in my head. But the idea is, like, you have. Where's the create task button? Oh, it's right there. That's stupid.
Them: There?
Me: I don't want.
Them: Or you can put it up in the in the menu bar on the right.
Me: Yeah.
Them: The tab bar I mean.
Me: I'm going to put it right here by active person, because active person is also a button.
Them: Can you make those not their own row right now it's a row.
Me: I'll just, like, do. Yeah, you'll just do whatever. It's fine.
Them: Don't worry about it I'll fix it.
Me: So we hired. We got. So the things I talk about today are tax. And us dying and us raising money. And my time changing going forward back to normal sort of. And they're all kind of interrelated.
Them: Yeah. I also have things to talk about and they're sort of interrelated as well.
Me: So.
Them: You just said so I have things to talk about that are not related to that.
Me: Okay, so taxo. I hired this GTO. He's like a perfect fit. It's like crazy how good of a fit he is. He's, like, perfect. So.
Them: Wait you didn't interview him though.
Me: No, I interviewed him. Yeah, I interviewed him and hired him.
Them: Let's say cut the end of a different story you took the G and you did an interview.
Me: Oh, that was. The Beastie boys. It was disappointing.
Them: I see.
Me: So. Yeah, so he's awesome. Super cool. He's from DC. Well, he's from Egypt. He lived in DC. He's moving to. New York. He has to go to Egypt for, like, three weeks for, like, a wedding, whatever. But he's gonna work remote. He's the CTO, and he's, like, a really, really good fit to be CTO. Like, I'm, like, really excited about him. And my role is going to change. So I basically, like, whipped him into shape. Now. And now my goal is to be support. So, like, I don't know how that's going to work out in practice. Essentially, like, I need. To. I need to come up with a better system for drawing down retainer hours. And, like, whatever. I think that, like. I can still use them as a backstop, probably, but I think they're super uncomfortable with being, like, a piggy bank. And so I'm trying to, like, limit that as much as I can. So basically, like, if we're in a missed payroll, I'm gonna be like, yo, help us not miss payroll. And then, like, that's the limit of it. Basically. So, like, I know we have a payroll next week.
Them: Monday Monday Tuesday. Yeah.
Me: So I'm gonna ask them for money and just be like, yo, can you help us float this payroll? And then we have to, like, really be done with that. By the next payroll cycle. And so done with that can mean whatever. So done with that can mean. Funding. Or whatever. I'm pretty comfortable that we could raise money. Like, now. And I think that I could raise money now. Like, I think. I think that it's better. And, Dan, this is not disrespect. It's just, I think something you agree with. I think that you suck at raising money because you're not as assertive. At closing. Do you think that.
Them: Maybe.
Me: Like, I.
Them: Dan's getting better at closing.
Me: Mean, I agree. So the, the point is, like, I don't think you suck or anything like that. It's just like, it's fundraising is challenging.
Them: And getting better.
Me: Because inherently it's a sales function. And you're currently developing your ability to get good at sales, which is awesome.
Them: Core strength of mine yes.
Me: And you're getting better at sales, which is amazing, but you're also getting better with sales with, like, the easiest product to sell, which is, like, something that completely means someone's movies. Right.
Them: Like getting good at stocks in the pandemic.
Me: Hooray. So, like. I don't think that we should. I think that if we're gonna do a fundraise, I should run the fundraise and, like, make it be. Like, a real proper fundraise. And, like, all do everything. Like, basically, like, we'll switch and all be CEO in terms of the fundraise. But I still. I mean, honestly, like, let's just have a real conversation. I'm CEO, but I should be. Like the way that Gwen shot well. Is CEO of SpaceX. Like, that's what it should be, right? Like, she runs SpaceX. Elon musk doesn't run SpaceX. You need to be that person who runs our company and not me, and I need to be more. Like, higher level, not on the. Not on the hook for day-to-day, blah, blah, blah, blah, blah. I think the thing that I've also learned over the last two weeks, just to be clear, is that, like, the less involved I am in day-to-day things, the better for everyone, without exception. Like, because I haven't been doing day-to-day attack. So I haven't been doing day-to-day here. I've been doing super high level, like, structural reorganization, blah, blah, blah. And it's just like. Just my superpower. My superpower is being able to look at a problem and just, like, reduce it to its most core issue and then fix that issue. And that's not, like, a thing that's, like, day-to-day necessarily. And so I definitely need. You to be like, I can. It costs me tons of energy. To do fundraising, but if I'm not building product, I have the energy.
Them: Okay pause for one second because there's like five things you just said that we need to unpack and respond to so before you keep going. So the thing that we were doing a fundraising before was like I run the fundraise meaning I set up all the meetings I'm like figuring out who we're talking to in the pitch and blah blah blah and then you just show up and you do the Randall thing and I do the intro and blah blah blah and like that didn't work. It seems like it should work in theory. I'm actually not clear why it didn't work. I don't know if it didn't work because we didn't we're not fundraisable like the story is not good.
Me: It's a combination of, like, we didn't push for closes. That's because, like, our story is fine. If. People believe it and we're pushing for closes, having you for closes and having me do a story doesn't work.
Them: I think it's the same thing but the my read is that there is no urgency for anyone so it's there's no penalty to just being like yeah like we'll just keep this warm. And let us know right like that's how every meeting ended.
Me: And now there will be.
Them: But now there's urgency because of customers.
Me: Growth. Exactly. Because of growth.
Them: But how does that create urgency just like as an investor why do I why wouldn't I do the same thing and be like I'm just gonna watch this for a month.
Me: Because I.
Them: Because that curve.
Me: Want to be on the rocket ship now so that the valuation doesn't go up.
Them: Okay.
Me: Because, like, if the. If the. If that curve continues to bend, like, you want to be on it now before it becomes vertical.
Them: Yeah. Then what we should do is start we should wait one more week. Meaning we should set up meetings for a week from Monday. But we should start today setting up meetings. And we should get more customers like I wanted to have 10 customers so that it, you know, it's cool to have that little curve, but it would be even cooler to have it be. You know we need six more realtors paying us that much for it to like that was my goal. So I would.
Me: That's not unreasonable.
Them: Like. Totally yeah yeah.
Me: Right? The other trick is that, like, technically, it's not MRR because, like, half of our customers were going to fire. So that kind of sucks. Because, like.
Them: I know I have I literally have a task to go in and like delete some of the people who we have created no value for but I'm just holding off.
Me: I think. Basically, if we can get. If we can raise money before their contracts expire, we can count them.
Them: Exactly.
Me: And so it's. Like, it's sketchy. Kind of, but not really. Because the implied growth.
Them: Other real yeah, they're real people who had a problem that we can solve just because they're not realtors.
Me: Fate. And it's. Like. Yeah. And.
Them: But it was in their investor update it's like we spread wide on purpose and then found this one thing it's implied we're not going to do those things. Exactly and if we get two more realtors then we can cover that.
Me: Just with the growth graph, it's like if we have expected growth and it's real, and then we actually come through, it creates more urgency.
Them: Like.
Me: So.
Them: Yeah.
Me: Like, yeah, I mean. I think we're totally fundraisable. I totally think it's gonna work. I think we can pitch to our current investors and just be like, yo, like, now it's now Reuben could go out and be like, yo. And the thing is, we can just say it's a different company. We don't have to even, like, we can just say it's work loop. And, like.
Them: Exactly we should brand everything as work loop.
Me: Prior conversations about Boltfoundry are gone, and it's just everything's work Loop. Whatever. We have, like, we don't even need the bot now. We can just have a deck. The deck can look nice on our site. Like, I actually, someone sent me a deck that was a site, and I was like, oh, that's actually really cool and reasonable to do now. Because, you know, the future is cool. So, yeah, like, I think it's like, okay. Identify targets today. Get friendly meetings Monday, Tuesday, Wednesday. Book meetings the next week. Start an actual fundraise and then have me run the fundraise with emails. Like, I need to run the fundraise completely. And, like, that is.
Them: If you can run the fundraise and I can just keep doing sales and making the graph go up that would make my life so I would be so happy.
Me: You know, we just need to know what. What is the product need to do before I can switch to fundraise?
Them: I have that answer you do? Yeah. It needs to intake email. Do a thing and output email.
Me: Great.
Them: Do a thing in the browser and output email.
Me: Done. So we'll use inbox API. And we'll do everything inbox API, inbound and outbound. And then there's no Gmail, there's no whatever, and it just works. We can get inbox API grants. Like, I can still use all the inbox api. I can use all the grant infrastructure we have. It will work just fine. Browser grants are switching to runtime scope instead of task scope. Meaning, like, every single, if you have a browser Grant anyone can use it for now. And then we'll narrowly scope it over time to be like, okay, now browser grants are this. Now browser grants are this. So. Essentially everyone will start out with full web scope. And then, because even if you have full web scope, you still don't have access to real secrets, so you can't actually drop anyone. I mean, like, the worst case scenario is you, like, read something from a website that you have logged in and then do something. That's like the worst case scenario. Right? Like, you get prompt injected. In a session where you have access to a site, and that site on which you have access, you exfiltrate information. And so, like, they'll solve to that is you either have web search Anonymous or you have logged in and you don't have both. That's the, like, solve, basically.
Them: When you say exfiltrate you mean like if if it's logged into keller williams and it clicks on things that it's not supposed to and gets information.
Me: Yes. Like you prompt inject someone to get, like, someone's Social Security number and then send it to China or whatever. And, like, I think it's, I think if we just say, like, the, it's okay right now for the policy to be. We [connector clipped a short span here] the email and pulls the data from it. Creates a folder in inbox that's like timestamped. Person so it's like the email says upload these documents for dan cisco so then it creates a folder in the inbox timestamped dan cisco and inside that folder is an email.md which is the text of the whole email. And then an attachments folder that has all the attachments. And then it creates a task this doesn't actually happen yet but this is where I'm heading there creates.
Me: Like, draft. Everyone.
Them: It'll create a task for the thing that reads the emails and figures out what to do with it because it could go to different things like it could be like add this to my closed database or send this these documents. So there's those are two different things that it could delegate to and then it takes those. And so once it gets through the whole thing it goes so for the example of uploading documents it has a thing an agent that goes and uploads them to the website. And then when it's done. It writes back. Into that original inbox like a status of what it did and if it couldn't do things like all that stuff and then it has something that reads it. That says was this done satisfactorily? If so, then it will put it in the vault and send an email. And if it's not then it'll have to like figure out what to do next. So the point is I have this folder called inbox. That's something that I created. Like what is the right way to do that?
Me: That should be in an area. So there should be an area.
Them: So.
Me: Like. So. Okay. So there's some sort of area. That's. Like. What is the. It's like there's an area that's just, like, transaction coordination or something. Right. And then, like, in the area, you have the co-workers you just outlined because they're not going to be for anything else but this single purpose. Right. And then those co-workers will do stuff. Just like you said. They'll hand off the way they hand off stuff is through right backs. So all the right backs are going to be. Like, whatever. Tasks don't have a way to say who needs to review them yet. So, like, that's a thing that's missing is, like, we don't have any sort of way to say, like, okay, I need. Like. One of the things that's missing is, like, a consensus. Because what you really want to do is you want to be like, have four different agents review this and give me a consensus, and if they all come to consensus, whatever. And if they can't, if they're a hung jury, just redo the task and do it again. And, like, if they all say it rejects, then it all rejects. And I go back and do it. Right. So they're like, we're missing this consensus idea. But the idea is, like, a task should actually have. Like, for every folder, every area, you should have a default list of reviewers that are different than manager. So, like, they're, like, managers, but they're. Anyway, it doesn't really matter.
Them: Like outside consultation.
Me: Precisely because it's. Like you want to be like, okay. This is a. Like, this needs to be reviewed by a code reviewer and a style reviewer and a whatever in a comms person or an HR person in a policy, all that stuff. And then it comes together. And then you kind of want to have some sort of consensus because, like, each of those branches could, you could be, like, two reviewers to do this thing, and if they reach consensus, move it up a level. And then if all of them reach consensus and say it's ready, move it up a level. And then at some point, you have someone, like, probably a person initially be like, okay, this is great. The write backs. The right back doesn't happen to the, to the whole tree until that, until you get all the way up. Right. So until all the reviewers agree, then it goes up, then it goes up. And then eventually you get to a top where you're like, okay. Global right back. And as soon as you do global right back, that's when, like, other, like, callbacks can happen. Like, okay, follow a follow-up task and, like, the managers on the hook for doing all those, like, follow-up tasks and stuff. Right. So the way that, like, it ends up flowing is. Like. So it's fractal. So, like, you start out with just the thing you said. Right? But eventually there's a. The manager is going to decide whether the right back is approved and the manager can be a person. Service. Agent. Anyway. Does that help? Did I answer any questions?
Them: Yeah. So back to what you said what we need. We need in email coming in. We need it to do things to the web page and then an email going up. We don't actually need email coming in or going out right now. Like the email coming in is to Dan.
Me: Yeah.
Them: And then we can have a script that takes that and puts it into this system. From outside the system. So or we can just like make a folder, Dan, cisco.
Me: But now.
Them: Like that's what I'm doing right now. It's like I have open AI. I just put in the text from the email and I tell it where the attachments are and then it creates that initial. Email intake stuff.
Me: Yeah. So I'm, I'm clear now on how all that's going to work. So.
Them: So my question is should we rebuild this app or rebuild this project?
Me: Like. Only if it's not reliable. If it's. Like.
Them: On the browser side? Like it'll the browser will like return an error.
Me: Focus more on that. And then, like, we could just, I think we should just fix the browser more than doing anything because, like. All the other stuff, like, until, like, browser is a plugin, it's not even going to be like, it's, it's just going to be a plugin and it's going to be a host. It's this weird situation where it runs untrusted, but it's kind of trusted. And anyway, but the point is, like, I'm really clear now on. Receptionists are just, like, plug-in triggered co-workers. Right? So, like, you can have. Inbox API. Both. You can have it inbox API plugin. The plugin can Define both a reception callback and a dispatch callback. And then you just make it so that, like, those callbacks get triggered by co-workers and the co-workers just know they exist and they're just available.
Them: Can we have file triggers? Like for this example like I am writing a JSON with it. That's next to it and it has it ready to ready state. So it's like it's copying the documents to the folder once the documents are done copying then it could change to ready and then something else will pick it up. Instead of having to write a task.
Me: Just co-workers right to, like, you have a plugin that's called file system. The file system plugin watch is. So host. I think that the host things are also, I haven't. Like here code. You can have this power. Yep. I haven't totally landed on how. I'm pretty sure that plugins are actually also just. Co-workers. And. Like, they could, like, I think they're just going to Trend towards being Services more than anything else. So, like, they're still going to have to have, like, like activation. It's like, okay. Like, you're always active. Like, always be on. Watch the file system. When the file system does something, tell me. Like, you're going to have a time, like a cron job one. It's like when the, when this time thing happens, do this thing. And then I don't know if you've seen the automation stuff that codex is starting to do. Where, like, codex will just, like, it'll be like this. There's a, there's a type of automation called heartbeat where it just, it's like trigger every and every end minutes or whatever. So, like, right now, I'll be like, hey, monitor the checks on this. And instead of doing sleep, it'll just have, like, a, like a cron job, basically, that checks every five minutes. So, like, all those will just be plugins, right? They'll be like a, like a, like a, like a clock plugin, a, like, file system plugin, a Gmail plugin. A slack plugin, whatever, like all these things will be plugins. And then each agent can say. Like, agents can register the callbacks so that agents can be. Like. Like part of their activation. Their activation criteria. Will say, I want to get activated when X happens. And if they do that, the plugin, basically, they'll register themselves in the plugin and they'll say, like, on this event, whatever. The plugin will be able to, like, trigger each agent when the thing happens. And then. And, like, eventually managers would decide, like, okay, is this co-worker allowed to, like. Get this, whatever, right? Like. Like, who's allowed to get triggered when the file system changes? Right. Who's allowed to get triggered when whatever. And then, like, maybe the file system plugin you're, like, watching us, you're going to be watching a specific folder. So you're going to be like, okay, when this folder does something, do something. Right. Anyway.
Them: So that's future. So next steps are.
Me: I've been, like, so close, though. Plugins are not, like, that future. They're like, basically, like, the next time I need to do something, like. Like inbox API will be a plugin. And so if we're. Like, inbox api is the forcing function, whenever we want to inbox, it'll be the first plugin, and then everything else will just become plugins.
Them: I think. I mean obviously how we have to see how many things we get. This first guy Dan how often does he send upload document? Like a couple times a week. It's not that frequent.
Me: I think inbox API is more a function of customer numbers. So.
Them: Yeah, well that's what I was going to get to like if you have 10 customers a couple times a week that's probably going to get out of hand.
Me: Like. Yeah. So, like, I think that. Coming up with docs, like a re, like in resources coming up with, like, a resources folder. A resource like. A company level resources thing that's like, actually, the most useful thing that we could do right now is probably. Redo the intense as a team together. Like, redo all the company intents and, like, start our folder over and, like, literally start our folder from scratch. Like, have it. I'm gonna. I need to make a memos folder anyway because it confuses the out of it when it's called work loops. So we have to make a memos folder. When we have the memos folder, we should probably just start it, like, basically from scratch and probably build out the real version. Like, we're now. There's enough data and enough understanding that we're ready to say, like, this is what it's going to be. And git is essentially the first version of writebacks. Right? Git will help us create stable write backs. And then eventually, once we get far enough, we don't have to use git, and we're just going to use our own write backs. And. Like. Eventually it's like the append only logs and the peer-to-peer and blah, blah, blah. We, like, get to that point. Right. But, like, for now, it's just. Like. We need to, like. We kind of. We just need to do a reset now that we know what we're doing. And, like, just, like, I mean, gbt55 also, like, makes a reset a good idea. A reset doesn't take that long. Every time I've done a reset, it takes, like, an hour or two. It doesn't take, like, all day. So I might just do a reset as one of my, like, primary tasks today. And then we'll need to basically all get on the same page about the reset. And, like. Be super fine tooth comb on the initial intense, build out the initial areas and then, like, assume linear, assume slack, assume all these things so that we can, like, not have to, like. I mean. I have this feeling. It's another spiritual feeling. I had a spiritual feeling last night that it was like, okay, the taxo. Stuff is over. Like, it's like another era, basically. And so I think today we just need to, like, kick off that era officially and be like, okay. Here's what we're doing. Here's how we're doing it. Here's whatever. And, like, taxo can backstop us for, like, next Tuesday if we need, but it probably will be alone. Probably won't be Revenue. And then still have to pay it back and whatever, but. Yeah.
Them: When you say reset, do you mean. BF mono structure or what are you resetting?
Me: Mbf mono, create a folder called memos. And, like, work Loop seven work loops is just the past and everything now is in memos. And, like. She was like, we're gonna have our own chief of staff. We're never our own co-workers we're gonna have people folders. Like, we're gonna do everything as if you're using work Loop. And then, like, the work Loop folder will be basically, like, at some point, we'll start doing tasks in work Loop instead of in linear.
Them: I. See.
Me: And, like, that's.
Them: But then isn't that collaboration? Are you basically saying we're using collaboration?
Me: Correct. So today the collaboration features happened in linear and git and stuff, and then eventually they happen.
Them: Yeah. So Randall's going to talk to the work loop app in the BF mono folder and then commit that. And then you can talk to it. So it's not at the same time. But eventually it will.
Me: It's. The model is trending toward what the actual work Loop model is going to be. Instead of this, like, yet again another state that we ended up having, which, you know. Yeah.
Them: I understand. I'm, I love that. Okay. I have a lot of questions, but there's sort of tangential. Ask someone. Like everything that you just talked about and said the thing that I'm still. Fuzzy on is like. Sorry to be like a dumb investor, but like. How is security still the main differentiator from codex? Like what is the differentiator?
Me: The differentiator is the coordination, coordination's the differentiator.
Them: So it's security collaboration. And the fact that it's built for realtors. Or what? Because like.
Me: Pitch is the pitch is actually like, we're building a vertical SAS for Realtors, like, more or less. Like, we're building a thing that does realtor whatever. And then. Like, the, like, and no is like, oh, by the way, this is a full operating system that can be used for anything.
Them: Yeah, I love that because it's like, oh, look, here's our tam. It's $50 billion. But also that's like our wedge, not our entire market.
Me: Exactly. It's like 275 or whatever.
Them: Yeah. I was talking to. I was doing deep research on it yesterday and it's like this real estate technology market is like $5 billion. But when you factor in the real estate like labor market, it's like.
Me: Infinity.
Them: Yeah, it's like many, many more. Okay. Cool. That makes a lot of sense. I still don't get like there's still to me there's, there's to me there is still a gap. Like everything that we are about to do, there's a gap between that and like building what realtors want. Right? Like this is useful for our startup team. How do we get to a place where instead of pitching, let me be your VA and I'm just going to use my software to make it easier like AI enabled services. Versus like, let me onboard you to this app.
Me: I don't think that it matters because, like, just. We're gonna be on. We're gonna be AI enabled services until it's ready, and then it's gonna flip and until it's ready, we don't have to care.
Them: And they're still sending an email.
Me: Yeah. The changes that. The changes that they get higher Fidelity, faster response, more, they can customize it more or whatever.
Them: So yeah, doesn't change for them.
Me: But, like, I mean, everyone's basically, I saw a thing today. It's like, everyone's becoming palantir. It's like everyone's doing what palantir was. And, like, that's just what we're gonna have now is, like, palantir.
Them: Totally. Yep. Okay. So. Okay, Do you want to talk about anything else product? I have other things to talk about. I do. Yeah, go ahead. I just want to talk about the state current state of the app. Like right backs are obvious. But if they're not tasks or if tasks aren't writing back, then that might not be as big of a deal right now. But I every time I. Run a task, I have to restart the app. And do another task. I can't do two tasks because it will get confused and use the old task.
Me: Yeah. So. Moving it tasks are not. Completely out of the files system yet. But them being out of the file system is a huge part of this. And, like, we might actually just remove them from the file system entirely, not even as projections. Because right now I have them as projections. More as, like, a compatibility thing. But, like, I think that we might just not even, like, it might just be tool calls that you make.
Them: But it's the state of the app is stale. That's the real issue.
Me: And that's exactly what I'm saying is, like, so I already moved it to tasks and task pickups are now app state instead of file system State, which fixes the staleness. But right now we're projecting the stale. We're still projecting the app state into files. That are, like, referenceable. But they're not.
Them: But it's the opposite way.
Me: What's that?
Them: I guess not using the files as the source of truth that's using the databases that sort of true.
Me: Precisely. And so the end result of that is that, like. If you project. So. Basically, we just have to keep removing confusion, removing confusion. And if the way to, like, get there eventually is just like, it's all tool calls, and then, like, the tool calls. Are also, quote, co-workers who can, like, also be services and, like, look up files in the file system and, like, whatever. Like, it's just. You know, more Turtles.
Them: And I didn't assign it to you because I'm not going to ever do it. It was just a task of frustration. Like I spent. Like I asked it to do a really simple thing. Like cue a task. And it took two minutes before it was even starting to do it because it's like reading everything. And then I did another one.
Me: Yeah.
Them: After that and it took seven minutes and it died. Just because like it's like this. Like, I mean create a task and fix is that but like.
Me: It's literally, like.
Them: It's still like assistant doesn't know.
Me: So that's. That's another thing. I I don't know if I said this, but, like, all of the create task buttons, they get exposed as mutations, tool calls and library calls. So.
Them: The assistant can make a tool call.
Me: Exactly co-workers. Have a library. For people. It's a UI for agents, it's tool calls for services. It's a library.
Them: Okay, that helps.
Me: Yeah.
Them: Like that.
Me: No one's. No one's going to be in a situation where they're like. Like every co-worker has the same set of functions, and that's actually why I started doing the person co-worker thing because it's. Like, I need to be able to just do it myself. And now open in VS code and open in codex means I can literally perform. Like, I, as a human can do a thing and request a write back. And, like, that's, like, kind of important. You know?
Them: So when can I have all of this? So.
Me: I'm the demo I showed is, like, I'm finishing. And pick up. The task Authority already landed. So last night. So.
Them: Okay. I will. Wait. I also. Had a bunch of tasks. That I made. Can you go linear? Did you see those?
Me: I've been sort of sorting through. I. Yeah, I don't want to talk to it right now because my brain's not in a place where that's, like, a good use of my brain power.
Them: Like basically what I did was I ran into a problem had codex fix it. And tell you what was wrong with it instead of pushing a pull request.
Me: That was super helpful.
Them: Because there are so many little things. Because I'm like, I'm sure most of them are related to other things that you're working on. So I didn't want to.
Me: Yeah, that's, like, incredibly helpful because also, like.
Them: But.
Me: A lot of the stuff that I'm doing because it's so big picture, it's like, oh, the way to fix these 10 bugs is to have plugins. You know, instead of.
Them: T.
Me: Oh, let's fix this one bug at a time or whatever. And, like, we might end up fixing it one bug at a time, but, like, knowing the 10 bucks exists gives us plugins, which fixes it long term. You know?
Them: And now that codex knows about all the tasks. It can be like these are all related.
Me: That's. And, yeah, I've just been. I've dumping. I'm just having codex dump everything into linear. And, like, anytime I see something that's a side quest, dump into linear and don't do it right now. And, like, it's just been really helpful.
Them: Wise that I found that I want to talk about is the logo.
Me: Wait, one thing really quick I just thought of really quick.
Them: Cannot.
Me: This. I can't. I don't want to lose it. Dan. Book with David today before as soon as possible. Okay, sorry. Keep going.
Them: Like it's literally just the logo cannot be yellow. Because it looks like a warning. Like a street closure sign.
Me: Yeah. I was thinking about going.
Them: That's all.
Me: Through. I mean, it'd be kind of fun to make it, like, the presso blue. What do you think? Blue works better for light mode? And dark mode?
Them: Yeah. Like right now we have all of the overrides so that it can never be yellow text on white background, but with the blue. You don't have to have that. Also what happened with tax.
Me: Yeah.
Them: O.
Me: The CTO just, like, put everything in question marks. So it's all question marks now.
Them: You're not going to use BFD. S.
Me: Not yet. Maybe next week. But.
Them: Is he a CTO. Before or is he a new CTO?
Me: He's been a founding engineer before. So he's. Like, extremely qualified.
Them: But still malleable so you can do what he want.
Me: Like, he'll trust me. Yeah. Like, he'll trust that I'm not full of. Basically.
Them: Cool. And Dan, I have no further.
Me: So.
Them: Topics.
Me: I'll dump all the Granola notes to create linear tasks from today. So don't do that, Dan. I'll do it.
Them: Wait, say that last thing again.
Me: I'll dump all the Granola notes from this meeting to make linear tasks and I'll organize them.
Them: Oh cool. I'm booking with David for Monday afternoon. Is that good?
Me: Yeah. So.
Them: Do you want a full hour or just half an hour?
Me: My goal is. That we have an actual pitch deck that we show David. And that the pitch deck is good.
Them: We haven't talked about that before I booked.
Me: No. Goals aren't necessarily the same thing. Like, we can do. There's a bunch of things we can do. But I want to do pitch deck. Like, I want to do all of it and then have it, like, work. So. I have a meeting at one with a Randall. Which is, like, kind of a good palette cleanse. And then. Oh, wait, hold on. Let me just call this guy really quick. Meeting right now. With this guy. For 20 minutes. Palate cleanse, and then let's come back and just do, like, a huge, like, hangout all day, like, work on the same. Call, not necessarily on the same things thing.
Them: Yes, I still have more questions, so we will pick this up at one.
Me: Okay. Love you. Bye.
Them: For things to talk about. Okay. Have fun.
Me: I just have a really cool domain. For. I was going to try doing work loopers. What do you think a good name? So I just realized that there should be an email. That's like not agents. It should be like work loop. It should just be work loop mail. It's fine. Great work loop mail exists. Okay, I'm going to share my screen. Okay. So. Why does that always come up on my screen? It's so stupid. Okay, so. Let's make a new. I'm gonna make a new workspace. Okay. BFT workspace. Work loop. We do. Our work loop company. Great. Thing so freaking long. This is the opposite of code bot. I think because it has to build the whole app and then it launches. I forgot. That that happened. Okay. Once this is done. I'll get my headphones. I'll be right back. I'll get my headphones. I'll be right back.
Them: I'm gonna go to the bathroom. Hey, sorry. I don't think slack has this good of noise canceling.
Me: You guys hear me? Is it better now?
Them: All I heard was.
Me: How about now?
Them: Sounded like it was corrupt audio.
Me: It was because I connected. And slack doesn't reinitialize. Probably.
```
