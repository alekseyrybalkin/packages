#!/bin/sh

pkgname=fontconfig
pkgver=2.10.1
urls="http://${pkgname}.org/release/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --docdir=/usr/share/doc/${pkgname}-${pkgver} \
      --disable-docs \
      --disable-static
  else
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --docdir=/usr/share/doc/${pkgname}-${pkgver} \
      --disable-docs \
      --disable-static \
      --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
  if [ -n "$KIIN_LIB32" ]; then
    rm -rf "${pkgdir}"/{usr/{include,share,bin},etc}
  fi
}
