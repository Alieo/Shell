#!/bin/bash
#输入一个路径看它是文件还是目录
read filename
maxlen=0
maxname=0
maxstr=0
maxpath=0

function counts() {  #该函数实现获取字符串长度，比大小
    for i in `cat $1 | tr -s -c "a-zA-Z""\n"`;do  
        #echo "maxlen="$maxlen
        #echo '${#i}='${#i}
        if [ $maxlen -lt ${#i} ];then
            maxlen=${#i}
            maxname=$1
            maxstr=$i
            maxpath=$2
        fi
    done    
}

function cycle() {
    path=$1
    cd $path
    for filename in `ls`;
    do
        if [ -d "$filename" ];then  
            cycle "$path/$filename/" #一直循环执行cd目录这个过程 
        elif [ -f "$filename" ];then  
            counts $filename $path
        fi    
    done   
    cd ../  #如果没有找到文件，则回到上一级
}
path=`pwd`
cycle $path
echo $maxlen
echo $maxname
echo $maxstr
echo $maxpath

