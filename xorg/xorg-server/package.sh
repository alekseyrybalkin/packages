#!/bin/sh

pkgname=xorg-server
pkgver=1.19.6
vcs=git
gittag=xorg-server-${pkgver}
relmon_id=5250

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure $XORG_CONFIG \
        --with-xkb-output=/var/lib/xkb \
        --enable-suid-wrapper \
        --enable-install-setuid \
        --with-sha1=libcrypto \
        --libexecdir=/usr/lib/xorg-server \
        --enable-dri \
        --enable-dri2 \
        --enable-dri3 \
        --enable-glamor \
        --enable-composite \
        --with-fontrootdir=/usr/share/fonts
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}/etc/X11/xorg.conf.d
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}
