pkgname=arc-icon-theme
pkgver=20161122
vcs=git
gittag=${pkgver}
relmon_id=14638

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
    find ${pkgdir} -name "*.svg" -exec rm {} \;
}

after_install() {
    gtk-update-icon-cache -q -t -f /usr/share/icons/Arc
}

after_upgrade() {
    after_install
}

known="usr/share/icons/Arc/icon-theme.cache"
