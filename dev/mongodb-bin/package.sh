#!/bin/sh

#vcs=ignore
pkgname=mongodb-bin
SKIP_ARCH_CHECK=1
_basever=4.0
pkgver=${_basever}.10
urls="https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${_basever}/multiverse/binary-amd64/mongodb-org-shell_${pkgver}_amd64.deb \
    https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${_basever}/multiverse/binary-amd64/mongodb-org-server_${pkgver}_amd64.deb \
    https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${_basever}/multiverse/binary-amd64/mongodb-org-mongos_${pkgver}_amd64.deb \
    https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${_basever}/multiverse/binary-amd64/mongodb-org-tools_${pkgver}_amd64.deb"

kiin_make() {
    cd ${location}
    mkdir build
    cd build
    mkdir -p output

    for deb in mongos server shell tools; do
        cp ${SOURCES_HOME}/tarballs/mongodb-org-${deb}_${pkgver}_amd64.deb .
        ar x mongodb-org-${deb}_${pkgver}_amd64.deb
        tar -xvf data.tar.xz -C output
    done
}

kiin_install() {
    cd ${location}
    mkdir -p ${pkgdir}/usr
    mkdir -p ${pkgdir}/usr/share/man
    cp -r build/output/usr/bin ${pkgdir}/usr/
    cp -r build/output/usr/share/man/man1 ${pkgdir}/usr/share/man/
    install -Dm644 mongodb.conf ${pkgdir}/etc/mongodb.conf
    install -Dm644 mongodb.service ${pkgdir}/usr/lib/systemd/system/mongodb.service
    install -Dm644 mongodb.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/mongodb.conf
    rm -rf build
}

kiin_after_install() {
    getent group mongodb >/dev/null || groupadd -g 970 mongodb
    getent passwd mongodb >/dev/null || \
        useradd -c 'mongodb' -d /var/lib/mongodb -g mongodb \
        -s /bin/false -u 970 mongodb
    systemd-tmpfiles --create mongodb.conf
}

kiin_after_upgrade(){
    kiin_after_install
}
