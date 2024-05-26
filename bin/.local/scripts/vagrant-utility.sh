#!/bin/bash
# This script is used to start and stop the Vagrant VMware Utility service.

if [ $# != 1 ]; then
    echo "Usage: vagrant-utility {start|stop}"
    exit 1
fi

if [ $1 == "start" ] ; then
    sudo launchctl load -w /Library/LaunchDaemons/com.vagrant.vagrant-vmware-utility.plist
fi

if [ $1 == "stop" ] ; then
    sudo launchctl unload -w /Library/LaunchDaemons/com.vagrant.vagrant-vmware-utility.plist
fi
