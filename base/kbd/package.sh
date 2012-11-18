#!/bin/sh

pkgname=kbd
pkgver=1.15.3
urls="http://ftp.altlinux.org/pub/people/legion/kbd/kbd-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/lfs/development/kbd-${pkgver}-upstream_fixes-1.patch \
  http://www.linuxfromscratch.org/patches/lfs/development/kbd-${pkgver}-backspace-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../kbd-${pkgver}-upstream_fixes-1.patch
  patch -Np1 -i ../kbd-${pkgver}-backspace-1.patch
  sed -i '/guardado\ el/s/\(^.*en\ %\)\(.*\)/\14\$\2/' po/es.po
  sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/' configure &&
  sed -i 's/resizecons.8 //' man/man8/Makefile.in &&
  touch -d '2011-05-07 08:30' configure.ac
  ./configure --prefix=/usr --datadir=/lib/kbd
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
