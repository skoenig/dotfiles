#!/bin/bash
#baraction.sh for spectrwm status bar

SLEEP_SEC=5

BATTERY_PATH=/sys/devices/platform/smapi/BAT0
FAN_PATH=/sys/devices/platform/thinkpad_hwmon/fan1_input
TEMP_PATH=/sys/devices/virtual/hwmon/hwmon0/temp1_input

while :; do

	BAT_STATE=`cat $BATTERY_PATH/state`
	BAT_REMAINING_PERCENT=`cat $BATTERY_PATH/remaining_percent`
	BAT_POWER_AVG=`cat $BATTERY_PATH/power_avg`
	BAT_REMAINING_RUNNING_TIME=`cat $BATTERY_PATH/remaining_running_time`

	# Value doesn't make any sense to me, can't be minutes, can't be seconds either
	#BAT_REMAINING_CHARGING_TIME=`cat $BATTERY_PATH/remaining_charging_time`
	
	case $BAT_STATE in
		idle)
		POWER_STR="Charged $BAT_REMAINING_PERCENT%"
		;;
		charging)
		case $BAT_REMAINING_CHARGING_TIME in
			not_charging)
			POWER_STR="Charging $BAT_REMAINING_PERCENT%"
			;;
			*)
			#POWER_STR="Charging $BAT_REMAINING_PERCENT% $BAT_REMAINING_CHARGING_TIME"
			POWER_STR="Charging $BAT_REMAINING_PERCENT%"
			;;
		esac
		;;
		discharging)
		WATTS=`echo "(-1)*$BAT_POWER_AVG/1000" | bc`
		case $BAT_REMAINING_RUNNING_TIME in
			not_discharging)
			POWER_STR="Discharging $BAT_REMAINING_PERCENT% ${WATTS}W"
			;;
			*)
			POWER_STR="Discharging $BAT_REMAINING_PERCENT% ${WATTS}W ${BAT_REMAINING_RUNNING_TIME}min"
			;;
		esac
		;;
		*)
		POWER_STR=$BAT_STATE
		;;
	esac

	FAN_SPEED=`cat $FAN_PATH`
	FAN_STR="${FAN_SPEED}RPM"

	TEMPIN=`cat $TEMP_PATH`
	TEMP=`echo "$TEMPIN/1000" | bc`
	TEMP_STR="${TEMP}C"

	CPULOAD_STR="$(uptime | sed 's/.*://; s/,//g')"

	MPD_STR=`mpc current`

	echo -e "$POWER_STR   $TEMP_STR $FAN_STR   $CPULOAD_STR      $MPD_STR"

	sleep $SLEEP_SEC
done
