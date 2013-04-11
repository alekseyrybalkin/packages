#!/bin/sh

pkgname=ntp
pkgver=4.2.6p5
urls="http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-binsubdir=sbin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  getent group ntp >/dev/null || groupadd -g 87 ntp
  getent passwd ntp >/dev/null || \
    useradd -c 'Network Time Protocol' -d /var/lib/ntp -g ntp \
    -s /bin/false -u 87 ntp
}

kiin_after_upgrade() {
  kiin_after_install
}
