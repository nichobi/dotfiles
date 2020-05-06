config.load_autoconfig()
c.editor.command = ["alacritty", "-t", "Qute Editor", "-d", "80", "24", "-e", "nvim", "{}", "+call cursor({line}, {column})"]
config.bind('<z><l>', 'spawn --userscript qute-pass')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only')

