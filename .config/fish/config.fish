# disable greeting
set fish_greeting

set -gx EDITOR nvim

# path
set -x BREW_HOME /opt/homebrew
set -x RUST_HOME $($BREW_HOME/bin/brew --prefix rustup)
set -x VOLTA_HOME "$HOME/.volta"
set -x PATH $PATH $BREW_HOME/bin $RUST_HOME/bin $VOLTA_HOME/bin

# orbstack
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# prompt
function fish_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -q fish_color_status
    or set -g fish_color_status red

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -n -s (set_color $color_cwd) (prompt_pwd) (set_color normal) (fish_vcs_prompt) (set_color normal) " "$prompt_status $suffix " "
end

# aliases
alias ll="ls -la"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
# gotos
alias cdconfig="cd ~/.config"
alias cdcode="cd ~/Code"
function "gh-open"
    set -l repo (git remote get-url origin | sed 's/.*github.com[:\/]\(.*\)\.git/\1/')
    open "https://github.com/$repo"
end
# apps
alias edit="nvim"
alias lg="lazygit"
# brew
alias brew-formulae="brew list --formulae -1 --installed-on-request"
alias brew-casks="brew list --casks -1"
# binaries proxies
alias cloc="echo \"Use 'scc' instead.\"; command cloc"
alias man="echo \"Remember you have 'tldr'?\"; command man"
# tmux
function tmux
    if test -n "$argv"
        command tmux $argv
    else
        command tmux attach -t main 2>/dev/null || tmux new-session -s main
    end
end
alias tmuxadd="tmux new-window -t main && tmux attach -t main || tmux"
alias tmuxdir="tmux attach -t (basename (pwd)) 2>/dev/null || tmux new-session -s (basename (pwd))"
# package manager
function n
    if test -f "bun.lockb"
        bun $argv
    else if test -f "pnpm-lock.yaml"
        pnpm $argv
    else if test -f "yarn.lock"
        yarn $argv
    else if test -f "package-lock.json"
        npm $argv
    else
        pnpm $argv
    end
end
function nx
    if test -f "pnpm-lock.yaml"
        pnpx $argv
    else
        npx $argv
    end
end
alias ni="n install"
alias nr="n run"
# prisma
alias prisma-generate-migrate="nx prisma generate && nx prisma migrate deploy"
