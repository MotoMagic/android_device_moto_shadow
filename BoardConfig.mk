#
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8

TARGET_NO_BOOTLOADER := false

#HARDWARE_OMX := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION    := VER_0_6_X
BOARD_WLAN_DEVICE         := tiwlan0
BOARD_WLAN_TI_STA_DK_ROOT := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_PATH   := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_ARG    := ""
WIFI_DRIVER_MODULE_NAME   := "tiwlan_drv"
WIFI_FIRMWARE_LOADER      := "wlan_loader"

TARGET_BOOTLOADER_BOARD_NAME := shadow

BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw mem=496M@0x80C00000 init=/init ip=off motobldlabel=none mtdparts=omap2-nand.0:128k(mbr),128k(mbmloader),256k(unused0),512k(mbm),512k(mbmbackup),512k(ebr),512k(bploader),512k(cdt),4m(pds),512k(lbl),512k(lbl_backup),1m(logo),2m(sp),512k(devtree),512k(devtree_backup),4m(bpsw),4m(boot),5m(recovery),12m(cdrom),512k(misc),512k(cid),4m(kpanic),286336k(system),384k(unused1),190m(cache),256m(preinstall),256m(userdata)

#BOARD_HAVE_BLUETOOTH := true

#BOARD_GL_TEX_POW2_DIMENSION_REQUIRED := true

#TARGET_HARDWARE_3D := false

#BOARD_GPS_LIBRARIES := libmoto_gps

USE_PV_WINDOWS_MEDIA := false

BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x003FFFFF)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x004FFFFF)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x0BDFFFFF)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# BOARD_KERNEL_BASE := 0x20000000
USE_CAMERA_STUB := false
BOARD_EGL_CFG := device/motorola/shadow/egl.cfg

ALLOW_LGPL := true
