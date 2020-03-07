#!/bin/bash

. ./config.ini


function time_stamp {
	date "+%Y-%m-%d %H:%M:%S"
}

function log {
	echo "[`time_stamp`]$1" >> ./raw_client.log
}

function start_client {
        _wc=`wc -l 'ip_list'`
        ip_count=`echo ${_wc##*( )}|cut -d " " -f1`
        line_no=$((1 + RANDOM % $ip_count))
        r_ip=`sed -n "${line_no}p" ip_list`
        nohup ./${raw_home}/udp2raw_mp_nolibnet -c -r${r_ip}:${r_port} -l0.0.0.0:${l_port} --raw-mode easyfaketcp -k"${passwd}"  1>>./raw_client.log 2>&1 &
        log "[Message] RAW Client connected to ${r_ip}"
}


function server_check {
	loss_rate=`ping -c 10 ${r_ip}|grep '%'|awk '{print $7}'`
	avg_ms=`ping -c 10 ${r_ip}|grep 'min/avg/max/stddev'|awk '{print $4}'|cut -d '/' -f 2`
	[[ $avg_ms = '' ]]&&{
		avg_ms="n/a "
	}
	echo "loss=${loss_rate}, avg=${avg_ms}ms"
}


function main {
	while true 
	do
		pid=`pgrep -f "udp2raw_mp_nolibnet"`
		[[ $pid = "" ]]&&{
			log "[Message] RAW Client not detected, starting..."
			start_client
		}||{
			log "[Message] Status check - Running, ip=${r_ip}, `server_check`, pid=${pid}, ppid=`deamon_pid`"
			sleep 60
		}
	done
}


main
