# Implementation Checklist: Mac Studio Remote Access

Use this checklist to build the target state for each Mac Studio.

## 0. Project Setup

- [ ] Assign host identifiers (Host A / Host B) and stable hostnames.
- [ ] Assign an owner for implementation execution.
- [ ] Confirm intent baseline from `INTENT.md` is accepted.
- [ ] Create or link a working runbook draft for procedures.

## 1. Identity and Access (Cloudflare)

- [ ] Create/confirm Cloudflare Tunnel per host.
- [ ] Configure Cloudflare Access applications/policies for SSH.
- [ ] Configure Cloudflare Access applications/policies for screen sharing.
- [ ] Restrict access to `@boltfoundry.com` identities.
- [ ] Add optional group allowlists where needed.
- [ ] Confirm no public inbound SSH/open ports are required.

## 2. Host Accounts and Security

- [ ] Ensure each teammate has an individual account (no shared logins).
- [ ] Create dedicated system account for background jobs/automation.
- [ ] Ensure interactive login is not default for system account.
- [ ] Verify local authentication posture avoids shared secrets.

## 3. Host Configuration via Nix

- [ ] Add host configuration under `code/` for each Mac Studio.
- [ ] Encode hostname, required services, and access dependencies in config.
- [ ] Apply configuration successfully on each host.
- [ ] Re-apply configuration to confirm reproducibility and drift correction.

## 4. Remote Access Services

- [ ] Enable SSH remote access path through Cloudflare Access.
- [ ] Enable macOS Screen Sharing remote access path.
- [ ] Install/configure Screens 5 fallback path.
- [ ] Confirm no public/exposed VNC endpoint exists.

## 5. Data Protection and Backups

- [ ] Create encrypted APFS `data` volume (or equivalent named volume).
- [ ] Validate mount/unmount workflow for sensitive data storage.
- [ ] Enable Time Machine to external disk on each host.
- [ ] Capture initial successful backup on each host.

## 6. Logging and Auditability

- [ ] Ensure Cloudflare Access events are captured and retained.
- [ ] Ensure access events can be attributed to individual identities.
- [ ] Document where logs are checked during incident/review.

## 7. Operations Readiness

- [ ] Finalize runbook for onboarding, access changes, and recovery.
- [ ] Include break-glass/escalation contact path in runbook.
- [ ] Document acceptable reboot recovery window and response policy.
- [ ] Mark implementation complete for Host A.
- [ ] Mark implementation complete for Host B.
