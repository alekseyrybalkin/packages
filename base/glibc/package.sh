#!/bin/sh

pkgname=glibc
pkgver=2.18
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's/3\.\[89/4\.\[0/g' configure.in
  sed -i -e 's/3\.\[89/4\.\[0/g' configure
  mkdir -v glibc-build
  cd glibc-build
  if [ -z "$KIIN_LIB32" ]; then
    ../configure \
        --prefix=/usr \
        --disable-profile \
        --enable-kernel=2.6.34 \
        --libexecdir=/usr/lib/glibc \
        --disable-nscd \
        --enable-multi-arch
  else
    echo "slibdir=/usr/lib32" >> configparms
    ../configure \
        --prefix=/usr \
        --disable-profile \
        --enable-kernel=2.6.25 \
        --libexecdir=/usr/lib32 \
        --disable-nscd \
        --libdir=/usr/lib32 \
        --enable-multi-arch i686-unknown-linux-gnu
  fi
  make
}

kiin_install() {
  cd glibc-build
  mkdir -p ${pkgdir}/etc/ld.so.conf.d
  make install_root=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    mkdir -pv ${pkgdir}/usr/include/{rpc,rpcsvc}
    cp -v ../sunrpc/rpc/*.h ${pkgdir}/usr/include/rpc
    cp -v ../sunrpc/rpcsvc/*.h ${pkgdir}/usr/include/rpcsvc
    cp -v ../nis/rpcsvc/*.h ${pkgdir}/usr/include/rpcsvc
    mkdir -pv ${pkgdir}/usr/lib/locale
    # remove /var, filesystem package creates everything in there
    # TODO: decide with /var/db/Makefile
    rm -rvf ${pkgdir}/var
  else
    rm -rf ${pkgdir}/{etc,sbin,usr/{bin,sbin,share},var}
    # We need one 32 bit specific header file
    find ${pkgdir}/usr/include -type f -not -name stubs-32.h -delete
    # Dynamic linker
    mkdir ${pkgdir}/lib
    ln -s /usr/lib32/ld-linux.so.2 ${pkgdir}/lib/
    # Add lib32 paths to the default library search path
    install -Dm644 ../../lib32-glibc.conf ${pkgdir}/etc/ld.so.conf.d/lib32-glibc.conf
    # Symlink /usr/lib32/locale to /usr/lib/locale
    ln -s ../lib/locale ${pkgdir}/usr/lib32/locale
  fi
}

kiin_after_install() {
  localedef -i en_US -f UTF-8 en_US.UTF-8
}

kiin_after_upgrade() {
  kiin_after_install
}
