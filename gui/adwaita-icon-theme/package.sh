pkgname=adwaita-icon-theme
pkgver=3.32.0
vcs=git
gittag=${pkgver}
relmon_id=13117
relmon_rules="skip_big_third"

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
