#!/bin/sh

pkgname=chrony
pkgver=3.5
vcs=git
gittag=${pkgver}
relmon_id=8810

kiin_make() {
    sed -i -e '/doc install$/d' Makefile.in
    ./configure --prefix=/usr \
        --with-user=chrony
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -Dm 644 examples/{chronyd,chrony-wait}.service -t ${pkgdir}/usr/lib/systemd/system
    mv ${pkgdir}/usr/sbin/chronyd ${pkgdir}/usr/bin
    rmdir ${pkgdir}/usr/sbin
    rm -rf ${pkgdir}/var
}

kiin_after_install() {
    getent group chrony >/dev/null || groupadd -g 183 chrony
    getent passwd chrony >/dev/null || \
        useradd -c 'chrony' -d /var/lib/chrony -g chrony \
        -s /bin/false -u 183 chrony
    chown -R chrony:chrony /var/lib/chrony &> /dev/null
}

kiin_after_upgrade() {
    kiin_after_install
}
