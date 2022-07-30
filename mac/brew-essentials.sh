# Install Homebrew (if not installed)
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Installs Casks
brew tap homebrew/cask

## Apps I use
# brew install alfred
# brew install mackup
# brew install dropbox
# brew install google-backup-and-sync
# brew install google-chrome #Chrome
# brew install google-drive
brew install homebrew/cask-versions/firefox-nightly # Nightly
# brew install homebrew/cask-versions/google-chrome-canary # Chrome Canary
brew install iterm2
# brew install kap
# brew install mongodb-compass
# brew install notion
# brew install signal
# brew install sketch
# brew install slack
# brew install spotify
# brew install textexpander
# brew install tower
brew install visual-studio-code
# brew install whatsapp
# brew install zoom
brew install sublime-text
brew install maccy
brew install daisydisk
brew install jenv
brew install jd-gui
brew install itsycal


# Restore plists of apps
mackup restore

# Remove outdated versions from the cellar.
brew cleanup
