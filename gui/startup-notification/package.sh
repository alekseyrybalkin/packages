#!/bin/sh

pkgname=startup-notification
pkgver=0.12
vcs=git
gittag=STARTUP_NOTIFICATION_${pkgver//\./_}
relmon_id=10089

kiin_make() {
    sed -i -e '/AC_PATH_XTRA/d' configure.in
    autoreconf --force --install
    ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
