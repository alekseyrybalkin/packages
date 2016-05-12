#!/bin/sh

pkgname=attr
pkgver=2.4.47
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://download.savannah.gnu.org/releases/${pkgname}/"
check_server=1

srctar=${pkgname}-${pkgver}.src.tar.${extension}

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-.*\.src\.tar\.${extension}$"
ver_seds() {
    sed -r "s/^${pkgname}-//g" | sed -r "s/\.src\.tar\.${extension}$//g"
}

kiin_make() {
    sed -i -e "/SUBDIRS/s|man2||" man/Makefile
    libtoolize -i
    autoreconf -f -i
    echo "#include <libintl.h>" >> include/config.h.in
    echo "#define _(x) gettext(x)" >> include/config.h.in
    INSTALL_USER=root INSTALL_GROUP=root ./configure --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DIST_ROOT=${pkgdir} install install-dev install-lib
    chmod -v 755 ${pkgdir}/usr/lib/libattr.so
}
