#!/bin/sh

pkgname=evince
pkgver=2.32.0
urls="http://ftp.gnome.org/pub/gnome/sources/evince/2.32/evince-${pkgver}.tar.bz2 \
  http://rybalkin.org/kiin-files/kill-missing-gconf-complaints.patch \
  http://rybalkin.org/kiin-files/libview-crash.patch \
  http://rybalkin.org/kiin-files/update-poppler.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../libview-crash.patch
  patch -Np1 -i ../update-poppler.patch
  patch -Np1 -i ../kill-missing-gconf-complaints.patch
  sed -i -e '63d' configure.ac
  autoreconf -fi

  # Don't depend on gnome-icon-theme
  sed -i '/gnome-icon-theme/d' configure

  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/evince \
    --disable-static \
    --disable-schemas-compile \
    --disable-tests \
    --disable-nautilus \
    --disable-scrollkeeper \
    --disable-help \
    --disable-t1lib \
    --enable-pixbuf \
    --enable-pdf \
    --disable-impress \
    --disable-dvi \
    --disable-tiff \
    --disable-ps \
    --disable-previewer \
    --disable-thumbnailer \
    --disable-dbus \
    --without-keyring \
    --without-gconf
  make LIBS=-lICE
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/GConf
}

kiin_after_install() {
  glib-compile-schemas /usr/share/glib-2.0/schemas
  update-desktop-database -q
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

kiin_after_upgrade() {
  kiin_after_install
}
