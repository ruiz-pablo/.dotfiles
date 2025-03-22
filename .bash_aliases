############################################################
#                        Aliases                           #
############################################################

# Default folders
alias home='cd ~'
alias desktop='cd ~/Desktop'
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias music='cd ~/Music/'
alias pictures='cd ~/Pictures//'
alias videos='cd ~/Videos'

# fs
alias fs='cd ~/fs'
alias documentos='cd ~/fs/documentos'
alias fp='cd ~/fs/fp'
alias imagenes='cd ~/fs/imagenes'
alias instituto='cd ~/fs/instituto'
alias libros='cd ~/fs/libros'
alias musica='cd ~/fs/musica'
alias proyectos='cd ~/fs/proyectos'
alias torrents='cd ~/fs/torrents'
alias universidad='cd ~/fs/universidad'
alias videos='cd ~/fs/videos'
alias memes='cd ~/fs/videos/memes/'

# Databases
alias sostenibilidad_db='mysqlsh -h 82.223.102.153 -u 1DAMSostenibilidad -p1DAMSostenibilidad1234'
alias sistemas_db='mysqlsh -h 82.223.102.153 -u 2DAM -p2DAM1234 -D 2DAM'
alias programacion_db='mysqlsh -h 192.168.33.214 -u sanjose -pSQL_2710_jsp --database i1i28'

# alias programacion_db=
# 192.168.33.214:90/phpmyadmin
# USuario: sanjose
# Constraseña: SQL_2710_jsp

# Replace rm with trash (if installed)
if [ -x /usr/bin/trash ]
then
    alias rm='trash'
    alias rm_perma='/bin/rm'
else
    echo WARNING: Trash-cli is not installed, the rm command HAS NOT BEEN REPLACED by trash
fi

# ssh
alias localserver='ssh -p 40000 localserver@localserver785.mooo.com'

# Utilities
bell() { echo -e '\a'; }
export -f bell
eye() { eog "$@"; }
export -f eye
alias magick='convert'
alias yt-dlp_best='yt-dlp -f "bv+ba/b"'
alias cow='ls /usr/share/cowsay/cows/ | sort -R | head -1 | xargs cowsay -f'

# Mac-like coping and pasting
pbcopy() { xsel --input --clipboard $@; }
export -f pbcopy
pbpaste() { xsel --output --clipboard $@; }
export -f pbpaste

# Alacritty
alias alacritty='alacritty --working-directory $PWD'

# lf
# Change direcory when lf is exited
lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

alias lf='lfcd'

# Set vi mode
# set -o vi
# bind 'set show-mode-in-prompt on' # Enable status line
# bind 'set keyseq-timeout 100' # When changing modes (form insert to normal) there is a delay, this reduces it
