#!/bin/sh

pkgname=sudo
# pkgver too complex to parse, we check hg tags instead
SKIP_ARCH_CHECK=1
pkgver=1.8.19p2
vcs=mercurial
hg_repo=http://www.sudo.ws/repos/sudo
hgtag=SUDO_${pkgver//\./_}
extension=gz
folder="http://www.sudo.ws/${pkgname}/dist/"
check_server=1
relmon_id=4906

. ${KIIN_REPO}/defaults.sh

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
        --without-pam \
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
}
