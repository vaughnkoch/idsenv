###
### Path
###

# Python3, Brew executables and other user-added software
# PATH="/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:${PATH}"

# Visual Studio Code
# This lets you run 'code' from anywhere in Terminal
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Anaconda - if you have it installed
# export PATH="$PATH:/usr/local/anaconda3/bin"

# Make it so..
export PATH


###
### Make Bash, Git Easier
###

# Bash aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi


# Git autocompletion
# If this breaks, use 'brew --prefix git' to get the new base path, and put it in here.
source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash


# Programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  source /etc/bash_completion
fi

# Menu completion with <tab><tab>
bind '"\t":menu-complete'

# Case insensitive filenames for globbing.
# example: ls A* will show a* files as well.
shopt -s nocaseglob

# Allow ** in globs for recursive globbing
shopt -s globstar

# Case insensitive filenames for tab completion.
bind 'set completion-ignore-case on'

# Custom PS1
# Will change your prompt from $ to something like:
# This is super helpful to know what virtualenv you're in, what git branch you're on,
# and what directory you're in.
# sarah (myvenv) git:master ~/src/myproject $
source ~/dotfiles/ps1.bash


###
### Python
###

# Default breakpoint() call
export PYTHONBREAKPOINT='ipdb.set_trace'


### Switches based on local environment.
export VIRTUALENVWRAPPER_LOCATION=/usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/Envs

# Virtualenvwrapper, if it exists
if [ -f $VIRTUALENVWRAPPER_LOCATION ]; then
  # Note: this command is pretty slow, 0.5s.
  source $VIRTUALENVWRAPPER_LOCATION
fi

