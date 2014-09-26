#!/bin/sh

pkgname=bash
_basever=4.3
_patchlevel=025
pkgver="${_basever}.$_patchlevel"
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${_basever}.tar.gz"
if [ ${_patchlevel} -gt 000 ]; then
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    urls="${urls} http://ftp.gnu.org/gnu/bash/bash-${_basever}-patches/bash${_basever//.}-$(printf "%03d" $p)"
  done
fi
srctar=${pkgname}-${_basever}.tar.gz
srcdir=${location}/${pkgname}-${_basever}

kiin_make() {
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    patch -Np0 -i ${KIIN_HOME}/tarballs/bash${_basever//.}-$(printf "%03d" $p)
  done
  ./configure --prefix=/usr \
              --htmldir=/usr/share/doc/bash \
              --without-bash-malloc \
              --with-installed-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv bash ${pkgdir}/usr/bin/sh
}
