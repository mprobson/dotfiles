alias ls='ls -G'

# enable tab completion
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
# http://star.mit.edu/cluster/docs/0.91/shell_completion.html
# https://unix.stackexchange.com/questions/210930/completions-stopped-working-after-upgrading-zsh/210931#326823
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then

  # specify plugins here
  zgenom load agkozak/polyglot

  #zgenom ohmyzsh

  # theme
  #zgenom ohmyzsh themes/michelebologna

  # generate the init script from plugins above
  zgenom save
fi
