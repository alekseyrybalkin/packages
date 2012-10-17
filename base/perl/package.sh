#!/bin/sh

pkgname=perl
pkgver=5.16.1
urls="http://www.cpan.org/src/5.0/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e "s|BUILD_ZLIB\s*= True|BUILD_ZLIB = False|"           \
        -e "s|INCLUDE\s*= ./zlib-src|INCLUDE    = /usr/include|" \
        -e "s|LIB\s*= ./zlib-src|LIB        = /usr/lib|"         \
      cpan/Compress-Raw-Zlib/config.in
  sh Configure -des -Dprefix=/usr                 \
                    -Dvendorprefix=/usr           \
                    -Dman1dir=/usr/share/man/man1 \
                    -Dman3dir=/usr/share/man/man3 \
                    -Dpager="/usr/bin/less -isR"  \
                    -Duseshrplib                  \
                    -Dinstallprefix=${pkgdir}/usr
  make
}

kiin_install() {
  make install
  sed -i -e 's/\/sources\/base\/perl\/kiin-dest//g' \
    ${pkgdir}/usr/lib/perl5/5.16.1/x86_64-linux/Config_heavy.pl
  sed -i -e 's/\/sources\/base\/perl\/kiin-dest//g' \
    ${pkgdir}/usr/lib/perl5/5.16.1/x86_64-linux/.packlist
}
