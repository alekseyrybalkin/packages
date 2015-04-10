#!/bin/sh

pkgname=mygui
pkgver=3.2.2
urls="https://github.com/MyGUI/mygui/archive/MyGUI${pkgver}.tar.gz"
srctar=MyGUI${pkgver}.tar.gz
srcdir=${location}/mygui-MyGUI${pkgver}

kiin_make() {
  sed -i '71 i set(MYGUI_GCC_VISIBILITY_FLAGS "")' CMakeLists.txt
  sed -i 's/\${OIS_LIBRARIES}/${OIS_LIBRARIES} boost_system/g' Common/CMakeLists.txt

  rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYGUI_INSTALL_TOOLS=TRUE \
    -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=TRUE
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
}
