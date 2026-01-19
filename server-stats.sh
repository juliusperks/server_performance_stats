#!/bin/bash

echo "Server Performance Stats"
echo ""

echo "CPU Usage"
top -bn1 |grep "Cpu(s)"
echo ""

echo "Memory Usage"
free -m | awk '/^Mem:/ {printf "Used: %dMB / %dMB (%.1f%%)\n", $3, $2, $3/$2 * 100}'
echo ""

echo "Disk Usage"
df -h --total | awk '/^total/ {print "Used: " $3 " / " $2 " (" $5 ")"}'
echo ""

echo "Top 5 processes by cpu"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6
echo ""

echo "Top 5 processes by memory"
ps -eo pid,comm,%mem --sort=-%mem | head -6
