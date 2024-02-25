#!/bin/bash

# Provision a new Mac

# Install Command-line tools as dependency for Homebrew
echo "🛠️ Installing XCode Command Line tools..."
xcode-select --install # Sets the development directory path to /Library/Developer/CommandLineTools
echo "Successfully installed XCode Command Line tools!"

# Configure Git
git config --global user.name "Jordan Foreman"
git config --global user.email hello@jordanforeman.com

# Install Homebrew
echo "🍻 Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Successfully installed Homebrew!"

# Install Generically Required Software
echo "📦 Install Homebrew packages..."
brew install \
    bat \
    gnupg \
    openssl \
    node \
    nvm \
    exa \
    tor \
    colima \
    spaceship

# Brew > Cask
brew install --cask \
    visual-studio-code \
    iterm2 \
    dbeaver-community \
    fantastical \
    todoist \
    obsidian \
    1password \
    altserver \
    discord \
    brave-browser \
    protonvpn \
    vlc \
    zoom \
    intellij-idea
echo "Successfully installed Homebrew Packages!"

echo "Configuring Shell Environment"

touch ~/.zshrc
touch ~/.aliases
mkdir -p ~/.nvm

echo "Installing Oh My ZSH!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Configuring Rocketship 🚀"
echo "# Rocketship Setup" >> ~/.zshrc
echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >> ~/.zshrc
echo "" >> ~/.zshrc

echo "Configuring 📦 Node.js Version Manager"
echo "# NVM Configuration" >> ~/.zshrc
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.zshrc
echo "[ -s \"/usr/local/opt/nvm/nvm.sh\" ] && \. \"/usr/local/opt/nvm/nvm.sh\"" >> ~/.zshrc
echo "[ -s \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\" ] && \. \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\"" >> ~/.zshrc
echo "" >> ~/.zshrc

# Setup common aliases
echo "# Load Aliases" >> ~/.zshrc
echo "if [ -f ~/.aliases ]; then" >> ~/.zshrc
echo "    . ~/.aliases" >> ~/.zshrc
echo "fi" >> ~/.zshrc
echo "" >> ~/.zshrc

echo "alias ls=exa -la" >> ~/.aliases
echo "alias cat=bat" >> ~/.aliases

source ~/.zshrc
