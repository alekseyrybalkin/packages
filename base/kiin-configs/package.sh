#!/bin/sh

pkgname=kiin-configs
SKIP_ARCH_CHECK=1
vcs=git
pkgver=1

kiin_make() {
    rm -rf .git
    find . -type f | xargs sed -i -e "s/%KIIN_HOSTNAME%/`hostname`/g"
    if [ "`hostname`" == "sol" ]; then
        # disable autostart for some services
        find etc/rc.d -type l -name "*postgresql*" | xargs rm
    fi
}

kiin_install() {
    cp -av ./* ${pkgdir}

    if [ -d /home/${PACMAN}/projects/journal ]; then
        cp /home/${PACMAN}/projects/journal/networth ${pkgdir}/usr/bin/
    fi

    chmod 440 ${pkgdir}/etc/sudoers
    chmod o-x ${pkgdir}/etc/rc.d/init.d/*

    chown root:${PACMAN} ${pkgdir}/usr/bin/*
    chmod 750 ${pkgdir}/usr/bin/*

    chown root:root ${pkgdir}/usr/bin/*wifi
    chmod 700 ${pkgdir}/usr/bin/*wifi

}
