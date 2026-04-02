# Neovim IDE Guide (Your Customized Kickstart)

This guide explains how to use your current Neovim setup like a full IDE.
It covers navigation, search, coding, diagnostics, formatting, linting,
Git, debugging, testing, terminals, sessions, and language workflows.

## 1) What You Have in This Setup

Your config now includes:

- LSP + autocompletion for TypeScript, Python, Go, Rust, Lua, Bash, JSON, YAML, Markdown, C/C++
- Treesitter syntax and indentation support for major development languages
- File explorer (Neo-tree)
- Fuzzy search (Telescope)
- Diagnostics panel (Trouble)
- Formatting (Conform)
- Linting (nvim-lint)
- Git integration (gitsigns)
- Debugging (nvim-dap + language adapters)
- Testing (neotest with adapters for Go, Python, Jest, Rust)
- Integrated terminal (ToggleTerm)
- Session restore (persistence)

## 2) First-Time Setup Checklist

1. Open Neovim:

   nvim

2. Let plugins install, then run:

   :Lazy sync

3. Install language tools:

   :Mason

4. Run health checks:

   :checkhealth

5. For icons to render correctly, ensure your terminal is using a Nerd Font.

## 3) Key Notation Used in This Guide

- leader = Space key
- Example: <leader>sf means Space then s then f
- Normal mode keys assume you pressed Esc first

## 4) Core Navigation and Editing

### Window Navigation

- Ctrl+h: focus left split
- Ctrl+j: focus lower split
- Ctrl+k: focus upper split
- Ctrl+l: focus right split

### Terminal Escape

- In terminal mode: Esc Esc to return to normal mode

### Search Highlight Reset

- Esc clears active search highlight

## 5) Project and File Navigation

### Neo-tree (file explorer)

- <leader>e: toggle file explorer and reveal current file
- \\: reveal current file in Neo-tree
- Inside Neo-tree, \\ closes the tree window

### Telescope (fuzzy finder)

- <leader>sh: help tags
- <leader>sk: keymaps
- <leader>sf: find files
- <leader>sg: live grep project
- <leader>sw: grep current word
- <leader>sd: diagnostics list
- <leader>sr: resume last picker
- <leader>s.: recent files
- <leader>sc: commands
- <leader>ss: telescope builtins
- <leader><leader>: open buffers
- <leader>sn: search Neovim config files
- <leader>/: fuzzy search in current buffer
- <leader>s/: live grep in open files

### Jump Navigation (Flash)

- <leader>j: jump to visible targets
- <leader>J: treesitter-aware jump

## 6) LSP Code Intelligence

### LSP Actions

- grn: rename symbol
- gra: code action
- grD: go to declaration

### LSP Navigation (Telescope-powered)

- grr: references
- gri: implementations
- grd: definitions
- grt: type definitions
- gO: document symbols
- gW: workspace symbols

### Inlay Hints

- <leader>th: toggle inlay hints in current LSP buffer

### Diagnostics

- <leader>q: open diagnostic location list
- <leader>xx: open Trouble diagnostics
- <leader>xX: Trouble diagnostics (current buffer only)
- <leader>xL: Trouble location list
- <leader>xQ: Trouble quickfix list
- <leader>cs: Trouble symbols
- <leader>cl: Trouble LSP references/definitions view

## 7) Formatting and Linting

### Format

- <leader>f: format current buffer

Configured formatters include:

- TypeScript/JavaScript/JSON/YAML/Markdown: prettierd/prettier
- Python: ruff organize imports + ruff format
- Go: goimports + gofumpt + gofmt
- Rust: rustfmt
- Shell: shfmt
- Lua: stylua

### Lint

- <leader>ll: lint current buffer manually

Linting also runs automatically on:

- buffer enter
- write post
- insert leave

Configured linters (when executables are available):

- TypeScript/JavaScript: eslint_d or eslint fallback
- Python: ruff or pylint fallback
- Go: golangci-lint
- Rust: clippy
- Shell: shellcheck
- Markdown: markdownlint

## 8) Git Workflows (gitsigns)

### Hunk Navigation

