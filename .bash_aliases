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
alias fp2='cd ~/fs/fp2'
alias imagenes='cd ~/fs/imagenes'
alias instituto='cd ~/fs/instituto'
alias libros='cd ~/fs/libros'
alias musica='cd ~/fs/musica'
alias proyectos='cd ~/fs/proyectos'
alias torrents='cd ~/fs/torrents'
alias universidad='cd ~/fs/universidad'
alias videos='cd ~/fs/videos'
alias memes='cd ~/fs/videos/memes/'
alias horario='open ~/fs/fp2/horario.png'

# ssh
alias localserver='ssh -p 40000 localserver@localserver785.mooo.com'

# Databases
# TODO: Move this to better place
alias sostenibilidad_db='mysqlsh -h 82.223.102.153 -u 1DAMSostenibilidad -p1DAMSostenibilidad1234'
alias sistemas_db='mysqlsh -h 82.223.102.153 -u 2DAM -p2DAM1234 -D 2DAM'
alias programacion_db='mysqlsh -h 192.168.33.214 -u sanjose -pSQL_2710_jsp --database i1i28'

# Programs
alias yt-dlp_best='yt-dlp -f "bv+ba/b"'
alias flatpak-run='flatpak list --app --columns=application | fzf | (xargs flatpak run &> /dev/null &)'
alias magick='convert'
alias c='clear'
alias lf='lfcd'
alias eye='eog_alias'
alias fzf='fzf_alias'
alias open='xdg-open'

# Functions
lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

eog_alias () {
    eog "$@"
}

fzf_alias() {
    command fzf --cycle --border=rounded --margin=20% "$@"
}

# Export functions
export -f fzf_alias
