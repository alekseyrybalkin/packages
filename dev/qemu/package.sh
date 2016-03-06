#!/bin/sh

pkgname=qemu
pkgver=2.5.0
vcs=git
gittag=v${pkgver}
extension=bz2
folder="http://wiki.qemu.org/download/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  sed -e '/#include <sys\/capability.h>/ d' \
    -e '/#include "virtio-9p-marshal.h"/ i#include <sys\/capability.h>' \
    -i fsdev/virtfs-proxy-helper.c
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/qemu \
    --localstatedir=/var \
    --target-list=x86_64-softmmu \
    --audio-drv-list=alsa \
    --disable-vnc-sasl \
    --disable-docs \
    --python=/usr/bin/python2
  # https://aur.archlinux.org/packages/qemu-spice
  # comment by kris7t 2013-10-09 18:15
  make ARFLAGS="rc"
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
