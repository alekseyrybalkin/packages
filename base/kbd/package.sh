#!/bin/sh

pkgname=kbd
pkgver=1.15.5
urls="http://ftp.altlinux.org/pub/people/legion/kbd/kbd-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/guardado\ el/s/\(^.*en\ %\)\(.*\)/\14\$\2/' po/es.po
  sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/' configure &&
  sed -i 's/resizecons.8 //' man/man8/Makefile.in &&
  touch -d '2011-05-07 08:30' configure.ac
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
