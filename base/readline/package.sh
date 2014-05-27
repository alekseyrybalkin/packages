#!/bin/sh

pkgname=readline
_basever=6.3
_patchlevel=006
pkgver="${_basever}.${_patchlevel}"
urls="http://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"
if [ ${_patchlevel} -gt 000 ]; then
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    urls="${urls} http://ftp.gnu.org/gnu/readline/readline-${_basever}-patches/readline${_basever//.}-$(printf "%03d" $p)"
  done
fi
srctar=${pkgname}-${_basever}.tar.gz
srcdir=${location}/${pkgname}-${_basever}

kiin_make() {
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    patch -Np0 -i ${KIIN_HOME}/tarballs/readline${_basever//.}-$(printf "%03d" $p)
  done
  sed -i '/MV.*old/d' Makefile.in
  sed -i '/{OLDSUFF}/c:' support/shlib-install
  ./configure --prefix=/usr --libdir=${LIBDIR}
  make SHLIB_LIBS=-lncurses
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/share/doc/readline
  install -v -m644 doc/*.{ps,pdf,html,dvi} \
    ${pkgdir}/usr/share/doc/readline
}
