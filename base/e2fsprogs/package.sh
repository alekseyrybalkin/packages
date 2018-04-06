#!/bin/sh

pkgname=e2fsprogs
pkgver=1.44.1
vcs=git
gittag=v${pkgver}
relmon_id=646

kiin_make() {
    MAKEFLAGS=
    sed -e '/int.*old_desc_blocks/s/int/blk64_t/' \
        -e '/if (old_desc_blocks/s/super->s_first_meta_bg/desc_blocks/' \
        -i lib/ext2fs/closefs.c
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

kiin_install() {
    MAKEFLAGS=
    cd build
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-libs
    chmod -v u+w ${pkgdir}/usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
    gunzip -v ${pkgdir}/usr/share/info/libext2fs.info.gz
    makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
    install -v -m644 doc/com_err.info ${pkgdir}/usr/share/info
}
