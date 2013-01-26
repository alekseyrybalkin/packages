#!/bin/sh

pkgname=pulseaudio
pkgver=3.0
urls=" http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  find . -name "Makefile.in" | xargs sed -i "s|(libdir)/@PACKAGE@|(libdir)/pulse|"
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --with-module-dir=/usr/lib/pulse/modules
  else
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib32 \
      --disable-udev \
      --disable-tcpwrap \
      --disable-rpath \
      --disable-default-build-tests \
      --disable-openssl \
      --libdir=$LIBDIR
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  fi
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  getent group pulse >/dev/null || groupadd -g 58 pulse
  getent group pulse-access >/dev/null || groupadd -g 59 pulse-access
  getent passwd pulse >/dev/null || {
    useradd -c "Pulseaudio User" -d /var/run/pulse -g pulse \
      -s /bin/false -u 58 pulse
    usermod -a -G audio pulse
  }
}

kiin_after_upgrade() {
  kiin_after_install
}
