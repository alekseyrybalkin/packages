#!/bin/sh

pkgname=adwaita-icon-theme
pkgver=3.32.0
vcs=git
gittag=${pkgver}
# beta versions
#relmon_id=13117

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

kiin_after_install() {
    gtk-update-icon-cache -q -t -f /usr/share/icons/Adwaita
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/share/icons/Adwaita/icon-theme.cache"
