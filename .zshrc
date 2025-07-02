# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# setting up antidote 
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt


# keybindings
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_ignore_all_dups 
setopt hist_find_no_dups


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive ls
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colours in ls auto-suggestion
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# aliases
alias ls='ls --color'
alias vi='nvim'
alias zshrc='nvim ~/.zshrc'
alias reload='source ~/.zshrc'
# shell integrations 
eval "$(fzf --zsh)" 
eval "$(zoxide init zsh)"

# sdkman setup (requires sdkman to be installed)
source "$HOME/.sdkman/bin/sdkman-init.sh"
alias sdklist='(z ~/.sdkman/candidates/java && ls -1)'
