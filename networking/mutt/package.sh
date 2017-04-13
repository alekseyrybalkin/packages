#!/bin/sh

pkgname=mutt
pkgver=1.8.1
ARCH_VERSION=${pkgver}
vcs=mercurial
hgtag=mutt-${pkgver//\./-}-rel

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
