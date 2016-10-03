#!/bin/sh

pkgname=gtk
ARCH_NAME=gtk3
majorver=3.22
pkgver=${majorver}.1
vcs=git
git_repo=git://git.gnome.org/gtk+
vcs_pkgname=gtk+
gittag=${pkgver}
extension=xz
major_folder="http://ftp.gnome.org/pub/gnome/sources/${pkgname}+/"
check_server=1

srctar=${pkgname}+-${pkgver}.tar.${extension}
srcdir=${location}/${pkgname}+-${pkgver}

. ${KIIN_REPO}/defaults.sh

majorver_grep="^[0-9]+\.[0-9]*[02468]{1}/?$"
ver_grep="^${pkgname}\+-.*\.tar\.${extension}$"
ver_seds() {
    sed -r "s/^${pkgname}\+-//g" | sed -r "s/\.tar\.${extension}$//g"
}

kiin_make() {
    sed -i -e '/bridge/d' gtk/a11y/gtkaccessibility.c
    sed -i -e 's/ atk-bridge-2.0//g' configure.ac
    # revert "file chooser: Allow activating without double-click"
    #git revert fb0a13b7f070a14312dafa1e4df6ba03cf33be01
    git apply ../filechooser.diff
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --disable-wayland-backend \
        --enable-x11-backend
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

kiin_after_install() {
    gtk-query-immodules-3.0 --update-cache
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/lib/gtk-3.0/3.0.0/immodules.cache"
