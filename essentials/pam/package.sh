#!/bin/sh

pkgname=pam
pkgver=1.3.1
vcs=git
gittag=v${pkgver}
relmon_id=12244

kiin_make() {
    patch -Np1 -i ../remove_browser_dep.patch

    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libdir=/usr/lib \
        --sbindir=/usr/bin \
        --disable-db \
        --docdir=/usr/share/doc/pam
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install

    # set unix_chkpwd uid
    chmod +s ${pkgdir}/usr/bin/unix_chkpwd

    install -vdm755 ${pkgdir}/etc/pam.d
    cat > ${pkgdir}/etc/pam.d/system-account << "EOF"
account   required    pam_unix.so
EOF

    cat > ${pkgdir}/etc/pam.d/system-auth << "EOF"
auth      optional    pam_cap.so
auth      required    pam_unix.so
EOF

    cat > ${pkgdir}/etc/pam.d/system-password << "EOF"
# use sha512 hash for encryption, use shadow, and try to use any previously
# defined authentication token (chosen password) set by any prior module
password  required    pam_unix.so       sha512 shadow try_first_pass
EOF

    cat > ${pkgdir}/etc/pam.d/other << "EOF"
auth        required        pam_warn.so
auth        required        pam_deny.so
account     required        pam_warn.so
account     required        pam_deny.so
password    required        pam_warn.so
password    required        pam_deny.so
session     required        pam_warn.so
session     required        pam_deny.so
EOF
}
