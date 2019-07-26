pkgname=attr
pkgver=2.4.48
vcs=git
gittag=v${pkgver}
relmon_id=137
relmon_sed='s/\.src//g'

build() {
    sed -i -e 's/po//g' Makefile.am
    libtoolize -i
    autoreconf -f -i
    INSTALL_USER=root INSTALL_GROUP=root ./configure --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --sysconfdir=/etc \
        --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
