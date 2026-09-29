#!/bin/bash
echo "=== SYSTEM MAINTENANCE SCRIPT ==="
echo "--- Uptime and Resource Utilization ---"
uptime
free -h
echo "--- Disk Space Usage ---"
df -h /
echo "--- Cleaning Temporary Files ---"
sudo rm -rf /tmp/* 2>/dev/null || true
echo "--- System Maintenance Completed Successfully ---"
