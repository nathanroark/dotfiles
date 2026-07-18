#!/usr/bin/env bash
#
# remap-capslock-to-backspace.sh
# Installs Karabiner-Elements (if needed) and remaps Caps Lock -> Delete/Backspace.
#
# Heads-up: macOS security requires you to grant a couple of permissions BY HAND
# (Input Monitoring + a driver/system extension). That part cannot be scripted,
# so the script pauses and walks you through it, then finishes the config for you.

set -euo pipefail

FROM_KEY="caps_lock"
TO_KEY="delete_or_backspace"
CONFIG="$HOME/.config/karabiner/karabiner.json"

echo "==> Checking for Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
  echo "    Homebrew isn't installed."
  read -r -p "    Install it now? (needs your password, may take a few min) [y/N] " ans
  if [[ "${ans:-N}" =~ ^[Yy]$ ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Load brew into this shell (covers Apple Silicon and Intel paths)
    if   [[ -x /opt/homebrew/bin/brew ]]; then eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew   ]]; then eval "$(/usr/local/bin/brew shellenv)"
    fi
  else
    echo "    Can't continue without Homebrew. Install from https://brew.sh and re-run."
    exit 1
  fi
fi

echo "==> Ensuring jq is available (used to edit Karabiner's config safely)..."
if ! command -v jq >/dev/null 2>&1; then
  brew install jq
fi

echo "==> Installing Karabiner-Elements..."
if brew list --cask karabiner-elements >/dev/null 2>&1; then
  echo "    Already installed."
else
  brew install --cask karabiner-elements
fi

echo "==> Launching Karabiner-Elements..."
open -a "Karabiner-Elements" || true

cat <<'EOM'

--------------------------------------------------------------------
ACTION NEEDED (one time — macOS won't let a script do this part):

  1. Karabiner will prompt to enable its driver / system extension.
     Follow its on-screen steps. You may also need:
     System Settings > General > Login Items & Extensions
       > Driver Extensions  -> enable Karabiner.
  2. Grant Input Monitoring when asked:
     System Settings > Privacy & Security > Input Monitoring
       -> enable Karabiner-Elements.
  3. On Apple Silicon this may require a reboot to load the driver.

When Karabiner reports it's active, come back to this window.
--------------------------------------------------------------------
EOM

read -r -p "Press Enter once Karabiner is installed and permitted... "

# Karabiner creates its config on first launch; create a stub if it's not there yet.
if [[ ! -f "$CONFIG" ]]; then
  echo "==> Config not found yet; creating a minimal one at $CONFIG"
  mkdir -p "$(dirname "$CONFIG")"
  echo '{}' > "$CONFIG"
fi

# Back up whatever is there now.
BACKUP="${CONFIG}.backup.$(date +%Y%m%d%H%M%S)"
cp "$CONFIG" "$BACKUP"
echo "==> Backed up existing config to $BACKUP"

# Add the mapping to the currently selected profile. Idempotent: any existing
# caps_lock mapping is removed first, so re-running won't create duplicates.
TMP="$(mktemp)"
jq --arg from "$FROM_KEY" --arg to "$TO_KEY" '
  .profiles = (.profiles // [])
  | (if (.profiles | length) == 0
       then .profiles = [{"name":"Default profile","selected":true,"simple_modifications":[]}]
       else . end)
  | (if (any(.profiles[]; .selected == true))
       then .
       else .profiles[0].selected = true end)
  | .profiles |= map(
      if .selected == true
        then .simple_modifications =
          (((.simple_modifications // [])
              | map(select(.from.key_code != $from)))
           + [{"from":{"key_code":$from},"to":[{"key_code":$to}]}])
        else . end)
' "$CONFIG" > "$TMP" && mv "$TMP" "$CONFIG"

echo
echo "==> Done. Caps Lock is now mapped to Backspace."
echo
echo "Active profile's simple modifications:"
jq '.profiles[] | select(.selected==true) | .simple_modifications' "$CONFIG"
echo
echo "Karabiner watches this file and reloads automatically — no restart needed."
echo "To undo: open Karabiner-Elements > Simple Modifications and delete the row,"
echo "or restore the backup:  cp \"$BACKUP\" \"$CONFIG\""
