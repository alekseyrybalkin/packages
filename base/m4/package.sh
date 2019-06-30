#!/bin/sh

pkgname=m4
pkgver=1.4.18
vcs=git
gittag=v${pkgver}
relmon_id=1871

kiin_make() {
    export CFLAGS="${CFALGS} -Wno-attributes -Wno-abi -Wimplicit-fallthrough=0"

    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po

    sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
    echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make prefix=${pkgdir}/usr install
}
