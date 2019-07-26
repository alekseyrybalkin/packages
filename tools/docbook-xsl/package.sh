#!/bin/sh

pkgname=docbook-xsl
pkgver=1.79.2
# build from git requires at least perl-xml-xpath
#vcs=git
#gittag=release/${pkgver}
urls="https://github.com/docbook/xslt10-stylesheets/releases/download/release%2F${pkgver}/docbook-xsl-nons-${pkgver}.tar.gz"
srctar=${pkgname}-nons-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-nons-${pkgver}
relmon_id=13115

build() {
    :
    #cd xsl
}

package() {
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

after_install() {
    if [ ! -d /etc/xml ]; then
        install -v -m755 -d /etc/xml
    fi
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

after_upgrade() {
    after_install
}
