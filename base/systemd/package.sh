#!/bin/sh

pkgname=systemd
pkgver=242
vcs=git
gittag=remotes/origin/stable/v${pkgver}-stable
relmon_id=5440

kiin_make() {
    sed -i 's/GROUP="render", //' rules/50-udev-default.rules.in
    mkdir -p build
    cd build

    PKG_CONFIG_PATH="/usr/lib/pkgconfig" \
    LANG=en_US.UTF-8 \
    meson --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        -Dblkid=true \
        -Dbuildtype=release \
        -Ddefault-dnssec=no \
        -Dfirstboot=false \
        -Dinstall-tests=false \
        -Dldconfig=false \
        -Drootprefix= \
        -Drootlibdir=/usr/lib \
        -Dsplit-usr=false \
        -Dsysusers=false \
        -Db_lto=false \
        ..
    LANG=en_US.UTF-8 ninja
}

kiin_install() {
    cd build
    LANG=en_US.UTF-8 DESTDIR=${pkgdir} ninja install
    rm -rvf ${pkgdir}/var
    rm -rvf ${pkgdir}/usr/lib/rpm

    mv ${pkgdir}/etc/systemd/journald.conf{,.packaged}
    mv ${pkgdir}/etc/systemd/logind.conf{,.packaged}

    ln -sv /usr/lib/systemd/systemd-udevd ${pkgdir}/usr/bin/udevd
}

kiin_after_install() {
    systemd-machine-id-setup
}

known="/etc/machine-id \
    etc/udev/hwdb.bin"
