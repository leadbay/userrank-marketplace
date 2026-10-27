#!/bin/sh
# UserRank statusline for Claude Code (spec 8.4; package C only, installed only when the person asks).
# Prints at most 40 characters, such as "UserRank No. 417 · trying 1 · scan open". Calls
# https://mcp.userrank.ai/v1/plugin/statusline with the session-check token at most once a day and caches the line in
# ~/.userrank/statusline.cache. Prints nothing when no token exists.
TOKEN_FILE="$HOME/.userrank/hook-token"
CACHE="$HOME/.userrank/statusline.cache"
show_cache() { [ -f "$CACHE" ] && cat "$CACHE"; exit 0; }
if [ -f "$CACHE" ] && [ -n "$(find "$CACHE" -mmin -1440 2>/dev/null)" ]; then show_cache; fi
[ -r "$TOKEN_FILE" ] || exit 0
[ -n "$CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC" ] && show_cache
DNT=0
[ -n "$DO_NOT_TRACK" ] && [ "$DO_NOT_TRACK" != "0" ] && DNT=1
[ -n "$DISABLE_TELEMETRY" ] && [ "$DISABLE_TELEMETRY" != "0" ] && DNT=1
BODY=$(curl -sf --max-time 2 -H "Authorization: Bearer $(cat "$TOKEN_FILE")" -H "DNT: $DNT" https://mcp.userrank.ai/v1/plugin/statusline) || show_cache
LINE=$(printf '%s' "$BODY" | sed -n 's/.*"line"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
[ -n "$LINE" ] || LINE=$(printf '%s\n' "$BODY" | head -n 1)
[ -n "$LINE" ] || show_cache
umask 077
printf '%s\n' "$LINE" > "$CACHE"
printf '%s\n' "$LINE"
