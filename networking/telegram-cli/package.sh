#!/bin/sh

pkgname=telegram-cli
SKIP_ARCH_CHECK=1
pkgver=1.3.1
vcs=git
vcs_pkgname=tg
#FIXME
gittag=6547c0b21b977b327b3c5e8142963f4bc246187a
relmon_id=5610

kiin_make() {
    patch -Np1 -i ../configdir.patch
    patch -Np1 -i ../silence_some_notifications.patch
    git clone ${SOURCES_HOME}/tgl
    cd tgl
    git clone ${SOURCES_HOME}/tl-parser
    patch -Np1 -i ../../openssl-1.1.patch
    cd ../
    ./configure --disable-libconfig --disable-liblua --disable-json
    make
}

kiin_install() {
    install -Dm644 tg-server.pub ${pkgdir}/etc/telegram-cli/server.pub
    install -Dm755 bin/telegram-cli ${pkgdir}/usr/bin/telegram-cli
}
