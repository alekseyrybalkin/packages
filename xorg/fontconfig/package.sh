#!/bin/sh

pkgname=fontconfig
pkgver=2.11.1
vcs=git
git_repo=git://anongit.freedesktop.org/fontconfig
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --docdir=/usr/share/doc/${pkgname} \
    --disable-docs \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/share/fonts \
    --with-templatedir=/etc/fonts/conf.avail \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
  if [ -n "${KIIN_LIB32}" ]; then
    mkdir -pv ${pkgdir}/usr/lib32/fontconfig
    mv ${pkgdir}/usr/bin/fc-cache ${pkgdir}/usr/lib32/fontconfig/
  fi
}
