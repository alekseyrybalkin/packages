#!/bin/sh

pkgname=grub
pkgver=2.00
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' grub-core/gnulib/stdio.in.h
  ./configure --prefix=/usr          \
              --sysconfdir=/etc      \
              --disable-grub-emu-usb \
              --disable-efiemu       \
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

  cat > ${pkgdir}/boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=10

insmod part_gpt
insmod part_msdos

function load_video {
    insmod all_video
}
if loadfont unicode ; then
    set gfxmode=auto
    load_video
    insmod gfxterm
    set locale_dir=$prefix/locale
    set lang=en_US
    insmod gettext
fi
terminal_input console
terminal_output gfxterm

menuentry "GNU/Linux, Linux 3.5.3-rybalkiin-1" {
    set gfxpayload=keep
    insmod part_msdos
    insmod ext2
    set root='hd0,msdos3'
    linux /boot/vmlinuz-3.5.3-rybalkiin-1 root=/dev/sda3 ro quiet
}
menuentry "Arch GNU/Linux" {
    set gfxpayload=keep
    insmod part_msdos
    insmod ext2
    set root='hd0,msdos2'
    linux /boot/vmlinuz-linux root=/dev/sda2 ro quiet
    initrd /boot/initramfs-linux.img
}
EOF
}
