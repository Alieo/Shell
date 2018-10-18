#!/bin/bash
year=$1
keep=$2
ans=0
if [[ $keep -ge 0 ]];then
    for i in `seq 1 $keep`;do
        ((year=${year}+${i}-1))
        if [[ $year%4 -eq 0 && $year%100 -ne 0 || $year%400 -eq 0 ]];then
            (( day=366 ))
        else 
            (( day=365 ))
        fi
        ((ans = ans + day))
    done
fi
echo $ans
