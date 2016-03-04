#!/bin/sh

pkgname=dbus-core
ARCH_NAME=dbus
ARCH_NAME_LIB32=lib32-libdbus
pkgver=1.10.6
urls="http://dbus.freedesktop.org/releases/dbus/dbus-${pkgver}.tar.gz"
srctar=dbus-${pkgver}.tar.gz
srcdir=${location}/dbus-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=81 \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify --disable-dnotify \
      --disable-verbose-mode --disable-static \
      --disable-tests --disable-asserts \
      --disable-systemd --without-x --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -f ${pkgdir}/usr/bin/dbus-launch
  rm -f ${pkgdir}/usr/share/man/man1/dbus-launch.1
  rm -rf ${pkgdir}/var
  sed -i -e 's|<user>81</user>|<user>dbus</user>|' ${pkgdir}/etc/dbus-1/system.conf
  if [ -z "$KIIN_LIB32" ]; then
    chmod 640 ${pkgdir}/usr/lib/dbus-1.0/dbus-daemon-launch-helper
    chmod -x ${pkgdir}/usr/bin/dbus-{send,daemon,monitor,cleanup-sockets,uuidgen,run-session}
    chown root:root ${pkgdir}/usr/lib/dbus-1.0/dbus-daemon-launch-helper
  else
    rm -rf ${pkgdir}/usr/lib
  fi
}

kiin_after_install() {
  chmod +x /usr/bin/dbus-uuidgen
  dbus-uuidgen > /etc/machine-id
  chmod -x /usr/bin/dbus-uuidgen
}

kiin_after_upgrade() {
  kiin_after_install
}

known="etc/machine-id"
