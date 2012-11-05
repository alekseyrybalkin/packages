#!/bin/sh

pkgname=docbook-xsl
pkgver=1.77.1
urls="http://downloads.sourceforge.net/docbook/docbook-xsl-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  install -v -m755 -d ${pkgdir}/usr/share/xml/docbook/xsl-stylesheets-${pkgver}
  cp -v -R VERSION common eclipse epub extensions fo highlighting html \
          htmlhelp images javahelp lib manpages params profiling \
          roundtrip slides template tests tools webhelp website \
          xhtml xhtml-1_1 \
      ${pkgdir}/usr/share/xml/docbook/xsl-stylesheets-${pkgver}
  ln -s VERSION ${pkgdir}/usr/share/xml/docbook/xsl-stylesheets-${pkgver}/VERSION.xsl
  mkdir -p ${pkgdir}/usr/share/doc/docbook-xsl-${pkgver}
  install -v -m644 -D README \
                      ${pkgdir}/usr/share/doc/docbook-xsl-${pkgver}/README.txt
  install -v -m755    RELEASE-NOTES* NEWS* \
                      ${pkgdir}/usr/share/doc/docbook-xsl-${pkgver}
  # now fix /etc/xml/catalog
}
