#!/bin/sh

pkgname=sdl
vcs="mercurial"
hgtag="f7fd5c3951b9"
pkgver=1.2.15+
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '168d' src/video/x11/SDL_x11sym.h
  sed -i -e '167aSDL_X11_SYM(int,_XData32,(Display *dpy,register _Xconst long *data,unsigned len),(dpy,data,len),return)' src/video/x11/SDL_x11sym.h
  ./autogen.sh
  mkdir sdl-build
  cd sdl-build
  ../configure --prefix=/usr \
    --enable-alsa \
    --with-x \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  cd sdl-build
  make DESTDIR=${pkgdir} install
}
