#!/bin/sh

pkgname=ruby
pkgver=2.4.1
vcs=git
gittag=v${pkgver//\./_}
relmon_id=4223
extra_urls="http://www.unicode.org/Public/9.0.0/ucd/UnicodeData.txt \
    http://www.unicode.org/Public/9.0.0/ucd/CompositionExclusions.txt \
    http://www.unicode.org/Public/9.0.0/ucd/NormalizationTest.txt \
    http://www.unicode.org/Public/9.0.0/ucd/CaseFolding.txt \
    http://www.unicode.org/Public/9.0.0/ucd/SpecialCasing.txt"

kiin_make() {
    cp ../config.guess tool/
    cp ../config.sub tool/
    mkdir -p enc/unicode/data/9.0.0/
    cp ${KIIN_HOME}/tarballs/UnicodeData.txt enc/unicode/data/9.0.0/
    cp ${KIIN_HOME}/tarballs/CompositionExclusions.txt enc/unicode/data/9.0.0/
    cp ${KIIN_HOME}/tarballs/NormalizationTest.txt enc/unicode/data/9.0.0/
    cp ${KIIN_HOME}/tarballs/CaseFolding.txt enc/unicode/data/9.0.0/
    cp ${KIIN_HOME}/tarballs/SpecialCasing.txt enc/unicode/data/9.0.0/
    autoreconf -f -i
    PKG_CONFIG=/usr/bin/pkg-config ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sharedstatedir=/var/lib \
        --libexecdir=/usr/lib/ruby \
        --enable-shared \
        --disable-rpath \
        --with-dbm-type=gdbm_compat
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install-nodoc
}
