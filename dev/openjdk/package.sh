#!/bin/sh

pkgname=openjdk
vcs="mercurial"
hg_pkgname=icedtea
hgtag=7b39d0b37add
pkgver=7+

# hotspot.map
HOTSPOT_CHANGESET=25fe5bf8dee3
# Makefile.am
OPENJDK_CHANGESET=78c6b2167b94
CORBA_CHANGESET=fd00f67b65c4
JAXP_CHANGESET=7dc9a882c6f8
JAXWS_CHANGESET=ea9a36dfd4ee
JDK_CHANGESET=3f1f89553b54
LANGTOOLS_CHANGESET=68c60cde94a7
urls="http://icedtea.classpath.org/hg/icedtea7-forest/hotspot/archive/${HOTSPOT_CHANGESET}.tar.gz \
  http://icedtea.classpath.org/hg/icedtea7-forest/archive/${OPENJDK_CHANGESET}.tar.gz \
  http://icedtea.classpath.org/hg/icedtea7-forest/corba/archive/${CORBA_CHANGESET}.tar.gz \
  http://icedtea.classpath.org/hg/icedtea7-forest/jaxp/archive/${JAXP_CHANGESET}.tar.gz \
  http://icedtea.classpath.org/hg/icedtea7-forest/jaxws/archive/${JAXWS_CHANGESET}.tar.gz \
  http://icedtea.classpath.org/hg/icedtea7-forest/jdk/archive/${JDK_CHANGESET}.tar.gz \
  http://icedtea.classpath.org/hg/icedtea7-forest/langtools/archive/${LANGTOOLS_CHANGESET}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/icedtea-2.3.3-fixed_paths-1.patch"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cp ../${HOTSPOT_CHANGESET}.tar.gz .
  cp ../${OPENJDK_CHANGESET}.tar.gz .
  cp ../${CORBA_CHANGESET}.tar.gz .
  cp ../${JAXP_CHANGESET}.tar.gz .
  cp ../${JAXWS_CHANGESET}.tar.gz .
  cp ../${JDK_CHANGESET}.tar.gz .
  cp ../${LANGTOOLS_CHANGESET}.tar.gz .
  patch -Np1 -i ../icedtea-2.3.3-fixed_paths-1.patch

  unset JAVA_HOME
  unset _JAVA_OPTIONS
  ./autogen.sh
  ./configure --with-jdk-home=/opt/jdk \
    --enable-nss \
    --with-hotspot-src-zip=${srcdir}/${HOTSPOT_CHANGESET}.tar.gz \
    --with-openjdk-src-zip=${srcdir}/${OPENJDK_CHANGESET}.tar.gz \
    --with-corba-src-zip=${srcdir}/${CORBA_CHANGESET}.tar.gz \
    --with-jaxp-src-zip=${srcdir}/${JAXP_CHANGESET}.tar.gz \
    --with-jaxws-src-zip=${srcdir}/${JAXWS_CHANGESET}.tar.gz \
    --with-jdk-src-zip=${srcdir}/${JDK_CHANGESET}.tar.gz \
    --with-langtools-src-zip=${srcdir}/${LANGTOOLS_CHANGESET}.tar.gz
  make
}

kiin_install() {
  chmod 0644 openjdk.build/j2sdk-image/lib/sa-jdi.jar
  mkdir -p ${pkgdir}/opt
  cp -R openjdk.build/j2sdk-image ${pkgdir}/opt/${pkgname}-${pkgver}
  chown -R root:root ${pkgdir}/opt/${pkgname}-${pkgver}
  ln -sv ${pkgname}-${pkgver} ${pkgdir}/opt/jdk
  ln -sf /etc/ssl/certs/java/cacerts ${pkgdir}/opt/${pkgname}-${pkgver}/jre/lib/security/cacerts
}
