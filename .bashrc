#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
grey=$(tput setaf 8)
clear=$(tput sgr0)

identity=`[[ $(id -u) -eq 0 ]] && echo '\[$red\]\u@\h' || echo '\[$green\]\u\[$red\]@\[$blue\]\h'`
PS1="\[$bold\]\[$identity\]\[$clear\]\[$white\]:\w\[$bold\]\n\[$clear\]\[$white\](\A) \$ \[$clear\]"

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias ls='ls --color=always'
alias cdp='cd $OLDPWD'

# History suppression for following lines duplicate
export HISTIGNORE='&'
# Harder history control : remove all duplicate in history
#export HISTCONTROL='erasedups'

export EDITOR=vim
export BROWSER=firefox
export PATH=$PATH:~/bin
