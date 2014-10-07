#!/bin/sh

pkgname=emacs
pkgver=24.3
urls="http://ftp.gnu.org/pub/gnu/emacs/emacs-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --with-gif=no \
    --localstatedir=/var \
    --libexecdir=/usr/lib
  make bootstrap
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/var
  chown -v -R root:root ${pkgdir}/usr/share/emacs/${pkgver}
}

kiin_after_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

kiin_after_upgrade() {
  kiin_after_install
}
