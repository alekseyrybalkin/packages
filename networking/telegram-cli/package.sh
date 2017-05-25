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
    git apply ../configdir.patch
    git clone ${SOURCES_HOME}/tgl
    cd tgl
    git clone ${SOURCES_HOME}/tl-parser
    git apply ../../openssl-1.1.patch
    cd ../
    ./configure --disable-libconfig --disable-liblua --disable-json
    make
}

kiin_install() {
    install -Dm644 tg-server.pub ${pkgdir}/etc/telegram-cli/server.pub
    install -Dm755 bin/telegram-cli ${pkgdir}/usr/bin/telegram-cli
}
