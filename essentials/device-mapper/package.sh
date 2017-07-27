#!/bin/sh

pkgname=device-mapper
ARCH_NAME=lvm2
pkgver=2.02.173
vcs=git
vcs_pkgname=lvm2
# FIXME
gittag=88f15659374042f7657d73393f73e267d752b4e1
#gittag=v${pkgver//\./_}
relmon_id=5354

kiin_make() {
    unset LDFLAGS
    ./configure --prefix=/ --sbindir=/usr/bin --sysconfdir=/etc \
        --localstatedir=/var --datarootdir=/usr/share \
        --includedir=/usr/include --with-usrlibdir=/usr/lib \
        --libdir=/usr/lib --enable-pkgconfig --enable-readline \
        --disable-notify-dbus --disable-dbus-service
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install_device-mapper
}
