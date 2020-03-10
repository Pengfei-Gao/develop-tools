#!/bin/bash

M2_PATH=${HOME}/.m2
COMMON_PATH=$(pwd)
LOCAL_JARS=$(find $COMMON_PATH -name  *.jar)

SOURCE_JAR_FLAG="sources"

mvn clean package -U  -Dmaven.test.skip=true

# 部署jar文件
# 将正则匹配到的文件用输入的源文件替换
function deploy_jar(){
    local regx=$1                  # jar 文件名的正则表达式
    local source_file=$2           # 源文件路径
    local jars=$(find $M2_PATH -name $regx)

    for jar in $jars; do
        [[ $jar =~ "$SOURCE_JAR_FLAG" ]] && continue
        local exec="cp $source_file $jar"
        echo $exec
        $exec
    done
}

# 部署 source jar 文件
# 将正则匹配到的文件用输入的源文件替换
function deploy_source_jar(){
    local regx=$1                  # source jar 文件名的正则表达式
    local source_file=$2           # 源文件路径
    local jars=$(find $M2_PATH -name $regx)
    for jar in $jars; do
        [[ ! $jar =~ "$SOURCE_JAR_FLAG" ]] && continue
        local exec="cp $source_file $jar"
        echo $exec
        $exec
    done
}

function local_deploy(){
    for local_jar in $LOCAL_JARS; do
        local jar_name=$(basename $local_jar)
        local jar_prefix=$(echo $jar_name | awk -F "-" '{printf "%s-%s-%s",$1,$2,$3}')
        local jar_regx="$jar_prefix*.jar"
        local jar_source_regx="$jar_prefix*$SOURCE_JAR_FLAG.jar"
        #开始部署 jar 文件
        [[ ! $local_jar =~ "$SOURCE_JAR_FLAG" ]] && deploy_jar "$jar_regx" "$local_jar"
        
        #开始不是 source jar 文件
        [[ $local_jar =~ "$SOURCE_JAR_FLAG" ]] && deploy_source_jar "$jar_source_regx" "$local_jar"
    done
}

local_deploy
