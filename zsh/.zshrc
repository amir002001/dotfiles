export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Starship 🚀
eval "$(starship init zsh)"

# Home Brew
if command -v /opt/homebrew/bin/brew &> /dev/null; then
    if [ "$(arch)" = "arm64" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# keybinds
#  macos goofy ah jump one word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
#  fish auto accept
bindkey '^ ' autosuggest-accept
bindkey -s '^q' '~/.scripts/tmux-sessionizer.sh^M'

# bun global bin
export PATH="/Users/amirhosseinazizafshari/.bun/bin:$PATH"

plugins=(
    git
    bazel
    docker
    zsh-autosuggestions
    fzf
    fzf-tab
    golang
)

source $ZSH/oh-my-zsh.sh

# User configuration
#   aliases
if command -v nvim &> /dev/null; then
    alias vi="nvim"
    alias vim="nvim"
    alias oldvim="vim"
fi
if command -v exa &> /dev/null; then
    alias ls='exa --git --icons --color=always --group-directories-first'
fi

#   exports
if command -v fd &> /dev/null; then
    export FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"
    export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
fi
export FZF_DEFAULT_OPTS="
--bind='f2:toggle-preview,f4:execute($EDITOR {}),alt-w:toggle-preview-wrap,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort,ctrl-l:clear-query'
--preview-window='right:60%:wrap'
--preview='bat --style=numbers --color=always {}'
--info=inline
--multi
--reverse
--height 60%
--no-mouse
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
"

export PATH=~/go/bin:$PATH

# bun completions
[ -s "/Users/amirhosseinazizafshari/.bun/_bun" ] && source "/Users/amirhosseinazizafshari/.bun/_bun"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
if command -v op &> /dev/null; then
    source /Users/amirhosseinazizafshari/.config/op/plugins.sh
fi

if command -v cowsay &> /dev/null; then
    ~/.scripts/cow-greet.sh
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/amirhosseinazizafshari/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/amirhosseinazizafshari/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/amirhosseinazizafshari/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/amirhosseinazizafshari/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

