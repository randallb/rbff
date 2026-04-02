# Mac Studio Remote Access

Execution companion for `INTENT.md`.

## Goal

Turn two Mac Studios into reliable, secure work servers accessible remotely via
Cloudflare Access, with reproducible setup and auditable operations.

## Scope

- Remote access via Cloudflare Tunnel + Cloudflare Access.
- Access control with Bolt Foundry Google Workspace identities.
- SSH and screen sharing (macOS Screen Sharing preferred, Screens 5 fallback).
- Reproducible host setup via Nix.
- Encrypted APFS data volume for sensitive/work data (without FileVault
  dependency at boot).
- Backups via Time Machine and restore validation.
- Runbook and onboarding/access-change/recovery procedures.

## Non-Goals (v1)

- Public inbound SSH or exposed VNC services.
- Shared user accounts or shared passwords.
- Durable implementation details inside `INTENT.md`.

## Deliverables

- Implementation checklist complete for both hosts.
- Verification checklist passed for both hosts.
- Runbook produced and tested end-to-end.

## Project Artifacts

- Intent: `memos/5-systems/projects/mac-studio-remote-access/INTENT.md`
- Implementation checklist:
  `memos/5-systems/projects/mac-studio-remote-access/IMPLEMENTATION_CHECKLIST.md`
- Verification checklist:
  `memos/5-systems/projects/mac-studio-remote-access/VERIFICATION_CHECKLIST.md`

## Exit Criteria

- Both hosts meet all verification checks.
- Reboot resilience validated for unattended recovery.
- Access and auth posture is auditable and restricted to intended identities.
