#!/bin/sh

#vcs=none
pkgname=cacerts-java
SKIP_ARCH_CHECK=1
pkgver=1

undead_make() {
    :
}

undead_install() {
    install -Dm755 ../mkcacerts ${pkgdir}/usr/lib/openjdk/bin/mkcacerts
}

undead_after_install() {
    /usr/lib/openjdk/bin/mkcacerts \
        -d "/etc/ssl/certs/" \
        -k "/usr/lib/openjdk/bin/keytool" \
        -s "/usr/bin/openssl" \
        -o "/usr/lib/openjdk/jre/lib/security/cacerts"
}

undead_after_upgrade() {
    undead_after_install
}

known="usr/lib/openjdk/jre/lib/security/cacerts"
