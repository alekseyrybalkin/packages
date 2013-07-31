#!/bin/sh

pkgname=avahi
pkgver=0.6.31
urls="http://avahi.org/download/avahi-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-mono \
    --disable-monodoc \
    --disable-python \
    --disable-qt3 \
    --disable-qt4 \
    --enable-core-docs \
    --disable-dbus \
    --with-distro=none
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}

kiin_after_install() {
  getent group avahi >/dev/null || groupadd -g 84 avahi
  getent passwd avahi >/dev/null || \
    useradd -c 'Awahi Daemon Owner' -d /var/run/avahi-daemon -g avahi \
    -s /bin/false -u 84 avahi
  getent group netdev >/dev/null || groupadd -g 86 netdev
}

kiin_after_upgrade() {
  kiin_after_install
}
