#!/bin/sh

pkgname=fakeroot
pkgver=1.22
vcs=git
# FIXME
gittag=d399b7ee2c71f1c697607d7d4596a4c506ab1a6c
#gittag=${pkgver}
extension=bz2
folder="http://ftp.ru.debian.org/debian/pool/main/f/${pkgname}/"
check_server=1
relmon_id=12048
relmon_sed='s/\.orig//g'

srctar=${pkgname}_${pkgver}.orig.tar.${extension}

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}_.*\.orig\.tar\.${extension}$"
ver_seds() {
    sed -r "s/^${pkgname}_//g" | sed -r "s/\.orig\.tar\.${extension}$//g"
}

kiin_make() {
    sed -i -e '/man_MANS/d' doc/Makefile.am
    sed -i -e 's/de es fr nl pt sv//g' doc/Makefile.am
    patch -p1 -i ../silence-dlerror.patch
    ./bootstrap
    ./configure --prefix=/usr --libdir=/usr/lib/libfakeroot \
        --disable-static --with-ipc=sysv
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -dm755 ${pkgdir}/etc/ld.so.conf.d/
    echo '/usr/lib/libfakeroot' > ${pkgdir}/etc/ld.so.conf.d/fakeroot.conf
    install -Dm644 README $pkgdir/usr/share/doc/fakeroot/README
}
