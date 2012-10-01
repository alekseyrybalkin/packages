#!/bin/sh

pkgname=openssh
pkgver=6.1p1
urls="http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
              --sysconfdir=/etc/ssh \
              --datadir=/usr/share/sshd \
              --with-md5-passwords \
              --with-privsep-path=/var/lib/sshd
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  install -v -m644 INSTALL LICENCE OVERVIEW README* \
      ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
  # do not replace sshd_config, since it is in git repo now
  mv -v ${pkgdir}/etc/ssh/sshd_config{,.packaged}
}