- ]c: next hunk
- [c: previous hunk

### Hunk Actions

- <leader>hs: stage hunk
- <leader>hr: reset hunk
- <leader>hS: stage buffer
- <leader>hR: reset buffer
- <leader>hp: preview hunk
- <leader>hi: inline hunk preview
- <leader>hb: blame line
- <leader>hd: diff against index
- <leader>hD: diff against last commit
- <leader>hq: send hunks to quickfix
- <leader>hQ: send all hunks to quickfix

### Toggles

- <leader>tb: toggle current line blame
- <leader>tw: toggle word diff

## 9) Debugging (DAP)

### Core Controls

- F5: start/continue
- F1: step into
- F2: step over
- F3: step out
- F7: toggle debug UI
- <leader>b: toggle breakpoint
- <leader>B: conditional breakpoint

### Language Adapters in This Setup

- Go: delve
- Python: debugpy
- Rust: codelldb
- TypeScript/JavaScript: js-debug-adapter

### Typical Debug Flow

1. Set breakpoint with <leader>b
2. Start debug with F5
3. Step with F1/F2/F3
4. Open debug UI with F7

## 10) Testing (neotest)

### Test Commands

- <leader>tr: run nearest test
- <leader>tR: run tests in current file
- <leader>ta: run all tests in project cwd
- <leader>td: debug nearest test via DAP
- <leader>ts: toggle test summary
- <leader>to: toggle test output panel
- <leader>tO: open output for nearest test

### Test Adapters Enabled

- Python: pytest
- Go: go test via neotest-go
- TypeScript/JavaScript: jest via neotest-jest
- Rust: cargo test via neotest-rust

## 11) Integrated Terminal and Sessions

### ToggleTerm

- <leader>tt: floating terminal
- <leader>tH: horizontal terminal
- <leader>tV: vertical terminal

### Sessions (persistence)

- <leader>qs: restore session for cwd
- <leader>qS: select session
- <leader>ql: restore last session
- <leader>qd: stop session saving

## 12) Language-Specific IDE Workflows

### TypeScript / JavaScript

1. Open project and run :Mason to ensure typescript-language-server, eslint_d, prettier/prettierd, js debugger are installed.
2. Use grr/gri/grd for navigation.
3. Run <leader>f for formatting.
4. Run <leader>ll for lint pass.
5. Run tests with <leader>tr or <leader>tR.
6. Debug script with F5 after setting breakpoints.

### Python

1. Ensure pyright, ruff, debugpy are installed in Mason.
2. Use LSP actions (rename/code action) with grn/gra.
3. Format with <leader>f (ruff format + import organization).
4. Lint with <leader>ll.
5. Test with <leader>tr and debug tests with <leader>td.

### Go

1. Ensure gopls, goimports, gofumpt, delve are installed.
2. Use LSP navigation for symbols and definitions.
3. Format with <leader>f.
4. Lint with <leader>ll.
5. Run tests with <leader>tr and debug with <leader>td.

### Rust

1. Ensure rust-analyzer, codelldb are installed.
2. Use LSP navigation and code actions.
3. Format with <leader>f.
4. Lint with <leader>ll (clippy).
5. Run tests with <leader>tr and debug with <leader>td.

## 13) Daily IDE Routine (Recommended)

1. Open project with nvim .
2. <leader>sf to find files quickly.
3. <leader>sg for project grep.
4. Use grr/gri/grd while coding.
5. Use <leader>f before commits.
6. Use <leader>ll and <leader>xx to fix diagnostics.
7. Use gitsigns keys for hunk-level Git work.
8. Use <leader>tr for fast test loop.
9. Use F5 workflow when a bug requires stepping.

## 14) Troubleshooting

### Icons or Folder Glyphs Look Broken

1. Confirm terminal font is a Nerd Font.
2. Confirm your config has have_nerd_font enabled.
3. Restart terminal after font changes.
4. In Neovim run:

   :Lazy sync

5. Reopen Neo-tree with <leader>e.

### Treesitter Parsers Missing

Run:

:TSInstallBase

If network is temporarily down, reconnect and run the command again.

### LSP Not Starting

- Run :Mason and install missing language server.
- Run :checkhealth.
- Verify project root has expected config files (package.json, pyproject.toml, go.mod, Cargo.toml).

### Formatter/Linter Not Running

- Verify tool is installed in Mason.
- Open :ConformInfo for formatter diagnostics.
- Use <leader>ll manually and inspect output in Trouble/diagnostics list.

## 15) Operational Commands You Should Know

- :Lazy: plugin manager UI
- :Lazy sync: install/update plugins
- :Mason: tool installer UI
- :ConformInfo: formatter status per filetype
- :checkhealth: diagnostics and environment checks
- :TSInstallBase: install baseline Treesitter parsers

---

If you want, the next step is to create a one-page quick cheat sheet from this guide optimized for daily use only (just the keymaps and common workflows).
