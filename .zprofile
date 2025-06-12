export GEM_HOME=$HOME/.gem
export BREW=/opt/homebrew/bin
export VOLTA_HOME=$HOME/.volta
export RUST_HOME=$($BREW/brew --prefix rustup)

# pnpm
export PNPM_HOME="/Users/smarroufin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:$GEM_HOME/bin:$BREW:$VOLTA_HOME/bin:$RUST_HOME/bin

export EDITOR='nvim'

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
