#!/bin/sh

pkgname=sudo
# pkgver too complex to parse, we check hg tags instead
SKIP_ARCH_CHECK=1
pkgver=1.8.27
vcs=mercurial
hg_repo=http://www.sudo.ws/repos/sudo
hgtag=SUDO_${pkgver//\./_}
relmon_id=4906

kiin_make() {
    ./autogen.sh
    sed -i -e 's/-lshadow//g' configure
    sed -i -e 's/-lshadow//g' configure.ac
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/sudo \
        --docdir=/usr/share/doc/${pkgname} \
        --with-all-insults \
        --with-env-editor \
        --with-pam \
        --disable-static \
        --without-sendmail \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    # do not replace /etc/sudoers, since it is in git repo now
    mv -v ${pkgdir}/etc/sudoers{,.packaged}
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
    rm -rvf ${pkgdir}/run

    mkdir -p ${pkgdir}/etc/pam.d
    cat > ${pkgdir}/etc/pam.d/sudo << "EOF"
auth            include         system-auth
account         include         system-auth
session         include         system-auth
EOF
}
