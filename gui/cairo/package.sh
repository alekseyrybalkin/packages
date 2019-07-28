pkgname=cairo
vcs=git
pkgver=1.16.0
gittag=${pkgver}
relmon_id=247
relmon_rules="skip_odd_second"

build() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --enable-gl \
        --enable-egl \
        --enable-tee \
        --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
