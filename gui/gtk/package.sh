pkgname=gtk
ARCH_NAME=gtk3
pkgver=3.24.10
vcs=git
gittag=${pkgver}
relmon_id=10018
relmon_rules="skip_big_second"

build() {
    sed -i -e '/needs to be enabled/d' modules/printbackends/meson.build
    meson --prefix=/usr \
        -D libexecdir=/usr/lib \
        -D sysconfdir=/etc \
        -D colord=no \
        -D gtk_doc=false \
        -D man=true \
        -D broadway_backend=true \
        -D wayland_backend=false \
        -D print_backends='' \
        . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}

after_install() {
    gtk-query-immodules-3.0 --update-cache
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

after_upgrade() {
    after_install
}

known="usr/lib/gtk-3.0/3.0.0/immodules.cache"
