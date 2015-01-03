#!/bin/sh

pkgname=apache
pkgver=2.4.10
urls="http://archive.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/httpd-${pkgver}-blfs_layout-1.patch"
srctar=httpd-${pkgver}.tar.bz2
srcdir=${location}/httpd-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/httpd-2.4.10-blfs_layout-1.patch
  sed '/dir.*CFG_PREFIX/s@^@#@' -i support/apxs.in
  ./configure --sbindir=/usr/bin \
    --enable-authnz-fcgi \
    --enable-layout=BLFS \
    --enable-mods-shared="all cgi" \
    --enable-mpms-shared=all \
    --enable-suexec=shared \
    --with-apr=/usr/bin/apr-1-config \
    --with-apr-util=/usr/bin/apu-1-config \
    --with-suexec-bin=/usr/lib/httpd/suexec \
    --with-suexec-caller=${PACMAN} \
    --with-suexec-docroot=/srv/www \
    --with-suexec-logfile=/var/log/httpd/suexec.log \
    --with-suexec-uidmin=100 \
    --with-suexec-userdir=public_html
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv -v ${pkgdir}/usr/bin/suexec ${pkgdir}/usr/lib/httpd/suexec
  chgrp ${PACMAN} ${pkgdir}/usr/lib/httpd/suexec
  chmod 4754 ${pkgdir}/usr/lib/httpd/suexec
  rm -rf ${pkgdir}/var
  rm -rf ${pkgdir}/srv
  mv -v ${pkgdir}/etc/httpd/httpd.conf{,.packaged}
}

kiin_after_install() {
  getent group apache >/dev/null || groupadd -g 25 apache
  getent passwd apache >/dev/null || \
    useradd -c 'Apache Server' -d /srv/www -g apache \
    -s /bin/false -u 25 apache
}

kiin_after_upgrade() {
  kiin_after_install
}
