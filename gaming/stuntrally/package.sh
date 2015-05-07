#!/bin/sh

pkgname=stuntrally
pkgver=2.5
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's/OGRE_EXCEPT(0/OGRE_EXCEPT(Ogre::Exception::ERR_INVALIDPARAMS/g' \
    source/paged-geom/{PropertyMaps.cpp,BatchedGeometry.cpp,PagedGeometry.cpp}
  sed -i -e 's/OGRE_EXCEPT(1/OGRE_EXCEPT(Ogre::Exception::ERR_INVALIDPARAMS/g' \
    source/paged-geom/{TreeLoader2D.cpp,TreeLoader3D.cpp,PagedGeometry.cpp}

  rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DSHARE_INSTALL="share/stuntrally"
  make

  cd ../
  git clone ${SOURCES_HOME}/stuntrally-tracks
  cd stuntrally-tracks
  git checkout ${pkgver}

  rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install

  cd ../stuntrally-tracks/build
  make DESTDIR=${pkgdir}/usr/share/stuntrally/ install

  rm "${pkgdir}/usr/share/stuntrally/objects0/_readme 0 A.D.txt"
}

kiin_after_install() {
  getent group bilbo >/dev/null || groupadd bilbo
  getent passwd bilbo >/dev/null || \
    useradd -m -g bilbo -G audio,video -s /bin/bash bilbo
  chmod 700 /usr/bin/{sr-editor,stuntrally}
  chown bilbo:bilbo /usr/bin/{sr-editor,stuntrally}
}

kiin_after_upgrade() {
  kiin_after_install
}
