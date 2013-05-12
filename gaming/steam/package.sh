#!/bin/sh

pkgname=steam
pkgver=1.0.0.39
urls="http://repo.steampowered.com/${pkgname}/pool/${pkgname}/s/${pkgname}/${pkgname}_${pkgver}.tar.gz"
srctar=${pkgname}_${pkgver}.tar.gz
srcdir=${location}/${pkgname}

kiin_make() {
  patch -Np1 -i ../alsa_sdl_audiodriver.patch
  echo "nothing to make..."
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sf /bin/true ${pkgdir}/usr/bin/steamdeps
}

kiin_after_install() {
  chmod 700 /usr/bin/steam
  getent group steam >/dev/null || groupadd steam
  getent passwd steam >/dev/null || \
    useradd -m -g steam -G audio,video -s /bin/bash steam
  chown steam:steam /usr/bin/steam
}

kiin_after_upgrade() {
  kiin_after_install
}
