#!/bin/sh

pkgname=openjdk
vcs="mercurial"
hg_pkgname=icedtea
hgtag=0a8108854365
pkgver=7+

# hotspot.map
HOTSPOT_CHANGESET=2efa7b70e843
# Makefile.am
OPENJDK_CHANGESET=424e7e279ef6
CORBA_CHANGESET=2abbbec3c03c
JAXP_CHANGESET=9ce0c87f3e87
JAXWS_CHANGESET=7278e9a73874
JDK_CHANGESET=afaedb56b499
LANGTOOLS_CHANGESET=c523dcea4ff3
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
  unset J2SDKDIR
  unset J2REDIR
  ./autogen.sh
  ./configure --with-jdk-home=/opt/openjdk-7+ \
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
  # use openjdk at home, oracle jdk at work, for now
  if [ `hostname` == 'ritchie' ]; then
    ln -sv ${pkgname}-${pkgver} ${pkgdir}/opt/jdk
  fi
  ln -sf /etc/ssl/certs/java/cacerts ${pkgdir}/opt/${pkgname}-${pkgver}/jre/lib/security/cacerts
}
