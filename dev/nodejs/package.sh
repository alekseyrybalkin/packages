#!/bin/sh

pkgname=nodejs
pkgver=0.10.28
urls="http://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz"
srctar=node-v${pkgver}.tar.gz
srcdir=${location}/node-v${pkgver}

kiin_make() {
  ./configure \
    --prefix=/usr \
    --shared-openssl
  make
}

kiin_install() {
  make DESTDIR="$pkgdir" install

  # install docs as per user request
  install -d "$pkgdir"/usr/share/doc/nodejs
  cp -r doc/api/{*.html,assets} \
    "$pkgdir"/usr/share/doc/nodejs

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE

  # Why the hell wasn't this installed?! FS#40221
  ln -s /usr/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js "$pkgdir"/usr/bin/node-gyp
}
