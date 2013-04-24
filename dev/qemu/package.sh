#!/bin/sh

pkgname=qemu
pkgver=1.4.1
urls="http://wiki.qemu.org/download/qemu-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

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
