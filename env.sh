#!/bin/sh
PLATFORM_DETECTED=`uname -m`
export PATH=$PATH:/usr/local/epics/base/bin/linux-$PLATFORM_DETECTED
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/epics/base/lib/linux-$PLATFORM_DETECTED
