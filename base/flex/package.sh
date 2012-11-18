#!/bin/sh

pkgname=flex
pkgver=2.5.37
urls="http://prdownloads.sourceforge.net/flex/flex-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/lfs/development/flex-${pkgver}-bison-2.6.1-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../flex-${pkgver}-bison-2.6.1-1.patch
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/${pkgname}-${pkgver}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv libfl.a ${pkgdir}/usr/lib/libl.a
  cat > ${pkgdir}/usr/bin/lex << "EOF"
#!/bin/sh
# Begin /usr/bin/lex

exec /usr/bin/flex -l "$@"

# End /usr/bin/lex
EOF
  chmod -v 755 ${pkgdir}/usr/bin/lex
}
