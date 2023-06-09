
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
    docker
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
export FZF_DEFAULT_OPTS="
--bind='f2:toggle-preview,f4:execute($EDITOR {}),alt-w:toggle-preview-wrap,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort,ctrl-l:clear-query'
--preview-window='right:60%:wrap'
--preview='bat --style=numbers --color=always {}'
--info=inline
--multi
--reverse
--height 60%
--no-mouse
--color=fg:#908caa,bg:#191724,hl:#ebbcba
--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
--color=border:#403d52,header:#31748f,gutter:#191724
--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
"

export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export PATH=~/go/bin:$PATH

# bun completions
[ -s "/Users/amirhosseinazizafshari/.bun/_bun" ] && source "/Users/amirhosseinazizafshari/.bun/_bun"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
