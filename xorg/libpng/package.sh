#!/bin/sh

pkgname=libpng
pkgver=1.5.14
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz \
  http://sourceforge.net/projects/${pkgname}-apng/files/${pkgname}15/${pkgver}/${pkgname}-${pkgver}-apng.patch.gz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  gzip -cd ../libpng-${pkgver}-apng.patch.gz | patch -p1
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
      --disable-static
  else
    ./configure --prefix=/usr \
      --disable-static --program-suffix=-32 --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
    cp README libpng-manual.txt ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  else
    cd contrib/pngminus
    make PNGLIB="-L${pkgdir}/usr/lib32 -lpng" -f makefile.std png2pnm pnm2png
    rm -rf "${pkgdir}"/usr/{include,share}
    rm "${pkgdir}/usr/bin/libpng-config"
    ln -s "libpng15-config-32" "${pkgdir}/usr/bin/libpng-config-32"
  fi
}
