#!/bin/bash
myrm_help() {
    echo "rm [options] filename"
    echo "options : -r ; -f"
}

#myrm() {
    if [[ $# == 1 ]]; then
        mv $1 ~/trash/
    elif [[ $# == 2 ]]; then 
        if [[ $1 == "-r" ]]; then 
            mv $2 ~/trash/ 
        elif [[ $1 == "-f" ]]; then
            mv -f $2 ~/trash/
        else myrm_help
        fi
    elif [[ $# == 3 ]]; then 
        if [[ $1 == "-r" && $2 == "-f" || $1 == "-f" && $2 == "-r" ]]; then
            mv -f $3 ~/trash/ 
        else myrm_help
        fi
    fi
#}

#alias rm='myrm'
