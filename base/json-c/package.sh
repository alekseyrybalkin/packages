pkgname=json-c
pkgver=0.13.1
vcs=git
gittag=json-c-${pkgver}-20180305
relmon_id=1477

build() {
    autoreconf -fi
    sed -i s/-Werror// Makefile.in
    ./configure --prefix=/usr \
        --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
