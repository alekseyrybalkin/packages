#!/bin/sh

pkgname=firefox
pkgver=48.0.2
vcs=mercurial
vcs_pkgname=firefox-release
hgtag=FIREFOX_${pkgver//\./_}_RELEASE
urls="https://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.xz"
srctar=${pkgname}-${pkgver}.source.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    rm -rf .hg .hgignore .hgtags
    cp ../mozconfig .
    patch -Np1 -i ../firefox-gtk3-20.patch

    sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
    echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig

    # WebRTC build tries to execute "python" and expects Python 2
    mkdir path
    ln -s /usr/bin/python2 "$srcdir/path/python"

    # gcc6
    CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

    make -f client.mk
}

kiin_install() {
    make -C firefox-build-dir DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
    mv ${pkgdir}/usr/lib/firefox{-${pkgver},}
    ln -sfv ../lib/firefox/firefox ${pkgdir}/usr/bin
    rm ${pkgdir}/usr/lib/firefox-devel-${pkgver}/bin
    ln -sfv /usr/lib/firefox ${pkgdir}/usr/lib/firefox-devel-${pkgver}/bin
}
