#!/bin/sh

pkgname=mutt
pkgver=1.12.1
ARCH_VERSION=${pkgver}
vcs=git
gittag=mutt-${pkgver//\./-}-rel
relmon_id=2035

kiin_make() {
    rm -rf .git
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc \
        --with-docdir=/usr/share/doc/mutt \
        --enable-pop --enable-imap \
        --enable-hcache --without-qdbm \
        --without-tokyocabinet \
        --with-gdbm --without-bdb --with-ssl
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
