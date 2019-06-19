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
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/dbus-1.0 \
        runstatedir=/run \
        --with-console-auth-dir=/run/console/ \
        --with-system-pid-file=/run/dbus/pid \
        --with-system-socket=/run/dbus/system_bus_socket \
        --enable-inotify \
        --enable-systemd \
        --enable-user-session \
        --disable-static \
        --disable-verbose-mode \
        --disable-asserts \
        --disable-tests \
        --disable-checks \
        --without-x \
        --disable-Werror \
        --disable-doxygen-docs \
        --disable-xml-docs \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/var
}

kiin_after_install() {
    if [ ! -f /var/lib/dbus/machine-id ]; then
        ln -sfv /etc/machine-id /var/lib/dbus/machine-id
    fi
}

kiin_after_upgrade() {
    kiin_after_install
}
