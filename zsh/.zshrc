# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"


# keybinds
#  macos goofy ah jump one word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
#  fish auto accept
bindkey '^ ' autosuggest-accept
bindkey -s '^q' '~/scripts/tmux-sessionizer.sh^M'

# bun global bin
export PATH="/Users/amirhosseinazizafshari/.bun/bin:$PATH"

plugins=(
    git
    zsh-autosuggestions
    fzf
    fzf-tab
    golang
)

source $ZSH/oh-my-zsh.sh

# User configuration
#   aliases
alias vi="nvim"
alias vim="nvim"
alias oldvim="vim"
alias ls='exa --git --icons --color=always --group-directories-first'

#   exports
export FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 80% --reverse --multi --info=inline --preview='$HOME/.vim/plugged/fzf.vim/bin/preview.sh {}' --preview-window='right:60%:wrap' --bind='f2:toggle-preview,f3:execute(bat --style=numbers {} || less -f {}),f4:execute($EDITOR {}),alt-w:toggle-preview-wrap,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort,ctrl-l:clear-query'"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export PATH=~/go/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/amirhosseinazizafshari/.bun/_bun" ] && source "/Users/amirhosseinazizafshari/.bun/_bun"
