#!/bin/sh

pkgname=physlock
pkgver=13
vcs=git
gittag=v${pkgver}

kiin_make() {
    make PREFIX=/usr
}

kiin_install() {
    make DESTDIR=${pkgdir} PREFIX=/usr install
    mkdir -p ${pkgdir}/etc/pam.d
    cat > ${pkgdir}/etc/pam.d/physlock << "EOF"
auth        required    pam_unix.so
account     required    pam_unix.so
password    required    pam_unix.so
session     required    pam_unix.so
EOF
}
