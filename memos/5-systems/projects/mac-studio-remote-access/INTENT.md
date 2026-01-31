# INTENT: Mac Studio Remote Access (Project)

## Purpose

- Turn two Mac Studios into reliable, secure work servers that teammates can
  access remotely at any time.

## End State

- Both Mac Studios are reachable remotely via Cloudflare Tunnel, with Cloudflare
  Access enforcing authentication and authorization.
- Access is restricted to Bolt Foundry Google Workspace identities
  (`@boltfoundry.com`), with optional group-based allowlists for specific
  services.
- Each teammate uses their own identity and account (no shared logins).
- A dedicated system account exists for background jobs and automation.
- Interactive login is not the default for this account.
- Each host has a stable hostname (recorded in the runbook) so access and
  automation are predictable.
- Authentication and access are logged (who accessed what, when) and are
  auditable.
- Their setup is instantiated by Nix, stored in this repo under `code/`, and is
  reproducible for each host.
- At-rest encryption is available without FileVault by using a dedicated,
  encrypted APFS volume (e.g., `data`) for sensitive/work data.
- Time Machine backups are enabled to an external disk, and a test file restore
  has been performed.
- Remote access supports SSH and screen sharing.
- Screen sharing preference order: macOS Screen Sharing first, then Screens 5,
  then other fallback options if needed (but never via a public/exposed VNC
  service).
- A documented runbook exists for onboarding, access changes, and recovery.
- After unattended reboots, remote access returns without physical
  intervention within an acceptable window.

## Constraints

- No public inbound SSH or open ports.
- Access must require Google SSO with domain allowlist.
- Preserve security; no shared passwords.
- Must be available at boot (avoid FileVault blocking remote access).
- Sensitive data must be encryptable at rest via an encrypted APFS volume.
- We may wipe and rebuild the machines; assume current state is disposable.

## Tradeoffs

- Security over convenience.
- Reliability over novelty.
- Centralized access control over ad-hoc sharing.
- Boot availability over full-disk encryption.
- Clean rebuild over preserving current state.

## Risk tolerance

- Medium for incremental configuration changes.
- Low for anything that weakens authentication or exposes the machines.

## Escalation conditions

- Access cannot be restricted to Bolt Foundry identities.
- Repeated downtime blocks work.
- Security posture degrades or cannot be validated.

## Verification steps

- Both Mac Studios are accessible through Cloudflare Access using
  `@boltfoundry.com` Google accounts; unauthorized accounts are blocked.
- At least one teammate can complete: authenticate, establish remote access, and
  perform basic work on each host.
- Both SSH and screen sharing work remotely.
- Screen sharing works using macOS Screen Sharing; Screens 5 is available as a
  fallback.
- Access events appear in the audit trail with the correct identity and
  timestamps.
- Reboot test: each host is rebooted and remote access returns without physical
  intervention within an acceptable window.
- Nix test: the Nix configuration for each host can be applied (or re-applied)
  from this repo, and drift is corrected.
- System account test: background jobs run without an interactive login, and a
  simple egress check (ping or HTTP) validates the host is up when nobody is
  logged in.
- Encryption test: an encrypted APFS `data` volume exists and can be mounted for
  storing sensitive/work data.
- Backup test: Time Machine shows recent backups and a test file restore
  succeeds.
- Runbook exists and has been tested end-to-end.

## Activation / revalidation

- Active immediately upon adoption.
- Superseded when the new access system is live and stable.
- Revalidate after first month of use or any major access change.

## Appendix

### Inputs

- `memos/INTENT.md`
- `memos/5-systems/INTENT.md`
- `policy/product-command.md`
