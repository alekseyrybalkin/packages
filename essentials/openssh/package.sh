#!/bin/sh

pkgname=openssh
pkgver=6.0p1
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  #groupadd -g 50 sshd
  #useradd -c 'sshd PrivSep' -d /var/lib/sshd -g sshd \
  #    -s /bin/false -u 50 sshd
  ./configure --prefix=/usr \
              --sysconfdir=/etc/ssh \
              --datadir=/usr/share/sshd \
              --with-md5-passwords \
              --with-privsep-path=/var/lib/sshd
  make
}

kiin_install() {
  # do we need these two lines?
  install -v -m700 -d ${pkgdir}/var/lib/sshd
  chown -v root:sys ${pkgdir}/var/lib/sshd

  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/openssh-6.0p1
  install -v -m644 INSTALL LICENCE OVERVIEW README* \
      ${pkgdir}/usr/share/doc/openssh-6.0p1
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
