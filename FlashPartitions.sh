#!/bin/bash

# ---------------------------------------------
# GammaOS Next Full v1.0.0 - Retroid Pocket Classic
# ---------------------------------------------

ADB="adb"
FASTBOOT="fastboot"
LOGFILE="log.txt"

echo "-------------------------------------------------"
echo " GammaOS Next Full v1.0.0 - Retroid Pocket 4 Classic"
echo "-------------------------------------------------"
echo

# ---------------------------------------------
# Show connected devices
# ---------------------------------------------
echo "Connected ADB devices:"
$ADB devices | tail -n +2 | while read -r serial status; do
    if [[ "$status" == "device" ]]; then
        echo "   ADB: $serial"
    fi
done

echo
echo "Connected Fastboot devices:"
$FASTBOOT devices | while read -r serial _; do
    if [[ -n "$serial" ]]; then
        echo "   FASTBOOT: $serial"
    fi
done

# ---------------------------------------------
# Pick the device
# ---------------------------------------------
DEVICE="Unknown"
CONNTYPE="None"

ADB_DEVICE=$($ADB devices | tail -n +2 | awk '$2=="device" {print $1; exit}')
if [[ -n "$ADB_DEVICE" ]]; then
    DEVICE="$ADB_DEVICE"
    CONNTYPE="ADB"
else
    FB_DEVICE=$($FASTBOOT devices | awk '{print $1; exit}')
    if [[ -n "$FB_DEVICE" ]]; then
        DEVICE="$FB_DEVICE"
        CONNTYPE="FASTBOOT"
    fi
fi

echo
echo "Selected device: $CONNTYPE/$DEVICE"
echo

read -p "Proceed with installation? (y/n): " yn
case $yn in
    [Yy]*) ;;
    *)
        echo "Installation canceled."
        exit 1
        ;;
esac

echo
echo "Beginning installation on $CONNTYPE/$DEVICE..."
echo

# ---------------------------------------------
# Reboot into fastbootd if needed
# ---------------------------------------------
if [[ "$CONNTYPE" == "ADB" ]]; then
    echo "[Info] Rebooting ADB device $DEVICE into fastbootd..."
    $ADB -s "$DEVICE" reboot fastboot >>"$LOGFILE" 2>&1
    sleep 5
else
    echo "[Info] Ensuring fastbootd session..."
    $FASTBOOT reboot fastboot >>"$LOGFILE" 2>&1
    sleep 5
fi

echo

# ---------------------------------------------
# Helper function
# ---------------------------------------------
run_and_log() {
    echo "[CMD] $*" >>"$LOGFILE"
    "$@" 2>&1 | tee -a "$LOGFILE"
}

echo "[Log] $(date)" >>"$LOGFILE"

echo "[Step 1] Flashing custom boot image..."
run_and_log $FASTBOOT flash boot flash/boot_custom.img
echo

echo "[Step 2] Flashing secondary boot (boot_b)..."
run_and_log $FASTBOOT flash boot_b flash/boot_custom.img
echo

echo "[Step 3] Flashing custom dtbo (dtbo_a)..."
run_and_log $FASTBOOT flash dtbo_a flash/dtbo_custom.img
echo

echo "[Step 4] Flashing secondary dtbo (dtbo_b)..."
run_and_log $FASTBOOT flash dtbo_b flash/dtbo_custom.img
echo

echo "[Step 5] Flashing custom vendor_boot (vendor_boot_a)..."
run_and_log $FASTBOOT flash vendor_boot_a flash/vendor_boot_custom.img
echo

echo "[Step 6] Flashing secondary vendor_boot (vendor_boot_b)..."
run_and_log $FASTBOOT flash vendor_boot_b flash/vendor_boot_custom.img
echo

echo "[Step 7] Removing old system partitions (A/B COW)..."
run_and_log $FASTBOOT delete-logical-partition system_a-cow
run_and_log $FASTBOOT delete-logical-partition system_b-cow
run_and_log $FASTBOOT delete-logical-partition system_ext_a
run_and_log $FASTBOOT delete-logical-partition system_ext_b
run_and_log $FASTBOOT delete-logical-partition product_a
run_and_log $FASTBOOT delete-logical-partition product_b
run_and_log $FASTBOOT delete-logical-partition system_ext_a-cow
run_and_log $FASTBOOT delete-logical-partition system_ext_b-cow
run_and_log $FASTBOOT delete-logical-partition product_a-cow
run_and_log $FASTBOOT delete-logical-partition product_b-cow
echo

echo "[Step 8] Flashing system image (3 min)..."
run_and_log $FASTBOOT flash system flash/system_custom.img
echo

echo "[Step 9] Flashing vendor image (1 min)..."
run_and_log $FASTBOOT flash vendor flash/vendor_custom.img
echo

echo "[Info] Installation complete on $CONNTYPE/$DEVICE."
echo
echo "[Info] Now run the EraseUserData script if this is a new install!"
echo
read -p "Press Enter to exit..."
exit 0
