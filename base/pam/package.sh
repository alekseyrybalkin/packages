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

    cat > ${pkgdir}/etc/pam.d/system-auth << "EOF"
auth      required  pam_unix.so     try_first_pass nullok
auth      optional  pam_permit.so
auth      required  pam_env.so

account   required  pam_unix.so
account   optional  pam_permit.so
account   required  pam_time.so

password  required  pam_unix.so     try_first_pass nullok sha512 shadow
password  optional  pam_permit.so

session   required  pam_limits.so
session   required  pam_unix.so
session   optional  pam_permit.so
EOF

    cat > ${pkgdir}/etc/pam.d/other << "EOF"
auth      required   pam_deny.so
auth      required   pam_warn.so
account   required   pam_deny.so
account   required   pam_warn.so
password  required   pam_deny.so
password  required   pam_warn.so
session   required   pam_deny.so
session   required   pam_warn.so
EOF

    cat > ${pkgdir}/etc/pam.d/system-login << "EOF"
auth       required   pam_tally2.so        onerr=succeed file=/var/log/tallylog
auth       required   pam_shells.so
auth       requisite  pam_nologin.so
auth       include    system-auth

account    required   pam_tally2.so
account    required   pam_access.so
account    required   pam_nologin.so
account    include    system-auth

password   include    system-auth

session    optional   pam_loginuid.so
session    optional   pam_keyinit.so       force revoke
session    include    system-auth
-session   optional   pam_systemd.so
session    required   pam_env.so
EOF

    cat > ${pkgdir}/etc/pam.d/system-remote-login << "EOF"
auth      include   system-login
account   include   system-login
password  include   system-login
session   include   system-login
EOF

    cat > ${pkgdir}/etc/pam.d/system-local-login << "EOF"
auth      include   system-login
account   include   system-login
password  include   system-login
session   include   system-login
EOF

    cat > ${pkgdir}/etc/pam.d/system-services << "EOF"
auth      sufficient  pam_permit.so

account   include     system-auth

session   optional    pam_loginuid.so
session   required    pam_limits.so
session   required    pam_unix.so
session   optional    pam_permit.so
session   required    pam_env.so
EOF
}
