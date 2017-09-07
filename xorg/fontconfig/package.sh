#!/bin/sh

pkgname=fontconfig
pkgver=2.12.4
vcs=git
git_repo=git://anongit.freedesktop.org/fontconfig
gittag=${pkgver}
relmon_id=827

kiin_make() {
    patch -Np1 -i ../fc-blanks.diff
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
