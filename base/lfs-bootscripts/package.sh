#!/bin/sh

pkgname=lfs-bootscripts
pkgver=20120905
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -pv ${pkgdir}/etc
  cat > ${pkgdir}/etc/resolv.conf << "EOF"
nameserver 208.67.222.222
nameserver 208.67.220.220
EOF

  cat > ${pkgdir}/etc/hosts << "EOF"
127.0.0.1   localhost.localdomain   localhost   alien
::1         localhost.localdomain   localhost
EOF

  make DESTDIR=${pkgdir} install
  ls ${pkgdir}/etc/rc.d/rc*/*network* | xargs rm

  cat > ${pkgdir}/etc/inittab << "EOF"
# Begin /etc/inittab

id:3:initdefault:

si::sysinit:/etc/rc.d/init.d/rc S

l0:0:wait:/etc/rc.d/init.d/rc 0
l1:S1:wait:/etc/rc.d/init.d/rc 1
l2:2:wait:/etc/rc.d/init.d/rc 2
l3:3:wait:/etc/rc.d/init.d/rc 3
l4:4:wait:/etc/rc.d/init.d/rc 4
l5:5:wait:/etc/rc.d/init.d/rc 5
l6:6:wait:/etc/rc.d/init.d/rc 6

ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now

su:S016:once:/sbin/sulogin

1:2345:respawn:/sbin/agetty --noclear tty1 9600
2:2345:respawn:/sbin/agetty tty2 9600
3:2345:respawn:/sbin/agetty tty3 9600
4:2345:respawn:/sbin/agetty tty4 9600
5:2345:respawn:/sbin/agetty tty5 9600
6:2345:respawn:/sbin/agetty tty6 9600

# End /etc/inittab
EOF

  echo "HOSTNAME=alien" > ${pkgdir}/etc/sysconfig/network

  cat > ${pkgdir}/etc/sysconfig/clock << "EOF"
# Begin /etc/sysconfig/clock

UTC=1

# Set this to any options you might need to give to hwclock,
# such as machine hardware clock type for Alphas.
CLOCKPARAMS=

# End /etc/sysconfig/clock
EOF

  cat > ${pkgdir}/etc/sysconfig/console << "EOF"
LOGLEVEL=4
EOF

  cat > ${pkgdir}/etc/sysconfig/rc.site << "EOF"
# rc.site
# Optional parameters for boot scripts.

# Distro Information
# These values, if specified here, override the defaults
#DISTRO="Linux From Scratch" # The distro name
#DISTRO_CONTACT="lfs-dev@linuxfromscratch.org" # Bug report address
#DISTRO_MINI="LFS" # Short name used in filenames for distro config

# Define custom colors used in messages printed to the screen

# Please consult `man console_codes` for more information
# under the "ECMA-48 Set Graphics Rendition" section
#
# Warning: when switching from a 8bit to a 9bit font,
# the linux console will reinterpret the bold (1;) to
# the top 256 glyphs of the 9bit font.  This does
# not affect framebuffer consoles

# These values, if specified here, override the defaults
#BRACKET="\\033[1;34m" # Blue
#FAILURE="\\033[1;31m" # Red
#INFO="\\033[1;36m"    # Cyan
#NORMAL="\\033[0;39m"  # Grey
#SUCCESS="\\033[1;32m" # Green
#WARNING="\\033[1;33m" # Yellow

# Use a colored prefix
# These values, if specified here, override the defaults
#BMPREFIX="     "
#SUCCESS_PREFIX="${SUCCESS}  *  ${NORMAL}"
#FAILURE_PREFIX="${FAILURE}*****${NORMAL}"
#WARNING_PREFIX="${WARNING} *** ${NORMAL}"

# Interactive startup
#IPROMPT="yes" # Whether to display the interactive boot prompt
#itime="3"    # The amount of time (in seconds) to display the prompt

# The total length of the distro welcome string, without escape codes
#wlen=$(echo "Welcome to ${DISTRO}" | wc -c )
#welcome_message="Welcome to ${INFO}${DISTRO}${NORMAL}"

# The total length of the interactive string, without escape codes
#ilen=$(echo "Press 'I' to enter interactive startup" | wc -c )
#i_message="Press '${FAILURE}I${NORMAL}' to enter interactive startup"

# Set scripts to skip the file system check on reboot
#FASTBOOT=yes

# Skip reading from the console
#HEADLESS=yes

# Skip cleaning /tmp
#SKIPTMPCLEAN=yes

# For setclock
#UTC=1
#CLOCKPARAMS=

# For consolelog
#LOGLEVEL=5

# For network
#HOSTNAME=mylfs

# Delay between TERM and KILL signals at shutdown
#KILLDELAY=3

# Optional sysklogd parameters
#SYSKLOGD_PARMS="-m 0"

# Console parameters
#UNICODE=1
#KEYMAP="de-latin1"
#KEYMAP_CORRECTIONS="euro2"
#FONT="lat0-16 -m 8859-15"
#LEGACY_CHARSET=
EOF

  cat > ${pkgdir}/etc/profile << "EOF"
export LANG=en_US.UTF-8
EOF

  cat > ${pkgdir}/etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

  echo "SVN-20120905" > ${pkgdir}/etc/lfs-release

  cat > ${pkgdir}/etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="SVN-20120905"
DISTRIB_CODENAME="rybalkiin"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

  cat > ${pkgdir}/etc/rc.d/init.d/rybalkin << "EOF"
#!/bin/sh

. /lib/lsb/init-functions

case "${1}" in
    start)
      log_info_msg "Running rybalkin custom initscript..."
      /sbin/hdparm -B 255 /dev/sda >/dev/null
      /sbin/dhcpcd -q eth0
      evaluate_retval
      ;;

    stop)
      log_info_msg "Stopping rybalkin custom initscript..."
      /sbin/dhcpcd -qk eth0
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

  ln -sv ../init.d/rybalkin ${pkgdir}/etc/rc.d/rc0.d/K91rybalkin
  ln -sv ../init.d/rybalkin ${pkgdir}/etc/rc.d/rc6.d/K91rybalkin
  ln -sv ../init.d/rybalkin ${pkgdir}/etc/rc.d/rc3.d/S11rybalkin
}
