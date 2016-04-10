#!/bin/sh

pkgname=docbook-xsl
pkgver=1.79.1
# build from svn requires at least perl-xml-xpath
#vcs=git-svn
#git_pkgname=docbook-git-svn
#svnrev=10010
urls="http://downloads.sourceforge.net/docbook/docbook-xsl-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
  #cd xsl
}

kiin_install() {
  #cd xsl
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
}

kiin_after_install() {
  if [ ! -d /etc/xml ]; then install -v -m755 -d /etc/xml; fi &&
  if [ ! -f /etc/xml/catalog ]; then
    xmlcatalog --noout --create /etc/xml/catalog
  fi
  xmlcatalog --noout --add "rewriteSystem" \
    "http://docbook.sourceforge.net/release/xsl/${pkgver}" \
    "/usr/share/xml/docbook/xsl-stylesheets-${pkgver}" \
    /etc/xml/catalog
  xmlcatalog --noout --add "rewriteURI" \
    "http://docbook.sourceforge.net/release/xsl/${pkgver}" \
    "/usr/share/xml/docbook/xsl-stylesheets-${pkgver}" \
    /etc/xml/catalog
  xmlcatalog --noout --add "rewriteSystem" \
    "http://docbook.sourceforge.net/release/xsl/current" \
    "/usr/share/xml/docbook/xsl-stylesheets-${pkgver}" \
    /etc/xml/catalog
  xmlcatalog --noout --add "rewriteURI" \
    "http://docbook.sourceforge.net/release/xsl/current" \
    "/usr/share/xml/docbook/xsl-stylesheets-${pkgver}" \
    /etc/xml/catalog
}

kiin_after_upgrade() {
  kiin_after_install
}
