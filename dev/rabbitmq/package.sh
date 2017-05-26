#!/bin/sh

pkgname=rabbitmq
KIIN_NON_FREE=1
pkgver=3.6.10
#vcs=git
#vcs_pkgname=rabbitmq-server-release
#gittag=rabbitmq_v${pkgver//\./_}
urls="https://www.rabbitmq.com/releases/${pkgname}-server/v${pkgver}/${pkgname}-server-generic-unix-${pkgver}.tar.xz"
srctar=${pkgname}-server-generic-unix-${pkgver}.tar.xz
srcdir=${location}/${pkgname}_server-${pkgver}
relmon_id=5585

kiin_make() {
    #make package-generic-unix VERSION=${pkgver}.build UNOFFICIAL_RELEASE=true
    sed -r 's|^(SYS_PREFIX=).*$|\1""|' -i sbin/rabbitmq-defaults
}

kiin_install() {
    local libdir="${pkgdir}/usr/lib/rabbitmq/lib/rabbitmq-server-${pkgver}"

    install -d "${libdir}"
    install -d "${pkgdir}/usr/bin"

    cp -R ebin "${libdir}"
    cp -R include "${libdir}"
    cp -R plugins "${libdir}"
    cp -R sbin "${libdir}"
    cp -R share "${pkgdir}/usr"

    for script in ${libdir}/sbin/*; do
        ln -s "${script#${pkgdir}}" "${pkgdir}/usr/bin/"
    done

    install -Dm 644 ../rabbitmq-env.conf ${pkgdir}/etc/rabbitmq/rabbitmq-env.conf
}

kiin_after_install() {
    if ! getent passwd rabbitmq &>/dev/null; then
        groupadd -r -g 197 rabbitmq &>/dev/null
        useradd -r -u 197 -g rabbitmq -d /var/lib/rabbitmq -s /bin/bash -c 'RabbitMQ user' rabbitmq &>/dev/null
        passwd -l rabbitmq &>/dev/null
    fi
    chown -R 197:0 ${pkgdir}/etc/rabbitmq
}

kiin_after_upgrade() {
    kiin_after_install
}

known="etc/rabbitmq/enabled_plugins"
