pkgname=adwaita-icon-theme
pkgver=3.32.0
vcs=git
gittag=${pkgver}
# beta versions
#relmon_id=13117

build() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}

after_install() {
    gtk-update-icon-cache -q -t -f /usr/share/icons/Adwaita
}

after_upgrade() {
    after_install
}

known="usr/share/icons/Adwaita/icon-theme.cache"
