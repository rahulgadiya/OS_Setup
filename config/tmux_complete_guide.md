# Complete tmux Guide Based on Optimized Configuration

## Table of Contents
- [Installation & Setup](#installation--setup)
- [Basic tmux Usage](#basic-tmux-usage)
- [Key Bindings Reference](#key-bindings-reference)
- [Window & Pane Management](#window--pane-management)
- [Copy Mode & Text Selection](#copy-mode--text-selection)
- [Session Management](#session-management)
- [Plugin System Deep Dive](#plugin-system-deep-dive)
- [Pro Tips & Workflows](#pro-tips--workflows)
- [Troubleshooting](#troubleshooting)

---

## Installation & Setup

### Prerequisites
```bash
# Install tmux (Ubuntu/Debian)
sudo apt update && sudo apt install tmux

# Install tmux (macOS)
brew install tmux

# Install tmux (CentOS/RHEL)
sudo yum install tmux
```

### Configuration Setup
1. Copy the optimized configuration to `~/.tmux.conf`
2. Install TPM (Tmux Plugin Manager):
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
3. Start tmux and install plugins: `prefix + I`

**Important: Your prefix key is `Ctrl-a` (not the default `Ctrl-b`)**

---

## Basic tmux Usage

### Starting & Managing Sessions

#### Creating Sessions
```bash
# Start new session with default name
tmux

# Start named session
tmux new-session -s myproject

# Start session with specific window name
tmux new-session -s myproject -n editor

# Start detached session
tmux new-session -d -s background-work
```

#### Session Navigation
```bash
# List all sessions
tmux ls
tmux list-sessions

# Attach to specific session
tmux attach -t myproject
tmux a -t myproject

# Attach to most recent session
tmux attach

# Kill specific session
tmux kill-session -t myproject

# Kill all sessions except current
tmux kill-session -a
```

#### Inside tmux Session
- `prefix + d` - Detach from current session
- `prefix + $` - Rename current session
- `prefix + s` - List and switch between sessions

---

## Key Bindings Reference

### Essential Shortcuts

| Action | Key Binding | Description |
|--------|-------------|-------------|
| **Prefix** | `Ctrl-a` | Command prefix (instead of default Ctrl-b) |
| **Help** | `prefix + ?` | Show all key bindings |
| **Reload Config** | `prefix + r` | Reload tmux configuration |

### Window Management

| Action | Key Binding | Description |
|--------|-------------|-------------|
| **New Window** | `prefix + c` | Create new window |
| **Next Window** | `prefix + n` | Move to next window |
| **Previous Window** | `prefix + p` | Move to previous window |
| **Quick Window Switch** | `Shift + Left/Right` | Switch windows without prefix |
| **List Windows** | `prefix + w` | List all windows |
| **Rename Window** | `prefix + ,` | Rename current window |
| **Kill Window** | `prefix + &` | Kill current window |
| **Window by Number** | `prefix + 0-9` | Switch to window by number |

### Pane Management

| Action | Key Binding | Description |
|--------|-------------|-------------|
| **Vertical Split** | `prefix + \|` | Split pane vertically |
| **Horizontal Split** | `prefix + -` | Split pane horizontally |
| **Kill Pane** | `prefix + x` | Kill current pane |
| **Maximize Pane** | `prefix + m` | Toggle pane zoom |

#### Pane Navigation (Multiple Methods)

**Method 1: Vim-style (with prefix)**
- `prefix + h` - Move left
- `prefix + j` - Move down  
- `prefix + k` - Move up
- `prefix + l` - Move right

**Method 2: Instant navigation (no prefix needed!)**
- `Alt + Left/Right/Up/Down` - Move between panes instantly

**Method 3: Traditional**
- `prefix + Arrow keys` - Move between panes

#### Pane Resizing
- `prefix + H/J/K/L` - Resize panes (repeatable)
- Hold the key after prefix to continuously resize

---

## Window & Pane Management

### Creating Optimal Layouts

#### Development Layout Example
```bash
# Start new session
tmux new-session -s dev

# Create vertical split for editor and terminal
prefix + |

# Create horizontal split in right pane for logs
prefix + -

# Navigate between panes
Alt + Arrow keys
```

#### Multi-Project Layout
```bash
# Create multiple windows for different aspects
prefix + c    # New window for frontend
prefix + ,    # Rename to "frontend"

prefix + c    # New window for backend  
prefix + ,    # Rename to "backend"

prefix + c    # New window for database
prefix + ,    # Rename to "database"

# Quick switching between projects
Shift + Left/Right
```

### Advanced Pane Features

#### Synchronize Panes
```bash
# Turn on synchronization
prefix + S

# Now commands are broadcast to ALL panes
# Perfect for managing multiple servers

# Turn off synchronization
prefix + S (again)
```

#### Pane Information
- `prefix + q` - Show pane numbers
- `prefix + q + number` - Switch to pane by number

---

## Copy Mode & Text Selection

### Entering Copy Mode
- `prefix + [` - Enter copy mode
- `q` or `Escape` - Exit copy mode

### Navigation in Copy Mode
| Action | Key Binding | Description |
|--------|-------------|-------------|
| **Move** | `h/j/k/l` or Arrow keys | Navigate text |
| **Page Up/Down** | `Ctrl-u / Ctrl-d` | Half page up/down |
| **Start of Line** | `0` | Move to beginning of line |
| **End of Line** | `$` | Move to end of line |
| **Top of Buffer** | `g` | Go to top |
| **Bottom of Buffer** | `G` | Go to bottom |

### Text Selection & Copying

#### Selection
- `v` - Start visual selection
- `V` - Select entire lines
- `Ctrl-v` - Rectangle/block selection

#### Copying
- `y` - Copy selection (goes to system clipboard!)
- `Enter` - Copy selection and exit copy mode
- `prefix + ]` - Paste from tmux buffer

### Search in Copy Mode
- `/` - Search forward
- `?` - Search backward  
- `n` - Next search result
- `N` - Previous search result

### Advanced Copy Features
With the enhanced configuration:
- Mouse selection automatically copies
- Text copied goes directly to system clipboard
- Search highlights matches

---

## Session Management

### Advanced Session Operations

#### Session Creation & Naming
```bash
# Create session with multiple windows
tmux new-session -s project -d
tmux new-window -t project -n editor
tmux new-window -t project -n server
tmux new-window -t project -n logs
tmux attach -t project
```

#### Session Navigation
- `prefix + (` - Switch to previous session
- `prefix + )` - Switch to next session
- `prefix + f` - Find and switch to session (interactive)

#### Session Control
- `prefix + N` - Create new session (prompts for name)
- `prefix + X` - Kill current session (with confirmation)
- `prefix + D` - Detach all other clients from session

### Session Persistence (tmux-resurrect)

#### Manual Save/Restore
- `prefix + Ctrl-s` - Save current session state
- `prefix + Ctrl-r` - Restore saved session state

#### What Gets Saved
- All sessions, windows, and panes
- Working directories for each pane
- Running programs (vim, man, etc.)
- Pane layouts and sizes
- Window and session names

---

## Plugin System Deep Dive

### Plugin Manager (TPM)

#### Installation Commands
- `prefix + I` - Install new plugins
- `prefix + U` - Update all plugins
- `prefix + Alt-u` - Remove plugins not in config

### Core Plugins

#### 1. tmux-sensible
**Automatically active** - Provides sensible defaults:
- Better scrollback behavior
- Improved mouse support
- UTF-8 support
- Better status line refresh rate

#### 2. tmux-resurrect
**Manual session persistence**

##### Basic Usage
```bash
# Save session
prefix + Ctrl-s

# Restore session
prefix + Ctrl-r
```

##### Configuration Options
```bash
# In your tmux.conf (already included)
set -g @resurrect-capture-pane-contents 'on'  # Save pane contents
set -g @resurrect-strategy-vim 'session'      # Restore vim sessions
```

### Optional Enhanced Plugins

#### 3. tmux-continuum (Automatic Persistence)
**Uncomment in config to enable**

```bash
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-restore 'on'     # Auto-restore on tmux start
set -g @continuum-boot 'on'        # Start tmux on system boot
```

Features:
- Automatically saves every 15 minutes
- Restores sessions when tmux starts
- No manual intervention needed

#### 4. tmux-yank (Enhanced Clipboard)
**Uncomment in config to enable**

```bash
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @yank_selection_mouse 'clipboard'
```

Features:
- `y` in copy mode copies to system clipboard
- Works over SSH
- Integrates with macOS/Linux clipboards
- Mouse selection auto-copies

#### 5. tmux-copycat (Advanced Search)
**Uncomment in config to enable**

```bash
set -g @plugin 'tmux-plugins/tmux-copycat'
```

Search Features:
- `prefix + /` - Search for regex patterns
- `prefix + Ctrl-f` - Search for files
- `prefix + Ctrl-u` - Search for URLs
- `prefix + Alt-h` - Search for IP addresses
- `prefix + Ctrl-d` - Search for numbers

#### 6. vim-tmux-navigator (Vim Integration)
**Uncomment in config to enable**

```bash
set -g @plugin 'christoomey/vim-tmux-navigator'
```

**Requires vim plugin too!** Add to your `.vimrc`:
```vim
Plug 'christoomey/vim-tmux-navigator'
```

Features:
- `Ctrl-h/j/k/l` - Navigate between vim splits AND tmux panes
- Seamless integration between editors and terminal

---

## Pro Tips & Workflows

### Development Workflow

#### Full-Stack Development Setup
```bash
# Create project session
tmux new-session -s fullstack

# Window 1: Editor
prefix + ,    # Rename to "editor"
# Split for file tree and main editor
prefix + |

# Window 2: Frontend server  
prefix + c
prefix + ,    # Rename to "frontend"
# Run: npm start

# Window 3: Backend server
prefix + c  
prefix + ,    # Rename to "backend"
# Run: python manage.py runserver

# Window 4: Database & logs
prefix + c
prefix + ,    # Rename to "database"
prefix + -    # Split for logs
```

#### Quick Navigation
- `Shift + Left/Right` - Jump between project aspects
- `Alt + Arrow keys` - Navigate within windows
- `prefix + f` - Quick session finder

### Server Administration

#### Multi-Server Management
```bash
# Create admin session
tmux new-session -s admin

# Split into multiple panes for different servers
prefix + |
prefix + -
prefix + |

# SSH into different servers in each pane
# Pane 1: ssh user@server1
# Pane 2: ssh user@server2  
# Pane 3: ssh user@server3
# Pane 4: local monitoring

# Synchronize panes for common commands
prefix + S
# Now type once, execute everywhere!
```

### Monitoring Setup

#### System Monitoring Dashboard
```bash
# Create monitoring session
tmux new-session -s monitor

# Top pane: htop
htop

# Split for network monitoring  
prefix + -
iftop

# Split for logs
prefix + |
tail -f /var/log/syslog

# Quick glance layout with prefix + q
```

### Mouse Integration

Your configuration enables comprehensive mouse support:

#### Mouse Features
- **Click** - Select panes
- **Drag borders** - Resize panes
- **Scroll** - Navigate history/copy mode
- **Click and drag text** - Auto-select and copy
- **Double-click** - Select word
- **Triple-click** - Select line

### Utility Commands

#### Screen Management
- `prefix + Ctrl-l` - Clear current pane
- `prefix + Ctrl-k` - Clear screen and history
- `prefix + z` - Toggle pane zoom (fullscreen)

#### Information Commands
- `prefix + t` - Show clock
- `prefix + q` - Show pane numbers and sizes
- `tmux info` - Show tmux server information

### Customization Tips

#### Adding Your Own Key Bindings
Add to `~/.tmux.conf`:
```bash
# Custom binding example
bind-key M command-prompt -p "Man page:" "split-window 'man %%'"
bind-key / command-prompt -p "Search:" "copy-mode; send-keys '/%%'"
```

#### Status Bar Customization
The config includes a modern status bar, but you can modify:
```bash
# Add CPU usage
set -g status-right "#[fg=#6c7086]│ CPU: #(top -l 1 | grep 'CPU usage' | awk '{print $3}') #[fg=#fab387]%Y-%m-%d #[fg=#6c7086]│ #[fg=#f9e2af]%H:%M "
```

---

## Troubleshooting

### Common Issues

#### Plugin Installation Problems
```bash
# If plugins don't install
cd ~/.tmux/plugins/tpm
git pull  # Update TPM itself
prefix + I  # Try installing again
```

#### Colors Not Working
```bash
# Check terminal capabilities
echo $TERM

# Should be: tmux-256color or screen-256color
# If not, add to shell config:
export TERM=tmux-256color
```

#### Copy to Clipboard Not Working

**Linux:**
```bash
# Install xclip
sudo apt install xclip

# Or install xsel
sudo apt install xsel
```

**macOS:**
```bash
# Should work out of the box
# If not, try installing reattach-to-user-namespace
brew install reattach-to-user-namespace
```

#### Session Not Restoring
```bash
# Check if resurrect files exist
ls ~/.tmux/resurrect/

# Manual restore
prefix + Ctrl-r

# Check resurrect status
tmux show-environment -g TMUX_SESSION_RESTORED
```

### Performance Issues

#### Large History Buffer
If tmux becomes slow:
```bash
# Reduce history limit in config
set -g history-limit 10000  # Instead of 50000
```

#### Too Many Plugins
Start with basic plugins and add gradually:
1. tpm (required)
2. tmux-sensible
3. tmux-resurrect
4. Add others as needed

### Configuration Debugging

#### Test Configuration
```bash
# Check config syntax
tmux source ~/.tmux.conf

# Show current options  
tmux show-options -g

# Show current key bindings
tmux list-keys
```

#### Reset to Defaults
```bash
# Kill all tmux sessions
tmux kill-server

# Rename config temporarily
mv ~/.tmux.conf ~/.tmux.conf.backup

# Start fresh tmux
tmux
```

---

## Quick Reference Card

### Essential Commands
| Purpose | Command |
|---------|---------|
| **Start tmux** | `tmux` |
| **New named session** | `tmux new -s name` |
| **List sessions** | `tmux ls` |
| **Attach session** | `tmux a -t name` |
| **Detach** | `prefix + d` |
| **Reload config** | `prefix + r` |

### Navigation Shortcuts
| Purpose | Command |
|---------|---------|
| **Move between panes** | `Alt + Arrow keys` |
| **Switch windows** | `Shift + Left/Right` |
| **Resize panes** | `prefix + H/J/K/L` |
| **Zoom pane** | `prefix + m` |

### Copy Mode
| Purpose             | Command      |
| ------------------- | ------------ |
| **Enter copy mode** | `prefix + [` |
| **Start selection** | `v`          |
| **Copy selection**  | `y`          |
| **Paste**           | `prefix + ]` |
| **Search**          | `/` or `?`   |

### Plugins
| Purpose             | Command           |
| ------------------- | ----------------- |
| **Install plugins** | `prefix + I`      |
| **Save session**    | `prefix + Ctrl-s` |
| **Restore session** | `prefix + Ctrl-r` |
| **Sync panes**      | `prefix + S`      |

---

*This guide covers the optimized tmux configuration. For the most up-to-date information, refer to the official tmux manual: `man tmux`*