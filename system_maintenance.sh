#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo "Starting DevOps Automated System Maintenance"
echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Host: $(hostname)"
echo "=========================================="

echo "[1/4] Checking System Disk Usage..."
df -h / | awk 'NR==2 {print "Disk Space Used: " $3 " / " $2 " (" $5 ")"}'

echo "[2/4] Checking System Memory..."
free -m | awk 'NR==2 {printf "Memory Used: %sMB / %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'

echo "[3/4] Cleaning Package Cache and Temp Files..."
if command -v apt-get &> /dev/null; then
    echo "Running apt-get clean..."
    sudo apt-get clean || true
fi
echo "Cleaning temporary files in /tmp older than 7 days..."
sudo find /tmp -type f -atime +7 -delete 2>/dev/null || true

echo "[4/4] Verifying Docker Environment Health..."
if command -v docker &> /dev/null; then
    docker info --format 'Docker Engine Version: {{.ServerVersion}}, Containers Running: {{.ContainersRunning}}' || true
else
    echo "Docker CLI not detected on host."
fi

echo "=========================================="
echo "System Maintenance Completed Successfully!"
echo "=========================================="
