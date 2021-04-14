# VSCode for SK
Skeleton

# Starship.rs

Install:
```bash
curl -fsSL https://starship.rs/install.sh | bash
```

```zsh
eval "$(starship init zsh)"
```

# Git
https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration
{% include utterances-general.html %}

# Starship.rs
## Installing
Use homebrew to install Starship:
`brew install starship`

Or use curl:
```curl -fsSL https://starship.rs/install.sh | bash```

## Configuring the prompt
Go into the `settings.json` file for Visual Studio Code to set the default shell to `zsh`

Then:
`nano ~\.zshrc`
Add this line to the end of the file in the nano editor:
```eval "$(starship init zsh)"```

To get started configuring starship, enter the command to create the `starship.toml` config file and fill it with the following:
`touch ~/.config/starship.toml` && `nano ~/.config/starship.toml`

```bash
# Inserts a blank line between shell prompts
add_newline = true

# Replace the "❯" symbol in the prompt with "➜"
[character]                            # The name of the module we are configuring is "character"
success_symbol = "[➜](bold green)"     # The "success_symbol" segment is being set to "➜" with the color "bold green"

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true
```

Here's my current setup:
```bash
# Inserts a blank line between shell prompts
add_newline = true

# Replace the "❯" symbol in the prompt with "➜"
[character]                            # The name of the module we are configuring is "character"
success_symbol = "[➜](bold green)"     # The "success_symbol" segment is being set to "➜" with the color "bold green"

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true

# Git -> https://starship.rs/config/#git-branch
[git_branch]
symbol = "🌱 "
truncation_length = 4
truncation_symbol = ""

# Python
#[python]
#symbol = "👾 "
#pyenv_version_name = true
```

Then press `ctrl+x` to save the toml file