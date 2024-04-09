#“कर्मण्येवाधिकारस्ते मा फलेषु कदाचन | मा कर्मफलहेतुर्भूर्मा ते सङ्गोऽस्त्वकर्मणि || 47 ||”

###Current Setup

1. Web Browsers
	- Chromium 
	- Edge (Personal)
	- Brave (Professional)
	- Firefox 
2. Note-taking 
	- Gnome-Text editor 
	- Obsidian (Second Brain) 
3. Terminal-Emulators 
	- Alacritty 
	- Warp-terminal
4. Other Apps 
	- VMware pro 
	- Pomodoro Timmer 
	- Gnome Default apps 
	- Spotify
	- Mailspring 
	- Todoist (edge web app) 
-------------------------------------------
#!/bin/bash

# Get the current workspace number
current_workspace=$(xdotool get_desktop)

# Calculate the next workspace number
next_workspace=$(( (current_workspace + 1) % $(wmctrl -d | wc -l) ))

# Switch to the next workspace
wmctrl -s $next_workspace

-------------------------------------------

