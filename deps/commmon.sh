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

function csrf_new(){
    local device_id=$1   # 设备id、
    local time=$2        # 时间戳
    local hash_str="$device_id&$time"
    local result=0;
    for i in $(seq ${#hash_str}); do
        local char=${hash_str:$((i-1)):1} 
        local ascii=$(printf "%d" "'$char")
        result=$[($result * 131 + $ascii)  % 65536]
    done
    echo -e "$time\t$result"
}
