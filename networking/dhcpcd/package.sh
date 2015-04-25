#!/bin/sh

pkgname=dhcpcd
pkgver=6.8.1
extension=bz2
folder="http://roy.marples.name/downloads/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --libexecdir=/usr/lib/dhcpcd \
    --dbdir=/run \
    --sbindir=/usr/bin \
    --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/lib/dhcpcd/* ${pkgdir}/usr/lib/dhcpcd
  rm -rf ${pkgdir}/lib

  # why i need this?
  sed -i "s;/var/lib;/run;g" dhcpcd-hooks/50-dhcpcd-compat
  install -v -m 644 dhcpcd-hooks/50-dhcpcd-compat ${pkgdir}/usr/lib/dhcpcd/dhcpcd-hooks/
  rm -r ${pkgdir}/run

  # do not replace system-wide config, since it is in git repo now
  mv -v ${pkgdir}/etc/dhcpcd.conf{,.packaged}

  # + some shit about useless bootscripts

  # The default behavior of dhcpcd sets the hostname and mtu settings.
  # It also overwrites /etc/resolv.conf and /etc/ntp.conf. These
  # modifications to system files and settings on system configuration
  # files are done by hooks which are stored in
  # /usr/lib/dhcpcd/dhcpcd-hooks. Setup dhcpcd by removing or adding hooks
  # from/to that directory. The execution of hooks can be disabled by
  # using the --nohook (-C) command line option or by the nohook
  # option in the /etc/dhcpcd.conf file.
  # Review the dhcpcd man page for switches to add to the DHCP_START
  # value.
}

known="etc/dhcpcd.duid"
