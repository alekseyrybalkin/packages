#!/bin/sh

pkgname=ratpoison
pkgver=1.4.6
urls="http://download.savannah.nongnu.org/releases/ratpoison/ratpoison-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-history
  make CFLAGS="$CFLAGS -DHAVE_GETLINE"
}

kiin_install() {
  make DESTDIR=${pkgdir} install

  # fix permissions
  chmod a+x ${pkgdir}/usr/share/${pkgname}/{allwindows.sh,clickframe.pl,rpshowall.sh,rpws,split.sh}

  # not useful outside the source tree
  rm ${pkgdir}/usr/share/${pkgname}/genrpbindings

  cd contrib
  ./genrpbindings
  install -dm755 ${pkgdir}/usr/share/ratpoison/bindings
  install -m644 {Ratpoison.pm,ratpoison-cmd.el,ratpoison.rb,ratpoison.lisp,ratpoison.py} \
    ${pkgdir}/usr/share/ratpoison/bindings/

  install -Dm644 ${pkgdir}/usr/share/ratpoison/ratpoison.el \
    ${pkgdir}/usr/share/emacs/site-lisp/ratpoison.el
}
