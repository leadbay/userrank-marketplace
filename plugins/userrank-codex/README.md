# UserRank for Codex

See how you work with AI, share a page you control, and learn the practices you're missing. Your own AI reads your sessions; UserRank gets only names and counts.

## What it does

UserRank shows how you work with AI. When you say "Get my UserRank", the scan skill reads your recent AI sessions on this computer with your own assistant, matches what you do against the UserRank catalogue of AI practices, and sends only names and counts, saved to your account, where you choose what others see. You get a page and a card with your usage, the tools your AI used and your practices, your ranks, and three practices to learn next. The coach skill shows your UserRank, teaches practices you are missing, and handles sharing, invites and tribes when you ask.

Install in Codex: `codex plugin marketplace add https://app.userrank.ai/plugins/userrank.git`, then `codex plugin add userrank-codex@userrank` (or install "UserRank for Codex" from `/plugins`).

Say "Get my UserRank" to start. Other things to try: "Show my UserRank", "Teach me a practice I'm missing", "What practices help me verify AI work?".

## What it reads

Only after you say Start: the session files of the last 30 days in ~/.claude/projects (Claude Code and the Claude Desktop Code tab) and, after asking you, ~/.codex/sessions (Codex) and Cursor's local store; for your usage chart, the dates of your prompts over up to a year (dates only); the inventory of your setup (instruction files, skills and commands, hooks, MCP server names, scheduled jobs; names and dates, never secrets); and a ChatGPT export file when you point the scan at one. In Cowork it reads only the folders you share. Everything is read locally by your own assistant. Nothing is read in chat apps, and the plugin never uses chat history or memory.

## What it sends

Every request goes to UserRank, run by Leadbay Inc., on two hosts: https://mcp.userrank.ai, which the collector and the hook call, and https://app.userrank.ai, your results page, which the scan opens in your browser.
- The scan payload, when the scan finishes, to mcp.userrank.ai: practice ids with session counts, the ids of the skills, MCP servers and plugins your AI used in the window with the days each was used (a hash for any not in UserRank's list), how many prompts you typed each day, session counts per surface, the scan window, the host and model names, the collector version and hash, and a hash of any possibly-new practices. Never transcript text, prompts, file paths, or names of people, companies or repositories.
- The sealed extras for your results page, when the scan finishes, to mcp.userrank.ai: the collector encrypts them with a key that stays in your results page's address after the # (browsers never send that part), and only your results page decrypts them, in your browser. UserRank stores the encrypted text for 7 days. They hold up to 5 people your assistant suggests you invite, each with a name, an email address and a few words on why, chosen from the people in the git history of your projects on this computer (commit authors of the last 90 days) and people named in your conversation; two draft posts for your card; a headline and a city for your profile; the name and one line of each possibly-new practice your scan found; and the name, one line and source of each skill, MCP server or plugin your AI used that is not in UserRank's list (the source is the repository address for a skill from a git repository).
- From your results page to https://app.userrank.ai: the possibly-new practices and the tools not in UserRank's list, name, one line and source only, checked for personal data before they are stored; the draft post, the headline and the city only when you post, copy or save them.
- Invites only after you press Send or copy one: name, email and note, used once and then kept only as a salted hash. Nobody is emailed before you press Send.
- The session-check request after you opt in: your hook token and a do-not-track flag, at most once a day.
- The catalogue fetch: the catalogue version only.
UserRank records server-side product analytics in PostHog's EU cloud (which UserRank tools and pages are used, never your sessions or anything you write). It is on by default; turn it off with "Turn off UserRank analytics" or in Settings.

## Hooks

None. This plugin has no hooks and runs nothing in the background. In Codex, news about new practices and people you invited arrives only inside UserRank tool results you asked for.

## Privacy

Everything is read on your computer by your own assistant. The only things that reach UserRank are the names and counts of your practices and of the tools your AI used, your prompts per day, the possibly-new practices your scan found, the sealed extras for your results page (invite suggestions with names and email addresses from your git history, draft posts, a headline and a city, and the names of tools not in UserRank's list), invites you sent, and the session-check token you opted in to.

- Your sessions are never sent to UserRank. Your own AI assistant reads them through your usual account with its AI provider, as part of normal use. UserRank receives only names and counts: your practices, the skills, MCP servers and plugins your AI used, how many prompts you typed each day, and the name and one line of each possibly-new practice your agent found.
- A finished scan is saved to your account. Everything counts for your score, and you choose who sees each result: Only me, Anyone with the link or On my page. You can see exactly what was sent, and delete a result at any time.
- Nothing is listed or searchable until you put a result on your page, except the name and one line of a practice or tool your agent is first to find. Hide anything you don't want shown. Only me closes a result's link and deletes its public pictures.
- If you sign in with a work address, you are counted in your company tribe (by email domain) unless you turn it off. Each colleague sees only their own place, never yours. Once you have a page and say yes, the builders in your tribes, colleagues included, see your name and page, never your score. Accounts created before 12 October 2026 are counted only if they turn it on.
- Nobody at your company can see your score.
- Invitee addresses are used once to send your invitation, then kept only as a salted hash so we never email them twice.
- Delete everything any time: say 'delete my UserRank' or use Settings. It's removed from UserRank within 24 hours and from backups within 60 days.

UserRank keeps product analytics in PostHog's EU cloud: which UserRank tools and pages are used, never your sessions or anything you write. Turn it off in Settings or say 'Turn off UserRank analytics'. Card and plugin usage details are linked to you only if you choose 'Share usage details'.

## Opt out

- Analytics: say "Turn off UserRank analytics" or switch it off in Settings (https://app.userrank.ai/settings).
- Session check hook: delete the folder ~/.userrank, or never say yes to the question; uninstalling the plugin removes the hook.
- Everything: say "Delete my UserRank" or use Settings. It's removed from UserRank within 24 hours and from backups within 60 days.

## Support

Help and known issues: https://app.userrank.ai/support. Email support@userrank.ai (we answer within 2 business days). Security reports: security@userrank.ai. Docs: https://app.userrank.ai/docs. Privacy policy: https://app.userrank.ai/privacy.

Publisher: Leadbay Inc., 1111B S Governors Ave STE 39898, Dover, DE 19904, United States.
