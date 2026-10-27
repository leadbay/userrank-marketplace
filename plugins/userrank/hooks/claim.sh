#!/bin/sh
# UserRank session check: exchanges the one-time hook claim from submit_scan for the hook token (spec 6.3, 8.1).
# Usage: sh claim.sh <hook_claim>
# POSTs the claim to https://mcp.userrank.ai/v1/plugin/hook/claim, saves the returned token to ~/.userrank/hook-token
# (folder mode 0700, file mode 0600) and prints only "Saved." or "Couldn't save the token." The token is never printed.
fail() { echo "Couldn't save the token."; exit 1; }
CLAIM="$1"
case "$CLAIM" in ''|*[!A-Za-z0-9_-]*) fail ;; esac
RESP=$(curl -sf --max-time 10 -X POST -H "Content-Type: application/json" -d "{\"claim\":\"$CLAIM\"}" https://mcp.userrank.ai/v1/plugin/hook/claim) || fail
TOKEN=$(printf '%s' "$RESP" | sed -n 's/.*"\(hook_\)\{0,1\}token"[[:space:]]*:[[:space:]]*"\([A-Za-z0-9_-]*\)".*/\2/p')
[ -n "$TOKEN" ] || fail
umask 077
mkdir -p "$HOME/.userrank" || fail
chmod 700 "$HOME/.userrank" || fail
printf '%s' "$TOKEN" > "$HOME/.userrank/hook-token" || fail
chmod 600 "$HOME/.userrank/hook-token" || fail
echo "Saved."
