#!/bin/bash
timestamp=`date +%Y/%m/%d-%H:%M:%S`
echo "$timestamp"
rsync -rz -e "ssh -i /config/key" copysync@$remotehost:$remotepath /media
