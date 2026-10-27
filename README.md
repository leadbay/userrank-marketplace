# UserRank plugin marketplace

For the Claude app (Settings → Plugins → Add → Add marketplace): enter `leadbay/userrank-marketplace`, then install UserRank.

In Claude Code: `claude plugin marketplace add https://app.userrank.ai/plugins/marketplace.json` then `claude plugin install userrank@userrank`.

This repo holds only the marketplace file. The plugin itself is served, pinned by sha256, from https://app.userrank.ai/plugins/. More: https://app.userrank.ai/docs
