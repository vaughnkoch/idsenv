# Uncomment these only if you install coreutils and follow the install instructions.
# brew install coreutils
# alias ll="ls -N -larht --color"
# alias ls="ls -N --color"

# List only directories
alias lsd="ls -d */"


# 'lsr' - Easy recursive search
# Thank you, http://www.unix.com/unix-advanced-expert-users/69618-shell-programming-aliasing-set-f.html !
# The problem was that making lsr a shell script was causing the parameter to expand globs like *.css, which futzed find.
# Usage - this will find any/all myfile.* files from where you run it.
# lsr myfile.*
alias lsr='set -f; mylsr'
mylsr () {
  find  -L . -iname $@ |fgrep -v ".meteor" | fgrep -v ".git" |fgrep -v "node_modules" |fgrep -v "__pycache__" |fgrep -v ".serverless"
  set +f
}


# Easy utilities to edit config files
alias edalias="code ~/.bash_aliases"
alias edgitconfig="code ~/.gitconfig"
alias edackrc="code ~/.ackrc"
alias edbashrc="code ~/.bashrc"

# Reload these config files after editing
alias reprofile="source ~/.bash_profile"
alias realias="source ~/.bash_aliases"


# Shortcuts
alias py='python'


# Useful tools
alias tree='tree -a -I "node_modules|.git|*.pyc|local"'
alias diff="colordiff --exclude=".svn" --exclude="*.pyc" $*"
alias rmpyc='echo Removed all __pycache__, .pyc, and .pyo files recursively.; find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf;'

# Jupyter
alias jtmonokai='jt -t monokai -cellw 100%'
alias jtgrade3='jt -t grade3 -cellw 100%'
alias jtdefault='jt'


### Open OSX apps from the command line
alias calc="open -a calculator"
alias chrome='open -a "Google Chrome.app"'
alias firefox="open -a firefox"
alias bc='bcompare'  # Opens Beyond Compare, very useful
