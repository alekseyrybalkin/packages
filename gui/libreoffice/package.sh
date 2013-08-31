#!/bin/sh

pkgname=libreoffice
_majorver=4.1.1
pkgver=4.1.1.2
urls="http://download.documentfoundation.org/libreoffice/src/${_majorver}/libreoffice-${pkgver}.tar.xz \
  http://download.documentfoundation.org/libreoffice/src/${_majorver}/libreoffice-dictionaries-${pkgver}.tar.xz \
  http://download.documentfoundation.org/libreoffice/src/${_majorver}/libreoffice-help-${pkgver}.tar.xz \
  http://www.linuxfromscratch.org/patches/blfs/svn/libreoffice-4.1.0.4-system_neon-1.patch"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  install -dm755 src
  tar -xf ../libreoffice-dictionaries-${pkgver}.tar.xz --no-overwrite-dir --strip-components=1
  ln -sv ../../libreoffice-dictionaries-${pkgver}.tar.xz src/
  ln -sv ../../libreoffice-help-${pkgver}.tar.xz src/
  sed -e "/gzip -f/d" \
    -e "s|.1.gz|.1|g" \
    -i bin/distro-install-desktop-integration
  sed -e "/distro-install-file-lists/d" -i Makefile.in
  patch -Np1 -i ../libreoffice-4.1.0.4-system_neon-1.patch
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --with-vendor="kiin GNU/Linux" \
    --with-lang="en-US" \
    --with-alloc=system \
    --without-java \
    --disable-gconf \
    --disable-odk \
    --disable-postgresql-sdbc \
    --disable-python \
    --with-system-boost \
    --with-system-cairo \
    --with-system-curl \
    --with-system-expat \
    --with-system-harfbuzz \
    --with-system-icu \
    --with-system-jpeg \
    --with-system-lcms2 \
    --with-system-libpng \
    --with-system-libxml \
    --with-system-mesa-headers \
    --with-system-nss \
    --with-system-openssl \
    --with-system-poppler \
    --with-system-neon \
    --with-system-zlib \
    --disable-gstreamer-0.10 \
    --disable-dbus \
    --with-parallelism=$(getconf _NPROCESSORS_ONLN)
    #--with-system-odbc \
    #--with-system-openldap \
    #--with-system-redland \
    #--enable-gstreamer=no \
  make build
}

kiin_install() {
  make DESTDIR=${pkgdir} distro-pack-install
  rm -rf ${pkgdir}/gid_Module_*
}
