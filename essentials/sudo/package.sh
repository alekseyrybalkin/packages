#!/bin/sh

pkgname=sudo
pkgver=1.8.8
extension=gz
folder="http://www.sudo.ws/${pkgname}/dist/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/sudo \
    --docdir=/usr/share/doc/${pkgname} \
    --with-all-insults \
    --with-env-editor \
    --without-pam \
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
