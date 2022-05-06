#!/bin/bash
hrs=$(date +%H)                                                                                                                             #hours.
min=$(date +%M)                                                                                                                             #minutes.
sec=$(date +%S)                                                                                                                             #seconds.
nas=$(date +%N)                                                                                                                             #nanoseconds.
dom=$(date +%d)                                                                                                                             #day of month.
dow=$(date +%w)                                                                                                                             #day of week.
won=$(date +%U)                                                                                                                             #no. of week.
won_left=`echo "scale=0; 52 - $won" | bc`                                                                                                   #no. of weeks left.
mon=$(date +%m)                                                                                                                             #no. of month.
mon_left=`echo "scale=0; 12 - $mon" | bc`                                                                                                   #no. of month left.
doy=$(date +%j)                                                                                                                             #day of year.
doy_left=`echo "scale=0; 365 - $doy" | bc`                                                                                                  #days of year, left.
noy=$(date +%Y)                                                                                                                             #no. of year.
dim=`echo "scale=2; $hrs * 60 + $min" | bc`                                                                                                 #day in minutes.
min_pass=`echo "scale=2; 1440 - $dim" | bc`                                                                                                 #min left.
dis=`echo "scale=2; $dim * 60 + $sec" | bc`                                                                                                 #day in seconds.
did=`echo "scale=2; $dis / 240" | bc`                                                                                                       #day in degree.
yim=`echo "scale=2; $doy * 1440 + $dim" | bc`                                                                                               #year in minutes.
yis=`echo "scale=2; $doy * 86400 + $dis" | bc`                                                                                              #year in seconds.
yih=`echo "scale=2; $doy * 24 + $hrs" | bc`                                                                                                 #year in hours.
sec_left=`echo "scale=0; 86400 - $dis" | bc`                                                                                                #seconds left.
#SUMERIAN==================================================================================================================================
diss=`echo "scale=0; $dis / 2" | bc`                                                                                                        #day in sumerian sec.
dism=`echo "scale=0; $diss / 60" | bc`                                                                                                      #day in sumerian sec.
dish=`echo "scale=0; $dism / 60" | bc`                                                                                                      #day in sumerian hrs.
sm=`echo "scale=0; $dism - $dish * 60" | bc`                                                                                                #sumerian min.
ss=`echo "scale=0; $diss - $dism * 60" | bc`                                                                                                #sumerian sec.
sn=`echo "scale=0; $nas /2" | bc`                                                                                                           #sumerian nano.
#==========================================================================================================================================
orbit=`echo "scale=0; 0.985626283368 * $doy" | bc`                                                                                          #planet position.
km_sec=`echo "scale=1; $dis * 0.463831018519 " |bc`                                                                                         #planet rev. in km/s
kmsec=`echo "scale=2; 40075 - $km_sec " | bc`                                                                                               #km left. 
hrs_left=`echo "scale=0; 24 - $hrs" | bc`                                                                                                   #hrs left.
min_left=`echo "scale=0; 1440 - $dim" | bc`                                                                                                 #min left.
#==========================================================================================================================================
rad=`echo "scale=2; $did * 0.0174532925" | bc`                                                                                              #day in radians.
#==========================================================================================================================================
age_years=`echo " $noy - 1976" | bc`                                                                                                        #my age in years .
age_hrs=`echo " 8766 * $age_years + $doy * 24 - 140 * 24 - 2" | bc`                                                                             #my age in hours.
age_days=`echo " $age_hrs / 24" | bc`                                                                                                       #my age in days.
age_minutes=`echo " $age_hrs * 60 + $min - 120" | bc`                                                                                             #my age in minutes.
age_seconds=`echo " $age_minutes * 60 + $sec + 20" | bc`                                                                                         #my age in seconds.
age_deg=`echo " $age_seconds / 240 + $did" | bc`                                                                                            #my age in degree.
age_rad=`echo "scale=2; $age_deg / 57.2957795" | bc`                                                                                        #my age in radians.
#==========================================================================================================================================
date_in_degree=`echo "scale=2; $noy * 131490 + $did" | bc`                                                                                  #date in degree.
date_in_hrs=`echo "scale=2; $noy * 8766 + $yih" | bc`                                                                                       #date in hrs.
date_in_min=`echo "scale=2; $date_in_hrs * 60 + $min" | bc`                                                                                 #date in min.
date_in_sec=`echo "scale=2; $date_in_min * 60 + $sec" | bc`                                                                                 #date in sec.
#==========================================================================================================================================
year_in_degree=`echo "scale=2; $doy * 360 + $did" | bc`                                                                                     #year in degree.
rad_days_of_years=`echo "scale=2; 6.2831853 * $doy + $rad" | bc`                                                                            #year in radians.
rad_years=`echo "scale=2; $noy * 2294.93343082 + $rad_days_of_years" | bc`                                                                  #date in radians.
########################################################################################################################################### 
header="\n%21s%21s%20s%20s\t\t\t%22s%30s"                                                                                                   #
format="\n%-21s%20s%20s%20s\t\t\t%20s%30s"                                                                                                  #
###########################################################################################################################################
printf "\n"                                                                                                                                 #new line.
printf "$header" "D$doy/T$hrs:$min:$sec/R$did°" "[ HOURS.hrs ]" "[ MINUTES.min ]" "[ SECONDS.sec ]" "[ DEGREES.deg ]" "[ RADIANS.rad ]"                                 #
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                    °                                                             #new line.
printf "$format" " [ DAY  IN : ]" "$hrs.hrs" "$dim.min" "$dis.sec" "$did°.deg" "$rad.rad"                                                    #
printf "\n"                                                                                                                                 #new line.
printf "$format" " [ YEAR IN : ]" "$yih.hrs" "$yim.min" "$yis.sec" "$year_in_degree°.deg" "$rad_days_of_years.rad"                           #
printf "\n"                                                                                                                                 #new line.
printf "$format" " [ 0BC. IN : ]" "$date_in_hrs.hrs" "$date_in_min.min" "$date_in_sec.sec" "$date_in_degree°.deg" "$rad_years.rad"           #
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                                                                                 #new line.
printf "$header" "Y$age_years/D$age_days/T$age_hrs:$min" "[ YEARS.yrs ]" "[ DAYS.dys ]" "[ HOURS.hrs ]" "[ MINUTES.min ]" "[ DEGREE.deg ]"
printf "\n"                                                                                                                                 #new line.
printf "$format" " [ LIFE IN : ]" "$age_years.yrs" "$age_days.dys" "$age_hrs.hrs" "$age_minutes.min" "$age_deg°.deg"                        #
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                                                                                 #new line.
printf "\n"                                                                                                                                 #new line.
echo " [ Position on Orbit: ] $orbit°"
###########################################################################################################################################
