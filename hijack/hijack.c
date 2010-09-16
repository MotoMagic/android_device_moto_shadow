#include "hijack.h"

int exec_and_wait(char** argp)
{
    pid_t pid;
    sig_t intsave, quitsave;
    sigset_t mask, omask;
    int pstat;

    sigemptyset(&mask);
    sigaddset(&mask, SIGCHLD);
    sigprocmask(SIG_BLOCK, &mask, &omask);
    switch (pid = vfork()) {
    case -1:            /* error */
        sigprocmask(SIG_SETMASK, &omask, NULL);
        return(-1);
    case 0:                /* child */
        sigprocmask(SIG_SETMASK, &omask, NULL);
        execve(argp[0], argp, environ);
    _exit(127);
  }

    intsave = (sig_t)  bsd_signal(SIGINT, SIG_IGN);
    quitsave = (sig_t) bsd_signal(SIGQUIT, SIG_IGN);
    pid = waitpid(pid, (int *)&pstat, 0);
    sigprocmask(SIG_SETMASK, &omask, NULL);
    (void)bsd_signal(SIGINT, intsave);
    (void)bsd_signal(SIGQUIT, quitsave);
    return (pid == -1 ? -1 : pstat);
}

int remount_root(const char * hijack_exec, int rw) {
    char* remount_root_args[5];
    remount_root_args[0] = strdup(hijack_exec);
    remount_root_args[1] = strdup("mount");
    if (rw > 0) {
        remount_root_args[2] = strdup("-orw,remount");
    } else {
        remount_root_args[2] = strdup("-oro,remount");
    }
    remount_root_args[3] = strdup("/");
    remount_root_args[4] = NULL;
    return exec_and_wait(remount_root_args);
}

int hijack_mount(const char * hijack_exec, const char * dev, const char * mount_point) {
    char* mount_args[5];
    mount_args[0] = strdup(hijack_exec);
    mount_args[1] = strdup("mount");
    mount_args[2] = strdup(dev);
    mount_args[3] = strdup(mount_point);
    mount_args[4] = NULL;
    return exec_and_wait(mount_args);
}

int hijack_umount(const char * hijack_exec, const char * mount_point) {
    char* umount_args[5];
    umount_args[0] = strdup(hijack_exec);
    umount_args[1] = strdup("umount");
    umount_args[2] = strdup("-l");
    umount_args[3] = strdup(mount_point);
    umount_args[4] = NULL;
    return exec_and_wait(umount_args);
}

void hijack_log(char * format, ...) {
#ifdef LOG_ENABLE
    FILE * log = fopen(LOG_PATH, "a");
    if (log != NULL) {
        // start our va list
        va_list args;
        va_start(args, format);

        // some buffers :D
        char * new_format = (char *)malloc(sizeof(char) * PATH_MAX);
        char * time_buffer = (char *)malloc(sizeof(char) * PATH_MAX);
        char * out_buffer = (char *)malloc(sizeof(char) * PATH_MAX);

        // get the time
        time_t * ts = (time_t *)malloc(sizeof(time_t));
        time(ts);
        struct tm * t = localtime(ts);
        free(ts);
        strftime(time_buffer, PATH_MAX, "%Y-%m-%d %H:%M:%S", t);

        sprintf(new_format, "hijack [%s]: %s\n", time_buffer, format);
        vsprintf(out_buffer, new_format, args);
        fputs(out_buffer, log);
        va_end(args);
        fclose(log);

        free(new_format);
        free(time_buffer);
        free(out_buffer);
    }
#endif
}

typedef char* string;

void mark_file(char* filename) {
    FILE *f = fopen(filename, "wb");
    fwrite("1", 1, 1, f);
    if (f != NULL)
        fclose(f);
}

