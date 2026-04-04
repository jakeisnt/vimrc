# nvim wishlist

Things worth doing, sourced from jakeisnt/nixcfg#163.

## plugins / features

- **Treesitter textobject keymaps** — `nvim-treesitter-textobjects` is a dependency of `treesitter.lua` but has no keymaps configured. Add `if`/`af` (function), `ic`/`ac` (class), etc.
- **Move highlighted block up/down** — `<A-j>`/`<A-k>` only work on single lines in normal mode. Extend to visual mode for multi-line moves.
- **Suppress LSP completion in comments** — `blink.lua` controls completion; add a context filter to skip suggestions inside comment treesitter nodes.
- **Highlight URLs + open with `gx`** — no URL highlighting. Add `vim-highlighturl` or configure `gx` to open URLs under cursor in a browser.
- **New bullet shortcut in markdown** — no filetype keymap for inserting a new list item. Add a small `BufEnter *.md` autocommand or snippet.
- **Semantic text navigation** — treesitter-textobjects is installed but unconfigured. Wire up delete/select by semantic unit (function, class, parameter).
- **Split → open file picker** — `<leader>ws`/`<leader>wv` split but leave the new pane empty. Wrap them to call Telescope after splitting.
- **`<leader>,` buffer switcher** — Doom-style buffer picker. `;` already maps to `telescope buffers`; alias `<leader>,` to the same.
