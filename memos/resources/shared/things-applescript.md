# Things AppleScript Access

Use AppleScript as the preferred programmatic interface for Things on this Mac.
The app bundle is `/Applications/Things.app`, and the scriptable application
name is `Things3`.

## Quick Checks

```applescript
tell application "Things3"
  get name of every area
  get name of every project
  get name of every to do
end tell
```

From shell:

```sh
osascript -e 'tell application "Things3" to get name of every area'
osascript -e 'tell application "Things3" to get name of every project'
```

## Object Model

Useful top-level collections:

- `area`
- `project`
- `to do`
- `tag`
- `contact`
- `list`
- `selected to do`

Important properties:

- Areas: `name`, `id`, `tag names`, `collapsed`, `to dos`
- Projects: `name`, `id`, `notes`, `tag names`, `status`, `area`, `to dos`
- To-dos: `name`, `id`, `notes`, `tag names`, `status`, `project`, `area`,
  `due date`, `activation date`, `completion date`, `cancellation date`
- Tags: `name`, `id`, `keyboard shortcut`, `parent tag`

Status values:

- `open`
- `completed`
- `canceled`

## Guardrails

- Use `Things3` as the AppleScript application name.
- Query projects globally with `every project`; do not use `every project of
  area "Name"`.
- To find projects in an Area, loop through global projects and check
  `name of area of p`.
- Create a Project with an `area` property when it belongs inside an Area.
- Create to-dos with a `project` property when they belong inside a Project.
- Use `schedule ... for date` for start dates.
- Use `due date` only for real deadlines.
- Avoid hidden `_private_experimental_` commands unless there is no stable
  alternative.
- Preserve existing Things structure unless the user explicitly asks for a
  cleanup.

## Create Missing Areas

```applescript
tell application "Things3"
  set existingAreas to name of every area

  if existingAreas does not contain "Consulting" then
    make new area with properties {name:"Consulting"}
  end if

  if existingAreas does not contain "Personal Ops" then
    make new area with properties {name:"Personal Ops"}
  end if
end tell
```

## Create a Project in an Area

```applescript
tell application "Things3"
  set existingProjects to name of every project

  if existingProjects does not contain "Memos operating system" then
    set p to make new project with properties {¬
      name:"Memos operating system", ¬
      area:area "Personal Ops", ¬
      notes:"Filesystem root: /Users/randallb/Documents/New project/memos" ¬
    }

    make new to do with properties {name:"Review memos root intent", project:p}
    make new to do with properties {name:"Create active consulting client project folders", project:p}
    make new to do with properties {name:"Link active Bolt Foundry Things projects to memos project folders", project:p}
  end if
end tell
```

## Create a Standalone To-Do in an Area

```applescript
tell application "Things3"
  make new to do with properties {¬
    name:"Review Taxo hours for May 1-7", ¬
    area:area "Consulting", ¬
    tag names:"client, admin" ¬
  }
end tell
```

## Create To-Dos in a Project

```applescript
tell application "Things3"
  set p to project "Memos operating system"

  make new to do with properties {name:"Draft project intent template", project:p}
  make new to do with properties {name:"Review Things AppleScript reference", project:p, tag names:"admin"}
end tell
```

## Schedule a To-Do

Scheduling sets the Things start date, which makes the task appear in Upcoming
until that date.

```applescript
tell application "Things3"
  set t to make new to do with properties {¬
    name:"Review weekly active projects", ¬
    area:area "Personal Ops" ¬
  }

  schedule t for date "Friday, May 8, 2026 at 9:00:00 AM"
end tell
```

## Complete or Cancel a To-Do

```applescript
tell application "Things3"
  set status of to do "Review memos root intent" to completed
end tell
```

```applescript
tell application "Things3"
  set status of to do "Old stale task" to canceled
end tell
```

## Read Projects with Their Areas

```applescript
tell application "Things3"
  set rows to {}

  repeat with p in every project
    try
      set areaName to name of area of p
    on error
      set areaName to ""
    end try

    set end of rows to (name of p & " | " & areaName)
  end repeat

  return rows
end tell
```

## Find Projects in an Area

```applescript
tell application "Things3"
  set matches to {}

  repeat with p in every project
    try
      if name of area of p is "Personal Ops" then
        set end of matches to name of p
      end if
    end try
  end repeat

  return matches
end tell
```

## Show an Item in Things

```applescript
tell application "Things3"
  show project "Memos operating system"
end tell
```

```applescript
tell application "Things3"
  show to do "Review memos root intent"
end tell
```

## Open Quick Entry

```applescript
tell application "Things3"
  show quick entry panel with properties {¬
    name:"Capture inbox item", ¬
    notes:"Created from AppleScript" ¬
  }
end tell
```

## Quicksilver Syntax

Things can parse a compact text format. Use this for simple capture, not for
careful project setup.

```applescript
tell application "Things3"
  parse quicksilver input "Review active projects #admin"
end tell
```

## Shell Pattern for Codex

Use heredocs for multi-line scripts:

```sh
osascript <<'APPLESCRIPT'
tell application "Things3"
  set existingAreas to name of every area
  if existingAreas does not contain "Consulting" then
    make new area with properties {name:"Consulting"}
  end if
end tell
APPLESCRIPT
```

## Known Error Patterns

This fails:

```applescript
tell application "Things3"
  get name of every project of area "Personal Ops"
end tell
```

Use a global loop instead:

```applescript
tell application "Things3"
  set matches to {}
  repeat with p in every project
    try
      if name of area of p is "Personal Ops" then set end of matches to name of p
    end try
  end repeat
  return matches
end tell
```

## Current Local Baseline

As of May 7, 2026, this Things database has these relevant Areas:

- `Workloop`
- `Consulting`
- `Family`
- `Home`
- `Personal Ops`
- `Health`
- `Relationships`
- `Money`
- `Systems`
- `Creative / Play`

These Areas should map to companion folders in `memos/areas/` when durable
context exists.
