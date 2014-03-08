#!/bin/sh

pkgname=adblockplus
ARCH_NAME=firefox-adblock-plus
vcs="mercurial"
hgtag="2.5.1"
pkgver=2.5.1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python build.py build -r
}

kiin_install() {
  mkdir xpi
  mv adblockplus*.xpi xpi
  cd xpi
  unzip adblockplus*.xpi
  emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
  mkdir -p ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
  rm adblockplus*.xpi
  cp -r * ${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
  find ${pkgdir} -type d -exec chmod 0755 {} \;
  find ${pkgdir} -type f -exec chmod 0644 {} \;
}
