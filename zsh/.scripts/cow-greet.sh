local cowsay_commands=(
    "cowsay -f ~/.cowfiles/finn-and-jake.cow 'you are \"sed\"istic'"
    "cowsay -f ~/.cowfiles/alfred.cow 'Welcome home, sir. Shall I fetch the runbook?'"
    "cowsay -f ~/.cowfiles/sparrow.cow '200?'"
)

local random_index=$((RANDOM % ${#cowsay_commands[@]}))
eval ${cowsay_commands[$random_index]}
