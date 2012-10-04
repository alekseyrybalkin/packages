#!/bin/sh

pkgname=flex
pkgver=2.5.37
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../flex-2.5.37-bison-2.6.1-1.patch
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
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
  cp    -v doc/flex.pdf ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
