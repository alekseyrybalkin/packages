#!/bin/sh

pkgname=cups
pkgver=2.2.6
vcs=git
gittag=v${pkgver}
urls="http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2"
srctar=cups-${pkgver}-source.tar.bz2
relmon_id=380

kiin_make() {
    sed -i 's:555:755:g;s:444:644:g' Makedefs.in
    sed -i '/MAN.*.EXT/s:.gz::g' \
        configure config-scripts/cups-manpages.m4
    sed -i '/LIBGCRYPTCONFIG/d' config-scripts/cups-ssl.m4
    sed -i 's@else /\* HAVE_AVAHI \*/@elif defined(HAVE_AVAHI)@' \
        test/ippserver.c
    aclocal -I config-scripts
    autoconf -I config-scripts
    CC=gcc ./configure --with-rcdir=/tmp/cupsinit \
        --with-docdir=/usr/share/cups/doc \
        --with-system-groups=lpadmin \
        --disable-systemd \
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
