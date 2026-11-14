#!/bin/bash
# system-report.sh: report CPU, memory and disk usage

THRESHOLD=${THRESHOLD:-80}

cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed 's/.*, *\([0-9.]*\) id.*/\1/')
cpu_used=$(awk -v idle="$cpu_idle" 'BEGIN {printf "%.1f", 100 - idle}')
mem_used=$(free | awk '/Mem:/ {printf "%.1f", $3/$2*100}')
disk_used=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo "=== System report: $(date) ==="
echo "Host:   $(hostname)"
echo "CPU:    ${cpu_used}%"
echo "Memory: ${mem_used}%"
echo "Disk /: ${disk_used}%"

if [ "$disk_used" -gt "$THRESHOLD" ]; then
    echo "WARNING: disk usage above ${THRESHOLD}%"
fi
