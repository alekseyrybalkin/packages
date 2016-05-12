#!/bin/sh

pkgname=libffi
pkgver=3.2.1
vcs=git
gittag=v${pkgver}
extension=gz
folder="ftp://sourceware.org/pub/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[^-rc]*\.tar\.${extension}$"

kiin_make() {
    ./autogen.sh
    # Make package install headers into /usr/include instead of /usr/lib/libffi-${pkgver}/include
    sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' -i include/Makefile.in
    sed -e '/^includedir/ s/=.*$/=@includedir@/' -e 's/^Cflags: -I${includedir}/Cflags:/' -i libffi.pc.in
    ./configure --prefix=/usr \
        --disable-static \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    if [ -z "${KIIN_LIB32}" ]; then
        mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib/
        rmdir ${pkgdir}/usr/lib64
    fi
}
