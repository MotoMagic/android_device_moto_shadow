#ifndef __HIJACK_H__
#define __HIJACK_H__

// declare all of our includes
#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <limits.h>
#include <linux/input.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <dirent.h>
#include <signal.h>
#include <sys/reboot.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/limits.h>
#include <sys/stat.h>
#include <sys/mount.h>
#include <cutils/properties.h>

// file that bypasses all hijacking
#ifndef HIJACK_BYPASS_FILE
#define HIJACK_BYPASS_FILE "/data/.hijack_bypass"
#endif

// file that throws us into recovery mode
#ifndef RECOVERY_MODE_FILE
#define RECOVERY_MODE_FILE "/data/.recovery_mode"
#endif

// file that throws us into charging mode
#ifndef CHARGING_MODE_FILE
#define CHARGING_MODE_FILE "/data/.charging_mode"
#endif

// if we enable logging...
#ifdef LOG_ENABLE
// log device
#ifndef LOG_DEVICE
#define LOG_DEVICE "/dev/block/mmcblk0p1" // default to SD card
#endif
// log mount point
#ifndef LOG_MOUNT
#define LOG_MOUNT "/sdlog" // default to SD logging
#endif
// log file name (will be placed under SDLOG_MOUNT)
#ifndef LOG_FILE
#define LOG_FILE "hijack.log" // this works
#endif
// script that dumps dmesg/logcat/etc
#ifndef LOG_DUMP_BINARY
#define LOG_DUMP_BINARY "/system/bin/hijack.log_dump"
#endif
// convenience define
#define LOG_PATH LOG_MOUNT"/"LOG_FILE
#endif

// update-binary executable
#ifndef UPDATE_BINARY
#define UPDATE_BINARY "/preinstall/update-binary"
#endif

// boot update.zip
#ifndef BOOT_UPDATE_ZIP
#define BOOT_UPDATE_ZIP "/preinstall/update-boot.zip"
#endif

// recovery update.zip
#ifndef RECOVERY_UPDATE_ZIP
#define RECOVERY_UPDATE_ZIP "/preinstall/update-recovery.zip"
#endif

// function prototypes! :D
int exec_and_wait(char ** argp);
int remount_root(const char * hijack_exec, int rw);
int hijack_mount(const char * hijack_exec, const char * dev, const char * mount_point);
int hijack_mount_ex(const char * hijack_exec, const char * type, const char * options, const char * dev, const char * mount_point);
int hijack_umount(const char * hijack_exec, const char * mount_point);
void hijacK_log(char * format, ...);
int mark_file(char * filename);

#endif
