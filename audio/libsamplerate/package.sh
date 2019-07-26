#!/bin/sh

pkgname=libsamplerate
pkgver=0.1.9
vcs=git
#FIXME no tag
gittag=f6730d03c3e7660bb6ecad8816f1b09c5825142a
relmon_id=1716

build() {
    sed -i -e 's/\-\-enable\-gcc-werror //g' autogen.sh
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
