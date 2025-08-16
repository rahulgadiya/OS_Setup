# Complete Kickstart Neovim Configuration Guide

## Table of Contents
- [Installation & Setup](#installation--setup)
- [Core Keybindings Reference](#core-keybindings-reference)
- [Window & Split Management](#window--split-management)
- [LSP Features & Navigation](#lsp-features--navigation)
- [Telescope Fuzzy Finder](#telescope-fuzzy-finder)
- [Completion & Snippets](#completion--snippets)
- [Plugin-Specific Features](#plugin-specific-features)
- [Advanced Workflows](#advanced-workflows)
- [Customization Tips](#customization-tips)
- [Troubleshooting](#troubleshooting)

---

## Installation & Setup

### Prerequisites
```bash
# Install Neovim (>= 0.9)
# Ubuntu/Debian
sudo apt update && sudo apt install neovim

# macOS
brew install neovim

# Arch Linux
sudo pacman -S neovim
```

### Configuration Setup
1. Backup existing config:
```bash
# Optional but recommended
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

2. Clone Kickstart or copy the configuration to `~/.config/nvim/init.lua`

3. Start Neovim - plugins will auto-install:
```bash
nvim
```

**Important: Leader key is `<Space>` by default**

---

## Core Keybindings Reference

### Basic Navigation & Editing

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| **Normal** | `<Esc>` | Clear search highlights | Remove search highlighting |
| **Normal** | `<leader>q` | Open diagnostic quickfix | Show all diagnostics in quickfix list |
| **Terminal** | `<Esc><Esc>` | Exit terminal mode | Return to normal mode in terminal |

### Movement (Vim Fundamentals)

| Key | Action | Description |
|-----|--------|-------------|
| `h/j/k/l` | Move left/down/up/right | Basic vim movement |
| `w/b` | Word forward/backward | Move by words |
| `e/ge` | End of word forward/backward | Move to word endings |
| `0/$` | Start/end of line | Line boundaries |
| `gg/G` | Start/end of file | File boundaries |
| `{/}` | Previous/next paragraph | Paragraph navigation |
| `Ctrl-u/Ctrl-d` | Half page up/down | Page scrolling |
| `Ctrl-b/Ctrl-f` | Full page up/down | Full page scrolling |

### Text Objects & Operations

| Operator | Text Object | Example | Description |
|----------|-------------|---------|-------------|
| `d` | Delete | `dw` | Delete word |
| `c` | Change | `ci"` | Change inside quotes |
| `y` | Yank (copy) | `yap` | Yank around paragraph |
| `v` | Visual select | `viw` | Select inside word |

**Text Objects:**
- `w` - word
- `s` - sentence  
- `p` - paragraph
- `t` - tag (HTML/XML)
- `"/'` - quotes
- `()[]{}` - brackets/braces

---

## Window & Split Management

### Window Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h>` | Move to left window | Focus left split |
| `<C-l>` | Move to right window | Focus right split |
| `<C-j>` | Move to lower window | Focus bottom split |
| `<C-k>` | Move to upper window | Focus top split |

### Window Operations
```vim
:split or :sp        " Horizontal split
:vsplit or :vsp      " Vertical split  
:only                " Close all other windows
:q                   " Close current window
<C-w>=               " Equalize window sizes
<C-w>_               " Maximize height
<C-w>|               " Maximize width
```

### Advanced Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `<C-w>H` | Move window left | Move current window to left |
| `<C-w>L` | Move window right | Move current window to right |
| `<C-w>J` | Move window down | Move current window down |
| `<C-w>K` | Move window up | Move current window up |

---

## LSP Features & Navigation

### Core LSP Keybindings

| Key | Action | Description |
|-----|--------|-------------|
| `grn` | **Rename** | Rename symbol under cursor |
| `gra` | **Code Action** | Show available code actions |
| `grr` | **Find References** | Show all references (Telescope) |
| `gri` | **Go to Implementation** | Jump to implementation |
| `grd` | **Go to Definition** | Jump to definition |
| `grD` | **Go to Declaration** | Jump to declaration |
| `grt` | **Go to Type Definition** | Jump to type definition |

### LSP Information & Symbols

| Key | Action | Description |
|-----|--------|-------------|
| `gO` | **Document Symbols** | Show symbols in current file |
| `gW` | **Workspace Symbols** | Show symbols in entire project |
| `<leader>th` | **Toggle Inlay Hints** | Show/hide type hints |

### Diagnostics

| Key | Action | Description |
|-----|--------|-------------|
| `]d` | Next diagnostic | Jump to next error/warning |
| `[d` | Previous diagnostic | Jump to previous error/warning |
| `<leader>e` | Show diagnostic | Show diagnostic in floating window |
| `<leader>q` | Diagnostic quickfix | Open all diagnostics in quickfix |

### LSP Workflow Examples

#### Refactoring Workflow
```
1. Place cursor on variable/function name
2. grn - Rename across entire project
3. gra - See available refactoring actions
4. grr - Check all references before changes
```

#### Code Navigation
```
1. grd - Go to definition
2. <C-t> - Jump back (built-in)
3. grr - See all usages
4. gri - Check implementation details
```

---

## Telescope Fuzzy Finder

### File & Search Operations

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sf` | **Find Files** | Search project files |
| `<leader>sg` | **Live Grep** | Search text in files |
| `<leader>sw` | **Search Word** | Search current word |
| `<leader>s.` | **Recent Files** | Recently opened files |
| `<leader><leader>` | **Find Buffers** | Switch between open buffers |

### Help & Configuration

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sh` | **Search Help** | Search Neovim help |
| `<leader>sk` | **Search Keymaps** | Find keyboard shortcuts |
| `<leader>ss` | **Telescope Select** | Browse Telescope options |
| `<leader>sn` | **Search Neovim** | Search Neovim config files |

### Advanced Search

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>/` | **Buffer Search** | Fuzzy search in current buffer |
| `<leader>s/` | **Search Open Files** | Search text in open files only |
| `<leader>sd` | **Search Diagnostics** | Search through all diagnostics |
| `<leader>sr` | **Resume Search** | Continue last search |

### Telescope Navigation (Inside Telescope)

| Key | Action | Description |
|-----|--------|-------------|
| `<C-n>/<C-p>` | Next/Previous | Navigate results |
| `<C-u>/<C-d>` | Scroll preview | Scroll preview window |
| `<C-/>` | Show help | Show all Telescope keymaps |
| `<C-c>` | Close | Close Telescope |
| `<Tab>` | Toggle selection | Select multiple items |
| `<C-q>` | Send to quickfix | Send results to quickfix list |

### Telescope Workflow Examples

#### Project-Wide Search & Replace
```
1. <leader>sg - Live grep for term
2. <C-q> - Send results to quickfix
3. :cfdo %s/old/new/g - Replace in all files
4. :cfdo write - Save all changes
```

#### Quick File Navigation
```
1. <leader>sf - Find files
2. Type partial filename
3. <C-p>/<C-n> - Navigate matches
4. <Enter> - Open file
```

---

## Completion & Snippets

### Blink.cmp Completion

| Key | Action | Description |
|-----|--------|-------------|
| `<C-y>` | **Accept completion** | Accept selected completion |
| `<C-space>` | **Open menu/docs** | Trigger completion or show docs |
| `<C-n>/<C-p>` | **Navigate items** | Move through completion items |
| `<Up>/<Down>` | **Navigate items** | Alternative navigation |
| `<C-e>` | **Hide menu** | Close completion menu |
| `<C-k>` | **Toggle signature** | Show/hide function signature |

### Snippet Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | **Next placeholder** | Jump to next snippet field |
| `<S-Tab>` | **Previous placeholder** | Jump to previous snippet field |

### Completion Sources
- **LSP**: Language server completions
- **Path**: File path completions  
- **Snippets**: Code snippet expansions
- **Buffer**: Words from current buffer

### Completion Workflow
```
1. Start typing
2. <C-space> to trigger if needed
3. <C-n>/<C-p> to navigate
4. <C-y> to accept
5. <Tab> to navigate snippet placeholders
```

---

## Plugin-Specific Features

### Which-Key (`<leader>` mappings)

Which-Key shows available keymaps after pressing leader:

| Group | Description |
|-------|-------------|
| `<leader>s` | **[S]earch** operations |
| `<leader>t` | **[T]oggle** features |
| `<leader>h` | **Git [H]unk** operations |

### Gitsigns (Git Integration)

| Key | Action | Description |
|-----|--------|-------------|
| `]c` | Next hunk | Jump to next git change |
| `[c` | Previous hunk | Jump to previous git change |
| `<leader>hs` | Stage hunk | Stage current hunk |
| `<leader>hr` | Reset hunk | Reset current hunk |
| `<leader>hS` | Stage buffer | Stage entire buffer |
| `<leader>hu` | Undo stage | Undo stage hunk |
| `<leader>hR` | Reset buffer | Reset entire buffer |
| `<leader>hp` | Preview hunk | Preview hunk changes |
| `<leader>hb` | Blame line | Show git blame |
| `<leader>hd` | Diff this | Show diff |
| `<leader>hD` | Diff this ~` | Show diff against index |

### Mini.nvim Modules

#### Mini.surround
| Key | Action | Description |
|-----|--------|-------------|
| `sa{motion}{char}` | **Add surround** | `saiw)` - surround word with () |
| `sd{char}` | **Delete surround** | `sd"` - delete surrounding quotes |
| `sr{old}{new}` | **Replace surround** | `sr)"` - replace () with "" |

Examples:
- `saiw)` - Surround word with parentheses
- `sa2w"` - Surround next 2 words with quotes  
- `sd'` - Delete surrounding single quotes
- `sr)]` - Replace () with []

#### Mini.ai (Text Objects)
Enhanced text objects:
- `va)` - Select around parentheses
- `vi"` - Select inside quotes
- `van` - Select around next object
- `cin` - Change inside next object

### Conform.nvim (Formatting)

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>f` | **Format buffer** | Format current buffer |

**Auto-formatting**: Enabled on save for most file types (disabled for C/C++)

### Todo Comments

Highlights TODO, FIXME, NOTE, etc. in comments:
```lua
-- TODO: Something to do
-- FIXME: This needs fixing  
-- NOTE: Important note
-- HACK: Temporary solution
-- WARN: Warning about something
```

---

## Advanced Workflows

### Development Workflow

#### Full Development Session
```
1. nvim .                    " Open project directory
2. <leader>sf               " Find main file
3. <leader>sg               " Search for function/class
4. grd                      " Go to definition
5. <leader>f                " Format code
6. <leader>hs               " Stage git changes
```

#### Debugging Workflow
```
1. <leader>sd               " Search diagnostics
2. ]d                       " Jump to next error
3. gra                      " See code actions
4. grn                      " Rename if needed
5. <leader>f                " Format fixed code
```

### Refactoring Workflow

#### Large-Scale Refactoring
```
1. <leader>sg "old_name"    " Find all occurrences
2. <C-q>                    " Send to quickfix
3. :cfdo %s/old/new/gc      " Interactive replace
4. :cfdo write              " Save all files
```

#### Symbol Exploration
```
1. gO                       " Show document symbols
2. <leader>sw               " Search current word
3. grr                      " Find all references
4. gri                      " Check implementations
```

### Research & Documentation
```
1. <leader>sh "topic"       " Search help
2. <leader>sk "keymap"      " Find keybindings
3. <leader>ss               " Explore Telescope
4. :help topic              " Direct help access
```

---

## Customization Tips

### Adding Custom Keybindings

Add to your `init.lua`:

```lua
-- Custom keymaps
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>x', '<cmd>x<CR>', { desc = 'Save and quit' })

-- Custom text objects
vim.keymap.set({'o', 'x'}, 'if', function()
  -- Select inside function
  vim.cmd('normal! /function<CR>V/end<CR>')
end, { desc = 'Inside function' })
```

### Custom LSP Servers

Add to servers table in LSP config:

```lua
local servers = {
  -- Add your language servers
  pyright = {},          -- Python
  ts_ls = {},           -- TypeScript
  rust_analyzer = {},   -- Rust
  gopls = {},          -- Go
  clangd = {},         -- C/C++
}
```

### Custom Formatters

Add to conform config:

```lua
formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'black', 'isort' },
  javascript = { 'prettier' },
  go = { 'gofmt' },
}
```

### Theme Customization

Change colorscheme:
```lua
-- In the tokyonight config, change:
vim.cmd.colorscheme 'tokyonight-storm'  -- or 'tokyonight-day', 'tokyonight-moon'

-- Or use different theme entirely:
{ 'catppuccin/nvim', name = 'catppuccin' }
```

---

## Troubleshooting

### Common Issues

#### LSP Not Working
```bash
# Check LSP status
:LspInfo

# Check Mason installations
:Mason

# Restart LSP
:LspRestart
```

#### Completion Not Working
```bash
# Check blink.cmp
:lua print(vim.inspect(require('blink.cmp').get_lsp_capabilities()))

# Check LSP capabilities
:lua print(vim.lsp.get_active_clients()[1].server_capabilities.completionProvider)
```

#### Telescope Issues
```bash
# Check Telescope health
:checkhealth telescope

# Reinstall fzf native
:Lazy build telescope-fzf-native.nvim
```

### Performance Issues

#### Slow Startup
```bash
# Profile startup time
nvim --startuptime startup.log

# Check which plugins are slow
:Lazy profile
```

#### Large Files
```lua
-- Add to init.lua for large files
vim.api.nvim_create_autocmd('BufReadPre', {
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > 1024*1024 then -- 1MB
      vim.opt_local.syntax = 'off'
      vim.opt_local.swapfile = false
    end
  end,
})
```

### Plugin Issues

#### Reset Plugin State
```bash
# Remove plugin data
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim  
rm -rf ~/.cache/nvim

# Restart Neovim - plugins will reinstall
```

#### Update Everything
```bash
# In Neovim
:Lazy sync    " Update all plugins
:Mason        " Update LSP servers
:TSUpdate     " Update Treesitter parsers
```

---

## Quick Reference Card

### Essential Keybindings
| Purpose | Key |
|---------|-----|
| **Leader key** | `<Space>` |
| **Find files** | `<leader>sf` |
| **Search text** | `<leader>sg` |
| **Go to definition** | `grd` |
| **Find references** | `grr` |
| **Rename symbol** | `grn` |
| **Code actions** | `gra` |
| **Format code** | `<leader>f` |

### Window Navigation
| Purpose | Key |
|---------|-----|
| **Move between splits** | `<C-h/j/k/l>` |
| **Find buffers** | `<leader><leader>` |
| **Close window** | `:q` |

### LSP Workflow
| Purpose | Key |
|---------|-----|
| **Next/prev diagnostic** | `]d / [d` |
| **Document symbols** | `gO` |
| **Workspace symbols** | `gW` |
| **Hover documentation** | `K` |

### Completion
| Purpose | Key |
|---------|-----|
| **Accept completion** | `<C-y>` |
| **Navigate completions** | `<C-n/p>` |
| **Show documentation** | `<C-space>` |

### Git (Gitsigns)
| Purpose | Key |
|---------|-----|
| **Next/prev hunk** | `]c / [c` |
| **Stage hunk** | `<leader>hs` |
| **Preview hunk** | `<leader>hp` |
| **Blame line** | `<leader>hb` |

---

*This guide covers the Kickstart Neovim configuration. For more advanced customization, check the official Neovim documentation with `:help` and explore the plugin repositories on GitHub.*