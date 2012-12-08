#!/bin/sh

pkgname=vim
vcs="mercurial"
hgtag="52bfa939fc07"
pkgver=7.3.754
srcdir=${location}/${pkgname}73

kiin_make() {
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
  ln -sv ../vim/vim73/doc ${pkgdir}/usr/share/doc/vim-7.3
  mkdir -pv ${pkgdir}/etc
}
