# trick to make sudo work with other aliases in bash
alias sudo='sudo '
# Source aliases. This allows the same aliases to be shared between bash and zsh
source ~/.aliashrc
# Source functions. This allows the same functions to be shared between bash and zsh
source ~/.functionshrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# this allows the current git branch to be retrieved
source ~/.git-prompt.sh
# customized my prompt to show the current git branch and space things differently
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1) \$ '

export TERM='xterm-256color'
