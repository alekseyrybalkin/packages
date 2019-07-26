#!/bin/sh

pkgname=tinyproxy
pkgver=1.10.0
vcs=git
gittag=${pkgver}
relmon_id=8699

build() {
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --localstatedir=/var \
        --enable-transparent
    make
}

package() {
    make DESTDIR=${pkgdir} install
    install -Dm0644 ../tinyproxy.tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/tinyproxy.conf
    install -Dm0644 ../tinyproxy.service ${pkgdir}/usr/lib/systemd/system/tinyproxy.service
    mv ${pkgdir}/etc/tinyproxy/tinyproxy.conf{,.packaged}
}

after_install() {
    getent group tinyproxy >/dev/null || groupadd -g 186 tinyproxy
    getent passwd tinyproxy >/dev/null || \
        useradd -c 'tinyproxy' -d /var/lib/tinyproxy -g tinyproxy \
        -s /bin/false -u 186 tinyproxy
}

after_upgrade() {
    after_install
}
