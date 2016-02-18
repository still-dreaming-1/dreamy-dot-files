# this enables using other defined aliases with sudo
alias sudo='sudo '
alias v='vim'
alias g='git'
#alias for gitting latest versions in version sorted order
alias gtag='git tag -n1 | sort -V | tail'
alias gbranch='git branch'
alias gadd='git add -A'
alias gdiff='git difftool'
alias gcommit='git commit'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log --decorate --stat --graph'
alias gdev='git checkout develop'
alias s='git status'

alias c='cd'
alias c.='cd ..'
alias cacs='cd /home/jesse/hacking/acs'
alias cvim='cd /home/jesse/.vim'

# thse are find functions. So they start with f. They use the -F option to prefent the search term from being treated as a regular expression. The "standard"
# version of these functions are also case insensitive. They all search recursively. They are basically used to find a search term across all files in a
# project without missing anything. The lack of case sensitivity helps not to miss anything, as does the lack of regular expression support since regular
# expressions are complicated and so often do not do what you think they do. Case sensitive versions of these search functions are provided for special case
# usage, but it is recommended not to use them except when they are specifically required

# find in web files
fw() {
	grep -Fri --include=*.{php,cs,html,js,css} "$@" .
}

# case sensitive version of fw
exact_fw() {
	grep -Fr --include=*.{php,cs,html,js,css} "$@" .
}

# find in php files
fp() {
	grep -Frin --include=*.php "$@" .
}

# case sensitive version of fp
exact_fp() {
	grep -Fr --include=*.php "$@" .
}
 
# find in C# files (fc is already taken. the n in fn is for .NET)
fn() {
	grep -Fri --include=*.cs "$@" .
}
 
# case sensitive version of fn
exact_fn() {
	grep -Fr --include=*.cs "$@" .
}

# find in all files
f_all() {
    grep -Fri "$@" .
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# this allows the current git branch to be retrieved
source ~/.git-prompt.sh
# customized my prompt to show the current git branch and space things differently
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1) \$ '

export TERM='xterm-256color'
