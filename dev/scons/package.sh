#!/bin/sh

pkgname=scons
pkgver=2.3.0
urls="http://downloads.sourceforge.net/scons/scons-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  python setup.py install --standard-lib \
    --prefix=/usr \
    --install-data=/usr/share \
    --optimize=1 \
    --root=${pkgdir}
}
