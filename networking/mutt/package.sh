#!/bin/sh

pkgname=mutt
pkgver=1.8
ARCH_VERSION=${pkgver}.0
vcs=mercurial
hgtag=mutt-${pkgver//\./-}-rel
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
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

kiin_after_install() {
    getent group mail >/dev/null || groupadd -g 34 mail
    chgrp -v mail /var/mail
}

kiin_after_upgrade() {
    kiin_after_install
}
