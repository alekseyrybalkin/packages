#!/bin/sh

pkgname=adwaita-icon-theme
majorver=3.28
pkgver=${majorver}.0
vcs=git
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/"
check_server=1
# beta versions
#relmon_id=13117

. ${UNDEAD_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}

undead_after_install() {
    gtk-update-icon-cache -q -t -f /usr/share/icons/Adwaita
}

undead_after_upgrade() {
    undead_after_install
}

known="usr/share/icons/Adwaita/icon-theme.cache"
