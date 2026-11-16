#!/bin/bash
# system-report.sh: report CPU, memory and disk usage, email an alert if disk is high

THRESHOLD=${THRESHOLD:-80}
ALERT_EMAIL="you@example.com"
[ -f "$HOME/.system-report.conf" ] && . "$HOME/.system-report.conf"

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
    {
        echo "From: $ALERT_EMAIL"
        echo "To: $ALERT_EMAIL"
        echo "Subject: [ALERT] $(hostname): disk at ${disk_used}%"
        echo
        echo "Disk usage on $(hostname) is ${disk_used}% (threshold ${THRESHOLD}%)."
        echo "CPU: ${cpu_used}%  Memory: ${mem_used}%"
    } | msmtp "$ALERT_EMAIL"
fi
