# Insight Data Science Tech Talk

This is a repo to help IDS Seattle Fellows set up their development environment.

### Goals
- Set up your dev environment
- Learn how to use brew, git, python
- Go through common use cases that will save you time and frustration
- Have fun!


## Chapter 1: Install All The Things

Talk: What tools should I install and what do they do?

### Install Homebrew

Go to https://brew.sh/ and follow the instructions to install it.
It will ask you to allow installing XCode Command Line Tools (official tools from Apple).

If you can't get xcode command line tools installed, try this:

```
xcode-select --install
```

Now that you have brew installed, you can use it to install all kinds of useful command line tools.  Here's a list of the most popular packages: https://formulae.brew.sh/analytics/install/365d/


### Install core tools

```
brew install python git bash-completion
```


### Install VSCode and Beyond Compare

- Visual Studio Code: https://code.visualstudio.com/ - Amazing free editor. The best.
- Beyond Compare: https://www.scootersoftware.com/download.php $30, but totally worth it.


In VSCode: At a minimum, install the official VSCode Python extension by clicking the square-with-big-border icon on the left and searching for Python.

In Beyond Compare menu: Beyond Compare -> Install Command Line Tools.


### Optional

Very useful tools:

```
brew install httpie ack tree fortune cowsay figlet lolcat

# Try out a few:
ack some-string-here   # Better than grep
http google.com   # Easier curl
fortune | cowsay | lolcat
fortune | figlet | lolcat
```

### If you're on Windows

Honestly, data science and open source engineering is WAY easier on a Mac. However, you should install Python from python.org, and install git from https://git-scm.com/download/win.


## Chapter 2: Python

Talk: What is a virtualenv and why should I use one?

### Check Python version and install virtualenv

```
python --version  # This should be 3.x, preferably 3.7
which pip  # This should point to the Python3 install, not Python2
pip install ipython ipdb
pip install virtualenv virtualenvwrapper

# Create the virtualenv - you should do this for every project.
mkvirtualenv myproject
```

### Working with virtualenv

Your virtualenv is a silo that holds all your python packages. You have to activate it with `workon your_env_here` before running your Python code. It helps you eliminate version conflicts between projects.

```
workon your_env_here  # Enter the env
deactivate  # Exit the env - rarely needed though
cdsitepackages  # Go to the directory containing your installed packages. Note: no space
cdproject  # Go to your source root folder where you created the venv. Note: no space
```

### Optional: Jupyter, NBExtensions & Theming

```
# Install core Jupyter and extensions
pip install jupyter jupyter-contrib-nbextensions jupyter_nbextensions_configurator

# Install libraries you're gonna need
pip install numpy scipy pandas

# Install other useful packages
pip install pygments colorama

# https://github.com/dunovank/jupyter-themes
pip install jupyterthemes==0.19.4
jt -t monokai  # Switch Jupyter to dark mode
jt  # Reset Jupyter themes
```

## Chapter 3: Git and Github

Git was incredibly painful for me to learn. I didn't have a good understanding of how it was structured, and the basic tools were arcane and hard to use as-is.
I'm going to give you solutions to both of those things.

Talk:

  - What is Git and why should I use it?
  - Git commits DAG
  - What is a branch?
  - Local branches vs remote branches
  - Files in Git: Working copy, index, commits
  - Switching between branches/commits and what happens to your files


Create your github account, if you don't have one already:

https://github.com/join


### Create and add ssh keys to github
This is so you can upload via ssh.

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

```
# Create ssh key - use a passphrase instead of bare
# You can add the passphrase to MacOS so you don't have to re-enter it.
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
cat ~/.ssh/id_rsa.pub | pbcopy   # This will copy your public key into your OS copy/paste buffer.
```


Then follow the instructions here to add it to your github account:

https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/



### Clone the IDSEnv repo (this repo)

New git command: `git clone`

```
# Get the IDSEnv repo
mkdir ~/src
cd ~/src

# Get the idsenv repo and put it in ~/src/idsenv
# If this fails, you need to fix your .ssh key setup.
git clone git@github.com:vaughnkoch/idsenv.git
```



