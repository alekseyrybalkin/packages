#!/bin/sh

pkgname=ntp
# pkgver is too complex to parse, we check server versions instead
SKIP_ARCH_CHECK=1
majorver=4.2
pkgver=${majorver}.8p9
#vcs=git
#gittag=0e6dbb8f4f1f6fdb61180f2765fe087d23c8a7c6
extension=gz
major_folder="https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/"
check_server=1

. ${KIIN_REPO}/defaults.sh

folder="${major_folder}ntp-${majorver}/"
urls="${folder}${srctar}"
majorver_grep="^ntp-[0-9]+\.[0-9]+/?$"
majorver_seds() {
    sed -r "s/\///g" | sed -r "s/ntp-//g"
}

kiin_make() {
    #sed -i -e 's/lynx/CONFIG_DIR=\.config links/g' Makefile.am
    #./bootstrap
    ./configure --prefix=/usr --sysconfdir=/etc \
        --with-binsubdir=bin --enable-linuxcaps \
        --libexecdir=/usr/lib
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rmdir ${pkgdir}/usr/{sbin,lib}
}

kiin_after_install() {
    getent group ntp >/dev/null || groupadd -g 87 ntp
    getent passwd ntp >/dev/null || \
        useradd -c 'Network Time Protocol' -d /var/lib/ntp -g ntp \
        -s /bin/false -u 87 ntp
}

kiin_after_upgrade() {
    kiin_after_install
}
