#!/bin/sh

#vcs=none
pkgname=filesystem
SKIP_ARCH_CHECK=1
pkgver=1

kiin_make() {
    :
}

kiin_before_install() {
    groupadd --gid 1000 rybalkin
    groupadd --gid 1001 chrussia
    groupadd --gid 1002 chtor
    groupadd --gid 1003 chgermany

    useradd --uid 1000 -g ${PACMAN} -G kvm,audio,video -s /bin/bash ${PACMAN}
    useradd --uid 1001 -g chrussia -G audio,video -s /bin/bash chrussia
    useradd --uid 1002 -g chtor -G video -s /bin/bash chtor
    useradd --uid 1003 -g chgermany -G audio,video -s /bin/bash chgermany
    useradd --uid 1004 -m -g ${PACMAN} -s /bin/bash ${HOUSECARL}
}

kiin_install() {
    # for virtual filesystems
    mkdir -v ${pkgdir}/{dev,proc,sys,run}
    mknod -m 600 ${pkgdir}/dev/console c 5 1
    mknod -m 666 ${pkgdir}/dev/null c 1 3

    # dirs
    mkdir -pv ${pkgdir}/{boot,etc/sysconfig,home,mnt}
    mkdir -pv ${pkgdir}/var
    install -dv -m 0750 ${pkgdir}/root
    install -dv -m 1777 ${pkgdir}/tmp ${pkgdir}/var/tmp
    mkdir -pv ${pkgdir}/usr/{bin,include,lib}
    mkdir -pv ${pkgdir}/usr/share/{doc,info,locale,man}
    mkdir -v  ${pkgdir}/usr/share/{misc,terminfo,zoneinfo}
    mkdir -pv ${pkgdir}/usr/share/man/man{1..8}

    ln -sv usr/bin ${pkgdir}/bin
    ln -sv usr/bin ${pkgdir}/sbin
    ln -sv bin ${pkgdir}/usr/sbin

    ln -sv usr/lib ${pkgdir}/lib
    ln -sv usr/lib ${pkgdir}/lib64
    ln -sv lib ${pkgdir}/usr/lib64

    mkdir -v ${pkgdir}/var/{log,spool}
    ln -sv /run ${pkgdir}/var/run
    ln -sv /run/lock ${pkgdir}/var/lock
    mkdir -pv ${pkgdir}/var/{opt,cache,lib/{misc,locate},local}

    # files
    ln -sv /proc/self/mounts ${pkgdir}/etc/mtab

    touch ${pkgdir}/var/log/{btmp,lastlog,faillog,wtmp}
    chgrp -v utmp ${pkgdir}/var/log/lastlog
    chmod -v 664  ${pkgdir}/var/log/lastlog
    chmod -v 600  ${pkgdir}/var/log/{btmp,faillog}

    # for glibc
    install -dv -m 0755 ${pkgdir}/usr/lib/locale
    install -dv -m 0755 ${pkgdir}/var/lib/nss_db

    # for util-linux
    install -dv -m 0755 ${pkgdir}/var/lib/hwclock

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

    # for nginx
    #install -dv -m 0755 ${pkgdir}/var/log/nginx
    #chown nginx:nginx ${pkgdir}/var/log/nginx
    #install -dv -m 0755 ${pkgdir}/var/lib/nginx/proxy
    #chown -R nginx:nginx ${pkgdir}/var/lib/nginx

    # for mail packages
    install -dv -m 1775 ${pkgdir}/var/spool/mail

    # for kiin
    mkdir -pv ${pkgdir}/var/lib/kiin/{installed,uninstalled}

    # for fcron
    #mkdir -pv ${pkgdir}/var/spool/fcron
    #chown fcron:fcron ${pkgdir}/var/spool/fcron
    #chmod 770 ${pkgdir}/var/spool/fcron

    # for chrony
    mkdir -pv ${pkgdir}/var/lib/chrony
}

kiin_after_install() {
    :
}

kiin_after_upgrade() {
    kiin_after_install
}
