#!/bin/sh

pkgname=glib
ARCH_NAME=glib2
majorver=2.60
pkgver=${majorver}.5
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
# development versions
#relmon_id=10024

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

kiin_make() {
    mkdir build
    cd build

    meson --prefix=/usr \
        -Dman=true \
        -Dselinux=disabled \
        ..
    ninja
}

kiin_install() {
    cd build
    DESTDIR=${pkgdir} meson install
    python -m compileall -d /usr/share/glib-2.0/codegen ${pkgdir}/usr/share/glib-2.0/codegen
    python -O -m compileall -d /usr/share/glib-2.0/codegen ${pkgdir}/usr/share/glib-2.0/codegen
}
