pkgname=elfutils
pkgver=0.176
vcs=git
gittag=elfutils-${pkgver}
relmon_id=5679

build() {
    autoreconf -fi
    ./configure --prefix=/usr \
        --program-prefix="eu-" \
        --enable-deterministic-archives \
        --enable-maintainer-mode
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
