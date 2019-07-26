pkgname=pinentry
pkgver=1.1.0
vcs=git
gittag=pinentry-${pkgver}
relmon_id=3643

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-pinentry-gtk2=no \
        --enable-pinentry-gnome3=no \
        --build=x86_64-unknown-linux-gnu \
        --enable-maintainer-mode
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
