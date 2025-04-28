# Root User ZSH Configuration for Kali Linux with Hyprland
# Optimized for security and administrative tasks
# Use with Kitty terminal

# Basic ZSH options for root user
setopt autocd              # Change directory just by typing its name
setopt interactivecomments # Allow comments in interactive mode
setopt nonomatch           # Hide error message if there is no match for the pattern
setopt notify              # Report the status of background jobs immediately
setopt numericglobsort     # Sort filenames numerically when it makes sense
setopt promptsubst         # Enable command substitution in prompt

# Root user history settings - more security-focused
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_all_dups  # Don't record duplicates
setopt hist_ignore_space     # Don't record commands that start with space
setopt hist_reduce_blanks    # Remove unnecessary blanks
setopt append_history        # Append to history file instead of overwriting
setopt inc_append_history    # Add commands as they are typed, not at shell exit

# Don't consider certain characters part of the word
WORDCHARS=${WORDCHARS//\/}

# Hide EOL sign ('%')
PROMPT_EOL_MARK=""

# Key bindings
bindkey -e                                        # Emacs key bindings
bindkey ' ' magic-space                           # Do history expansion on space
bindkey '^U' backward-kill-line                   # Ctrl + U
bindkey '^[[3;5~' kill-word                       # Ctrl + Supr
bindkey '^[[3~' delete-char                       # Delete
bindkey '^[[1;5C' forward-word                    # Ctrl + ->
bindkey '^[[1;5D' backward-word                   # Ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # Page up
bindkey '^[[6~' end-of-buffer-or-history          # Page down
bindkey '^[[H' beginning-of-line                  # Home
bindkey '^[[F' end-of-line                        # End
bindkey '^[[Z' undo                               # Shift + Tab undo last action

# Completion settings - security focused
autoload -Uz compinit
compinit -d ~/.cache/zcompdump-root
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Root user prompt configuration (red to indicate root user)
prompt_root() {
    # Red color for root prompt to clearly indicate elevated privileges
    PROMPT=$'%F{red}┌──(%B%F{red}%n@%m%b%F{red})-[%B%F{white}%(6~.%-1~/…/%4~.%5~)%b%F{red}]\n└─%B%F{red}# %b%F{reset}'
}

# Setup the prompt
prompt_root

# Set terminal title
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty|kitty)
    precmd() { print -Pn "\e]0;%n@%m: %~\a" }
    ;;
*)
    ;;
esac

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # Fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
    
    # Colors for man pages
    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi

# Useful root user aliases
alias ll='ls -lah'
alias la='ls -lA'
alias l='ls -CF'
alias cl='clear'
alias h='history'
alias df='df -h'
alias du='du -h'
alias ports='netstat -tulanp'
alias zshreload='source ~/.zshrc'
alias syslog='tail -f /var/log/syslog'
alias authlog='tail -f /var/log/auth.log'
alias netstat='ss -tulanp'

# System administration aliases
alias apts='apt search'
alias apti='apt install'
alias aptr='apt remove'
alias aptu='apt update'
alias aptug='apt upgrade'
alias aptdu='apt dist-upgrade'
alias services='systemctl list-units --type=service'
alias running='systemctl list-units --type=service --state=running'
alias failed='systemctl list-units --type=service --state=failed'
alias journal='journalctl -xe'

# Network security aliases
alias ips='ip -c addr show'
alias iprs='ip -c route show'
alias tcpdumpi='tcpdump -i'
alias nmapo='nmap -O' 
alias nmapa='nmap -A'
alias nmapp='nmap -sP'
alias myip='curl -s http://ifconfig.me'

# Kitty terminal specific settings
if [[ $TERM == "xterm-kitty" ]]; then
    alias icat="kitty +kitten icat"
    alias kdiff="kitty +kitten diff"
    alias kssh="kitty +kitten ssh"
fi

# Hyprland specific aliases
alias hyprconf="nano /etc/hypr/hyprland.conf"
alias waybconf="nano /etc/xdg/waybar/config"
alias systemnodes="journalctl -f"

# Security-focused root functions
# Inspect a process by PID
function inspect_pid() {
    if [ -z "$1" ]; then
        echo "Usage: inspect_pid [pid]"
        return 1
    fi
    
    echo "== Process Info =="
    ps -p $1 -o pid,ppid,user,cmd
    
    echo -e "\n== File Descriptors =="
    ls -la /proc/$1/fd
    
    echo -e "\n== Opened Files =="
    lsof -p $1
    
    echo -e "\n== Network Connections =="
    ss -tulanp | grep $1
}

# Check if system is up to date
function check_updates() {
    echo "Checking for updates..."
    apt update -qq
    
    updates=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | wc -l)
    security_updates=$(apt list --upgradable 2>/dev/null | grep -i security | wc -l)
    
    echo "Regular updates available: $updates"
    echo "Security updates available: $security_updates"
    
    if [ $security_updates -gt 0 ]; then
        echo -e "\n\033[1;31mSecurity updates are available! Run 'apt upgrade' to install them.\033[0m"
    fi
}

# Set preferred editor
export EDITOR='nano'
export VISUAL='nano'
export LANG=en_US.UTF-8

# Warning message for root shell
echo -e "\033[1;31m"
echo "████████╗██╗  ██╗██╗███████╗    ██╗███████╗    ██████╗  ██████╗  ██████╗ ████████╗"
echo "╚══██╔══╝██║  ██║██║██╔════╝    ██║██╔════╝    ██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝"
echo "   ██║   ███████║██║███████╗    ██║███████╗    ██████╔╝██║   ██║██║   ██║   ██║   "
echo "   ██║   ██╔══██║██║╚════██║    ██║╚════██║    ██╔══██╗██║   ██║██║   ██║   ██║   "
echo "   ██║   ██║  ██║██║███████║    ██║███████║    ██║  ██║╚██████╔╝╚██████╔╝   ██║   "
echo "   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝    ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝   "
echo -e "\033[0m"
echo -e "\033[1;31mWARNING: You are logged in as ROOT. Use with caution!\033[0m"
echo -e "Current date: $(date)"
echo -e "System: $(uname -a)"
echo

# Print basic security recommendations
function security_tips() {
    echo -e "\033[1;33mSecurity Tips for Kali Linux:\033[0m"
    echo "1. Keep your system updated: apt update && apt upgrade"
    echo "2. Check running services: systemctl list-units --type=service --state=running"
    echo "3. Monitor active connections: ss -tulanp"
    echo "4. Check for suspicious processes: ps aux | grep -i suspicious_name"
    echo "5. Review auth logs for login attempts: tail -f /var/log/auth.log"
}

# Security tips on login (commented by default)
# security_tips
