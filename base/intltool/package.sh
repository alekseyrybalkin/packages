#!/bin/sh

pkgname=intltool
pkgver=0.51.0
vcs=bzr
vcs_clone='bzr branch lp:intltool'
bzrtag=release-${pkgver//\./_}
relmon_id=1385

kiin_make() {
    patch -Np1 -i ../intltool-0.51.0-perl-5.22.patch
    patch -Np1 -i ../intltool-merge-Create-cache-file-atomically.patch
    patch -Np1 -i ../intltool_distcheck-fix.patch
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -v -m644 -D doc/I18N-HOWTO \
        ${pkgdir}/usr/share/doc/${pkgname}/I18N-HOWTO
}
