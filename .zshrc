# General Aliases
alias kubectl="minikube kubectl --"
alias k="kubectl"
alias vim="nvim --"

# Homebrew Setup
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Setup NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# added by Jetbrains Toolbox
export PATH="$PATH:/home/kayden/.local/share/JetBrains/Toolbox/scripts"

# OH MY ZSH
ZSH_THEME="jispwoso"
# ZSH_THEME="agnoster"
ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Terraform Autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
