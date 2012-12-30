#!/bin/sh

pkgname=qt
pkgver=4.8.4
urls="http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${pkgver}.tar.gz"
srctar=qt-everywhere-opensource-src-${pkgver}.tar.gz
srcdir=${location}/qt-everywhere-opensource-src-${pkgver}

kiin_make() {
  ./configure -prefix /usr \
    -docdir /usr/share/doc/qt \
    -plugindir /usr/lib/qt/plugins \
    -importdir /usr/lib/qt/imports \
    -datadir /usr/share/qt \
    -translationdir /usr/share/qt/translations \
    -examplesdir /usr/share/doc/qt/examples \
    -demosdir /usr/share/doc/qt/demos \
    -release \
    -nomake examples \
    -nomake demos \
    -nomake docs \
    -system-sqlite \
    -no-phonon \
    -no-phonon-backend \
    -no-webkit \
    -no-nis \
    -opensource \
    -confirm-license
  make
}

kiin_install() {
  make INSTALL_ROOT=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/doc/qt
}
