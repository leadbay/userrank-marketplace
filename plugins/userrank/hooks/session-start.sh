#!/bin/sh
TOKEN_FILE="$HOME/.userrank/hook-token"
STAMP="$HOME/.userrank/last-hook"
[ -r "$TOKEN_FILE" ] || exit 0
[ -n "$CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC" ] && exit 0
if [ -f "$STAMP" ] && [ -n "$(find "$STAMP" -mmin -1440 2>/dev/null)" ]; then exit 0; fi
touch "$STAMP"
DNT=0
[ -n "$DO_NOT_TRACK" ] && [ "$DO_NOT_TRACK" != "0" ] && DNT=1
[ -n "$DISABLE_TELEMETRY" ] && [ "$DISABLE_TELEMETRY" != "0" ] && DNT=1
curl -sf --max-time 2 -H "Authorization: Bearer $(cat "$TOKEN_FILE")" -H "DNT: $DNT" https://mcp.userrank.ai/v1/plugin/hook/session-start || true
exit 0
