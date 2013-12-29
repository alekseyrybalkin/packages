#!/bin/sh

pkgname=tidyhtml
pkgver=1.46
urls="http://tidy.cvs.sourceforge.net/viewvc/tidy/tidy/?view=tar"
srctar=tidy-${pkgver}.tar.gz
wget_set_filename=${srctar}
srcdir=${location}/tidy

kiin_make() {
  source build/gnuauto/setup.sh
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
