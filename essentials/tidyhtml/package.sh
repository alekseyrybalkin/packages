#!/bin/sh

pkgname=tidyhtml
pkgver=1.46
urls="http://tidy.cvs.sourceforge.net/viewvc/tidy/tidy/?view=tar"
wget_set_filename=1
srctar=tidy-${pkgver}.tar.gz
srcdir=${location}/tidy

kiin_make() {
  source build/gnuauto/setup.sh
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
