#!/bin/sh

pkgname=shared-mime-info
pkgver=1.2
urls="http://freedesktop.org/~hadess/shared-mime-info-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  ./configure --prefix=/usr
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  update-mime-database /usr/share/mime
}

kiin_after_upgrade() {
  kiin_after_install
}

known="usr/share/applications/mimeinfo.cache \
  usr/share/mime/application/vnd.ms-word.xml \
  usr/share/mime/application/vnd.ms-powerpoint.template.macroenabled.12.xml \
  usr/share/mime/application/vnd.ms-excel.sheet.binary.macroenabled.12.xml \
  usr/share/mime/application/vnd.ms-excel.template.macroenabled.12.xml \
  usr/share/mime/application/vnd.ms-excel.sheet.macroenabled.12.xml \
  usr/share/mime/application/vnd.sun.xml.base.xml \
  usr/share/mime/application/vnd.ms-powerpoint.presentation.macroenabled.12.xml \
  usr/share/mime/application/vnd.ms-word.document.macroenabled.12.xml \
  usr/share/mime/application/vnd.ms-word.template.macroenabled.12.xml"
