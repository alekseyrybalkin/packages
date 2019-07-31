pkgname=lightlang
SKIP_ARCH_CHECK=1
vcs=git
pkgver=20140410
gittag=7510d5dd87fc988fe1b14718bb546daae5baebe6

build() {
    sed -i -e 's/\.sl/\.config\/sl/g' apps/sl/src/settings.h
    autoconf
    ./configure --with-gui-flag=no \
        --with-python-xlib-flag=no \
        --with-audio-player=true
    make
}

package() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/usr/share/sl
}
