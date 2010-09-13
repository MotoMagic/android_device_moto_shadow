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

HARDWARE_OMX := true
OMX_TI_OMAP_TIER_LEVEL := 10

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
WIFI_DRIVER_FW_STA_PATH   := "/system/etc/wifi/fw_wlan1271.bin"
WIFI_DRIVER_FW_AP_PATH    := "/system/etc/wifi/fw_tiwlan_ap.bin"

TARGET_BOOTLOADER_BOARD_NAME := shadow

BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw mem=498M@0x80C00000 init=/init ip=off motobldlabel=none mmcparts=mmcblk1:p1(mbmloader),p2(mbm),p3(mbmbackup),p4(ebr),p5(bploader),p6(cdt.bin),p7(pds),p8(lbl),p9(lbl_backup),p10(logo.bin),p11(sp),p12(devtree),p13(devtree_backup),p14(bpsw),p15(boot),p16(recovery),p17(cdrom),p18(misc),p19(cid),p20(kpanic),p21(system),p22(cache),p23(preinstall),p24(userdata)

BOARD_HAVE_BLUETOOTH := true

BOARD_GL_TEX_POW2_DIMENSION_REQUIRED := true

#TARGET_HARDWARE_3D := false

BOARD_GPS_LIBRARIES := libgps_rds

BOARD_USES_QCOM_HARDWARE := true

USE_PV_WINDOWS_MEDIA := false

BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x003FFFFF)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x004FFFFF)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x0BDFFFFF)
BOARD_PREINSTALLIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# BOARD_KERNEL_BASE := 0x20000000
USE_CAMERA_STUB := false
BOARD_EGL_CFG := device/motorola/shadow/egl.cfg

TARGET_OTA_SCRIPT_MODE := edify
TARGET_NO_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_NO_PREINSTALL := false

BOARD_HIJACK_EXECUTABLES := logwrapper
BOARD_HIJACK_UPDATE_BINARY := /preinstall/obsidian/update-binary
BOARD_HIJACK_BOOT_UPDATE_ZIP := /preinstall/obsidian/update-boot.zip
BOARD_HIJACK_RECOVERY_UPDATE_ZIP := /preinstall/obsidian/update-recovery.zip

ALLOW_LGPL := true
