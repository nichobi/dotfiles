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

# Bindings to close all tabs to the left or right of the current tab
config.bind('ch', 'tab-only --next') # Close tabs to the left
config.bind('cl', 'tab-only --prev') # Close tabs to the right

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

# Open links in other applications
config.unbind('m')
config.bind('mm', 'spawn -d mpv --force-window=immediate {url}')
config.bind('mf', 'spawn -d firefox {url}')
config.bind(';mm', 'hint all spawn -d mpv --force-window=immediate {hint-url}')
config.bind(';mf', 'hint all spawn -d firefox {hint-url}')

# Disable autoplay
c.content.autoplay = False

# Enable spellcheck
c.spellcheck.languages = ['en-GB', 'sv-SE']
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

# Enable smooth scrolling
c.scrolling.smooth = True

# Prefer dark color schemes
c.colors.webpage.prefers_color_scheme_dark = True;

# Font settings
c.fonts.default_family = 'Source Code Pro'
c.fonts.default_size   = '11pt'

# Set up search engines
c.url.searchengines = {
  "DEFAULT": "https://duckduckgo.com?q={}",
  "!au":     "https://aur.archlinux.org/packages/?K={}",
  "!aw":     "https://wiki.archlinux.org/?search={}",
  "!dd":     "https://duckduckgo.com?q={}",
  "!df":     "https://dwarffortresswiki.org?search={}",
  "!g":      "https://www.google.com/search?q={}",
  "!gh":     "https://github.com/search?q={}",
  "!gm":     "https://mail.google.com/mail/u/0/#search/{}",
  "!gp":     "https://photos.google.com/search/{}",
  "!hoo":    "https://hoogle.haskell.org/?hoogle={}",
  "!sp":     "https://startpage.com/sp/search?query={}",
  "!sx":     "https://searx.isacsson.se?q={}",
  "!yt":     "https://www.youtube.com/results?search_query={}"
}

