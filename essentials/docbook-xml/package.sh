#!/bin/sh

pkgname=docbook-xml
pkgver=4.5
urls="http://www.docbook.org/xml/${pkgver}/${pkgname}-${pkgver}.zip"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  mkdir ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  unzip ../${pkgname}-${pkgver}.zip
}

kiin_install() {
  cd ${pkgname}-${pkgver}
  install -v -d -m755 ${pkgdir}/usr/share/xml/docbook/xml-dtd-${pkgver}
  install -v -d -m755 ${pkgdir}/etc/xml
  chown -R root:root .
  cp -v -af docbook.cat *.dtd ent/ *.mod \
      ${pkgdir}/usr/share/xml/docbook/xml-dtd-${pkgver}
  # now fix /etc/xml/docbook
  # now fix /etc/xml/catalog
}
