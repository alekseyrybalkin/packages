#!/bin/sh

pkgname=tor
pkgver=0.4.0.5
vcs=git
gittag=tor-${pkgver}
relmon_id=4991

build() {
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    make DESTDIR=${pkgdir} install
    install -Dm0644 ../tor.service ${pkgdir}/usr/lib/systemd/system/tor.service
}

after_install() {
    getent group tor >/dev/null || groupadd -g 43 tor
    getent passwd tor >/dev/null || \
        useradd -c 'tor' -d /var/lib/tor -g tor \
        -s /bin/false -u 43 tor
    chown -R tor:tor /var/lib/tor &> /dev/null
    chmod 700 /var/lib/tor &> /dev/null
}

after_upgrade() {
    after_install
}
