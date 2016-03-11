#!/bin/sh

pkgname=perl
pkgver=5.22.1
vcs=git
gittag=v${pkgver}
urls="http://www.cpan.org/src/5.0/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git cherry-pick ae37b791a73a9e78dedb89fb2429d2628cf58076
  export BUILD_ZLIB=False
  export BUILD_BZIP2=0
  sh Configure -des -Dprefix=/usr \
    -Dvendorprefix=/usr \
    -Dman1dir=/usr/share/man/man1 \
    -Dman3dir=/usr/share/man/man3 \
    -Dpager="/usr/bin/less -isR" \
    -Duseshrplib \
    -Di_db=undef
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
