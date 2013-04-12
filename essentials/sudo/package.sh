#!/bin/sh

pkgname=sudo
pkgver=1.8.6p8
urls="http://www.${pkgname}.ws/${pkgname}/dist/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr                   \
              --libexecdir=/usr/lib/sudo      \
              --docdir=/usr/share/doc/${pkgname}-${pkgver} \
              --with-all-insults              \
              --with-env-editor               \
              --without-pam                   \
              --without-sendmail
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # do not replace /etc/sudoers, since it is in git repo now
  mv -v ${pkgdir}/etc/sudoers{,.packaged}
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
