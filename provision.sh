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
    colima

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