int main(int argc, char** argv) {
    char* hijacked_executable = argv[0];
    struct stat info;
    int result = 0;
    int logr;
    int i;

    if (NULL != strstr(hijacked_executable, "hijack")) {
        // no op
        if (argc >= 2) {
            return busybox_driver(argc - 1, argv + 1);
        }
        return 0;
    }

#ifdef LOG_ENABLE
    // SCREW THE RULES, IF WE GET HERE WE'RE HIJACKING, AND FROM HERE ON OUT
    // WE'RE FUCKING WITH ROOT (/) NO MATTER WHAT AT THIS POINT
    remount_root("/system/bin/hijack", 1);

    // OH FUCK YEAH MOUNT
    mkdir(LOG_MOUNT, S_IRWXU);
    hijack_mount("/system/bin/hijack", LOG_DEVICE, LOG_MOUNT);

    // time to create our log file and jam our header into it!
hijack_log("Hijack called with the following arguments:");
    for (i = 0; i < argc; i++) {
hijack_log("    argv[%d] = \"%s\"", i, argv[i]);
    }

hijack_log("Executing log dumper script:");
    char* log_dump_args[] = { LOG_DUMP_BINARY, LOG_PATH, NULL };
hijack_log("exec(\"%s %s\") executing...", LOG_DUMP_BINARY, LOG_PATH);
    logr = exec_and_wait(log_dump_args);
hijack_log("exec(\"%s %s\") returned: %d", LOG_DUMP_BINARY, LOG_PATH, logr);

#endif

    // check to see if hijack was already run, and if so, just continue on.
    if (argc >= 3 && 0 == strcmp(argv[2], "cache")) {

hijack_log("Entering testing for hijacking!");

        if (0 == stat(RECOVERY_MODE_FILE, &info)) {

hijack_log("Recovery mode detected");

            // don't boot into recovery again
hijack_log("remove(%s) executing...", RECOVERY_MODE_FILE);
            logr = remove(RECOVERY_MODE_FILE);
hijack_log("remove(%s) returned: %d", RECOVERY_MODE_FILE, logr);

hijack_log("remount_root(%s, %d) executing...", "/system/bin/hijack", 1);
            logr = remount_root("/system/bin/hijack", 1);
hijack_log("remount_root(%s, %d) returned: %d", "/system/bin/hijack", 1, logr);

hijack_log("mkdir(%s, %d) executing...", "/preinstall", S_IRWXU);
            logr = mkdir("/preinstall", S_IRWXU);
hijack_log("mkdir(%s, %d) returned: %d", "/preinstall", S_IRWXU, logr);

hijack_log("mkdir(%s, %d) executing...", "/tmp", S_IRWXU);
            logr = mkdir("/tmp", S_IRWXU);
hijack_log("mkdir(%s, %d) returned: %d", "/tmp", S_IRWXU, logr);

hijack_log("mkdir(%s, %d) executing...", "/res", S_IRWXU);
            logr = mkdir("/res", S_IRWXU);
hijack_log("mkdir(%s, %d) returned: %d", "/res", S_IRWXU, logr);

hijack_log("mkdir(%s, %d) executing...", "/res/images", S_IRWXU);
            logr = mkdir("/res/images", S_IRWXU);
hijack_log("mkdir(%s, %d) returned: %d", "/res/images", S_IRWXU, logr);

hijack_log("remove(%s) executing...", "/etc");
            logr = remove("/etc");
hijack_log("remove(%s) returned: %d", "/etc", logr);

hijack_log("mkdir(%s, %d) executing...", "/etc", S_IRWXU);
            logr = mkdir("/etc", S_IRWXU);
hijack_log("mkdir(%s, %d) returned: %d", "/etc", S_IRWXU, logr);

hijack_log("rename(%s, %s) executing...", "/sbin/adbd", "/sbin/adbd.old");
            logr = rename("/sbin/adbd", "/sbin/adbd.old");
hijack_log("rename(%s, %s) returned: %d", "/sbin/adbd", "/sbin/adbd.old", logr);

hijack_log("property_set(%s, %s) executing...", "ctl.stop", "runtime");
            logr = property_set("ctl.stop", "runtime");
hijack_log("property_set(%s, %s) returned: %d", "ctl.stop", "runtime", logr);

hijack_log("property_set(%s, %s) executing...", "ctl.stop", "zygote");
            logr = property_set("ctl.stop", "zygote");
hijack_log("property_set(%s, %s) returned: %d", "ctl.stop", "zygote", logr);

hijack_log("property_set(%s, %s) executing...", "persist.service.adb.enable", "1");
            logr = property_set("persist.service.adb.enable", "1");
hijack_log("property_set(%s, %s) returned: %d", "persist.service.adb.enable", "1", logr);

hijack_log("hijack_mount(%s, %s, %s) returned %d", "/system/bin/hijack", "/dev/block/preinstall", "/preinstall");
            logr = hijack_mount("/system/bin/hijack", "/dev/block/preinstall", "/preinstall");
hijack_log("hijack_mount(%s, %s, %s) returned %d", "/system/bin/hijack", "/dev/block/preinstall", "/preinstall", logr);

            // this will prevent hijack from being called again
hijack_log("hijack_umount(%s, %s) executing...", "/system/bin/hijack", "/system");
            logr = hijack_umount("/system/bin/hijack", "/system");
hijack_log("hijack_umount(%s, %s) returned: %d", "/system/bin/hijack", "/system", logr);

            char* updater_args[] = { UPDATE_BINARY, "2", "0", RECOVERY_UPDATE_ZIP, NULL };
hijack_log("exec(\"%s %s %s %s\") executing...", UPDATE_BINARY, "2", "0", RECOVERY_UPDATE_ZIP);
            result = exec_and_wait(updater_args);
hijack_log("exec(\"%s %s %s %s\") returned: %d", UPDATE_BINARY, "2", "0", RECOVERY_UPDATE_ZIP, result);
            goto done;
        } else if (0 == stat(BOOT_MODE_FILE, &info)) {
            // we want to go into recovery mode on next boot if there's a failure
            mark_file(RECOVERY_MODE_FILE);
            remount_root("/system/bin/hijack", 1);

            mkdir("/preinstall", S_IRWXU);
            mkdir("/newboot", S_IRWXU);
            rename("/sbin/adbd", "/sbin/adbd.old");
            property_set("ctl.stop", "runtime");
            property_set("ctl.stop", "zygote");
            property_set("persist.service.adb.enable", "1");

            // get access to our preinstall
            char* mount_preinstall_args[] = { "/system/bin/hijack", "mount", "/dev/block/preinstall", "/preinstall", NULL };
            exec_and_wait(mount_preinstall_args);

            // mount tmpfs on /newboot
            char* mount_newboot_args[] = { "/system/bin/hijack", "mount", "-t", "tmpfs", "none", "/newboot", NULL };
            exec_and_wait(mount_newboot_args);

            // have updater unpack our boot partition (will create /newboot/sbin/hijack)
            char* updater_args[] = { UPDATE_BINARY, "2", "0", BOOT_UPDATE_ZIP, NULL };
            exec_and_wait(updater_args);

            // now we're done with /preinstall
            char* umount_preinstall_args[] = { "/newboot/sbin/hijack", "umount", "-l", "/preinstall", NULL };
            exec_and_wait(updater_args);

            // since we have /newboot/sbin/hijack, we no longer need /system
            char* umount_system_args[] = { "/newboot/sbin/hijack", "umount", "-l", "/system", NULL };
            exec_and_wait(umount_system_args);

            // now we mount some needed directories
            char* mount_proc_args[] = { "/newboot/sbin/hijack", "mount", "-t", "proc", "proc", "/newboot/proc", NULL };
            exec_and_wait(mount_proc_args);
            char* mount_sys_args[] = { "/newboot/sbin/hijack", "mount", "-t", "sysfs", "none", "/newboot/sys", NULL };
            exec_and_wait(mount_sys_args);
            char* mount_dev_args[] = { "/newboot/sbin/hijack", "mount", "-o", "bind", "/dev", "/newboot/dev", NULL };
            exec_and_wait(mount_dev_args);

            // now we chroot and re-run init
            char* chroot_args[] = { "/newboot/sbin/hijack", "chroot", "/newboot", "/init", NULL };
            result = exec_and_wait(chroot_args);
            goto done;
        }

        // mark it in case we don't boot
        mark_file(RECOVERY_MODE_FILE);
    }

    char real_executable[PATH_MAX];
    sprintf(real_executable, "%s.bin", hijacked_executable);
    char ** argp = (char **)malloc(sizeof(char *) * (argc + 1));
    for (i = 0; i < argc; i++) {
        argp[i]=argv[i];
    }
    argp[argc] = NULL;

    argp[0] = real_executable;

hijack_log("Executing real program: %s", real_executable);
    for (i = 0; i < argc; i++) {
hijack_log("    argp[%d] = \"%s\"", i, argp[i]);
    }

    // should clean up memory leaks, but it really doesn't matter since the process immediately exits.
    result = exec_and_wait(argp);
hijack_log("Result: %d", result);

done:
    return result;
}
