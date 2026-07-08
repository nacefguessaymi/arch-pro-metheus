# aerc + Outlook/M365 — required executables

## Installed / built

- **`w3m`** — `sudo pacman -S w3m` — renders HTML email safely (sandboxed via `unshare`)
- **`gnupg`** — `sudo pacman -S gnupg` — encrypts the OAuth2 token files (binary is `gpg`)
- **`man-db` + `man-pages`** — `sudo pacman -S man-db man-pages` — needed for aerc's `:help`
- **`cyrus-sasl-xoauth2`** — compiled from source (our fork), installed to `/usr/lib/sasl2/`
  — teaches SASL how to speak the XOAUTH2 mechanism
- **`mutt_oauth2.py`** — downloaded script at `~/.local/bin/mutt_oauth2.py`
  — fetches/refreshes the actual OAuth2 tokens; called by mbsync and aerc as a `PassCmd`/`cred-cmd`

