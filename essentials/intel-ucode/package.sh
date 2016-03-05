#!/bin/sh

KIIN_NON_FREE=1
pkgname=intel-ucode
pkgver=20151106
_dlid=25512
urls="http://downloadmirror.intel.com/${_dlid}/eng/microcode-${pkgver}.tgz"
srctar=microcode-${pkgver}.tgz

kiin_make() {
  gcc -Wall ${CFLAGS} -o intel-microcode2ucode intel-microcode2ucode.c
  ./intel-microcode2ucode ./microcode.dat
}

kiin_install() {
  install -d -m755 ${pkgdir}/boot

  mkdir -p kernel/x86/microcode
  mv microcode.bin kernel/x86/microcode/GenuineIntel.bin
  echo kernel/x86/microcode/GenuineIntel.bin | cpio -o -H newc -R 0:0 > ${pkgdir}/boot/intel-ucode.img

  rm -rf intel-microcode2ucode kernel microcode.dat
}
