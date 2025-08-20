config.load_autoconfig(False)
# --------------------------------
# DARK MODE (Web Content)
# --------------------------------
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"   # don’t invert images
c.colors.webpage.bg = "#0a0a0a"

# --------------------------------
# HOMEPAGE
# --------------------------------
c.url.default_page = 'file:///home/djraul/Code/practice/searchbox/searchbox.html'
c.url.start_pages = [c.url.default_page]

# --------------------------------
# MINIMAL UI
# --------------------------------
c.statusbar.show = 'in-mode'
c.tabs.show = 'switching'
c.scrolling.bar = 'never'
c.completion.height = '30%'
c.window.hide_decoration = True

# --------------------------------
# VIBRANT NEON COLOR SCHEME
# --------------------------------
neon = {
    'bg_dark': '#0a0a0a',
    'bg_darker': '#000000',
    'bg_light': '#1a1a1a',
    'bg_medium': '#2a2a2a',
    'text': '#00ff00',
    'accent': '#00ffff',
    'pink': '#ff00ff',
    'yellow': '#ffff00',
    'red': '#ff0040',
    'blue': '#0080ff',
    'purple': '#8000ff',
    'orange': '#ff8000',
}

# Statusbar
c.colors.statusbar.normal.bg = neon['bg_darker']
c.colors.statusbar.normal.fg = neon['text']
c.colors.statusbar.command.bg = neon['bg_dark']
c.colors.statusbar.command.fg = neon['accent']
c.colors.statusbar.insert.bg = neon['bg_dark']
c.colors.statusbar.insert.fg = neon['pink']

# Tabs
c.colors.tabs.bar.bg = neon['bg_darker']
c.colors.tabs.even.bg = neon['bg_dark']
c.colors.tabs.odd.bg = neon['bg_dark']
c.colors.tabs.even.fg = neon['text']
c.colors.tabs.odd.fg = neon['text']
c.colors.tabs.selected.even.bg = neon['accent']
c.colors.tabs.selected.odd.bg = neon['accent']
c.colors.tabs.selected.even.fg = neon['bg_darker']
c.colors.tabs.selected.odd.fg = neon['bg_darker']

# Completion
c.colors.completion.category.bg = neon['bg_dark']
c.colors.completion.category.fg = neon['pink']
c.colors.completion.even.bg = neon['bg_light']
c.colors.completion.odd.bg = neon['bg_medium']
c.colors.completion.fg = neon['text']
c.colors.completion.item.selected.bg = neon['blue']
c.colors.completion.item.selected.fg = neon['bg_darker']

# Hints
c.colors.hints.bg = neon['yellow']
c.colors.hints.fg = neon['bg_darker']
c.colors.hints.match.fg = neon['red']

# Downloads
c.colors.downloads.bar.bg = neon['bg_dark']
c.colors.downloads.start.bg = neon['blue']
c.colors.downloads.start.fg = neon['bg_darker']
c.colors.downloads.stop.bg = neon['text']
c.colors.downloads.stop.fg = neon['bg_darker']
c.colors.downloads.error.bg = neon['red']
c.colors.downloads.error.fg = neon['bg_darker']

# Prompts
c.colors.prompts.bg = neon['bg_medium']
c.colors.prompts.fg = neon['text']
c.colors.prompts.border = f"2px solid {neon['accent']}"
c.colors.prompts.selected.bg = neon['purple']
c.colors.prompts.selected.fg = neon['bg_darker']

# Messages
c.colors.messages.error.bg = neon['red']
c.colors.messages.error.fg = neon['bg_darker']
c.colors.messages.warning.bg = neon['orange']
c.colors.messages.warning.fg = neon['bg_darker']
c.colors.messages.info.bg = neon['blue']
c.colors.messages.info.fg = neon['bg_darker']

# --------------------------------
# READING SETTINGS
# --------------------------------
c.fonts.default_family = ['Liberation Serif', 'Georgia', 'Times New Roman', 'serif']
c.fonts.default_size = '12pt'
c.fonts.web.family.serif = 'Liberation Serif'
c.fonts.web.family.sans_serif = 'Liberation Sans'
c.zoom.default = '110%'
c.zoom.levels = ['50%', '75%', '90%', '100%', '110%', '125%', '150%', '200%', '300%']
c.content.default_encoding = 'utf-8'
c.scrolling.smooth = True

# --------------------------------
# CONTENT BLOCKING (AD + DISTRACTIONS)
# --------------------------------
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://secure.fanboy.co.nz/fanboy-annoyance.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt'
]

DISTRACTION_SITES = [
    'youtube.com','www.youtube.com','m.youtube.com',
    'facebook.com','www.facebook.com',
    'twitter.com','x.com',
    'instagram.com','www.instagram.com',
    'tiktok.com','www.tiktok.com',
    'reddit.com','www.reddit.com',
    'netflix.com','twitch.tv','discord.com'
]

for site in DISTRACTION_SITES:
    config.set('content.cookies.accept', 'never', f'*://{site}/*')
    config.set('content.local_storage', False, f'*://{site}/*')
    config.set('content.notifications.enabled', False, f'*://{site}/*')
    config.set('content.geolocation', False, f'*://{site}/*')

# --------------------------------
# GLOBAL PRIVACY
# --------------------------------
c.content.cookies.accept = 'no-3rdparty'
c.content.local_storage = True
c.content.javascript.enabled = True
c.content.notifications.enabled = False
c.content.geolocation = False
c.content.webgl = False
c.content.canvas_reading = False
c.content.headers.do_not_track = True

# --------------------------------
# CACHE CLEAR ON EXIT
# --------------------------------
import atexit, os, shutil
def clear_cache_on_exit():
    cache_dir = os.path.expanduser('~/.cache/qutebrowser')
    if os.path.exists(cache_dir):
        shutil.rmtree(cache_dir, ignore_errors=True)
atexit.register(clear_cache_on_exit)

# --------------------------------
# PRIVACY TOGGLES
# --------------------------------
c.aliases.update({
    'privacy-max': 'set content.cookies.accept never ;; message-info "Maximum privacy enabled"',
    'privacy-normal': 'set content.cookies.accept no-3rdparty ;; message-info "Normal privacy restored"',
})
config.bind('mp', 'privacy-max')
config.bind('mn', 'privacy-normal')

# --------------------------------
# DOWNLOADS & HISTORY
# --------------------------------
c.downloads.remove_finished = 3000
c.completion.web_history.max_items = 100

print("✓ Vibrant Neon Privacy Config loaded")
