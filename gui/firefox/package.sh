#!/bin/sh

pkgname=firefox
_pkgbase=51.0
pkgver=${_pkgbase}
vcs=mercurial
vcs_pkgname=firefox-release
hgtag=FIREFOX_${pkgver//\./_}_RELEASE
urls="https://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.xz"
srctar=${pkgname}-${pkgver}.source.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    rm -rf .hg .hgignore .hgtags
    cp ../mozconfig .

    # fix for sed 4.3 / autoconf
    sed -i -e 's/\[\[:space:\]\]/\\\ /g' build/autoconf/icu.m4

    sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
    echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig

    # WebRTC build tries to execute "python" and expects Python 2
    mkdir path
    ln -s /usr/bin/python2 "$srcdir/path/python"

    # gcc6
    CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-schedule-insns2"

    make -f client.mk
}

kiin_install() {
    make -C firefox-build-dir DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
    mv ${pkgdir}/usr/lib/firefox{-${_pkgbase},}
    ln -sfv ../lib/firefox/firefox ${pkgdir}/usr/bin
    rm ${pkgdir}/usr/lib/firefox-devel-${_pkgbase}/bin
    ln -sfv /usr/lib/firefox ${pkgdir}/usr/lib/firefox-devel-${_pkgbase}/bin
}
