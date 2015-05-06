#!/bin/sh

pkgname=gconf
majorver=3.2
pkgver=${majorver}.6
urls="http://ftp.gnome.org/pub/gnome/sources/GConf/${majorver}/GConf-${pkgver}.tar.xz"
srctar=GConf-${pkgver}.tar.xz
srcdir=${location}/GConf-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc --disable-orbit --disable-static --libexecdir=/usr/lib/gconf --disable-defaults-service
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv gconf.xml.defaults ${pkgdir}/etc/gconf/gconf.xml.system
}
