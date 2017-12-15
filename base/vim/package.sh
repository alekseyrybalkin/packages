#!/bin/sh

pkgname=vim
pkgver=8.0.1390
vcs=git
gittag=v${pkgver}
relmon_id=5092

kiin_make() {
    echo 'set viminfo=' >> runtime/defaults.vim
    sed -i -e 's/set scrolloff=5/set scrolloff=0/g' runtime/defaults.vim
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
    ./configure --prefix=/usr \
        --enable-multibyte \
        --with-x=no \
        --disable-gui \
        --with-compiledby=kiin \
        --enable-python3interp=dynamic
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    ln -sv vim ${pkgdir}/usr/bin/vi
    mkdir -pv ${pkgdir}/usr/share/doc
    ln -sv ../vim/vim80/doc ${pkgdir}/usr/share/doc/vim
    mkdir -pv ${pkgdir}/etc
}
