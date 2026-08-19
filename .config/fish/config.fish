# disable greeting
set fish_greeting

set -gx EDITOR nvim

# path
set -x BREW_HOME /opt/homebrew
fish_add_path $BREW_HOME/bin
set -Ux MISE_FISH_AUTO_ACTIVATE 0
mise activate fish | source

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
alias l="ls -la"
alias ll="ls -la"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
# apps
alias edit="nvim"
alias lg="lazygit"
alias ld="lazydocker"
# brew
alias brew-formulae="brew list --formulae -1 --installed-on-request"
alias brew-casks="brew list --casks -1"
# binaries proxies
alias cloc="echo \"Use 'scc' instead.\"; command cloc"
alias man="echo \"Remember you have 'tldr'?\"; command man"
# scripts
alias gho="bun ~/.scripts/gh.ts index"
alias ghi="bun ~/.scripts/gh.ts issues"
alias ghp="bun ~/.scripts/gh.ts pulls"
alias ghr="bun ~/.scripts/gh.ts releases"
# tmux
function tmux
    if test (count $argv) -gt 0
        command tmux $argv
    else
        command tmux attach -t main 2>/dev/null || tmux new-session -s main
    end
end
alias tmuxadd="tmux new-window -t main && tmux attach -t main || tmux"
alias tmuxdir="tmux attach -t (basename (pwd)) 2>/dev/null || tmux new-session -s (basename (pwd))"
# package manager
function n
    if test -f "bun.lock"
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
    if test -f "bun.lock"
        bunx $argv
    else if test -f "pnpm-lock.yaml"
        pnpm dlx $argv
    else
        npx $argv
    end
end
alias ni="n install"
alias nr="n run"

# zoxide
zoxide init fish | source

