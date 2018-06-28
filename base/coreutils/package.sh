#!/bin/sh

pkgname=coreutils
pkgver=8.29
vcs=git
gittag=v${pkgver}
relmon_id=343

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --build=x86_64-unknown-linux-gnu \
        --enable-no-install-program=kill,uptime
    make
}

undead_install() {
    mkdir -p ${pkgdir}/usr/share/man/man8
    make DESTDIR=${pkgdir} install
    mv -v ${pkgdir}/usr/share/man/man1/chroot.1 ${pkgdir}/usr/share/man/man8/chroot.8
    sed -i s/\"1\"/\"8\"/1 ${pkgdir}/usr/share/man/man8/chroot.8
}
