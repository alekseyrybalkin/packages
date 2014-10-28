#!/bin/sh

pkgname=pulseaudio
ARCH_NAME_LIB32=pulseaudio
pkgver=5.0
urls="http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  find . -name "Makefile.in" | xargs sed -i "s|(libdir)/@PACKAGE@|(libdir)/pulse|"
  if [ -n "${KIIN_LIB32}" ]; then
    ADDITIONAL_OPTS="--disable-default-build-tests --disable-tcpwrap --libexecdir=/usr/lib32 --without-caps"
  fi
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-bluez4 \
    --disable-rpath \
    --with-udev-rules-dir=${LIBDIR}/udev/rules.d \
    --with-module-dir=${LIBDIR}/pulse/modules \
    ${ADDITIONAL_OPTS} \
    --libdir=${LIBDIR}
  if [ -n "${KIIN_LIB32}" ]; then
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  fi
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
  rm ${pkgdir}/etc/dbus-1/system.d/pulseaudio-system.conf
  sed '/load-module module-console-kit/s/^/#/' -i ${pkgdir}/etc/pulse/default.pa
  if [ -z "${KIIN_LIB32}" ]; then
    chmod 700 ${pkgdir}/usr/bin/*
    chown skype:skype ${pkgdir}/usr/bin/*
  fi
}
