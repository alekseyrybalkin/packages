pkgname=iproute
ARCH_NAME=iproute2
vcs=git
pkgver=5.1.0
gittag=v${pkgver}
relmon_id=1392

build() {
    sed -i /ARPD/d Makefile
    sed -i 's/arpd.8//' man/man8/Makefile
    ./configure --prefix=/usr
    sed -i -e '/HAVE_BERKELEY_DB:=y/d' config.mk
    make DESTDIR=
}

package() {
    make DESTDIR=${pkgdir} \
        MANDIR=/usr/share/man \
        DOCDIR=/usr/share/doc/${pkgname} install
    mv ${pkgdir}/{sbin,usr/bin}
}
