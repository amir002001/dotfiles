
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Starship 🚀
eval "$(starship init zsh)"


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

# bun completions
[ -s "/Users/amirhosseinazizafshari/.bun/_bun" ] && source "/Users/amirhosseinazizafshari/.bun/_bun"
