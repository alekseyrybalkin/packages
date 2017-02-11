#!/bin/sh

pkgname=python
_pybasever=3.6
pkgver=${_pybasever}.0
vcs=git
gittag=v${pkgver}
srcdir=${location}/Python-${pkgver}

kiin_make() {
    MAKEFLAGS=
    rm -rf .github .git .gitignore .bzrignore .hgeol .hgignore .hgtags .hgtouch
    rm -r Modules/expat
    rm -r Modules/zlib
    rm -r Modules/_ctypes/{darwin,libffi}*
    CXX="/usr/bin/g++" \
    ./configure --prefix=/usr \
        --enable-shared \
        --with-system-expat \
        --with-system-ffi \
        --without-ensurepip
    make
    cd Doc
    make html
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
    ln -s python3               ${pkgdir}/usr/bin/python
    ln -s python3-config        ${pkgdir}/usr/bin/python-config
    ln -s idle3                 ${pkgdir}/usr/bin/idle
    ln -s pydoc3                ${pkgdir}/usr/bin/pydoc
    ln -s python${_pybasever}.1 ${pkgdir}/usr/share/man/man1/python.1
    mkdir -p ${pkgdir}/usr/share/doc/python
    cp -r Doc/build/html ${pkgdir}/usr/share/doc/python
}
