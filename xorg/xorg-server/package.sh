#!/bin/sh

pkgname=xorg-server
pkgver=1.17.1
vcs=git
gittag=xorg-server-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # gcc5 fix
  git cherry-pick 21b896939c5bb242f3aacc37baf12379e43254b6
  NOCONFIGURE=1 ./autogen.sh
  ./configure $XORG_CONFIG \
    --with-xkb-output=/var/lib/xkb \
    --enable-suid-wrapper \
    --enable-install-setuid \
    --with-sha1=libcrypto \
    --libexecdir=/usr/lib/xorg-server \
    --with-fontrootdir=/usr/share/fonts
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/etc/X11/xorg.conf.d
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
