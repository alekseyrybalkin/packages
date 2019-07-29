pkgname=nodejs
pkgver=12.7.0
vcs=git
gittag=v${pkgver}
relmon_id=8251

build() {
    find -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;
    find test/ -type f -exec sed 's_python _python2 _' -i {} \;

    export PYTHON=python2

    ./configure --prefix=/usr \
        --shared-zlib \
        --shared-libuv \
        --with-intl=small-icu
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
