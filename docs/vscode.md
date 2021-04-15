# VSCode for SK

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


# Starship.rs
## Installing
Use homebrew to install Starship:
`brew install starship`

Or use curl:
```curl -fsSL https://starship.rs/install.sh | bash```

## Configuring the prompt
<details><Summary>Go into the `settings.json` file for Visual Studio Code to set the default shell to `zsh`</Summary>

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

</details>

<details><Summary>Here's my current setup</summary>

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
</details>



## Integrate [OhMy]ZSH with Python
[![](https://img.shields.io/github/stars/sakshamsharma/zpyi?color=red&logo=github&style=for-the-badge)](https://github.com/sakshamsharma/zpyi)

```bash
cd ~
git clone https://github.com/sakshamsharma/zpyi ~/.zpyi
echo "source ~/.zpyi/zpyi.zsh" >> ~/.zshrc
source ~/.zshrc
```

Then enter any command you want!

# Jekyll on the command line
Follow the instructions from the [documentation](https://jekyllrb.com/docs/installation/ubuntu/).

Install jekyll on the zsh prompt:
```sudo apt-get install ruby-full build-essential zlib1g-dev```

Then install it to your `~/.zshrc` file:
```
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

```
gem install jekyll bundler
```

### Jekyll example
With [this repo](https://github.com/acord-robotics/stellarios/tree/gh-pages), we've got a jekyll library/setup that's quite old and isn't too well optimised for 2021 (I'm working on changing that). To get jekyll working on my CLI with my zsh profile, I had to enter the following command:

```
bundle update --bundler
bundle update jekyll build
```

Building the site:
```
bundle update jekyll serve
```

### Discussion
{% include utterances-general.html %}

<!--To do
Fix python version to 3
-->

<!--Idea: Integrate Starship with Jira
Force `bundle update` on all jekyll commands on stellarios/gh-pages repo-->