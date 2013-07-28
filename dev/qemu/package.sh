#!/bin/sh

pkgname=qemu
pkgver=1.5.2
extension=bz2
folder="http://wiki.qemu.org/download/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --target-list=x86_64-softmmu \
    --disable-docs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv qemu-system-x86_64 ${pkgdir}/usr/bin/qemu
  install -D -m644 ../65-kvm.rules \
    ${pkgdir}/etc/udev/rules.d/65-kvm.rules
}

kiin_after_install() {
  getent group kvm >/dev/null || groupadd -g 78 kvm
}

kiin_after_upgrade() {
  kiin_after_install
}
