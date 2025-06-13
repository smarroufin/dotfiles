# common
alias "ls"="ls --color=auto"
alias "ll"="ls -la"
alias "rm"="rm -i"
alias "cp"="cp -i"
alias "mv"="mv -i"
alias "zprofile"="edit ~/.zprofile"
alias "zshrc"="edit ~/.zshrc"
# gotos
alias "cdconfig"="cd ~/.config"
alias "cdcode"="cd ~/Code"
# apps
alias "edit"="nvim"
# brew
alias "brew-formulae"="brew list --formulae -1 --installed-on-request"
alias "brew-casks"="brew list --casks -1"
# binaries proxies
alias "cloc"="echo \"Use 'scc' instead.\"; cloc"
alias "man"="echo \"Remember you have 'tldr'?\"; man"
# tmux
function tmux() {
  if [[ "$@" ]]; then
    command tmux "$@"
  else
    command tmux attach -t main 2>/dev/null || tmux new-session -s main
  fi
}
alias "tmuxadd"="tmux new-window -t main && tmux attach -t main || tmux"
alias "tmuxdir"='tmux attach -t "$(basename $(pwd))" 2>/dev/null || tmux new-session -s "$(basename $(pwd))"'
# package manager
function n() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command pnpm "$@"
  fi
}
function nx() {
  if [[ -f pnpm-lock.yaml ]]; then
    command pnpx "$@"
  else
    command npx "$@"
  fi
}
alias "ni"="n install"
alias "nr"="n run"
# prisma
alias "prisma-generate-migrate"="nx prisma generate && nx prisma migrate deploy"

# run compaudit and automatically fix permissions
autoload -Uz compaudit
compaudit | xargs chmod g-w,o-w
# completion
autoload -Uz compinit && compinit

# git
autoload -Uz vcs_info
precmd() {
  vcs_info
}
zstyle ':vcs_info:git:*' formats '(%b)'
setopt prompt_subst
PROMPT_BASE='%F{red}%~%f %F{blue}${vcs_info_msg_0_}%f'
PROMPT_CMD='%K{red}%F{black}!%f%k'
PROMPT_INS='$'

# vim mode indicator
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      PROMPT="$PROMPT_BASE $PROMPT_CMD " ;;
        (main|viins) PROMPT="$PROMPT_BASE $PROMPT_INS " ;;
        (*)          PROMPT="$PROMPT_BASE $PROMPT_INS " ;;
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
