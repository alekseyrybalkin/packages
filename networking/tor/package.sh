#!/bin/sh

pkgname=tor
pkgver=0.4.0.5
vcs=git
gittag=tor-${pkgver}
urls="http://www.torproject.org/dist/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=4991

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/etc/tor/torrc{.sample,}
    install -Dm0644 ../tor.service ${pkgdir}/usr/lib/systemd/system/tor.service
}

kiin_after_install() {
    getent group tor >/dev/null || groupadd -g 43 tor
    getent passwd tor >/dev/null || \
        useradd -c 'tor' -d /var/lib/tor -g tor \
        -s /bin/false -u 43 tor
    chown -R tor:tor /var/lib/tor &> /dev/null
    chmod 700 /var/lib/tor &> /dev/null
}

kiin_after_upgrade() {
    kiin_after_install
}
