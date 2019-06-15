#!/bin/sh

pkgname=dbus
pkgver=1.12.16
vcs=git
gittag=dbus-${pkgver}
urls="http://dbus.freedesktop.org/releases/dbus/dbus-${pkgver}.tar.gz"
srctar=dbus-${pkgver}.tar.gz
# development versions
#relmon_id=5356

kiin_make() {
    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=81 \
        --with-system-pid-file=/run/dbus/pid \
        --with-system-socket=/run/dbus/system_bus_socket \
        --with-console-auth-dir=/run/console/ \
        --enable-inotify --disable-dnotify \
        --disable-verbose-mode --disable-static \
        --disable-tests --disable-asserts \
        --without-x --disable-Werror \
        --disable-doxygen-docs --disable-xml-docs \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/var
    sed -i -e 's|<user>81</user>|<user>dbus</user>|' ${pkgdir}/etc/dbus-1/system.conf
}

kiin_after_install() {
    if [ ! -f /var/lib/dbus/machine-id ]; then
        ln -sfv /etc/machine-id /var/lib/dbus/machine-id
    fi
}

kiin_after_upgrade() {
    kiin_after_install
}
