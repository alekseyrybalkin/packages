#!/bin/sh

pkgname=kiin-configs
SKIP_ARCH_CHECK=1
vcs="git"
pkgver=1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  rm -rf .git
  find . -type f | xargs sed -i -e "s/%KIIN_HOSTNAME%/`hostname`/g"
  if [ "`hostname`" == "snowden" ]; then
    echo "domain pyn.ru
search pyn.ru
nameserver 94.124.205.83
nameserver 192.168.0.3" > etc/resolv.conf.snow
    cat etc/resolv.conf >> etc/resolv.conf.snow
    mv etc/resolv.conf{.snow,}
    sed -i -e '/gamer/d' etc/rc.d/rc.iptables
    sed -i -e 's/quiet/quiet\ acpi_osi="!Windows\ 2012"/g' boot/grub/grub.cfg
  fi
  if [ "`hostname`" == "ritchie" ]; then
    find etc/rc.d -name "*postgresql*" | xargs rm
    rm -rf etc/nginx
  fi
}

kiin_install() {
  cp -av ./* ${pkgdir}
  chmod 440 ${pkgdir}/etc/sudoers
  chmod o-x ${pkgdir}/etc/rc.d/init.d/*
}
