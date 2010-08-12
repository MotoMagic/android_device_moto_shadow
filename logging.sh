# delete files older than 7 days
/system/bin/busybox find  /sdcard/logs/* -mtime +7 -exec rm {} \;

for file in kernel main radio events; do
    /system/bin/mv /sdcard/logs/thisboot_$file.txt /sdcard/logs/`cat /sdcard/logs/last_timestamp`_$file.txt
done

/system/bin/cat /proc/kmsg >/sdcard/logs/thisboot_kernel.txt &
/system/bin/logcat -v threadtime >/sdcard/logs/thisboot_main.txt &
/system/bin/logcat -v threadtime -b radio >/sdcard/logs/thisboot_radio.txt &
/system/bin/logcat -v threadtime -b events >/sdcard/logs/thisboot_events.txt &

for file in apanic_console apanic_threads; do
    if [ -f /data/dontpanic/$file ]
    then
        /system/bin/busybox md5sum -c /sdcard/logs/$file.md5 || /system/bin/gzip -c /data/dontpanic/$file > /sdcard/logs/`cat /sdcard/logs/last_timestamp`_$file.txt.gz
        /system/bin/busybox md5sum /data/dontpanic/$file > /sdcard/logs/$file.md5
    fi
done

/system/bin/date -u +'%Y-%m-%d_%H.%M.%S' > /sdcard/logs/last_timestamp

for file in `/system/bin/ls /sdcard/logs/????-??-??_??.??.??_*.txt`; do
    gzip $file
done
