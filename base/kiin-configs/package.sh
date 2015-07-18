#!/bin/sh

pkgname=kiin-configs
SKIP_ARCH_CHECK=1
vcs="git"
pkgver=1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  rm -rf .git
  find . -type f | xargs sed -i -e "s/%KIIN_HOSTNAME%/`hostname`/g"
  if [ "`hostname`" == "sol" ]; then
    # disable autostart for some services
    find etc/rc.d -type l -name "*postgresql*" | xargs rm
    find etc/rc.d -type l -name "*php-fpm*" | xargs rm
    find etc/rc.d -type l -name "*mysql*" | xargs rm
  fi
}

kiin_install() {
  cp -av ./* ${pkgdir}
  chmod 440 ${pkgdir}/etc/sudoers
  chmod o-x ${pkgdir}/etc/rc.d/init.d/*
  chmod 700 ${pkgdir}/usr/bin/*
}
