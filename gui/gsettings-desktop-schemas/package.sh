pkgname=gsettings-desktop-schemas
pkgver=3.33.1
vcs=git
gittag=${pkgver}
relmon_id=13139
relmon_rules="skip_big_third"

build() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}

after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

after_upgrade() {
    after_install
}

generated_files="usr/share/glib-2.0/schemas/gschemas.compiled"
