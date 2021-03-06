## Sourcing ##

# Load automatic configuration
config.load_autoconfig()
# Load custom theme
config.source('theme.py')


## Misc. ##

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Prefer dark color schemes
c.colors.webpage.preferred_color_scheme = 'dark'

# Require a confirmation before quitting the application if downloads are active.
c.confirm_quit = ["downloads"]

# Use neovim in alacritty as an editor
c.editor.command = ["alacritty", "-t", "Qutebrowser Editor", "-e",
                    "nvim", "{}", "+call cursor({line}, {column})"]

# Font settings
c.fonts.default_family = 'Source Code Pro'
c.fonts.default_size   = '11pt'

# Enable hidpi mode
c.qt.highdpi = True

# Enable smooth scrolling
c.scrolling.smooth = True

# Enable spellcheck
c.spellcheck.languages = ['en-GB', 'sv-SE']


## Binds ##

# Bind for opening download immediately
config.bind('<Ctrl-o>', 'prompt-open-download', mode='prompt')

# Bind Ctrl-e in command mode to edit the current command
config.bind('<Ctrl+e>', 'edit-command', mode='command')

# Binds for moving through completion items
config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')

# Rebind close tab to 'dd'
config.unbind('d')
config.bind('dd', 'tab-close')

# Bindings to close all tabs to the left or right of the current tab
# --pinned flag requires https://github.com/qutebrowser/qutebrowser/pull/6287
# Merged in 2.2.0
config.bind('co', 'tab-only --pinned keep') # Close other tabs
config.bind('ch', 'tab-only --next --pinned keep') # Close tabs to the left
config.bind('cl', 'tab-only --prev --pinned keep') # Close tabs to the right

# Bindings to move in tab history
config.bind('gh', 'set-cmd-text -s :back ')
config.bind('gl', 'set-cmd-text -s :forward ')

# Binds for qute-pass
config.bind('zl',  'spawn --userscript qute-pass')
config.bind('zol', 'spawn --userscript qute-pass --otp-only')
config.bind('zpl', 'spawn --userscript qute-pass --password-only')
config.bind('zul', 'spawn --userscript qute-pass --username-only')

# Binds for images
config.unbind(';i')
config.bind(';ii', 'hint images')
config.bind(';io', 'hint images run open {hint-url}')
config.bind(';iO', 'hint images run open -t {hint-url}')
config.bind(';ig', 'hint images run open https://www.google.com/searchbyimage?&image_url={hint-url}')

# Bind for opening link in private window
config.bind(';p', 'hint all run open -p {hint-url}')

# Binds for opening archived version of current page
config.bind('aa', 'open https://web.archive.org/web/*/{url}')
config.bind('aA', 'open -t https://web.archive.org/web/*/{url}')
config.bind('ag', 'open https://www.google.com/search?q=cache:{url}')
config.bind('aG', 'open -t https://www.google.com/search?q=cache:{url}')

# Open links in other applications
config.unbind('m')
config.bind('mm', 'spawn -d umpv {url}')
config.bind('mf', 'spawn -d firefox {url}')
config.bind('mc', 'spawn -d google-chrome-stable {url}')
config.bind(';mm', 'hint all spawn -d umpv {hint-url}')
config.bind(';mf', 'hint all spawn -d firefox {hint-url}')
config.bind(';mc', 'hint all spawn -d google-chrome-stable {hint-url}')


## Content ##

# Don't view pdf files in-browser
c.content.pdfjs = False

# Disable autoplay
c.content.autoplay = False

# Anti-fingerprinting
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36'
c.content.headers.accept_language = 'en-US,en;q=0.5'
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
c.content.cookies.accept = "no-3rdparty"

# Adblock filter lists
c.content.blocking.adblock.lists = [
        "https://easylist.to/easylist/easylist.txt",
        "https://easylist.to/easylist/easyprivacy.txt",
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
        "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt",
        "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
]


## Downloads ##

# Put the download bar at the bottom of the screen
c.downloads.position = "bottom"

# Remove finished downloads from the download bar after 5 minutes
c.downloads.remove_finished = 300000


## Hints ##

# Add full keyboard layout to hint chars
# This is a bad idea but works nicely as typing practice
c.hints.chars =  'asdfghjkl;\'\\' + 'qwertyuiop[]' + '<zxcvbnm,./' + '1234567890-='

# Don't lead hint mode when page loads
c.hints.leave_on_load = False


## Tabs ##

# Load the default page after closing the last tab
c.tabs.last_close = "close"

# Hide the tab bar if only one tab is open
c.tabs.show = "multiple"

# Set a maximum tab width so small numbers of tabs aren't so huge
c.tabs.max_width = 250


## URL ##

# Set default_page to blank page
c.url.default_page = "about:blank"

# Set up search engines
c.url.searchengines = {
  "DEFAULT": "https://duckduckgo.com?q={}",
  "au":      "https://aur.archlinux.org/packages/?K={}",
  "aw":      "https://wiki.archlinux.org/?search={}",
  "dd":      "https://duckduckgo.com?q={}",
  "df":      "https://dwarffortresswiki.org?search={}",
  "g":       "https://www.google.com/search?q={}",
  "gh":      "https://github.com/search?q={}",
  "gm":      "https://mail.google.com/mail/u/0/#search/{}",
  "gp":      "https://photos.google.com/search/{}",
  "hoo":     "https://hoogle.haskell.org/?hoogle={}",
  "sp":      "https://startpage.com/sp/search?query={}",
  "yt":      "https://www.youtube.com/results?search_query={}"
}

