#!/bin/sh

pkgname=cairo
vcs="git"
gittag=74a19c527c1fa07ade2042a8d2acecbb5f6ccab1
pkgver=1.12.10.20130129
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
      --disable-static \
      --enable-tee \
      --enable-xcb \
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
    ./configure --prefix=/usr \
      --disable-static \
      --enable-tee \
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
