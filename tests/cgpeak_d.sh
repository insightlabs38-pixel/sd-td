#!/bin/bash
# Peak memory charged to a fresh cgroup-v1 memory group, which is what the board reports as M.
# usage: SD_DATA=... SD_OUT=... tests/cgpeak_d.sh BIN
g=/sys/fs/cgroup/memory/sdtest
rmdir $g 2>/dev/null; mkdir -p $g || exit 1
( echo $BASHPID > $g/cgroup.procs; exec "$@" ) && echo "peak=$(cat $g/memory.max_usage_in_bytes)"
