#!/bin/sh

pkgname=openjdk
vcs="mercurial"
hg_pkgname=icedtea
hgtag=e562523c5037
pkgver=7+

HOTSPOT_CHANGESET=2fc73bd48efa
OPENJDK_CHANGESET=6579f526e5e4
CORBA_CHANGESET=4366e0fe59d5
JAXP_CHANGESET=5a11895b645d
JAXWS_CHANGESET=29619865cc64
JDK_CHANGESET=d4cd8f10764d
LANGTOOLS_CHANGESET=718a945bfdb9
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
