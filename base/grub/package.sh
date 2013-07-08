#!/bin/sh

pkgname=grub
pkgver=2.00
arch_version_exception="2.00.5043"
urls="http://ftp.gnu.org/gnu/grub/grub-${pkgver}.tar.xz \
  http://rybalkin.org/kiin-files/unicode.pf2"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' grub-core/gnulib/stdio.in.h
  #don't build against fuse (will not build /usr/bin/grub-mount
  sed -i -e 's/fuse_main_real/fuse_main_real_fail/g' configure
  sed -i -e 's/fuse_main_real/fuse_main_real_fail/g' configure.ac
  ./configure --prefix=/usr           \
              --sysconfdir=/etc       \
              --disable-grub-emu-usb  \
              --disable-efiemu        \
              --disable-device-mapper \
              --disable-grub-mkfont   \
              --disable-werror
  make
}

kiin_install() {
  make DESTDIR="${pkgdir}/" install
  mkdir -pv ${pkgdir}/boot/grub/i386-pc
  cp -av ${pkgdir}/usr/lib/grub/i386-pc/*.{mod,lst,img} ${pkgdir}/boot/grub/i386-pc
  mkdir -pv ${pkgdir}/boot/grub/locale
  for dir in ${pkgdir}/usr/share/locale/*; do
    if test -f "$dir/LC_MESSAGES/grub.mo"; then
      cp -fv "$dir/LC_MESSAGES/grub.mo" "${pkgdir}/boot/grub/locale/${dir##*/}.mo"
    fi
  done
  cp -av ${pkgdir}/boot/grub/locale/en@quot.mo ${pkgdir}/boot/grub/locale/en.mo
  mkdir ${pkgdir}/boot/grub/fonts
  cp -av ../unicode.pf2 ${pkgdir}/boot/grub/fonts
}
