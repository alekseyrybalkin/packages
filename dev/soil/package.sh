#!/bin/sh

pkgname=soil
SKIP_ARCH_CHECK=1
pkgver=1.16
urls="http://www.lonesock.net/files/soil.zip"
srczip=${pkgname}.zip

kiin_make() {
  mv "Simple OpenGL Image Library" soil
  cd ${location}/soil
  sed 's/-Wall/-Wall -fPIC/' -i "projects/makefile/alternate Makefile.txt"
  sed 's/1.07-20071110/1.16/' -i "projects/makefile/alternate Makefile.txt"
  cd src
  make -f "../projects/makefile/alternate Makefile.txt"
}

kiin_install() {
  cd ${location}/soil/src
  make -f "../projects/makefile/alternate Makefile.txt" DESTDIR=${pkgdir} install
  rm -rf ${location}/soil
}
