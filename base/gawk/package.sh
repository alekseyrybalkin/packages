pkgname=gawk
pkgver=5.0.1
vcs=git
gittag=gawk-${pkgver}
relmon_id=868

build() {
    MAKEFLAGS=
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --libexecdir=/usr/lib
    make
}

package() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
    mkdir -p -v ${pkgdir}/usr/share/doc/gawk
    cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} ${pkgdir}/usr/share/doc/gawk
    rm -rf ${pkgdir}/usr/etc
}
