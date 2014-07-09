# Add `~/bin` to the `$PATH`

export GOPATH=/Users/Abhi/Go
PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/bin:$PATH"

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# Autocomplete Grunt commands
which grunt > /dev/null && eval "$(grunt --completion=bash)"

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

##
# Your previous /Users/Abhi/.bash_profile file was backed up as /Users/Abhi/.bash_profile.macports-saved_2013-06-06_at_03:59:05
##

# MacPorts Installer addition on 2013-06-06_at_03:59:05: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

function gi() { curl http://gitignore.io/api/$@ ;}
export PATH=~/pebble-dev/PebbleSDK-2.0-BETA1/bin:$PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Enables Canopy to be used in the environment. This is good if you want to use things like opencv
# VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/Abhi/Library/Enthought/Canopy_64bit/User/bin/activate

[ -s "/Users/Abhi/.nvm/nvm.sh" ] && . "/Users/Abhi/.nvm/nvm.sh" # This loads nvm

NODE_PATH='/usr/local/lib/node_modules'
