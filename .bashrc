# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=10000

# Other options
shopt -s histappend   # Append to history command, do not overwrite
shopt -s checkwinsize # Resize terminal after every command
shopt -s globstar     # Enable ** pattern 

# enable color support of ls and also add handy aliases
if [ -x $(command -v dircolors) ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# TODO: Move to aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Replace rm with trash-cli (if avaliable)
if [ -x $(command -v trash) ]
then
    alias rm='trash'
    alias rm_perma='/bin/rm'
else
    echo "WARNING: Trash-cli is not installed and the rm command HAS NOT BEEN REPLACED"
fi

# Set prompt line 
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\\n> "

# Set gnome desktop key repeat rate and delay
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 35;
gsettings set org.gnome.desktop.peripherals.keyboard delay 255;
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30;
gsettings set org.gnome.desktop.peripherals.keyboard delay 250;

# Source .bash_aliases file
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Source .bash_profile file
[ -f ~/.bash_profile ] && source ~/.bash_profile
