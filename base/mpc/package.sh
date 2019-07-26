pkgname=mpc
ARCH_NAME=libmpc
pkgver=1.1.0
vcs=git
gittag=${pkgver}
relmon_id=1667

build() {
    autoreconf -fi
    ./configure --prefix=/usr \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --docdir=/usr/share/doc/mpc
    make
    make html
}

package() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install html
}