### Create your own dotfiles repo.

Talk: What are dotfiles and why should I use them?

New git commands:

```
git add <file>     # Add a file
git add <dir>      # Add a whole directory
git add -p         # Selectively add parts of a file
git commit -m "Some message"    # Commit your code
git push origin master   # Push your changes to Github
```

On Github, at the top right, there's a + icon. Click that and choose 'New repository'. Use 'dotfiles' as the name. Make it private. Don't add a readme or anything else. Click 'Create Repository'.

When that's done, we're going to create the dotfiles repo locally and push it to github. In Terminal:

```
# Create a directory for your repo
mkdir ~/src/dotfiles
cd ~/src/dotfiles

# Create the repo, add a file, and push it to Github.
# Remember to replace 'YOUR_USERNAME_HERE' with your Github username!

# Initialize Git and create a file
git init
echo "This is MY readme." > readme.md

# Add the file to Git
git add readme.md
git commit -m "Added readme"

# Add Github as the origin and push your code
git remote add origin git@github.com:YOUR_USERNAME_HERE/dotfiles.git
git push -u origin master
```

You just created and pushed the first file of your repo. Now we're going to add your dotfiles and push those too.

```
# Copy some useful files over and add them to your repo
cp ~/env/idsenv/.*  .  # Get all dotfiles, e.g. ".gitconfig" and copy them here.

# Add all the files, commit them, and push to Github.
git add .
git commit -m "Added some files"
git push -u origin master
```

Now refresh your browser in the repo you created. You should see the new dotfiles you added.


### Activate your dotfiles with symlinks

In order to use your dotfiles, we have to add them to your home directory.
But, we want to do that so any changes to your dotfiles repo is autosaved to those files. We do that with symlinks.

```
# Create symlinks from your repo to your home directory
# This activates these config files
# If you already have these files, these commands won't overwrite them. You should then do a manual merge by editing them.

# Bash
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.bashrc ~/.bashrc

# Git
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore
```


### Change the name and email in your .gitconfig


New git commands:

```
git config --global user.name YOUR_NAME_HERE
git config --global user.email YOUR_EMAIL_HERE
```

### Git tools to make your life easier

Talk and try-it-yourself:

- Look at the log of changes - git lg, git lgall
- See what branches/remotes you have - git brall, git remote -vv
- Checking out a commit temporarily - git co <commit>


New git commands, mostly from your new .gitconfig:

```
git st             # See what you've changed - better version of git status
git lg             # Power tool to see your git log
git lgall          # Power tool to see your git log - but with all branches
git diff / diffc   # See changes in Terminal
git dt / dtc       # Use a GUI to see changes
git co             # Shorter version of git checkout
git brall          # See all the branches you have
git remote -vv     # See what remotes you have
```

### Other Git scenarios

Talk and try-it-yourself:

- What's the difference between origin, master, and origin/master?
- Checking out a branch - git co <branch>
- Checking out a commit temporarily - git co <commit>
- Working with the Git index - git reset, git add
- Working with git stash
- Working with git rebase
- Getting someone else's changes
- Resolving conflicts
- Diffing your changes (or someone else's)
- .gitignore files

New git commands:

```
# Working with branches
git br newreadme
git co <branch>    # Checkout a branch to work on it
git co <commit>    # Checkout a commit to test it
git reset          # Remove files from the index
git reset --hard   # Wipe your changes and/or point to a new commit


# Getting other peoples' changes
git fetch          # Get all remote changes, but don't mess with your branches.
git pr             # Get clean updates that other people pushed


# Stash
git stash          # Temporarily save what you're working on
git stash pop      # Get back the things you stashed
git stash list     # Show all your stashes
git stash show stash@{0} -p  # Show a specific stash

# Rebasing
git rebase -i      # Reshape your commits before you push then
```


### What's next?

The free online book Pro Git (https://git-scm.com/book/en/v2) is a really great way to understand Git fundamentals.