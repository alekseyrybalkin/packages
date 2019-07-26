#!/bin/sh

pkgname=subversion
pkgver=1.12.2
vcs=git
gittag=${pkgver}
relmon_id=4905

build() {
    MAKEFLAGS=
    export PYTHON=/usr/bin/python2
    ./autogen.sh
    ./configure --prefix=/usr \
        --with-apr=/usr \
        --with-apr-util=/usr \
        --with-zlib=/usr \
        --with-serf=/usr \
        --with-sqlite=/usr \
        --disable-static \
        --with-lz4=internal \
        --with-utf8proc=internal \
        --enable-experimental-libtool
    make local-all
    mkdir -p subversion/bindings/swig/proxy
    make swig-pl
}

package() {
    MAKEFLAGS=
    export LD_LIBRARY_PATH=${pkgdir}/usr/lib:${LD_LIBRARY_PATH}
    make DESTDIR=${pkgdir} install
    install -v -m755 -d ${pkgdir}/usr/share/doc/subversion-${pkgver}
    cp -v -R doc/* ${pkgdir}/usr/share/doc/subversion-${pkgver}
    make DESTDIR=${pkgdir} install-swig-pl
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
