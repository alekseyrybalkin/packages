#!/bin/sh

pkgname=glm
pkgver=0.9.5.3
urls="http://sourceforge.net/projects/ogl-math/files/glm-${pkgver}/glm-${pkgver}.zip"
srczip=${pkgname}-${pkgver}.zip
srcdir=${location}/${pkgname}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/include/glm
  mkdir -p ${pkgdir}/usr/share/doc
  cp -r glm ${pkgdir}/usr/include
  cp -r doc ${pkgdir}/usr/share/doc/glm
  rm -f ${pkgdir}/usr/include/glm/CMakeLists.txt
  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
  install -Dm644 util/FindGLM.cmake ${pkgdir}/usr/share/cmake-2.8/Modules/FindGLM.cmake
}
