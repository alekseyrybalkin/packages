#!/bin/sh

pkgname=gtk2
pkgver=2.24.26
urls="http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz"
srctar=gtk+-${pkgver}.tar.xz
srcdir=${location}/gtk+-${pkgver}

kiin_make() {
  sed -i 's#l \(gtk-.*\).sgml#& -o \1#' docs/{faq,tutorial}/Makefile.in
  sed -i 's#.*@man_#man_#' docs/reference/gtk/Makefile.in
  # remove this with 2.24.26 release [ http://wiki.linuxfromscratch.org/blfs/ticket/5852 ]
  sed -i '/GDK_PIXBUF_DISABLE_DEPRECATED/d' configure
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # fix conflict with gtk3
  mv ${pkgdir}/usr/bin/gtk{,2}-update-icon-cache
  mv ${pkgdir}/usr/share/man/man1/gtk{,2}-update-icon-cache.1
}

kiin_after_install() {
  gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
}

kiin_after_upgrade() {
  kiin_after_install
}

known="etc/gtk-2.0/gtk.immodules"
