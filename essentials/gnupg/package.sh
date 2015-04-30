#!/bin/sh

pkgname=gnupg
SKIP_ARCH_CHECK=1
pkgver=1.4.19
vcs=git
gittag=gnupg-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib --enable-maintainer-mode
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/gnupg-${pkgver}
  mv -v ${pkgdir}/usr/share/gnupg/FAQ ${pkgdir}/usr/share/doc/gnupg-${pkgver}
  install -v -m644 \
    doc/{highlights-1.4.txt,OpenPGP,samplekeys.asc,DETAILS,*.texi} \
    ${pkgdir}/usr/share/doc/gnupg-${pkgver}
}
