#!/bin/sh

pkgname=xorg-server
pkgver=1.18.2
vcs=git
gittag=xorg-server-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git cherry-pick 3b385105b2d19a1c55e9779ae88d775185eea231
  NOCONFIGURE=1 ./autogen.sh
  ./configure $XORG_CONFIG \
    --with-xkb-output=/var/lib/xkb \
    --enable-suid-wrapper \
    --enable-install-setuid \
    --with-sha1=libcrypto \
    --libexecdir=/usr/lib/xorg-server \
    --disable-systemd-logind \
    --with-fontrootdir=/usr/share/fonts
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/etc/X11/xorg.conf.d
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
