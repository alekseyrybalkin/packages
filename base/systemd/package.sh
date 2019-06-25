#!/bin/sh

pkgname=systemd
pkgver=242
ARCH_VERSION=242.29
vcs=git
gittag=remotes/origin/stable/v${pkgver}-stable
relmon_id=5440

kiin_make() {
    sed -i 's/GROUP="render", //' rules/50-udev-default.rules.in

    mkdir -p build
    cd build

    CFLAGS+=" -Wno-format-overflow" \
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
        -Drpmmacrosdir=no \
        -Db_lto=false \
        ..
    ninja
}

kiin_install() {
    cd build
    DESTDIR=${pkgdir} ninja install
    rm -rvf ${pkgdir}/var
    rm -rvf ${pkgdir}/usr/lib/rpm

    mv ${pkgdir}/etc/systemd/journald.conf{,.packaged}
    mv ${pkgdir}/etc/systemd/logind.conf{,.packaged}

    ln -sv /usr/lib/systemd/systemd-udevd ${pkgdir}/usr/bin/udevd

    mkdir -pv ${pkgdir}/etc/systemd/system/getty.target.wants/
    ln -sv ../../../../lib/systemd/system/getty@.service ${pkgdir}/etc/systemd/system/getty.target.wants/getty@tty1.service

    cat > ${pkgdir}/etc/pam.d/systemd-user << "EOF"
account  required    pam_access.so
account  include     system-account

session  required    pam_env.so
session  required    pam_limits.so
session  required    pam_unix.so
session  required    pam_loginuid.so
session  optional    pam_keyinit.so force revoke
session  optional    pam_systemd.so

auth     required    pam_deny.so
password required    pam_deny.so
EOF

    cat > ${pkgdir}/etc/pam.d/system-session << "EOF"
session  required    pam_unix.so
session  required    pam_loginuid.so
session  optional    pam_systemd.so
EOF
}

kiin_after_install() {
    systemd-machine-id-setup
}

known="/etc/machine-id \
    etc/udev/hwdb.bin \
    etc/.updated"
