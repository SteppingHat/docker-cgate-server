#!/bin/sh
#
# Simple wrapper script for C-Gate on Linux machines.
# - It discovers the serial ports and passes them to the JVM.
# - The loop is designed to support a server restart (result code 126).
#

RESTART=126
while [ $RESTART -eq 126 ]
do
	DEVICE_LIST=`ls -1 /dev/tty* | grep USB | paste -sd ":"`
	java -Djava.library.path=. -DSERIAL_PORT_LIST=$DEVICE_LIST -jar cgate.jar
	RESTART=$?
done

