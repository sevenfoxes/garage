#!/bin/sh
### BEGIN INIT INFO
# Provides:         exporter_gpio
# Required-Start:    $remote_fs dbus
# Required-Stop:     $remote_fs dbus
# Should-Start:      $syslog
# Should-Stop:       $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Enable garage GPIO
# Description:       Enable garage GPIO
### END INIT INFO

PATH=/sbin:/bin:/usr/sbin:/usr/bin
DESC="Enable GPIO for the garage Module"
NAME="exporter_gpio"
SCRIPTNAME=/etc/init.d/$NAME

. /lib/lsb/init-functions

case "$1" in
    start)
        log_daemon_msg "Enabling garage GPIO"
        success=0
        if [ ! -e /sys/class/gpio/gpio16 ] ; then
                echo 16 > /sys/class/gpio/export
                success=$?
                echo out > /sys/class/gpio/gpio16/direction
        fi

        if [ ! -e /sys/class/gpio/gpio20 ] ; then
                echo 20 > /sys/class/gpio/export
                success=$?
                echo in > /sys/class/gpio/gpio20/direction
        fi

        if [ ! -e /sys/class/gpio/gpio21 ] ; then
                echo 21 > /sys/class/gpio/export
                success=$?
                echo in > /sys/class/gpio/gpio21/direction
        fi

        log_end_msg $success
        ;;
    *)
        echo "Usage: $SCRIPTNAME {start}" >&2
        exit 1
        ;;
esac

exit 0
