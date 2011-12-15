#!/bin/bash

# http://en.wikipedia.org/wiki/ANSI_escape_code
# http://www.frexx.de/xterm-256-notes/

numColors=`tput colors`

ESC="\033["
__color_fg256="38;5;"
__color_bg256="48;5;"
__color_sblink="5;"
__color_fblink="6;"
__color_bold="1;"
__color_none="0;"

fgColor() {
    color=$1
    echo "\[${ESC}${__color_fg256}${color}m\]"
}

bgColor() {
    color=$1
    echo "\[${ESC}${__color_bg256}${color}m\]"
}

resetColor() {
    echo "\[${ESC}${__color_none}m\]"
}

addColor() {
    string="$1"
    color=$2
    echo -ne "$(fgColor ${color})${string}$(resetColor)"
}






# regular colors
#local K="\[\033[0;30m\]"    # black
#local R="\[\033[0;31m\]"    # red
#local G="\[\033[0;32m\]"    # green
#local Y="\[\033[0;33m\]"    # yellow
#local B="\[\033[0;34m\]"    # blue
#local M="\[\033[0;35m\]"    # magenta
#local C="\[\033[0;36m\]"    # cyan
#local W="\[\033[0;37m\]"    # white
    
# emphasized (bolded) colors
#local EMK="\[\033[1;30m\]"
#local EMR="\[\033[1;31m\]"
#local EMG="\[\033[1;32m\]"
#local EMY="\[\033[1;33m\]"
#local EMB="\[\033[1;34m\]"
#local EMM="\[\033[1;35m\]"
#local EMC="\[\033[1;36m\]"
#local EMW="\[\033[1;37m\]"
    
# background colors
#local BGK="\[\033[40m\]"
#local BGR="\[\033[41m\]"
#local BGG="\[\033[42m\]"
#local BGY="\[\033[43m\]"
#local BGB="\[\033[44m\]"
#local BGM="\[\033[45m\]"
#local BGC="\[\033[46m\]"
#local BGW="\[\033[47m\]"
