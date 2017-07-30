#!/bin/sh

pkgname=memcached
pkgver=1.5.0
vcs=git
gittag=${pkgver}
relmon_id=1965

kiin_make() {
    sed -i -e 's/automake-1.14/automake-1.15\ automake-1.14/g' autogen.sh
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

kiin_after_install() {
    getent passwd memcached >/dev/null || \
        useradd --system --shell /bin/false memcached
}

kiin_after_upgrade() {
    kiin_after_install
}
