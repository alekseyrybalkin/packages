pkgname=cups
pkgver=2.2.11
vcs=git
gittag=v${pkgver}
relmon_id=380

build() {
    sed -i 's:444:644:' Makedefs.in
    sed -i '/MAN.EXT/s:.gz::' configure config-scripts/cups-manpages.m4

    export CFLAGS="${CFLAGS} -Wno-format-truncation -Wno-maybe-uninitialized"
    export CXXFLAGS=${CFLAGS}

    aclocal -I config-scripts
    autoconf -I config-scripts
    CC=gcc CXX=g++ ./configure --with-rcdir=/tmp/cupsinit \
        --with-docdir=/usr/share/cups/doc \
        --with-system-groups=lpadmin \
        --libdir=${LIBDIR}
    make
}

package() {
    make BUILDROOT=${pkgdir} install-headers install-libs
    mkdir ${pkgdir}/usr/bin
    echo '#!/bin/bash' > ${pkgdir}/usr/bin/cups-config
    echo "echo -lcups -lz -lpthread -lm -lcrypt -lz" >> ${pkgdir}/usr/bin/cups-config
    chmod +x ${pkgdir}/usr/bin/cups-config
}
