#!/system/bin/sh
export PATH=/system/bin:$PATH
if [ -e /system/usr/keylayout/sholes-keypad.kl ]; then
	return
fi

if [ -e /proc/device-tree/System@0/Keypad@0/name ]; then
	keypad_name=`cat /proc/device-tree/System@0/Keypad@0/name`
	if [ "x$keypad_name" != "x" ]; then
		ln -s /system/usr/keylayout/$keypad_name.kl /system/usr/keylayout/sholes-keypad.kl
		ln -s /system/usr/keychars/$keypad_name.kcm.bin /system/usr/keychars/sholes-keypad.kcm.bin
	fi
fi
