#!/bin/bash
Time_now=`date +"%Y-%m-%d_%H:%M:%S"`
total=`free -m | tr -s -c "0-9" " " | awk '{printf $1}'` #获取总量
used=`free -m | tr -s -c "0-9" " " | awk '{printf $2}'` #获取使用量
(( last = $total - $used )) #总量 - 使用量 = 剩余量
(( Occupy_now = $used * 100 / $total )) #使用量 / 总量 = 当前占用量
Dynamic_average=`echo | awk -v a=$1 -v b=$Occupy_now '{printf a * 0.3 + 0.7 * b}'` # 平均值
echo -e "$Time_now\t${total}M\t${last}M\t$Occupy_now%\t$Dynamic_average%"
