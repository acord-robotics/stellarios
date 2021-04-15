# VSCode for SK

[Discussion](#discussion)
[Starship.rs](#starshiprs)
[Jekyll](#jekyll-on-the-command-line)

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
![](https://i.ibb.co/2jTKxBM/carbon-1.png)

<!--
<details><Summary>Here's my current setup</summary>

<!--
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
```-->


[![](https://i.ibb.co/vvXHzJ0/carbon.png)](https://carbon.now.sh/?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=one-light&wt=none&l=auto&ds=true&dsyoff=20px&dsblur=68px&wc=true&wa=true&pv=56px&ph=56px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%2523%2520Inserts%2520a%2520blank%2520line%2520between%2520shell%2520prompts%250Aadd_newline%2520%253D%2520true%250A%250A%2523%2520Replace%2520the%2520%2522%25E2%259D%25AF%2522%2520symbol%2520in%2520the%2520prompt%2520with%2520%2522%25E2%259E%259C%2522%250A%255Bcharacter%255D%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2523%2520The%2520name%2520of%2520the%2520module%2520we%2520are%2520configuring%2520is%2520%2522character%2522%250Asuccess_symbol%2520%253D%2520%2522%255B%25E2%259E%259C%255D%28bold%2520green%29%2522%2520%2520%2520%2520%2520%2523%2520The%2520%2522success_symbol%2522%2520segment%2520is%2520being%2520set%2520to%2520%2522%25E2%259E%259C%2522%2520with%2520the%2520color%2520%2522bold%2520green%2522%250A%250A%2523%2520Disable%2520the%2520package%2520module%252C%2520hiding%2520it%2520from%2520the%2520prompt%2520completely%250A%255Bpackage%255D%250Adisabled%2520%253D%2520true%250A%250A%2523%2520Git%2520-%253E%2520https%253A%252F%252Fstarship.rs%252Fconfig%252F%2523git-branch%250A%255Bgit_branch%255D%250Asymbol%2520%253D%2520%2522%25F0%259F%258C%25B1%2520%2522%250Atruncation_length%2520%253D%25204%250Atruncation_symbol%2520%253D%2520%2522%2522%250A%250A%2523%2520Python%250A%2523%255Bpython%255D%250A%2523symbol%2520%253D%2520%2522%25F0%259F%2591%25BE%2520%2522%250A%2523pyenv_version_name%2520%253D%2520true%250A%250A%252F%252F%2520Photo%2520by%2520Samara%2520Doole%2520on%2520Unsplash) 

Then press `ctrl+x` to save the toml file







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