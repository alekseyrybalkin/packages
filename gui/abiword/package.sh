#!/bin/sh

pkgname=abiword
pkgver=3.0.1
vcs=git
gittag=release-${pkgver}
urls="http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr \
    --without-evolution-data-server \
    --disable-collab-backend-telepathy \
    --disable-collab-backend-sugar \
    --enable-plugins="applix babelfish freetranslation eml urldict
      mswrite paint epub garble mif t602 goffice s5 passepartout sdw gimp
      google hancom opml kword collab openwriter pdb opendocument pdf mht
      iscii loadbindings clarisworks docbook gdict wikipedia hrtext bmp
      command openxml presentation wml"
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
