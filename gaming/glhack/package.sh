#!/bin/sh

pkgname=glhack
pkgver=1.2
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz \
  http://rybalkin.org/kiin-files/glhack-libpng15.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -p0 -i ${KIIN_HOME}/tarballs/glhack-libpng15.patch
  sed -i 's|/usr/lib/games|/usr/share|' include/config.h
  sed -i 's|/var/lib/games/glhack|/var/games/glhack|' include/unixconf.h
  sed -i -e 's|PREFIX	 = /usr|PREFIX	 = $(DESTDIR)/usr|' Makefile
  sed -i -e 's|VARDIR   = /var/lib/games/glhack|VARDIR   = $(DESTDIR)/var/games/glhack|' Makefile
  sed -i -e 's|/usr/man/man6|$(DESTDIR)/usr/share/man/man6|' doc/Makefile
  sed -i -e 's|GAMEDIR  = $(PREFIX)/lib/games/$(GAME)|GAMEDIR  = $(PREFIX)/share/$(GAME)|' Makefile
  sed -i -e 's|GAMEGRP  = games|GAMEGRP  = root|' Makefile
  make
}

kiin_install() {
  MAKEFLAGS=
  install -d ${pkgdir}/usr/share/man/man{5,6}
  make DESTDIR=${pkgdir} install
  pushd ${pkgdir}/usr/share/man/man6
  for manpage in dgn_comp dlb lev_comp nethack recover; do
    mv $manpage.6 $manpage-glhack.6
  done
  popd

  mv ${pkgdir}/usr/share/glhack/glhack ${pkgdir}/usr/bin/glhack
  mv ${pkgdir}/usr/share/glhack/recover_glhack ${pkgdir}/usr/bin/recover_glhack

  chown -R root:root ${pkgdir}/usr/share/glhack
  chmod 700 ${pkgdir}/usr/bin/{,recover_}glhack

  rm -r ${pkgdir}/var
}

kiin_after_install() {
  chmod 700 /usr/bin/{,recover_}glhack
  getent group gamer >/dev/null || groupadd gamer
  getent passwd gamer >/dev/null || \
    useradd -m -g gamer -G audio,video -s /bin/bash gamer
  chown gamer:gamer /usr/bin/{,recover_}glhack
}

kiin_after_upgrade() {
  kiin_after_install
}
