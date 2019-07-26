pkgname=w3m
pkgver=0.5.3+git20190105
vcs=git
gittag=v${pkgver}
relmon_id=5115

build() {
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --enable-image=no \
        --with-termlib=ncurses \
        --disable-w3mmailer
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
