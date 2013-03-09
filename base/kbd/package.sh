#!/bin/sh

pkgname=kbd
pkgver=1.15.5
urls="http://ftp.altlinux.org/pub/people/legion/kbd/kbd-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/lfs/development/kbd-${pkgver}-backspace-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../kbd-1.15.5-backspace-1.patch
  sed -i -e '326 s/if/while/' src/loadkeys.analyze.l
  sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
  sed -i 's/resizecons.8 //' man/man8/Makefile.in
  ./configure --prefix=/usr \
    --datadir=/lib/kbd \
    --disable-vlock
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/{kbd_mode,loadkeys,openvt,setfont} ${pkgdir}/bin
  mkdir -pv ${pkgdir}/usr/share/doc/kbd-${pkgver}
  cp -R -v doc/* \
          ${pkgdir}/usr/share/doc/kbd-${pkgver}
}
