---
name: lazyvim-qa
description: Answer LazyVim/Neovim keybinding and how-to questions using the user's real config, then append the resulting bindings to their "LazyVim Q&A" Claude Doc. Use for any question like "how do I ... in lazyvim", and when asked to add something to the LazyVim doc.
---

# LazyVim Q&A

Answer the question from the user's actual setup, then record the bindings in the Q&A doc.

## 1. Find the answer, don't guess

- Grep `~/.config/nvim/lua/**` for overrides first. Trust that the host is in sync with chezmoi; don't read the chezmoi source for this. Check `~/.config/nvim/lazyvim.json` for enabled extras.
- Verify defaults against the installed plugin source in `~/.local/share/nvim/lazy/` (LazyVim, snacks.nvim, sidekick.nvim, ...). Read-only greps only.
- Prefer built-in, LazyVim-extra and snacks features over new plugins. Never install anything; list what's needed.

## 2. Answer in chat

- Exact keys or command first, then one or two lines of context.
- End with a keybinding summary table (Keys | Action).
- If the answer needs a config change, edit the chezmoi source (`chezmoi source-path`), never `~/.config`. The sandbox blocks `chezmoi apply`, so give the user the exact command (e.g. `chezmoi apply ~/.config/nvim/lua/config/keymaps.lua`) to run themselves.

## 3. Update the doc

Doc: `https://claude.ai/code/artifact/6daba1d3-b445-4d17-9bc6-31b39cd411f1` (doc id `6daba1d3-b445-4d17-9bc6-31b39cd411f1`, tab body node `4b4e2929-9da4`).

- Load the docs tools (`guide`, `read`, `update`, `query`) before the first call. Load `topic.editing` and `topic.comments` via `guide` if you haven't.
- Before editing, `read` the body with `payload {"kind":"view","sinceRev":<last rev seen>}`, or a full outline if you have none. Also `query` comments with `afterSeq`. The user edits the doc and comments to you, so their changes win.
- **Merge before creating.** If an existing section covers the topic (search/grep, terminal, Sidekick, ...), add one line and table rows to it. Only if none fits, add `## N. <short title>` at the bottom: a few-word title (not the full question), a one-line answer, then a Keys | Action table. No bullet descriptions.
- Add only the main 1–2 bindings to the combined "All keybindings" table at the top. It has just Keys and Action, and each binding appears once.
- Guard replaces and deletes with `ifRev`/`ifHash`. Never use `force`.
- Finish with one short chat line saying what changed in the doc. Don't paste the doc.

If the docs tools aren't available, say so and give the rows to paste. Don't write a local file.
