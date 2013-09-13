#!/bin/sh

pkgname=openssh
pkgver=6.3p1
extension=gz
folder="http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/openssh \
    --sysconfdir=/etc/ssh \
    --datadir=/usr/share/sshd \
    --with-md5-passwords \
    --with-privsep-path=/var/lib/sshd
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  install -v -m644 INSTALL LICENCE OVERVIEW README* \
      ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
  # do not replace sshd_config, since it is in git repo now
  mv -v ${pkgdir}/etc/ssh/sshd_config{,.packaged}
}

kiin_after_install() {
  getent group sshd >/dev/null || groupadd -g 50 sshd
  getent passwd sshd >/dev/null || \
    useradd -c 'sshd PrivSep' -d /var/lib/sshd -g sshd \
    -s /bin/false -u 50 sshd
  [ -f /etc/ssh/ssh_host_key ] || ssh-keygen -A
}

kiin_after_upgrade() {
  kiin_after_install
}
