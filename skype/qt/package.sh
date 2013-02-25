#!/bin/sh

pkgname=qt
pkgver=4.8.4
urls="http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${pkgver}.tar.gz"
srctar=qt-everywhere-opensource-src-${pkgver}.tar.gz
srcdir=${location}/qt-everywhere-opensource-src-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure -prefix /usr \
      -docdir /usr/share/doc/qt \
      -plugindir /usr/lib/qt/plugins \
      -importdir /usr/lib/qt/imports \
      -datadir /usr/share/qt \
      -translationdir /usr/share/qt/translations \
      -examplesdir /usr/share/doc/qt/examples \
      -demosdir /usr/share/doc/qt/demos \
      -release \
      -nomake examples \
      -nomake demos \
      -nomake docs \
      -nomake tests \
      -system-sqlite \
      -openssl-linked \
      -no-phonon \
      -no-phonon-backend \
      -no-webkit \
      -no-nis \
      -no-rpath \
      -no-cups \
      -no-icu \
      -no-dbus \
      -opengl \
      -optimized-qmake \
      -reduce-relocations \
      -opensource \
      -confirm-license
  else
    sed -i "/^QMAKE_LINK\s/s|g++|g++ -m32|g" mkspecs/common/g++-base.conf
    sed -i "s|-O2|${CXXFLAGS} -m32|" mkspecs/common/g++-base.conf
    sed -i "s|-O2|${CXXFLAGS} -m32|" mkspecs/common/gcc-base.conf
    sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" mkspecs/common/gcc-base-unix.conf
    sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS} -m32|g" mkspecs/common/gcc-base.conf
    sed -i "s|-Wl,-O1|-m32 -Wl,-O1|" mkspecs/common/g++-unix.conf
    sed -e "s|-O2|$CXXFLAGS -m32|" \
        -e "/^QMAKE_RPATH/s| -Wl,-rpath,||g" \
        -e "/^QMAKE_LINK\s/s|g++|g++ -m32|g" \
        -e "/^QMAKE_LFLAGS\s/s|+=|+= $LDFLAGS|g" \
        -i mkspecs/common/g++.conf
    ./configure -prefix /usr \
      -libdir $LIBDIR \
      -v -platform linux-g++-32 \
      -docdir /usr/share/doc/qt \
      -plugindir /usr/lib32/qt/plugins \
      -importdir /usr/lib32/qt/imports \
      -datadir /usr/share/qt \
      -translationdir /usr/share/qt/translations \
      -examplesdir /usr/share/doc/qt/examples \
      -demosdir /usr/share/doc/qt/demos \
      -release \
      -nomake examples \
      -nomake demos \
      -nomake docs \
      -nomake tests \
      -system-sqlite \
      -no-phonon \
      -no-phonon-backend \
      -no-nis \
      -no-rpath \
      -no-cups \
      -no-icu \
      -opengl \
      -optimized-qmake \
      -reduce-relocations \
      -opensource \
      -confirm-license
  fi
  make
}

kiin_install() {
  make INSTALL_ROOT=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/doc/qt
  if [ -n "$KIIN_LIB32" ]; then
    # Fix wrong path in pkgconfig files
    find ${pkgdir}/usr/lib32/pkgconfig -type f -name '*.pc' \
      -exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;
    # Fix wrong path in prl files
    find ${pkgdir}/usr/lib32 -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
    rm -rf "${pkgdir}"/usr/{include,share,bin,tests}
  fi
}
