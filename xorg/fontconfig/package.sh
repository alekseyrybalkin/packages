#!/bin/sh

pkgname=fontconfig
pkgver=2.13.1
ARCH_VERSION=2.13.1+12+g5f5ec56
vcs=git
gittag=${pkgver}
# rc versions
#relmon_id=827

kiin_make() {
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --docdir=/usr/share/doc/${pkgname} \
        --disable-docs \
        --disable-static \
        --with-default-fonts=/usr/share/fonts \
        --with-add-fonts=/usr/share/fonts \
        --with-templatedir=/etc/fonts/conf.avail \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}

kiin_after_install() {
    fc-cache -rs > /dev/null
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/share/fonts/TTF/.uuid \
    usr/share/fonts/X11/encodings/.uuid \
    usr/share/fonts/X11/.uuid \
    usr/share/fonts/.uuid \
    usr/share/fonts/TTF/fonts.scale \
    usr/share/fonts/TTF/fonts.dir"
