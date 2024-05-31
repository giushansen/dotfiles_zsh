git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor='%F{red}'
    else
      local gitstatuscolor='%F{green}'
    fi
    echo "${gitstatuscolor} (${ref})"
  else
    echo ""
  fi
}

setopt PROMPT_SUBST

# Hulkified prompt color
# PS1='\[\e[1;32m\]\w \[\e[0m\]\$\[\e[1;37m\] '
#PS1=$'\e[1;34m%D{%H:%M:%S}\e[0m\e[1;32m %~$(git_branch_test_color) $ \e[0m\e[1;37m'
PS1=%{$'\e[1;34m%D{%H:%M:%S}\e[0m\e[1;32m%} %~$(git_branch_test_color) $ \e[0m\e[1;37m'

# Improve our history
export HISTFILESIZE=10000
export HISTSIZE=10000
#shopt -s histappend
export PROMPT_COMMAND='history -a'
# Elixir history
export ERL_AFLAGS="-kernel shell_history enabled"

# Shortcuts
alias ll='ls -lArtG'

alias gs='git status'
alias gco='git checkout'
alias gp='git pull --rebase'
alias gca='git commit -am'
alias gd='git diff'
alias gsl='git stash list'
alias gsi='git stash apply --index'

alias p='cd /Users/guillaumefourret/Projects/'
alias bb='cd /Users/guillaumefourret/Projects/barebloc/'