config.load_autoconfig()
config.source('theme.py')

# Don't view pdf files in-browser
c.content.pdfjs = False

#Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Require a confirmation before quitting the application if downloads are active.
c.confirm_quit = ["downloads"]

# Set default_page to blank page
c.url.default_page = "about:blank"

# Put the download bar at the bottom of the screen
c.downloads.position = "bottom"

# Remove finished downloads from the download bar after 5 minutes
c.downloads.remove_finished = 300000

# Bind for opening download immediately
config.bind('<Ctrl-o>', 'prompt-open-download', mode='prompt')

# Use neovim in alacritty as an editor
c.editor.command = ["alacritty", "-t", "Qutebrowser Editor", "-d", "80", "24",
                    "-e", "nvim", "{}", "+call cursor({line}, {column})"]

# Bind Ctrl-e in command mode to edit the current command
config.bind('<Ctrl+e>', 'edit-command', mode='command')

# Rebind close tab to 'dd'
config.unbind('d')
config.bind('dd', 'tab-close')

# Bindings to keep only the current tab and those to its left or right, respectively
config.bind('ch', 'tab-only --prev')
config.bind('cl', 'tab-only --next')

# Binds for qute-pass
config.bind('zl',  'spawn --userscript qute-pass')
config.bind('zol', 'spawn --userscript qute-pass --otp-only')
config.bind('zpl', 'spawn --userscript qute-pass --password-only')
config.bind('zul', 'spawn --userscript qute-pass --username-only')

# Bind key for opening images
config.bind(';I', 'hint images run open {hint-url}')

# Bind for opening link in private window
config.bind(';p', 'hint all run open -p {hint-url}')

# Binds for opening archived version of current page
config.bind('aa', 'open https://web.archive.org/web/*/{url}')
config.bind('aA', 'open -t https://web.archive.org/web/*/{url}')
config.bind('ag', 'open https://www.google.com/search?q=cache:{url}')
config.bind('aG', 'open -t https://www.google.com/search?q=cache:{url}')

# Open in mpv
config.unbind('m')
config.bind('mm', 'spawn mpv {url}')
config.bind(';mm', 'hint all spawn mpv {hint-url}')

# Open in firefox
config.bind('mf', 'spawn firefox {url}')
config.bind(';mf', 'hint all spawn firefox {hint-url}')

# Disable autoplay
c.content.autoplay = False

# Add full keyboard layout to hint chars
## This is a bad idea but works nicely as typing practice
c.hints.chars =  'asdfghjkl;\'\\' + 'qwertyuiop[]' + '<zxcvbnm,./' + '1234567890-='

# Don't lead hint mode when page loads
c.hints.leave_on_load = False

# Load the default page after closing the last tab
c.tabs.last_close = "close"

# Hide the tab bar if only one tab is open
c.tabs.show = "multiple"

# Set a maximum tab width so small numbers of tabs aren't so huge
c.tabs.max_width = 250

# Enable hidpi mode
c.qt.highdpi = True

# Prefer dark color schemes
c.colors.webpage.prefers_color_scheme_dark = True;

# Font settings
c.fonts.default_family = 'Source Code Pro'
c.fonts.default_size   = '11pt'

# Set up search engines
c.url.searchengines = {
  "DEFAULT": "https://startpage.com/sp/search?query={}",
  "!sx": "https://searx.isacsson.se?q={}",
  "!g": "https://www.google.com/search?q={}",
  "!dd":     "https://duckduckgo.com?q={}",
  "!aw":     "https://wiki.archlinux.org/?search={}",
  "!au":     "https://aur.archlinux.org/packages/?K={}",
  "!df":     "https://dwarffortresswiki.org?search={}",
  "!hoo":    "https://hoogle.haskell.org/?hoogle={}"
}

