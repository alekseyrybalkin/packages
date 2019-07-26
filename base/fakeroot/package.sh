#!/bin/sh

pkgname=fakeroot
pkgver=1.23
vcs=git
#FIXME no tag
gittag=dc2e20a65d1fb3a4c49bb6121a0e5caf3f1b321a
#gittag=${pkgver}
relmon_id=12048
relmon_sed='s/\.orig//g'

build() {
    sed -i -e '/man_MANS/d' doc/Makefile.am
    sed -i -e 's/de es fr nl pt sv//g' doc/Makefile.am
    patch -p1 -i ../silence-dlerror.patch
    ./bootstrap
    ./configure --prefix=/usr --libdir=/usr/lib/libfakeroot \
        --disable-static --with-ipc=sysv
    make
}

package() {
    make DESTDIR=${pkgdir} install
    install -dm755 ${pkgdir}/etc/ld.so.conf.d/
    echo '/usr/lib/libfakeroot' > ${pkgdir}/etc/ld.so.conf.d/fakeroot.conf
    install -Dm644 README $pkgdir/usr/share/doc/fakeroot/README
}
