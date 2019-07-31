pkgname=libuv
pkgver=1.30.1
vcs=git
gittag=v${pkgver}
relmon_id=10784

build() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
    make man -C docs
}

package() {
    make DESTDIR=${pkgdir} install
    install -Dm644 docs/build/man/libuv.1 \
        ${pkgdir}/usr/share/man/man1/libuv.1
}
