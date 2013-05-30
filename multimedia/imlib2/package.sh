#!/bin/sh

pkgname=imlib2
pkgver=1.4.5
urls="http://downloads.sourceforge.net/enlightenment/imlib2-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '22d' src/modules/loaders/loader_gif.c
  sed -i -e '21aint fd,err=0;' src/modules/loaders/loader_gif.c
  sed -i -e '39d' src/modules/loaders/loader_gif.c
  sed -i -e '38agif=DGifOpenFileHandle(fd,&err);' src/modules/loaders/loader_gif.c
  sed -i -e '40d' src/modules/loaders/loader_gif.c
  sed -i -e '39aif(err)' src/modules/loaders/loader_gif.c
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
