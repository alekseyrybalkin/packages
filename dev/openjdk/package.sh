#!/bin/sh

pkgname=openjdk
vcs="mercurial"
hg_pkgname=icedtea
hgtag=c3c661000904
pkgver=7+

# hotspot.map
HOTSPOT_CHANGESET=62c7dcedbbc4
# Makefile.am
OPENJDK_CHANGESET=51c1d39f82ae
CORBA_CHANGESET=e5da8ecaf6f9
JAXP_CHANGESET=fc76c585e6c5
JAXWS_CHANGESET=b28455339003
JDK_CHANGESET=99a2c23b1d94
LANGTOOLS_CHANGESET=db375fd08fa3
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
  # use openjdk at home, oracle jdk at work, for now
  if [ `hostname` == 'ritchie' ]; then
    ln -sv ${pkgname}-${pkgver} ${pkgdir}/opt/jdk
  fi
  ln -sf /etc/ssl/certs/java/cacerts ${pkgdir}/opt/${pkgname}-${pkgver}/jre/lib/security/cacerts
}
