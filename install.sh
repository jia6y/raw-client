#!/bin/bash

echo "[Message] Expanding package..."
unzip mp.zip 1>/dev/null
cd udp2raw-multiplatform-mp

os=`uname`

echo "[Message] OS=${os}"
echo "[Message] Compiling..."

case $os in
	"Linux")
		make linux_nolibnet
		;;
	"Darwin")
		make mac_nolibnet
		;;
	"Freebsd")
		make freebsd_nolibnet
		;;
	"[Cc]ygwin")
		make cygwin
		;;
	"[Mm]ingw")
		make mingw
		;;
	*)
		echo "[WARN] Unsupported OS: [$os]"
		echo "[ERROR] Installation Failed."
		exit 1

esac

[[ $? = 0 ]]&&{
	echo "[Message] Completed Successfully."
	echo "[Message] To start RAW Cleint please use: ./raw -s"
	echo "[Message] To check RAW Client please use: ./raw -l"
}||{
	echo "[ERROR] Installation Failed."
}
