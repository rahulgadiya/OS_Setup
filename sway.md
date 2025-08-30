# Sway Writer/Researcher Setup Guide
*A minimalist, productive environment inspired by DHH's omakase philosophy*

## Step-by-Step Implementation Plan

### Phase 1: Foundation Setup

#### 1. Base System Requirements
```bash
# Core Sway components
sway
swayidle
swaylock
waybar
wofi (or dmenu-wl)
grim + slurp (screenshots)
wl-clipboard
```

#### 2. Essential System Services
```bash
# Audio
pipewire pipewire-pulse wireplumber

# Bluetooth
bluez bluez-utils

# Network
NetworkManager nm-connection-editor

# Authentication
polkit-gnome

# File management
thunar (lightweight) or ranger (terminal)

# Notifications
mako
```

### Phase 2: Writer/Researcher Specific Tools

#### Text Editors & Writing Tools
- **Primary**: `neovim` with writing plugins
- **Alternative**: `typora` or `ghostwriter` (markdown-focused)
- **Note-taking**: `joplin` or `obsidian` (if GUI preferred)
- **Citations**: `zotero` (essential for researchers)
- **Terminal**: `alacritty` (fast, minimal)

#### Research & Reference Tools
- **Browser**: `firefox` (good PDF handling, research extensions)
- **PDF viewer**: `zathura` (keyboard-driven, minimal)
- **Document converter**: `pandoc`
- **Calendar**: `calcurse` (terminal) or `gnome-calendar` (minimal GUI)
- **Email**: `thunderbird` or `neomutt` (terminal)

#### System Utilities
- **File manager**: `ranger` + `thunar` (terminal + GUI options)
- **Image viewer**: `imv`
- **Archive manager**: `file-roller`
- **System monitor**: `htop` or `btop`

### Phase 3: Theme Implementation

#### Black & White Theme Structure
```
~/.config/
├── sway/
│   ├── config
│   ├── config.d/
│   │   ├── theme-light
│   │   ├── theme-dark
│   │   └── keybindings
├── waybar/
│   ├── config
│   ├── style-light.css
│   └── style-dark.css
├── alacritty/
│   └── alacritty.yml
└── gtk-3.0/
    └── settings.ini
```

#### Theme Switching Strategy
- Use environment variables and symlinks
- Script-based theme switching
- Consistent across all applications

### Phase 4: Configuration Architecture

#### Modular Sway Config
```
~/.config/sway/
├── config (main file)
├── config.d/
│   ├── variables
│   ├── appearance
│   ├── keybindings
│   ├── workspaces
│   ├── autostart
│   └── applications
```

#### Key Design Principles
1. **Minimal visual clutter** - clean, distraction-free
2. **Keyboard-driven workflow** - reduce mouse dependency
3. **Quick access to research tools** - custom keybindings
4. **Consistent theming** - unified black/white aesthetic
5. **Easy theme switching** - single command toggle

## Recommended Tools & Documentation

### Primary References
- **Sway Wiki**: https://github.com/swaywm/sway/wiki
- **Arch Wiki Sway**: https://wiki.archlinux.org/title/Sway
- **EndeavourOS Sway CE**: https://github.com/EndeavourOS-Community-Editions/sway
- **Waybar Documentation**: https://github.com/Alexays/Waybar

### Essential Utilities Documentation
- **Wofi**: https://hg.sr.ht/~scoopta/wofi
- **Mako**: https://wayland.app/protocols/wlr-layer-shell-unstable-v1
- **Grim/Slurp**: Screenshot tools for Wayland

### Writing-Specific Resources
- **Neovim for Writers**: https://github.com/preservim/vim-pencil
- **Markdown Preview**: https://github.com/iamcco/markdown-preview.nvim
- **Zotero Integration**: Better BibTeX plugin

## Testing & Validation Strategies

### 1. Progressive Testing Approach
```bash
# Test in VM first
# Use nested Sway session for testing
# Keep backup of working config
```

### 2. Validation Checklist
- [ ] All essential hardware works (WiFi, Bluetooth, audio)
- [ ] Theme switching works seamlessly
- [ ] All writer tools accessible via keyboard
- [ ] PDF/research workflow smooth
- [ ] Battery life acceptable (laptop users)
- [ ] External monitor support
- [ ] Screenshot/screen sharing works

### 3. Workflow Testing
- [ ] Open research paper → annotate → take notes workflow
- [ ] Multi-document writing session
- [ ] Citation insertion process
- [ ] Theme switching mid-session
- [ ] Backup and sync procedures

## Configuration Examples

### Core Writer Keybindings
```
# Quick access to writing tools
$mod+w exec typora
$mod+n exec alacritty -e nvim ~/notes/$(date +%Y-%m-%d).md
$mod+z exec zotero
$mod+p exec firefox --new-window
$mod+f exec thunar

# Research workflow
$mod+r exec wofi --show run
$mod+shift+s exec grim -g "$(slurp)" - | wl-copy
$mod+shift+t exec theme-toggle.sh

# Focus and productivity
$mod+shift+d exec sway-do-not-disturb.sh
```

### Workspace Layout for Writers
```
# Workspace assignments for writing workflow
assign [class="Typora"] workspace number 1
assign [class="Zotero"] workspace number 2
assign [class="firefox"] workspace number 3
assign [app_id="thunar"] workspace number 4

# Automatic layouts
workspace 1 layout tabbed    # Writing
workspace 2 layout stacked   # Research tools
workspace 3 layout default   # Browser/web research
```

## Installation Scripts

The following scripts will be provided:
1. `install.sh` - Complete setup automation
2. `uninstall.sh` - Clean removal
3. `theme-toggle.sh` - Runtime theme switching
4. `backup-config.sh` - Configuration backup
5. `writer-session.sh` - Launch writing environment

## Expected Benefits

### For Writers
- Distraction-free environment
- Fast switching between writing and research
- Consistent, eye-friendly theming
- Efficient PDF and citation management

### For Researchers
- Quick access to reference materials
- Seamless note-taking integration
- Multi-document workflows
- Customizable workspace layouts

### For General Productivity
- Low resource usage
- Highly customizable
- Reproducible setup
- Easy sharing with collaborators

## Next Steps

1. **Week 1**: Set up base Sway environment
2. **Week 2**: Implement theming system
3. **Week 3**: Configure writer-specific tools
4. **Week 4**: Test, refine, and document
