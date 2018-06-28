#!/bin/sh

pkgname=memcached
pkgver=1.5.7
vcs=git
gittag=${pkgver}
relmon_id=1965

undead_make() {
    sed -i -e 's/automake-1.14/automake-1.15\ automake-1.14/g' autogen.sh
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}

undead_after_install() {
    getent passwd memcached >/dev/null || \
        useradd --system --shell /bin/false memcached
}

undead_after_upgrade() {
    undead_after_install
}
