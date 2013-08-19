#!/bin/sh

pkgname=cups
pkgver=1.6.3
urls="http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/cups-${pkgver}-blfs-1.patch"
srctar=cups-${pkgver}-source.tar.bz2
srcdir=${location}/cups-${pkgver}

kiin_make() {
  sed -i 's#@CUPS_HTMLVIEW@#firefox#' desktop/cups.desktop.in
  patch -Np1 -i ../cups-${pkgver}-blfs-1.patch
  ./configure --with-rcdir=/tmp/cupsinit \
    --with-docdir=/usr/share/cups/doc \
    --with-system-groups=lpadmin \
    --disable-gnutls --enable-openssl \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make BUILDROOT=${pkgdir} install
  mkdir -p ${pkgdir}/etc/cups
  echo "ServerName /var/run/cups/cups.sock" > ${pkgdir}/etc/cups/client.conf
  rm -rf ${pkgdir}/usr/share/cups/banners
  rm -rf ${pkgdir}/usr/share/cups/data/testprint
  rm -rf ${pkgdir}/tmp
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}

kiin_after_install() {
  getent passwd lp >/dev/null || \
    useradd -c 'Print Service User' -d /var/spool/cups -g lp \
    -s /bin/false -u 9 lp
  getent group lpadmin >/dev/null || groupadd -g 19 lpadmin
  gtk-update-icon-cache
}

kiin_after_upgrade() {
  kiin_after_install
}
