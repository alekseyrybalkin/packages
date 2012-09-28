#!/bin/sh

pkgname=filesystem
pkgver=1
#srctar=${pkgname}-${pkgver}.tar.bz2
#srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -v ${pkgdir}/{dev,proc,sys}
  mknod -m 600 ${pkgdir}/dev/console c 5 1
  mknod -m 666 ${pkgdir}/dev/null c 1 3
  mkdir -pv ${pkgdir}/{bin,boot,etc/{opt,sysconfig},home,lib,mnt,opt,run}
  mkdir -pv ${pkgdir}/{media/{floppy,cdrom},sbin,srv,var}
  install -dv -m 0750 ${pkgdir}/root
  install -dv -m 1777 ${pkgdir}/tmp ${pkgdir}/var/tmp
  mkdir -pv ${pkgdir}/usr/{,local/}{bin,include,lib,sbin,src}
  mkdir -pv ${pkgdir}/usr/{,local/}share/{doc,info,locale,man}
  mkdir -v  ${pkgdir}/usr/{,local/}share/{misc,terminfo,zoneinfo}
  mkdir -pv ${pkgdir}/usr/{,local/}share/man/man{1..8}
  for dir in ${pkgdir}/usr ${pkgdir}/usr/local; do
    ln -sv share/{man,doc,info} $dir
  done
  case $(uname -m) in
  x86_64) ln -sv lib ${pkgdir}/lib64 && ln -sv lib ${pkgdir}/usr/lib64 ;;
  esac
  mkdir -v ${pkgdir}/var/{log,mail,spool}
  ln -sv /run ${pkgdir}/var/run
  ln -sv /run/lock ${pkgdir}/var/lock
  mkdir -pv ${pkgdir}/var/{opt,cache,lib/{misc,locate},local}
  touch ${pkgdir}/etc/mtab

  # for sudo
  install -dv -m 0755 ${pkgdir}/var/db
  install -dv -m 0700 ${pkgdir}/var/db/sudo

  # for openssh
  install -dv -m 0700 ${pkgdir}/var/lib/sshd
  chown root:sys ${pkgdir}/var/lib/sshd

  touch ${pkgdir}/var/log/{btmp,lastlog,wtmp}
  chgrp -v utmp ${pkgdir}/var/log/lastlog
  chmod -v 664  ${pkgdir}/var/log/lastlog
  chmod -v 600  ${pkgdir}/var/log/btmp

  cat > ${pkgdir}/etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/sda3      /            ext4     defaults            1     1
/dev/sda1      swap         swap     pri=1               0     0
proc           /proc        proc     nosuid,noexec,nodev 0     0
sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts     devpts   gid=5,mode=620      0     0
tmpfs          /run         tmpfs    defaults            0     0
devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0

# End /etc/fstab
EOF
}
