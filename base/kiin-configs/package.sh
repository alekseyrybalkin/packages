#!/bin/sh

pkgname=kiin-configs
vcs="git"
gittag=master
pkgver=1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  rm -rf .git
  find . -type f | xargs sed -i -e "s/%KIIN_HOSTNAME%/`hostname`/g"
  if [ "`hostname`" == "snowden" ]; then
    true
  fi
}

kiin_install() {
  cp -av ./* ${pkgdir}
  chmod 440 ${pkgdir}/etc/sudoers
  chmod o-x ${pkgdir}/etc/rc.d/init.d/*
}
