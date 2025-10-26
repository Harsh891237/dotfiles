# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# --- Plugins ---
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

eval "$(zoxide init zsh)"

# --- Load Completions ---
autoload -U compinit && compinit


source $ZSH/oh-my-zsh.sh

# --- Aliases ---
alias update="yay -Syu"
alias ll='ls -al'
alias sps="sudo pacman -S"
alias spr="sudo pacman -Rns"
alias s="yay -Ss"
alias walset="sh ~/.config/hypr/scripts/walset.sh"
alias way="waydroid show-full-ui"
alias waykill="waydroid session stop"
alias ff="fastfetch"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# --- To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Sources ---
source ~/powerlevel10k/powerlevel10k.zsh-theme
