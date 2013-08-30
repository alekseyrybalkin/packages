#!/bin/sh

pkgname=ttf-dejavu
pkgver=2.34
urls="http://downloads.sourceforge.net/project/dejavu/dejavu/${pkgver}/dejavu-fonts-ttf-${pkgver}.tar.bz2"
srctar=dejavu-fonts-ttf-${pkgver}.tar.bz2
srcdir=${location}/dejavu-fonts-ttf-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

configs=(20-unhint-small-dejavu-sans-mono.conf
         20-unhint-small-dejavu-sans.conf
         20-unhint-small-dejavu-serif.conf
         57-dejavu-sans-mono.conf
         57-dejavu-sans.conf
         57-dejavu-serif.conf)

kiin_install() {
  install -dm755 ${pkgdir}/etc/fonts/conf.avail
  install -dm755 ${pkgdir}/usr/share/fonts/TTF

  install -m644 ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -m644 fontconfig/*.conf ${pkgdir}/etc/fonts/conf.avail/

  mkdir -p ${pkgdir}/etc/fonts/conf.d
  pushd ${pkgdir}/etc/fonts/conf.d > /dev/null
  for config in "${configs[@]}"; do
    ln -sf ../conf.avail/${config} .
  done
  popd > /dev/null
  mkfontscale ${pkgdir}/usr/share/fonts/TTF
  mkfontdir ${pkgdir}/usr/share/fonts/TTF
}
