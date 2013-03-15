#!/bin/sh

pkgname=bash
_patchlevel=045
pkgver="4.2.$_patchlevel"
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-4.2.tar.gz"
if [ $_patchlevel -gt 000 ]; then
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    urls="$urls http://ftp.gnu.org/gnu/bash/bash-4.2-patches/bash42-$(printf "%03d" $p)"
  done
fi
srctar=${pkgname}-4.2.tar.gz
srcdir=${location}/${pkgname}-4.2

kiin_make() {
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    patch -Np0 -i ../bash42-$(printf "%03d" $p)
  done
  ./configure --prefix=/usr                     \
              --bindir=/bin                     \
              --htmldir=/usr/share/doc/bash-4.2 \
              --without-bash-malloc             \
              --with-installed-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/bin
  ln -sv bash ${pkgdir}/bin/sh
}
