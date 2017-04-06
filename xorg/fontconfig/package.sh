#!/bin/sh

pkgname=fontconfig
pkgver=2.12.1
vcs=git
git_repo=git://anongit.freedesktop.org/fontconfig
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=827

kiin_make() {
    git apply ../fc-blanks.diff
    git cherry-pick 1ab5258f7c2abfafcd63a760ca08bf93591912da
    git cherry-pick 9878b306f6c673d3d6cd9db487f67eb426cc03df
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
