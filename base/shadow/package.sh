#!/bin/sh

pkgname=shadow
pkgver=4.6
vcs=git
gittag=${pkgver}
relmon_id=4802

kiin_make() {
    sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' etc/login.defs
    sed -i -e 's/po man/po/g' Makefile.am
    autoreconf -fi
    sed -i 's/groups$(EXEEXT) //' src/Makefile.in
    find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
    ./configure --sysconfdir=/etc \
        --bindir=/usr/bin \
        --with-group-name-max-length=32 \
        --enable-man=no
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    sed -i 's/yes/no/' ${pkgdir}/etc/default/useradd
    mv ${pkgdir}{,/usr}/sbin/* ${pkgdir}/usr/bin
    rm -rf ${pkgdir}{,/usr}/sbin

    # Remove evil/broken tools
    rm ${pkgdir}/usr/bin/logoutd

    # Remove utilities provided by util-linux
    rm ${pkgdir}/usr/bin/{login,su,chsh,chfn,sg,nologin,vipw,vigr}
    rm -f ${pkgdir}/etc/pam.d/{chfn,chsh,login,runuser,runuser-l,su,su-l}

    # but we keep newgrp, as sg is really an alias to it
    mv ${pkgdir}/usr/bin/{newgrp,sg}
}

kiin_after_install() {
    pwconv
    grpconv
}

known="etc/group \
    etc/gshadow- \
    etc/shadow- \
    etc/gshadow \
    etc/passwd \
    etc/shadow \
    etc/.pwd.lock \
    etc/passwd- \
    etc/group-"
