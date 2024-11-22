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
    aws
)

source $ZSH/oh-my-zsh.sh

# User configuration
#   aliases



if command -v nvim &> /dev/null; then
    alias vi="nvim"
    alias vim="nvim"
    alias oldvim="vim"
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
--color=fg:#000000,bg:#fffffe,hl:#c49701
"

export PATH=~/go/bin:$PATH
export JAVA_HOME="/opt/homebrew/Cellar/openjdk/22.0.1/libexec/openjdk.jdk/Contents/Home"

# bun completions
[ -s "/Users/amirhosseinazizafshari/.bun/_bun" ] && source "/Users/amirhosseinazizafshari/.bun/_bun"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

if command -v cowsay &> /dev/null; then
    ~/.scripts/cow-greet.sh
fi


# export PATH="/Users/amirhosseinazizafshari/miniconda3/bin:$PATH"  # commented out by conda initialize

unset __conda_setup
# <<< conda initialize <<<



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/amirhosseinazizafshari/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/amirhosseinazizafshari/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/amirhosseinazizafshari/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/amirhosseinazizafshari/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

