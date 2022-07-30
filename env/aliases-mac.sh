#!/bin/bash

# For faster navigation
alias ~="cd ~" # `cd` is probably faster to type though

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Kills applications that take up a lot of power to preserve battery
function savebatt() {
  fkill Backup and Sync
  fkill Dropbox
  fkill Google Drive File Stream
  fkill Creative Cloud
}
