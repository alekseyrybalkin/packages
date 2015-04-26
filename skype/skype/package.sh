#!/bin/sh

KIIN_NON_FREE=1
pkgname=skype
pkgver=4.3.0.37
urls="http://download.skype.com/linux/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  libdir="usr/lib32"
  install -d ${pkgdir}/usr/bin
  cp ../skype-wrapper ${pkgdir}/usr/bin/skype
  install -D skype "$pkgdir/$libdir/skype/skype"
  mkdir -p "$pkgdir"/usr/share/skype/{avatars,lang,sounds}
  install -m 644 lang/*    "$pkgdir/usr/share/skype/lang"
  install -m 644 sounds/*  "$pkgdir/usr/share/skype/sounds"
  for _i in 16 32 48; do
    install -Dm 644 icons/SkypeBlue_${_i}x${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/skype.png"
  done
  install -Dm 644 icons/SkypeBlue_48x48.png \
    "$pkgdir/usr/share/pixmaps/skype.png"
}

kiin_after_install() {
  chmod 750 /usr/bin/skype
  getent group skype >/dev/null || groupadd skype
  getent passwd skype >/dev/null || \
    useradd -m -g skype -G audio,video -s /bin/bash skype
  chown root:skype /usr/bin/skype
}

kiin_after_upgrade() {
  kiin_after_install
}
