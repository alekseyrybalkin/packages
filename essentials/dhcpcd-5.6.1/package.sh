#!/bin/sh

pkgname=dhcpcd
pkgver=5.6.1
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --libexecdir=/lib/dhcpcd \
              --dbdir=/run             \
              --sysconfdir=/etc &&
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install

  # was it done or not? why i need this?
  #sed -i "s;/var/lib;/run;g" dhcpcd-hooks/50-dhcpcd-compat &&
  #install -v -m 644 dhcpcd-hooks/50-dhcpcd-compat /lib/dhcpcd/dhcpcd-hooks/

  # + some shit about useless bootscripts

  # The default behavior of dhcpcd sets the hostname and mtu settings.
  # It also overwrites /etc/resolv.conf and /etc/ntp.conf. These
  # modifications to system files and settings on system configuration
  # files are done by hooks which are stored in
  # /lib/dhcpcd/dhcpcd-hooks. Setup dhcpcd by removing or adding hooks
  # from/to that directory. The execution of hooks can be disabled by
  # using the --nohook (-C) command line option or by the nohook
  # option in the /etc/dhcpcd.conf file.
  # Review the dhcpcd man page for switches to add to the DHCP_START
  # value.
}
