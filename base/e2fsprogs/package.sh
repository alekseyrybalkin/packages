#!/bin/sh

pkgname=e2fsprogs
pkgver=1.45.2
vcs=git
gittag=v${pkgver}
relmon_id=646

build() {
    mkdir -v build
    cd build
    ../configure --prefix=/usr \
        --with-root-prefix="" \
        --enable-elf-shlibs \
        --disable-libblkid \
        --disable-libuuid \
        --disable-uuidd \
        --sbindir=/usr/bin \
        --libdir=/usr/lib \
        --build=x86_64-unknown-linux-gnu \
        --disable-fsck
    make
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-libs
    chmod -v u+w ${pkgdir}/usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
    gunzip -v ${pkgdir}/usr/share/info/libext2fs.info.gz
    makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
    install -v -m644 doc/com_err.info ${pkgdir}/usr/share/info
}
