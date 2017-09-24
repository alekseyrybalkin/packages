#!/bin/sh

pkgname=mutt
pkgver=1.9.1
ARCH_VERSION=${pkgver}
vcs=mercurial
hgtag=mutt-${pkgver//\./-}-rel
relmon_id=2035

kiin_make() {
    rm -rf .hg
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
    chmod 0755 ${pkgdir}/usr/bin/mutt_dotlock
}

kiin_after_install() {
    getent group mail >/dev/null || groupadd -g 34 mail
    chgrp -v mail /var/mail
}

kiin_after_upgrade() {
    kiin_after_install
}
