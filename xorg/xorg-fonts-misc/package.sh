#!/bin/sh

pkgname=xorg-fonts-misc
pkgver=1.0.3
url="http://xorg.freedesktop.org/"
urls="${url}/releases/individual/font/font-arabic-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-cursor-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-daewoo-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-dec-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-isas-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-jis-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-micro-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-misc-misc-1.1.2.tar.bz2 \
  ${url}/releases/individual/font/font-mutt-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-schumacher-misc-1.1.2.tar.bz2 \
  ${url}/releases/individual/font/font-sony-misc-${pkgver}.tar.bz2 \
  ${url}/releases/individual/font/font-sun-misc-${pkgver}.tar.bz2"
#srctar=${_pkgname}-${pkgver}.tar.bz2
#srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
  mkdir build
  cd build
  for i in ${KIIN_HOME}/tarballs/font-{arabic,cursor,daewoo,dec,isas,jis,micro,mutt,sony,sun}-misc-${pkgver}.tar.bz2 \
    ${KIIN_HOME}/tarballs/font-misc-misc-1.1.2.tar.bz2 \
    ${KIIN_HOME}/tarballs/font-schumacher-misc-1.1.2.tar.bz2; do
    tar xvf $i
  done
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      ./configure $XORG_CONFIG
      make
      popd
    fi
  done
  cd ..
}

kiin_install() {
  cd build
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      make DESTDIR=${pkgdir} install
      popd
    fi
  done
  cd ..
  rm -rf build
}
