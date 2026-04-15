# ---- completions ----
autoload -Uz compinit
compinit

# ---- history ----
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

# ---- atuin ----
eval "$(atuin init zsh)"

# ---- starship ----
eval "$(starship init zsh)"

# ---- aliases ----
alias grep='grep --color=auto'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gb='git branch'
alias gcm='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias cat='bat --theme ansi -pp'
alias ls='eza -al --header --git --icons=always'
alias lg='lazygit'
alias ld='lazydocker'
gacp() {
  git add .
  git commit -m "$*"
  branch=$(git rev-parse --abbrev-ref HEAD) || return 1
  git push origin "$branch"
}

# ---- env ----
export EDITOR=nano
export VISUAL=nano
export PAGER=less

# ---- plugins ----
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
