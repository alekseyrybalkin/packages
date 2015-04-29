#!/bin/sh

pkgname=cairo
vcs="git"
gittag=1.14.2
pkgver=${gittag}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  export ac_cv_lib_lzo2_lzo2a_decompress="no"
  NOCONFIGURE=1 ./autogen.sh
  if [ -z "$KIIN_LIB32" ]; then
    CFLAGS="${CFLAGS} -ffat-lto-objects" ./configure --prefix=/usr \
      --disable-static \
      --enable-gl \
      --enable-egl \
      --enable-tee \
      --libdir=$LIBDIR
  else
    rm -rf test
    rm -rf perf
    sed -i -e 's/test\/Makefile//g' configure
    sed -i -e 's/test\/Makefile//g' configure.ac
    sed -i -e 's/perf\/Makefile//g' configure
    sed -i -e 's/perf\/Makefile//g' configure.ac
    sed -i -e 's/test\/pdiff\/Makefile//g' configure
    sed -i -e 's/test\/pdiff\/Makefile//g' configure.ac
    sed -i -e 's/perf\/micro\/Makefile//g' configure
    sed -i -e 's/perf\/micro\/Makefile//g' configure.ac
    CFLAGS="${CFLAGS} -ffat-lto-objects" ./configure --prefix=/usr \
      --disable-static \
      --disable-xlib-xcb \
      --libdir=$LIBDIR
    sed -i -e 's/boilerplate\ test\ perf/boilerplate/g' Makefile
    sed -i -e 's/boilerplate\ test\ perf/boilerplate/g' Makefile.am
    sed -i -e 's/boilerplate\ test\ perf/boilerplate/g' Makefile.in
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
