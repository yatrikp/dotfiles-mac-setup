# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disables Insecure completion error. No harm because https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390589452
ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load.
ZSH_THEME="agnoster"

# Plugins
# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)



source $ZSH/oh-my-zsh.sh

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
export MACHINE

# Source aliases
# For a full list of active aliases, run `alias`.
if [[ "$MACHINE" == "Linux" ]];then
  PROJECT_ROOT='/mnt/c/Users/zellw/projects/dotfiles'
  # source "$PROJECT_ROOT/env/aliases-shared.sh"
  # source "$PROJECT_ROOT/env/aliases-linux.sh"
  # source "$PROJECT_ROOT/env/exports.sh"
  # source "$PROJECT_ROOT/env/functions.sh"
elif [[ "$MACHINE" == "Mac" ]]; then
  PROJECT_ROOT='/Users/yatrik.mehta/git/tools/dotfiles-mac-setup'
  # source "$PROJECT_ROOT/env/aliases-shared.sh"
  source "$PROJECT_ROOT/env/aliases-mac.sh"
  source "$PROJECT_ROOT/env/exports.sh"
  # source "$PROJECT_ROOT/env/functions.sh"
fi
eval export PATH="/Users/yatrik.mehta/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/opt/homebrew/Cellar/jenv/0.5.5_2/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
export PATH="$(/usr/libexec/java_home):$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_HOME="/opt/homebrew/Cellar/maven/3.8.6/bin"
export KAFKA_HOME=/Users/yatrik.mehta/yatrik/installs/kafka_2.13-3.2.3

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yatrik.mehta/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)


### ALIASES ###
alias k="kubectl"
### END OF ALIASES ###



# K8s
k_set_context() {
    echo "Current context: "`kubectl config current-context`
    if [ -z "$1" ]; then
        echo "Available contexts:"
        kubectl config get-contexts -o name
        echo ""
        echo -n "New context: "
        read new_ctx
    else
        new_ctx=$1
    fi

    kubectl config use-context $new_ctx
}


k_set_namespace() {
    echo "Current"`kubectl config view --minify | grep namespace:`
    if [ -z "$1" ]; then
        echo ""
        echo "Available namespaces:"
        kubectl get namespaces -o json | jq .items[].metadata.name

        echo ""
        echo -n "New namespace:"
        read new_ns
    else
        new_ns=$1
    fi
    kubectl config set-context --current --namespace=$new_ns
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
