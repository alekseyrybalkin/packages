#!/bin/sh

pkgname=git
vcs="git"
gittag=727a46b2f9a1ce69eaf09bc46cb129f1c40833d8
pkgver=1.8.3+
manpagesver=1.8.3
urls="http://${pkgname}-core.googlecode.com/files/${pkgname}-manpages-${manpagesver}.tar.gz \
  http://rybalkin.org/kiin-files/git_gitignore_fix.patch"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../git_gitignore_fix.patch
  make configure
  ./configure --prefix=/usr         \
              --libexecdir=/usr/lib \
              --with-libpcre \
              --with-gitconfig=/etc/gitconfig
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  tar -xf ../${pkgname}-manpages-${manpagesver}.tar.gz -C ${pkgdir}/usr/share/man \
    --no-same-owner
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
