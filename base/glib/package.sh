pkgname=glib
ARCH_NAME=glib2
pkgver=2.60.6
vcs=git
gittag=${pkgver}
relmon_id=10024
relmon_rules="skip_odd_second"

build() {
    mkdir build
    cd build

    meson --prefix=/usr \
        -D man=true \
        -D selinux=disabled \
        -D gtk_doc=true \
        ..
    ninja
}

package() {
    cd build
    DESTDIR=${pkgdir} meson install
    python -m compileall -d /usr/share/glib-2.0/codegen ${pkgdir}/usr/share/glib-2.0/codegen
    python -O -m compileall -d /usr/share/glib-2.0/codegen ${pkgdir}/usr/share/glib-2.0/codegen
}