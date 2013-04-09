#!/bin/sh

pkgname=openjdk
pkgver=1.7.0.9
icedtea_ver=2.3.3
rhino_ver=1_7R3
urls="http://icedtea.classpath.org/download/source/icedtea-${icedtea_ver}.tar.gz \
  http://anduin.linuxfromscratch.org/files/BLFS/OpenJDK-${pkgver}/corba.tar.gz \
  http://anduin.linuxfromscratch.org/files/BLFS/OpenJDK-${pkgver}/hotspot.tar.gz \
  http://anduin.linuxfromscratch.org/files/BLFS/OpenJDK-${pkgver}/openjdk.tar.gz \
  http://anduin.linuxfromscratch.org/files/BLFS/OpenJDK-${pkgver}/jaxp.tar.gz \
  http://anduin.linuxfromscratch.org/files/BLFS/OpenJDK-${pkgver}/jaxws.tar.gz \
  http://anduin.linuxfromscratch.org/files/BLFS/OpenJDK-${pkgver}/langtools.tar.gz \
  http://anduin.linuxfromscratch.org/files/BLFS/OpenJDK-${pkgver}/jdk.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/icedtea-${icedtea_ver}-add_cacerts-1.patch \
  http://www.linuxfromscratch.org/patches/blfs/svn/icedtea-${icedtea_ver}-fixed_paths-1.patch \
  ftp://ftp.mozilla.org/pub/mozilla.org/js/rhino${rhino_ver}.zip \
  http://rybalkin.org/kiin-files/openjdk7_nonreparenting-wm.diff"
srctar=icedtea-${icedtea_ver}.tar.gz
srcdir=${location}/icedtea-${icedtea_ver}

kiin_make() {
  cp -v ../corba.tar.gz .
  cp -v ../hotspot.tar.gz .
  cp -v ../jaxp.tar.gz .
  cp -v ../jaxws.tar.gz .
  cp -v ../jdk.tar.gz .
  cp -v ../langtools.tar.gz .
  cp -v ../openjdk.tar.gz .
  patch -Np1 -i ../icedtea-${icedtea_ver}-add_cacerts-1.patch
  patch -Np1 -i ../icedtea-${icedtea_ver}-fixed_paths-1.patch
  sed -i -e 's/DISTRIBUTION_PATCHES\ =\ patches\/lfs-fixed-paths\.patch/DISTRIBUTION_PATCHES\ =\ patches\/lfs-fixed-paths\.patch\ patches\/openjdk7_nonreparenting-wm\.diff/g' Makefile.am
  cp ../openjdk7_nonreparenting-wm.diff patches
  unset JAVA_HOME
  unset _JAVA_OPTIONS
  ./autogen.sh
  ./configure --with-jdk-home=/opt/jdk \
              --enable-nss \
              --disable-system-gif \
              --disable-system-lcms
  make
}

kiin_install() {
  chmod 0644 openjdk.build/j2sdk-image/lib/sa-jdi.jar
  mkdir -p ${pkgdir}/opt
  cp -R openjdk.build/j2sdk-image ${pkgdir}/opt/OpenJDK-${pkgver}
  chown -R root:root ${pkgdir}/opt/OpenJDK-${pkgver}
  unzip ../rhino${rhino_ver}.zip
  install -v -d -m755 ${pkgdir}/usr/share/java
  install -v -m755 rhino${rhino_ver}/*.jar ${pkgdir}/usr/share/java
  ln -sv OpenJDK-${pkgver} ${pkgdir}/opt/jdk
}
