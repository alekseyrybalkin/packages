pkgname=libxml
ARCH_NAME=libxml2
pkgver=2.9.9
vcs=git
vcs_pkgname=libxml2
gittag=v${pkgver}
relmon_id=1783

build() {
    ./autogen.sh --prefix=/usr \
        --disable-static \
        --with-history \
        --with-python=/usr/bin/python
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
