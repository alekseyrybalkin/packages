#!/bin/sh

pkgname=elasticsearch2
_pkgname=elasticsearch
SKIP_ARCH_CHECK=1
pkgver=2.4.6
urls="http://download.elasticsearch.org/${_pkgname}/release/org/${_pkgname}/distribution/tar/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
srctar=${_pkgname}-${pkgver}.tar.gz
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
    for script in plugin elasticsearch; do
        sed -e 's|^ES_HOME=.*dirname.*|ES_HOME=/usr/share/elasticsearch|' \
            -e '/^ES_HOME=.*pwd/d' \
            -e 's|$ES_HOME/config|/etc/elasticsearch|' \
            -i bin/${script}
    done

    sed -re 's;#\s*(path\.conf:).*$;\1 /etc/elasticsearch;' \
        -e '0,/#\s*(path\.data:).*$/s;;\1 /var/lib/elasticsearch;' \
        -e 's;#\s*(path\.work:).*$;\1 /tmp/elasticsearch;' \
        -e 's;#\s*(path\.logs:).*$;\1 /var/log/elasticsearch;' \
        -i config/elasticsearch.yml
}

kiin_install() {
    install -dm750 ${pkgdir}/etc/elasticsearch/scripts
    install -dm755 ${pkgdir}/usr/share/elasticsearch/plugins

    install -Dm644 ../elasticsearch.service ${pkgdir}/usr/lib/systemd/system/elasticsearch.service
    install -Dm644 ../elasticsearch-tmpfile.conf ${pkgdir}/usr/lib/tmpfiles.d/elasticsearch.conf
    install -Dm644 ../elasticsearch-sysctl.conf ${pkgdir}/usr/lib/sysctl.d/elasticsearch.conf
    install -Dm644 ../elasticsearch.default ${pkgdir}/etc/default/elasticsearch

    cp -R lib modules ${pkgdir}/usr/share/elasticsearch/
    cp config/* ${pkgdir}/etc/elasticsearch/

    install -Dm755 bin/elasticsearch ${pkgdir}/usr/bin/elasticsearch
    install -Dm755 bin/plugin ${pkgdir}/usr/bin/elasticsearch-plugin
    install -Dm644 bin/elasticsearch.in.sh ${pkgdir}/usr/share/elasticsearch/bin/elasticsearch.in.sh

    sed -i -e '/UseParNewGC/d' ${pkgdir}/usr/share/elasticsearch/bin/elasticsearch.in.sh

    mv ${pkgdir}/etc/elasticsearch/elasticsearch.yml{,.packaged}
}

kiin_after_install() {
    getent group elasticsearch >/dev/null || groupadd -g 969 elasticsearch
    getent passwd elasticsearch >/dev/null || \
        useradd -c 'elasticsearch' -d /var/lib/elasticsearch -g elasticsearch \
        -s /bin/false -u 969 elasticsearch
    systemd-tmpfiles --create elasticsearch.conf
}

kiin_after_upgrade(){
    kiin_after_install
}
