pkgname=physlock
pkgver=13
vcs=git
gittag=v${pkgver}

build() {
    make PREFIX=/usr
}

package() {
    make DESTDIR=${pkgdir} PREFIX=/usr install
    mkdir -p ${pkgdir}/etc/pam.d
    cat > ${pkgdir}/etc/pam.d/physlock << "EOF"
auth        required    pam_unix.so
account     required    pam_unix.so
password    required    pam_unix.so
session     required    pam_unix.so
EOF
}
