#!/bin/sh

pkgname=angband
vcs="git"
gittag=v3.5.0
pkgver=3.5.0
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  sed -i -e 's/rst2html/true/g' doc/Makefile
  sed -i -e 's/rst2latex/true/g' doc/Makefile
  ./configure --prefix=/usr \
    --bindir=/usr/bin/ \
    --sysconfdir=/usr/share/angband \
    --enable-gtk \
    --enable-sdl \
    --enable-sdl-mixer
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -f ${pkgdir}/usr/share/angband/*/delete.me
}

kiin_after_install() {
  chmod 700 /usr/bin/angband
  getent group gamer >/dev/null || groupadd gamer
  getent passwd gamer >/dev/null || \
    useradd -m -g gamer -G audio,video -s /bin/bash gamer
  chown gamer:gamer /usr/bin/angband
}

kiin_after_upgrade() {
  kiin_after_install
}
