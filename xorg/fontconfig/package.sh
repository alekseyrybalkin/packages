#!/bin/sh

pkgname=fontconfig
pkgver=2.13.0
vcs=git
git_repo=git://anongit.freedesktop.org/fontconfig
gittag=${pkgver}
relmon_id=827

undead_make() {
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

undead_install() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}

undead_after_install() {
    fc-cache -rs > /dev/null
}

undead_after_upgrade() {
    undead_after_install
}
