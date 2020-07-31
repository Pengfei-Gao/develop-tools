#!/bin/bash

function trim() {
    if [ -z $1 ]; then # $1 is unset
        sed -e 's/^ *//' -e 's/ *$//'
    else
        # echo "=== $1 ==="
        sed -e 's/^ *//' -e 's/ *$//' -e "s/^$1//" -e "s/$1$//"
    fi
}

function add_column {
    local content=""
    for arg in $@; do
        content="$content | $arg"
    done
    echo -e "$content |"
}

function get_timestamp(){
    echo $(date +%s)
}
