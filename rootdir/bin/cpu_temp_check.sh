#!/bin/bash

# j7
echo 1 > /sys/class/power_supply/battery/input_suspend;
sleep 3;
rm /sdcard/cpu_temp.txt
echo "hello" > /sys/power/wake_lock;
stop /vendor/bin/mi_thermald;
echo -n "time(s)" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "battery" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "online" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "cpu0_cur_freq" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "cpu0_max_freq" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "cpu4_cur_freq" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "cpu4_max_freq" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "battery_current_now" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "battery_voltage_now" >> /sdcard/cpu_temp.txt;



for i in `ls /sys/class/thermal/ | grep thermal_z`;
do
	if [ `cat /sys/class/thermal/${i}/type` = "mtktsbattery" ] ; then
		export battery="/sys/class/thermal/${i}/temp"
	elif [ `cat /sys/class/thermal/${i}/type` = "mtktsAP" ] ; then
		export AP="/sys/class/thermal/${i}/temp"
	elif [ `cat /sys/class/thermal/${i}/type` = "mtktsbtsmdpa" ] ; then
		export pa="/sys/class/thermal/${i}/temp"
	elif [ `cat /sys/class/thermal/${i}/type` = "mtktscpu" ] ; then
		export cpu="/sys/class/thermal/${i}/temp"
	fi
done

echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "mtktsbattery" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "mtktsAP" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "mtktsbtsmdpa" >> /sdcard/cpu_temp.txt;
echo -n "," >> /sdcard/cpu_temp.txt;
echo -n "mtktscpu" >> /sdcard/cpu_temp.txt;
echo >> /sdcard/cpu_temp.txt;
starttime=`date +%s`

echo cpu4 1548000 > /sys/class/thermal/thermal_message/cpu_limits;
echo cpu0 1500000 > /sys/class/thermal/thermal_message/cpu_limits;
j=1;
while [ j -le 8 ]
do
        while true; do done &
        j=$j+1;
done
i=1;
while [ i -lt 120 ]
do
	nowtime=`date +%s`
	temp=`expr $nowtime - $starttime`
	echo -n $temp >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/class/power_supply/battery/capacity` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/devices/system/cpu/online` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/class/power_supply/battery/current_now` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat /sys/class/power_supply/battery/voltage_now` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat $battery` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat $AP` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat $pa` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	echo -n `cat $cpu` >> /sdcard/cpu_temp.txt;
	echo -n "," >> /sdcard/cpu_temp.txt;
	i=$i+2;
	sleep 2;
done
