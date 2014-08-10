#!/bin/sh

pkgname=openjdk
ARCH_NAME=java7-openjdk
vcs="mercurial"
hg_pkgname=icedtea7-2.4
_icedtea_ver=2.4.5
hgtag=7449e5c8ae77

# hotspot.map
HOTSPOT_CHANGESET=2cb58882dac3
# Makefile.am
JDK_UPDATE_VERSION=51
OPENJDK_CHANGESET=410eb7fef869
CORBA_CHANGESET=3594dbde270d
JAXP_CHANGESET=8fe156ad49e2
JAXWS_CHANGESET=32ea8b1ed91a
JDK_CHANGESET=9db88c18e114
LANGTOOLS_CHANGESET=dabd37b7e295

pkgver=7.u${JDK_UPDATE_VERSION}_${_icedtea_ver}

_hgurl="http://icedtea.classpath.org/hg/release/icedtea7-forest-${_icedtea_ver:0:3}"

urls="${_hgurl}/hotspot/archive/${HOTSPOT_CHANGESET}.tar.gz \
  ${_hgurl}/archive/${OPENJDK_CHANGESET}.tar.gz \
  ${_hgurl}/corba/archive/${CORBA_CHANGESET}.tar.gz \
  ${_hgurl}/jaxp/archive/${JAXP_CHANGESET}.tar.gz \
  ${_hgurl}/jaxws/archive/${JAXWS_CHANGESET}.tar.gz \
  ${_hgurl}/jdk/archive/${JDK_CHANGESET}.tar.gz \
  ${_hgurl}/langtools/archive/${LANGTOOLS_CHANGESET}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/icedtea-2.3.3-fixed_paths-1.patch"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cp ${KIIN_HOME}/tarballs/${HOTSPOT_CHANGESET}.tar.gz .
  cp ${KIIN_HOME}/tarballs/${OPENJDK_CHANGESET}.tar.gz .
  cp ${KIIN_HOME}/tarballs/${CORBA_CHANGESET}.tar.gz .
  cp ${KIIN_HOME}/tarballs/${JAXP_CHANGESET}.tar.gz .
  cp ${KIIN_HOME}/tarballs/${JAXWS_CHANGESET}.tar.gz .
  cp ${KIIN_HOME}/tarballs/${JDK_CHANGESET}.tar.gz .
  cp ${KIIN_HOME}/tarballs/${LANGTOOLS_CHANGESET}.tar.gz .
  patch -Np1 -i ${KIIN_HOME}/tarballs/icedtea-2.3.3-fixed_paths-1.patch

  unset JAVA_HOME
  unset _JAVA_OPTIONS
  unset J2SDKDIR
  unset J2REDIR
  ./autogen.sh
  _JDK_HOME=`find /opt -maxdepth 1 -name "openjdk-*" | sort | head -n 1`
  ./configure --with-jdk-home=${_JDK_HOME} \
    --enable-nss \
    --disable-system-kerberos \
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
