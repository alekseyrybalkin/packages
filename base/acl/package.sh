pkgname=acl
pkgver=2.2.53
vcs=git
gittag=v${pkgver}
relmon_id=16
relmon_sed='s/\.src//g'

build() {
    sed -i -e 's/po//g' Makefile.am
    sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
        libacl/__acl_to_any_text.c
    libtoolize -i
    autoreconf -f -i
    INSTALL_USER=root INSTALL_GROUP=root ./configure --prefix=/usr \
        --libdir=/usr/lib \
        --sysconfdir=/etc \
        --bindir=/usr/bin \
        --disable-static \
        --libexecdir=/usr/lib
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
