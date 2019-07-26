pkgname=alsa-lib
pkgver=1.1.9
vcs=git
gittag=v${pkgver}
relmon_id=38

build() {
    autoreconf -fi
    ./configure --libdir=$LIBDIR --disable-python
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
