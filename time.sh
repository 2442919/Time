#!/bin/bash
#STAGE I. -Standard Time-
hrs=$(date +%H)                                             #hrs
hrs_cd=`echo "scale=0; 24 - $hrs" | bc`                     #hrs.CountDown
min=$(date +%M)                                             #min
min_cd=`echo "scale=0; 60 - $min" | bc`                     #min.CountDown
sec=$(date +%S)                                             #sec
sec_cd=`echo "scale=0; 60 - $sec" | bc`                     #sec.CountDown
dom=$(date +%d)                                             #day.of.month
dow=$(date +%w)                                             #day.of.week
dow_cd=`echo "scale=0; 7 - $dow" | bc`                      #day.of.week.CountDown
now=$(date +%U)                                             #number.of.week
now_cd=`echo "scale=0; 52 - $now" | bc`                     #numbers.of.week.CountDown
mon=$(date +%m)                                             #number.of.month
mon_cd=`echo "scale=0; 12 - $mon" | bc`                     #number.of.month.CountDown
doy=$(date +%j)                                             #day.of.year
doy_cd=`echo "scale=0; 365 - $doy" | bc`                    #day.of.year.CountDown
noy=$(date +%Y)                                             #number.of.year
