# user specific aliases
if [ -f ~/.bash_user_aliases ]; then
    . ~/.bash_user_aliases
fi


alias efs='emacs -fs -g 158x49 '
alias e='emacs -g 158x44 '
alias i='sudo apt-get install '
alias s='apt-cache search '
alias show='apt-cache show '
alias upg='sudo apt-get upgrade'
alias burncd='cdrecord -v -dev=/dev/hda speed=8 '
alias blankcd='cdrecord -v -dev=/dev/hda blank=fast '
alias jpegoptim='jpegoptim --strip-all '     # optimize JPEG files for web
alias pngcrush='pngcrush -rem alla -reduce -brute ' # optimize PNG files for web
alias ll='ls -l'	
alias la='ls -a'
alias ls='ls -hF --color=auto'
alias df='df -h'
alias du='du -h'
alias dus='du -sh * | sort -rn | head'
alias ..='cd ..'
alias ...='cd ../..'
alias d='ls -d */'
alias lld='ls -l | grep ^d'
alias rb='rm *~'	# remove emacs backup files
alias grep='grep --color=auto'
alias untar='tar zxfv'
alias totar='tar zcfv'
alias his='history | grep ' # search history
alias cl='clear;ls'
alias fromdos="tr -d '\r' "  # usage: fromdos < file.dos > file.unix
alias todos="awk 'sub(\"$\",\"\r\")' "  # todos file.unix > file.dos
alias scrdump="import -window root"	# screendump
