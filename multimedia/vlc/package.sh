#!/bin/sh

pkgname=vlc
majorver=2.1.5
pkgver=${majorver}
extension=xz
major_folder="http://download.videolan.org/pub/videolan/vlc/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr --disable-lua --disable-mad --disable-a52 \
    --disable-dbus
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
