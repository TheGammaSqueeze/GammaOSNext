#!/bin/bash

# ---------------------------------------------
# Erase userdata via fastboot (macOS/Linux)
# ---------------------------------------------

FASTBOOT="fastboot"

echo "[Info] Wiping data and cache..."
$FASTBOOT -w
$FASTBOOT erase userdata

echo
echo "Factory reset complete. Closing this window in 60 seconds."
sleep 60
