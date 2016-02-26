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
