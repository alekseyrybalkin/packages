pkgname=gtk-doc
pkgver=1.30
vcs=git
gittag=GTK_DOC_${pkgver//\./_}
relmon_id=13140

build() {
    # https://gitlab.gnome.org/GNOME/gtk-doc/issues/84
    sed -i -e 's/stat.S_IWRITE/0o644/g' gtkdoc/highlight.py
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
