# source the prezto zshrc config
source "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc"

# customize to your needs...
TERM=xterm-256color

# Source aliases. This allows the same aliases to be shared between bash, zsh, and vimshell
source "${ZDOTDIR:-$HOME}/.aliashrc"
# Source custom aliases not tracked by git. This allows the same aliases to be shared between bash, zsh, and vimshell
source "${ZDOTDIR:-$HOME}/.afteraliashrc"
# Source functions. This allows the same functions to be shared between bash and zsh
source "${ZDOTDIR:-$HOME}/.functionshrc"
# This is a good place to put settings that only apply to the current computer or user
source "${ZDOTDIR:-$HOME}/.afterzshrc"

# fzf install script adds this line automatically to this file. Running the uninstall script will remove this line automatically
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export VISUAL=nvim
export EDITOR="$VISUAL"
export NVIM_PYTHON_LOG_FILE=/home/jesse/logs/nvim_python.log

# prezto agnoster theme. This theme also works well with the iOS prompt app
prompt agnoster

# disable auto-correct. This allows sudo to work with other aliases with a special sudo alias and still work with commands like mkdir
unsetopt correct_all
unsetopt correct

export NVM_DIR="/home/jesse/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
