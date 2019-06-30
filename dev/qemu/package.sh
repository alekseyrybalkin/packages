#!/bin/sh

pkgname=qemu
vcs=git

pkgver=2.11.1
gittag=v${pkgver}

extension=bz2
folder="http://wiki.qemu.org/download/"
check_server=1
relmon_id=13607

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    git clone `find_vcs_repo keycodemapdb` ui/keycodemapdb

    sed -i 's/ memfd_create/ qemu_memfd_create/' util/memfd.c

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/qemu \
        --localstatedir=/var \
        --target-list=x86_64-softmmu \
        --audio-drv-list=alsa \
        --disable-vnc-sasl \
        --disable-docs \
        --with-gtkabi=3.0 \
        --disable-werror \
        --disable-capstone \
        --disable-fdt \
        --python=/usr/bin/python2
        #--disable-git-update \
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    ln -sv qemu-system-x86_64 ${pkgdir}/usr/bin/qemu
    install -D -m644 ../65-kvm.rules \
        ${pkgdir}/etc/udev/rules.d/65-kvm.rules
    rm -rf ${pkgdir}/var
}

kiin_after_install() {
    getent group kvm >/dev/null || groupadd -g 78 kvm
}

kiin_after_upgrade() {
    kiin_after_install
}
