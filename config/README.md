# OS_Setup Config Files

This repository stores configuration files, guides, and scripts for setting up my **development environment** and **desktop workflow**.  
It is organized by tool/environment so that future configs can be added easily.

---

## 📑 Table of Contents
- [🌐 Hyprland / Sway](#-hyprland--sway)
- [🖥️ Tmux](#️-tmux)
- [✍️ Neovim](#-neovim)
- [🖊️ Editors](#-editors)
- [🐚 Shell](#-shell)
- [📖 Meta](#-meta)
- [✅ Usage Notes](#-usage-notes)
- [🔮 Future Plans](#-future-plans)

---

## 🌐 Hyprland / Sway
Window manager configurations.

- **`keybindings.conf`** – custom keyboard shortcuts.  
- **`windowrules.conf`** – application rules (workspace, floating, fullscreen, etc.).  

---

## 🖥️ Tmux
Terminal multiplexer configurations.

- **`tmux.conf`** – main tmux config.  
- **`tmux_2.conf`** – experimental/alternate config.  
- **`tmux_complete_guide.md`** – learning notes & reference for both configs.  

---

## ✍️ Neovim
Editor configuration.

- **`kickstart_nvim_guide.md`** – setup guide for Neovim using kickstart.nvim.  

---

## 🖊️ Editors
Other editors and browsers.

- **`nanorc`** – nano configuration (syntax highlighting, Git commit helper).  
- **`qute-config.txt`** – qutebrowser configuration.  

---

## 🐚 Shell
Shell configuration and utilities.

- **`zshrc`** – Zsh config (aliases, plugins, prompt, environment).  
- **`search.sh`** – helper script for searching (can be extended with fzf/ripgrep/etc).  

---

## 📖 Meta
- **`README.md`** – this documentation file.  

---

## ✅ Usage Notes
- `.conf` files = **actively used configs**.  
- `*_guide.md` files = **reference guides** for reinstall/setup.  
- Scripts (`*.sh`) = **utility scripts** for automation.  
- Always keep configs under version control for rollback.  

---

## 🔮 Future Plans
This repo is structured to grow with my workflow.  
Planned additions:
- **Waybar / Polybar configs** (status bar).  
- **Kitty / Foot terminal configs**.  
- **Dunst / notification daemon configs**.  
- **System scripts** for setup automation.  

> ⚡️ **Tip for future expansion**:  
> When adding new configs, simply create a new section like:
> ```markdown
> ## 🎨 Waybar
> - `waybar.json` – bar layout.
> - `style.css` – theming.
> ```

