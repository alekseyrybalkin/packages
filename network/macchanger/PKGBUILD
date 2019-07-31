pkgname=macchanger
pkgver=1.7.0
vcs=git
gittag=${pkgver}
relmon_id=1873

build() {
    patch -Np1 -i ../0001-don-t-use-hwrng.patch
    ./autogen.sh
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
