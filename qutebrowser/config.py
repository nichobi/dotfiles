config.load_autoconfig()
c.editor.command = ["alacritty", "-t", "Qute Editor", "-d", "80", "24", "-e", "nvim", "{}", "+call cursor({line}, {column})"]
