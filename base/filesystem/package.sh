#!/bin/sh

pkgname=filesystem
SKIP_ARCH_CHECK=1
pkgver=1

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -v ${pkgdir}/{dev,proc,sys}
  mknod -m 600 ${pkgdir}/dev/console c 5 1
  mknod -m 666 ${pkgdir}/dev/null c 1 3
  mkdir -pv ${pkgdir}/{boot,etc/{opt,sysconfig},home,mnt,opt,run}
  mkdir -pv ${pkgdir}/var
  install -dv -m 0750 ${pkgdir}/root
  install -dv -m 1777 ${pkgdir}/tmp ${pkgdir}/var/tmp
  mkdir -pv ${pkgdir}/usr/{bin,include,lib}
  mkdir -pv ${pkgdir}/usr/share/{doc,info,locale,man}
  mkdir -v  ${pkgdir}/usr/share/{misc,terminfo,zoneinfo}
  mkdir -pv ${pkgdir}/usr/share/man/man{1..8}

  ln -sv usr/bin ${pkgdir}/bin
  ln -sv usr/bin ${pkgdir}/sbin
  ln -sv bin ${pkgdir}/usr/sbin

  ln -sv usr/lib ${pkgdir}/lib
  ln -sv usr/lib ${pkgdir}/lib64
  ln -sv lib ${pkgdir}/usr/lib64

  mkdir -v ${pkgdir}/var/{log,mail,spool}
  ln -sv /run ${pkgdir}/var/run
  ln -sv /run/lock ${pkgdir}/var/lock
  mkdir -pv ${pkgdir}/var/{opt,cache,lib/{misc,locate},local}
  ln -sv /proc/self/mounts ${pkgdir}/etc/mtab

  # for util-linux
  install -dv -m 0755 ${pkgdir}/var/lib/hwclock

  # for sudo
  install -dv -m 0755 ${pkgdir}/var/db
  install -dv -m 0700 ${pkgdir}/var/db/sudo

  # for openssh
  install -dv -m 0700 ${pkgdir}/var/lib/sshd
  chown root:sys ${pkgdir}/var/lib/sshd

  # for alsa-utils
  install -dv -m 0755 ${pkgdir}/var/lib/alsa

  # for fontconfig
  install -dv -m 0755 ${pkgdir}/var/cache/fontconfig

  # for xorg-server
  install -dv -m 0775 ${pkgdir}/var/lib/xkb

  # for cups
  install -dv -m 0755 ${pkgdir}/var/log/cups
  install -dv -m 0775 ${pkgdir}/var/cache/cups
  install -dv -m 0775 ${pkgdir}/var/cache/cups/rss
  chown -R root:lp ${pkgdir}/var/cache/cups
  install -dv -m 0710 ${pkgdir}/var/spool/cups
  install -dv -m 1770 ${pkgdir}/var/spool/cups/tmp
  chown -R root:lp ${pkgdir}/var/spool/cups

  # for tor
  install -dv -m 0700 ${pkgdir}/var/lib/tor

  # for nginx
  install -dv -m 0755 ${pkgdir}/var/log/nginx
  chown nginx:nginx ${pkgdir}/var/log/nginx
  install -dv -m 0755 ${pkgdir}/var/lib/nginx/proxy
  chown -R nginx:nginx ${pkgdir}/var/lib/nginx

  # for mail packages
  install -dv -m 0755 ${pkgdir}/var/mail

  # for kiin
  mkdir -pv ${pkgdir}/var/lib/kiin/{installed,uninstalled,tarballs,sources,server-listings}
  chown rybalkin:rybalkin ${pkgdir}/var/lib/kiin/{tarballs,sources,server-listings}

  touch ${pkgdir}/var/log/{btmp,lastlog,wtmp}
  chgrp -v utmp ${pkgdir}/var/log/lastlog
  chmod -v 664  ${pkgdir}/var/log/lastlog
  chmod -v 600  ${pkgdir}/var/log/btmp
}
