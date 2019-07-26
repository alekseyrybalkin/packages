#!/bin/sh

pkgname=findutils
pkgver=4.6.0
vcs=git
gittag=v${pkgver}
relmon_id=812

build() {
    export DO_NOT_WANT_CHANGELOG_DRIVER=1
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po

    sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
    sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
    echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h

    ./configure --prefix=/usr \
        --libexecdir=/usr/lib/findutils \
        --build=x86_64-unknown-linux-gnu \
        --localstatedir=/var/lib/locate
    make
}

package() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}
