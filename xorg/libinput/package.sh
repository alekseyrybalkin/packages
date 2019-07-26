pkgname=libinput
pkgver=1.13.3
vcs=git
gittag=${pkgver}
relmon_id=5781

build() {
    mkdir build
    meson --prefix=$XORG_PREFIX \
        -D libexecdir=/usr/lib \
        -D udev-dir=/usr/lib/udev \
        -D debug-gui=false \
        -D tests=false \
        -D documentation=false \
        -D libwacom=false \
        . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
