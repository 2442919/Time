#!/bin/bash
#STAGE I - STANDARD TIME -
hrs=$(date +%H) #Hours
hrs_cd=`echo "scale=0; 24 - $hrs" | bc` #Hours.CountDown
min=$(date +%M) #Minutes
min_cd=`echo "scale=0; 60 - $min" | bc` #Minutes.CountDown
sec=$(date +%S) #Seconds
sec_cd=`echo "scale=0; 60 - $sec" | bc` #Seconds.CountDown
dom=$(date +%d) #DayOfMonth
dow=$(date +%w) #DayOfWeek
dow_cd=`echo "scale=0; 7 - $dow" | bc` #DayOfWeek.CountDown
now=$(date +%U) #NumberOfWeek
now_cd=`echo "scale=0; 52 - $now" | bc` #NumberOfWeek.CountDown
mon=$(date +%m) #NumberOfMonth
mon_cd=`echo "scale=0; 12 - $mon" | bc` #NumberOfMonth.CountDown
doy=$(date +%j) #DayOfYear
doy_cd=`echo "scale=0; 365 - $doy" | bc` #DayOfYear.CountDown
noy=$(date +%Y) #NumberOfYear
dim=`echo "scale=0; $hrs * 60 + $min" | bc` #DayInMinutes
dim_cd=`echo "scale=0; 1440 - $dim" | bc` #DayInMinutes.CountDown
dis=`echo "scale=0; $dim * 60 + $sec" | bc` #DayInSeconds
dis_cd=`echo "scale=0; 86400 - $dis" | bc` #DayInSeconds.CountDown
yih=`echo "scale=0; $doy * 24 + $hrs" | bc` #YearInHours
yih_cd=`echo "scale=0; 8766 - $yih" | bc` #YearInHours.CountDown
yim=`echo "scale=0; $doy * 1440 + $dim" | bc` #YearInMinutes
yim_cd=`echo "scale=0; 525960 - $yim" | bc` #YearInMinutes.Countdown
yis=`echo "scale=0; $doy * 86400 + $dis" | bc` #YearInSeconds
yis_cd=`echo "scale=0; 31557600 - $yis" | bc` #YearInSeconds.CountDown
#Stage II - TIME IN DEGREE -
did=`echo "scale=2; $dis / 240" | bc` #DayInDegree
did_cd=`echo "scale=2; 360 - $did" |bc` #DayInDegree.CountDown
hid=`echo "scale=2; $min / 4" | bc` #HourInDegree
hid_cd=`echo "scale=2; 15 - $hid" | bc` #HoursInDegree.CountDown
#Stage III - SUMERIAN TIME SYSTEM -
diss=`echo "scale=0; $dis / 2" | bc` #DayInSumerianSeconds
diss_cd=`echo "scale=0; 43200 - $diss" | bc` #DayInSumerianSeconds.CountDown
dism=`echo "scale=0; $dim / 2" | bc` #DayInSumerianMinutes
dism_cd=`echo "scale=0; 720 -$dism" | bc` #DayInSumerianMinutes.CountDown
sh=`echo "scale=0; $hrs / 2" | bc` #DayInSumerianHours
sh_cd=`echo "scale=0; 12 - $sh" |bc` #DayInSumerianHours.CountDown
sm=`echo "scale=0; $dism - $sh * 60" | bc` #SumerianMinutes
sm_cd=`echo "scale=0; 60 - $sm" | bc` #SumerianMinutes.CountDown
ss=`echo "scale=0; $diss - $dism * 60" | bc` #SumerianSeconds
ss_cd=`echo "scale=0; 60 - $ss" | bc` #SumerianSeconds.CountDown
syih=`echo "scale=0; $doy * 12 + $sh" | bc` #SumerianYearInHours
syih_cd=`echo "scale=0; 4383 - $syih" | bc` #SumerianYearInHours.CountDown
syim=`echo "scale=0; $doy * 720 + $dism" | bc` #SumerianYearInMinutes
syim_cd=`echo "scale=0; 262980 - $syim" | bc` #SumerianYearInMinutes.CowntDown
syis=`echo "scale=0; $doy * 43200 + $diss" | bc` #SumerianYearInSeconds
syis_cd=`echo "scale=0; 15778800 - $syis" | bc` #SumerianYearInSeconds.CountDown
#Stage IV - SUMERIAN TIME IN DEGREE -
revolution=`echo "scale=2; $diss / 120" | bc` #DayInDegree.MidNight00:00:00AsStartPoint
revolution_cd=`echo "scale=2; 360 - $revolution" | bc` #Revolution.CountDown
syid=`echo "scale=2; $syis / 120" | bc` #SumerianYearInDegree
syid_cd=`echo "scale=2; 131490 - $syid" | bc` #SumerianYearInDegree.CountDown
smon=`echo "scale=2; $syid / 10800" | bc` #SumerianYearInMonths.360hrsCicles.30degreesX12timesX30days=360hrsCicle
smon_cd=`echo "scale=2; 12 - $smon" | bc` #SumerianYearInMonths.CountDown
shid=`echo "scale=0; $sm / 2" | bc` #SumerianHourInDegree
shid_cd=`echo "scale=0; 30 - $shid" | bc` #SumerianHourInDegree.CountDown
#Stage V - OUTPUT -
Time="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$Time" "24hFORMAT" ":" "+$hrs:$min:$sec" ":" "-$hrs_cd:$min_cd:$sec_cd" "12hFORMAT" ":" "+$sh:$sm:$ss" ":" "-$sh_cd:$sm_cd:$ss_cd"
DayInHours="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$DayInHours" "DayInHours" ":" "+$hrs" ":" "-$hrs_cd" "DayInSumerianHours" ":" "+$sh" ":" "-$sh_cd"
DayInMinutes="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$DayInMinutes" "DayInMinutes" ":" "+$dim" ":" "-$dim_cd" "DayInSumerianMinutes" ":" "+$dism" ":" "-$dism_cd"
DayInSeconds="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$DayInSeconds" "DayInSeconds" ":" "+$dis" ":" "-$dis_cd" "DayInSumerianSeconds" ":" "+$diss" ":" "-$diss_cd"
YearInDays="\n%20s%2s%10s%2s%10s"
printf "$YearInDays" "YearInDays" ":" "+$doy" ":" "-$doy_cd"
YearInHours="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$YearInHours" "YearInHours" ":" "+$yih" ":" "-$yih_cd" "SumerianYearInHours" ":" "+$syih" ":" "-$syih_cd"
YearInMinutes="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$YearInMinutes" "YearInMinutes" ":" "+$yim" ":" "-$yim_cd" "SumerianYearInMinutes" ":" "+$syim" ":" "-$syim_cd"
YearInSeconds="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$YearInSeconds" "YearInSeconds" ":" "+$yis" ":" "-$yis_cd" "SumerianYearInSeconds" ":" "+$syis" ":" "-$syis_cd"
DayInDegree="\n%20s%2s%10s%2s%10s"
printf "$DayInDegree" "DayInDegree" ":" "+$did" ":" "-$did_cd"
HourInDegree="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$HourInDegree" "HourInDegree" ":" "+$hid" ":" "-$hid_cd" "SumerianHourInDegree" ":" "+$shid" ":" "-$shid_cd"
