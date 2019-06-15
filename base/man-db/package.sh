#!/bin/sh

pkgname=man-db
pkgver=2.8.5
vcs=git
gittag=${pkgver}
urls="http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=1882

kiin_make() {
    git clone -s ${SOURCES_HOME}/dev/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib \
        --libdir=/usr/lib \
        --docdir=/usr/share/doc/man-db \
        --sysconfdir=/etc \
        --disable-setuid \
        --with-browser=/usr/bin/lynx \
        --with-vgrind=/usr/bin/vgrind \
        --with-grap=/usr/bin/grap \
        --with-systemdsystemunitdir=/usr/lib/systemd/system
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
