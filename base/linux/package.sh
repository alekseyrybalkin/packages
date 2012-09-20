#!/bin/sh

pkgname=linux
pkgver=3.5.3
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64 .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/lib/modules
  make INSTALL_MOD_PATH=${pkgdir} modules_install
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-3.5.3-rybalkiin-1
  cp -v System.map ${pkgdir}/boot/System.map-3.5.3
  cp -v .config ${pkgdir}/boot/config-3.5.3

  install -d ${pkgdir}/usr/share/doc/linux-3.5.3
  cp -r Documentation/* ${pkgdir}/usr/share/doc/linux-3.5.3

  install -v -m755 -d ${pkgdir}/etc/modprobe.d
  cat > ${pkgdir}/etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

  cat > ${pkgdir}/etc/modprobe.d/nouveau_blacklist.conf << "EOF"
blacklist nouveau
EOF

  cat > ${pkgdir}/etc/modprobe.d/pcspkr_blacklist.conf << "EOF"
blacklist pcspkr
EOF
}
