#!/bin/bash


SCRIPT_PATH=`dirname $0`

TIME=$(date +"%Y-%d-%m %H:%M:%S")

source $SCRIPT_PATH/params.conf

echo $TIME : "Start reset sysvol acls..."
$SAMBASYSVOLRESET
echo $TIME : "Reseting sysvol acls ended."

echo $TIME : "Start sync sysvol on $SERVERNAME..."
$RSYNC_COMMAND $SYSVOLPATH $USERNAME@$SERVERNAME:$SYSVOLPATH
echo $TIME : "Sync sysvol on $SERVERNAME ended."

echo $TIME : "Start reset sysvol acls on $SERVERNAME..."
$SSH_COMMAND $SAMBASYSVOLRESET
echo $TIME : "Reseting sysvol acls ended."
echo $TIME : "End of replication."
