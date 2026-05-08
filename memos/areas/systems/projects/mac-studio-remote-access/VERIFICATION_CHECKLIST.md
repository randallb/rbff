# Verification Checklist: Mac Studio Remote Access

Use this checklist to verify acceptance criteria after implementation.

## Verification Metadata

- [ ] Verification date recorded.
- [ ] Verifier name recorded.
- [ ] Host A identifier recorded.
- [ ] Host B identifier recorded.

## 1. Access Control and Identity

- [ ] Host A: Cloudflare Access allows `@boltfoundry.com` Google identity login.
- [ ] Host A: unauthorized/non-allowlisted identity is blocked.
- [ ] Host B: Cloudflare Access allows `@boltfoundry.com` Google identity login.
- [ ] Host B: unauthorized/non-allowlisted identity is blocked.

## 2. End-to-End Remote Work Test

- [ ] Host A: teammate can authenticate and establish remote session.
- [ ] Host A: teammate can perform basic work tasks in session.
- [ ] Host B: teammate can authenticate and establish remote session.
- [ ] Host B: teammate can perform basic work tasks in session.

## 3. Remote Protocol Coverage

- [ ] Host A: SSH works remotely through approved access path.
- [ ] Host B: SSH works remotely through approved access path.
- [ ] Host A: macOS Screen Sharing works remotely.
- [ ] Host B: macOS Screen Sharing works remotely.
- [ ] Host A: Screens 5 fallback path works.
- [ ] Host B: Screens 5 fallback path works.
- [ ] Confirm no public/exposed VNC service is reachable.

## 4. Audit and Logging

- [ ] Access event log shows correct user identity for Host A test session.
- [ ] Access event log shows correct user identity for Host B test session.
- [ ] Access event timestamps are present and accurate.
- [ ] Log retrieval path is documented in runbook.

## 5. Reboot Resilience

- [ ] Host A rebooted unattended; remote access recovered within acceptable window.
- [ ] Host B rebooted unattended; remote access recovered within acceptable window.
- [ ] Recovery times recorded for both hosts.

## 6. Nix Reproducibility

- [ ] Host A: Nix configuration applied successfully from this repo.
- [ ] Host A: re-apply shows drift correction behavior as expected.
- [ ] Host B: Nix configuration applied successfully from this repo.
- [ ] Host B: re-apply shows drift correction behavior as expected.

## 7. System Account Validation

- [ ] Host A: background job runs without interactive login.
- [ ] Host A: egress check succeeds while no user is logged in.
- [ ] Host B: background job runs without interactive login.
- [ ] Host B: egress check succeeds while no user is logged in.

## 8. Encryption and Data Volume

- [ ] Host A: encrypted APFS `data` volume exists.
- [ ] Host A: `data` volume mounts and stores test sensitive file.
- [ ] Host B: encrypted APFS `data` volume exists.
- [ ] Host B: `data` volume mounts and stores test sensitive file.

## 9. Backup Validation

- [ ] Host A: Time Machine shows recent backup.
- [ ] Host A: test file restore succeeds.
- [ ] Host B: Time Machine shows recent backup.
- [ ] Host B: test file restore succeeds.

## 10. Runbook Acceptance

- [ ] Runbook exists and is up to date.
- [ ] Onboarding flow tested end-to-end.
- [ ] Access change flow tested end-to-end.
- [ ] Recovery flow tested end-to-end.

## Evidence Log

- [ ] Attach/link screenshots, logs, and command outputs for each section.
- [ ] Record open issues and owners for any unchecked item.
- [ ] Final pass/fail decision recorded.
