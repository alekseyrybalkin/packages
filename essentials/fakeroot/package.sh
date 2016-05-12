#!/bin/sh

pkgname=fakeroot
pkgver=1.20.2
vcs=git
gittag=b5159a93f0ea7f1d7cf788754ef4d8c7d30dd22e
extension=bz2
folder="http://ftp.ru.debian.org/debian/pool/main/f/${pkgname}/"
check_server=1

srctar=${pkgname}_${pkgver}.orig.tar.${extension}

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}_.*\.orig\.tar\.${extension}$"
ver_seds() {
    sed -r "s/^${pkgname}_//g" | sed -r "s/\.orig\.tar\.${extension}$//g"
}

kiin_make() {
    sed -i -e '/man_MANS/d' doc/Makefile.am
    sed -i -e 's/de es fr sv nl//g' doc/Makefile.am
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
