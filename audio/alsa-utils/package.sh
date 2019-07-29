pkgname=alsa-utils
pkgver=1.1.9
vcs=git
gittag=v${pkgver}
relmon_id=37

build() {
    autoreconf -fi
    ./configure --disable-alsaconf --disable-xmlto --disable-bat \
        --sbindir=/usr/bin \
        --with-udev-rules-dir=/usr/lib/udev/rules.d
    make
}

package() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}