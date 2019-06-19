#!/bin/sh

#vcs=none
pkgname=filesystem
SKIP_ARCH_CHECK=1
pkgver=1

kiin_make() {
    :
}

kiin_before_install() {
    groupadd --gid 1000 ${PACMAN}
    useradd --uid 1000 -m -g ${PACMAN} -G kvm,audio,video -s /bin/bash ${PACMAN}
    useradd --uid 1100 -m -g ${PACMAN} -s /bin/bash ${HOUSECARL}
}

kiin_install() {
    # dirs
    mkdir -v ${pkgdir}/{boot,dev,etc,home,mnt,proc,run,sys,usr,var}
    install -dv -m 0750 ${pkgdir}/root
    install -dv -m 1777 ${pkgdir}/tmp ${pkgdir}/var/tmp
    mkdir -pv ${pkgdir}/usr/{bin,include,lib}
    mkdir -pv ${pkgdir}/usr/share/{doc,info,locale,man,misc,terminfo,zoneinfo}
    mkdir -pv ${pkgdir}/usr/share/man/man{1..8}
    mkdir -pv ${pkgdir}/var/{log,spool,opt,cache,lib/{misc,locate},local}

    # device nodes
    mknod -m 600 ${pkgdir}/dev/console c 5 1
    mknod -m 666 ${pkgdir}/dev/null c 1 3

    # bin/lib symlinks
    ln -sv usr/bin ${pkgdir}/bin
    ln -sv usr/bin ${pkgdir}/sbin
    ln -sv bin ${pkgdir}/usr/sbin
    ln -sv usr/lib ${pkgdir}/lib
    ln -sv usr/lib ${pkgdir}/lib64
    ln -sv lib ${pkgdir}/usr/lib64

    # var symlinks
    ln -sv /run ${pkgdir}/var/run
    ln -sv /run/lock ${pkgdir}/var/lock

    # files
    ln -sv /proc/self/mounts ${pkgdir}/etc/mtab

    # log files
    touch ${pkgdir}/var/log/{btmp,lastlog,faillog,wtmp}
    chgrp -v utmp ${pkgdir}/var/log/lastlog
    chmod -v 664  ${pkgdir}/var/log/lastlog
    chmod -v 600  ${pkgdir}/var/log/{btmp,faillog}

    # for glibc
    install -dv -m 0755 ${pkgdir}/usr/lib/locale
    install -dv -m 0755 ${pkgdir}/var/lib/nss_db

    # for systemd
    install -dv -m 0755 ${pkgdir}/var/lib/systemd
    install -dv -m 0755 ${pkgdir}/var/log/journal

    # for dbus
    install -dv -m 0755 ${pkgdir}/var/lib/dbus

    # for sudo
    install -dv -m 0755 ${pkgdir}/var/db
    install -dv -m 0700 ${pkgdir}/var/db/sudo

    # for openssh
    install -dv -m 0700 ${pkgdir}/var/lib/sshd
    chown root:sys ${pkgdir}/var/lib/sshd

    # for alsa-utils
    install -dv -m 0755 ${pkgdir}/var/lib/alsa

    # for fontconfig
    install -dv -m 0755 ${pkgdir}/var/cache/fontconfig

    # for tor
    install -dv -m 0700 ${pkgdir}/var/lib/tor

    # for kiin
    mkdir -pv ${pkgdir}/var/lib/kiin/{installed,uninstalled}

    # for chrony
    mkdir -pv ${pkgdir}/var/lib/chrony

    # for nginx
    #install -dv -m 0755 ${pkgdir}/var/log/nginx
    #chown nginx:nginx ${pkgdir}/var/log/nginx
    #install -dv -m 0755 ${pkgdir}/var/lib/nginx/proxy
    #chown -R nginx:nginx ${pkgdir}/var/lib/nginx

    cp ../nsswitch.conf ${pkgdir}/etc/nsswitch.conf
    cp ../ld.so.conf ${pkgdir}/etc/ld.so.conf
    cp ../shells ${pkgdir}/etc/shells
    cp ../os-release ${pkgdir}/etc/os-release
}

kiin_after_install() {
    :
}

kiin_after_upgrade() {
    kiin_after_install
}
