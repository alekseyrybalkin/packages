#!/bin/sh

pkgname=gtk
ARCH_NAME=gtk3
majorver=3.22
pkgver=${majorver}.13
vcs=git
vcs_pkgname=gtk+
gittag=${pkgver}
# beta versions
#relmon_id=10018

kiin_make() {
    sed -i -e '/bridge/d' gtk/a11y/gtkaccessibility.c
    sed -i -e 's/ atk-bridge-2.0//g' configure.ac
    # revert "file chooser: Allow activating without double-click"
    # git revert fb0a13b7f070a14312dafa1e4df6ba03cf33be01
    # https://bugzilla.gnome.org/show_bug.cgi?id=758065
    git apply ../filechooser.diff

    # https://bugzilla.mozilla.org/show_bug.cgi?id=1361979
    # https://bugzilla.gnome.org/show_bug.cgi?id=781814
    git revert --no-edit 7d9450fb60b03dcead85a462f30f24e60119c520

    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --disable-wayland-backend \
        --disable-cups \
        --disable-schemas-compile \
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
