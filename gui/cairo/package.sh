pkgname=cairo
vcs=git
pkgver=1.16.0
gittag=${pkgver}
# includes rcairo versions from https://cairographics.org/releases/
#relmon_id=247
#relmon_rules="skip_odd_second"

build() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --enable-gl \
        --enable-egl \
        --enable-tee \
        --enable-svg=no \
        --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
