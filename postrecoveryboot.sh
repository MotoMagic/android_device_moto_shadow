#!/sbin/sh

sleep 5

for i in $(seq 1 10)
do
    TMP=$(mount | grep /tmp)
    if [ -z "$TMP" ]
    then
        break
    fi
    umount -l /tmp
    sleep 1
done

busybox mount -orw,remount /
rm -r /tmp
mkdir -p tmp
rm sdcard
mkdir sdcard

# Restart with root hacked adbd
echo msc_adb > /dev/usb_device_mode
touch /tmp/recovery.log
sync

NEEDS_ADBD=$(ps | grep adbd | grep -v grep)
if [ -z "$NEEDS_ADBD" ]
then
    /sbin/adbd recovery &
fi
