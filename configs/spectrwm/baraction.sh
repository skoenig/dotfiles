#!/bin/bash
# baraction.sh for scrotwm status bar

BAT_PATH=/sys/class/power_supply/BAT0

while true
do
    eval $(sensors 2>/dev/null | sed s/[°+]//g | awk '/^CPU Temperature/ {printf "CORETEMP=%s;", $3}; /^MB/ {printf "MBTEMP=%s;",$3}; /^CPU Fan Speed/ {printf "FANSPD=%s;",$4};' -)
    TEMP_STR="CT: $CORETEMP MT: $MBTEMP FS: $FANSPD"
    FREQ_STR="FQ: $( grep 'cpu MHz' /proc/cpuinfo | sed 's/.*: //g; s/\..*//g;' | tr '\n' ' ')"
    LOAD_STR="LD:$(uptime | awk -F':' '{print $NF}' | sed 's/,//g')"
    UPTIME_STR="UP:$(uptime | sed 's/.*up//' | awk -F ',' '{print $1 $2}' )"
    eval $(awk '/^MemTotal/ {printf "MTOT=%s;", $2}; /^MemFree/ {printf "MFREE=%s;",$2}' /proc/meminfo)
    MUSED=$(( $MTOT - $MFREE ))
    MUSEDPT=$(( ($MUSED * 100) / $MTOT ))
    MEM_STR="M: ${MUSEDPT}%"
    BAT_NOW=$(cat $BAT_PATH/energy_now)
    BAT_FULL=$(cat $BAT_PATH/energy_full)
    BAT=$(( ($BAT_NOW * 100) / $BAT_FULL ))
    BAT_STATUS=$(cat $BAT_PATH/status)

    echo -e ":: $TEMP_STR | $FREQ_STR | $LOAD_STR | $UPTIME_STR | $MEM_STR | $BAT% $BAT_STATUS ::"

    sleep 5
done

