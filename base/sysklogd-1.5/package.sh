#!/bin/sh

pkgname=sysklogd
pkgver=1.5
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/{etc,sbin}
  mkdir -pv ${pkgdir}/usr/share/man/man5
  mkdir -pv ${pkgdir}/usr/share/man/man8
  mkdir -pv ${pkgdir}/usr/sbin
  make prefix=${pkgdir} install
  mv -v ${pkgdir}/usr/sbin/* ${pkgdir}/sbin

  cat > ${pkgdir}/etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF
}
