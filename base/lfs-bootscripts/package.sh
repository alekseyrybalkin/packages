#!/bin/sh

pkgname=lfs-bootscripts
pkgver=20120905
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ls ${pkgdir}/etc/rc.d/rc*/*network* | xargs rm

  # remove /etc/sysconfig/rc.site, it is in git repo now
  rm ${pkgdir}/etc/sysconfig/rc.site
  # remove /etc/sysconfig/createfiles, it is in git repo now
  rm ${pkgdir}/etc/sysconfig/createfiles

  cat > ${pkgdir}/etc/rc.d/init.d/rybalkin << "EOF"
#!/bin/sh

. /lib/lsb/init-functions

case "${1}" in
    start)
      log_info_msg "Running rybalkin custom initscript..."
      /sbin/hdparm -B 255 /dev/sda >/dev/null
      loadkeys /lib/kbd/keymaps/i386/qwerty/ru.map.gz
      setfont /lib/kbd/consolefonts/UniCyrExt_8x16.psf.gz
      /root/bin/wifi &
      evaluate_retval
      ;;

    stop)
      log_info_msg "Stopping rybalkin custom initscript..."
      /root/bin/uwifi
      evaluate_retval
      ;;

    status)
      /sbin/ifstat
      ;;

    *)
      echo "Usage: ${0} {start|stop|status}"
      exit 1
      ;;
esac

exit 0
EOF
  chmod +x ${pkgdir}/etc/rc.d/init.d/rybalkin

  ln -sv ../init.d/rybalkin ${pkgdir}/etc/rc.d/rc0.d/K91rybalkin
  ln -sv ../init.d/rybalkin ${pkgdir}/etc/rc.d/rc6.d/K91rybalkin
  ln -sv ../init.d/rybalkin ${pkgdir}/etc/rc.d/rc3.d/S11rybalkin
}
