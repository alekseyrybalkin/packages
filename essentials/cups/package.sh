#!/bin/sh

pkgname=cups
#FIXME
pkgver=2.3b4
vcs=git
gittag=v${pkgver}
urls="http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2"
srctar=cups-${pkgver}-source.tar.bz2
relmon_id=380

kiin_make() {
    sed -i 's:444:644:' Makedefs.in
    sed -i '/MAN.*.EXT/s:.gz::g' configure config-scripts/cups-manpages.m4
    sed -i 's@else /\* HAVE_AVAHI \*/@elif defined(HAVE_AVAHI)@' test/ippserver.c
    patch -Np1 -i ../cups-no-export-ssllibs.patch

    aclocal -I config-scripts
    autoconf -I config-scripts
    CC=gcc ./configure --with-rcdir=/tmp/cupsinit \
        --with-docdir=/usr/share/cups/doc \
        --with-system-groups=lpadmin \
        --disable-systemd \
        --disable-pam \
        --libdir=${LIBDIR}
    make
}

kiin_install() {
    make BUILDROOT=${pkgdir} install-headers install-libs
    mkdir ${pkgdir}/usr/bin
    echo '#!/bin/bash' > ${pkgdir}/usr/bin/cups-config
    echo "echo -lcups -lz -lpthread -lm -lcrypt -lz" >> ${pkgdir}/usr/bin/cups-config
    chmod +x ${pkgdir}/usr/bin/cups-config
}
