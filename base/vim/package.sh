#!/bin/sh

pkgname=vim
pkgver=8.0.0002
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    echo 'set viminfo=' >> runtime/defaults.vim
    sed -i -e 's/set scrolloff=5/set scrolloff=0/g' runtime/defaults.vim
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
    ./configure --prefix=/usr \
        --enable-multibyte \
        --with-x=no \
        --disable-gui \
        --with-compiledby=kiin
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    ln -sv vim ${pkgdir}/usr/bin/vi
    for L in  ${pkgdir}/usr/share/man/{,*/}man1/vim.1; do
        ln -sv vim.1 $(dirname $L)/vi.1
    done
    mkdir -pv ${pkgdir}/usr/share/doc
    ln -sv ../vim/vim74/doc ${pkgdir}/usr/share/doc/vim
    mkdir -pv ${pkgdir}/etc
}
