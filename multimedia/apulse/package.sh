#!/bin/sh

pkgname=apulse
SKIP_ARCH_CHECK=1
pkgver=0.1.2
urls="https://github.com/i-rinat/apulse/archive/v$pkgver.tar.gz"
srctar=v${pkgver}.tar.gz
srcdir=${location}/apulse-${pkgver}

kiin_make() {
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
  if [ -n "${KIIN_LIB32}" ]; then
    mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
  fi
  cp ${pkgdir}/usr/bin/apulse{,32}
  sed -i 's:usr/lib/apulse:usr/lib32/apulse:' ${pkgdir}/usr/bin/apulse32
}
