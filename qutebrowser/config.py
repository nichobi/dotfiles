config.load_autoconfig()

# View pdf files in-browser
c.content.pdfjs = True

#Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Require a confirmation before quitting the application if downloads are active.
c.confirm_quit = ["downloads"]

# Put the   download bar at the bottom of the screen
c.downloads.position = "bottom"

# Remove finished downloads from the download bar after 5 minutes
c.downloads.remove_finished = 300000

# Use neovim in alacritty as an editor
c.editor.command = ["alacritty", "-t", "Qute Editor", "-d", "80", "24", "-e",
                    "nvim", "{}", "+call cursor({line}, {column})"]

# Load the default page after closing the last tab
c.tabs.last_close = "default-page"

# qute-pass bindings
config.bind('<z><l>',    'spawn --userscript qute-pass')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only')
