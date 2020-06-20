#config.load_autoconfig()

# View pdf files in-browser
c.content.pdfjs = True

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

# Use neovim in alacritty as an editor
c.editor.command = ["alacritty", "-t", "Qute Editor", "-d", "80", "24", "-e",
                    "nvim", "{}", "+call cursor({line}, {column})"]

# Bind Ctrl-e in command mode to edit the current command
config.bind('<Ctrl+e>', 'edit-command', mode='command')

# Rebind close tab to 'dd'
config.unbind('d')
config.bind('dd', 'tab-close')

# Binds for qute-pass
config.bind('zl',  'spawn --userscript qute-pass')
config.bind('zol', 'spawn --userscript qute-pass --otp-only')
config.bind('zpl', 'spawn --userscript qute-pass --password-only')
config.bind('zul', 'spawn --userscript qute-pass --username-only')

# Bind key for opening images
config.bind(';I', 'hint images run open {hint-url}')

# Load the default page after closing the last tab
c.tabs.last_close = "default-page"

# Hide the tab bar if only one tab is available
c.tabs.show = "multiple"

# Set a maximum tab width so small numbers of tabs aren't so huge
c.tabs.max_width = 250

# Enable hidpi mode
c.qt.highdpi = True

# Font settings
c.fonts.default_family = 'Source Code Pro'
c.fonts.default_size = '11pt'

# Set up search engines
c.url.searchengines = {
  "DEFAULT": "https://www.google.com/search?q={}",
  "ddg":     "https://duckduckgo.com?q={}",
  "aw":      "https://wiki.archlinux.org/?search={}",
  "aur":     "https://aur.archlinux.org/packages/?K={}",
  "dfw":     "https://dwarffortresswiki.org?search={}"
}

