#!/bin/sh

pkgname=libreoffice
majorver=4.2.0
pkgver=${majorver}.1
extension=xz
major_folder="http://download.documentfoundation.org/libreoffice/src/"
check_server=1

. ${KIIN_HOME}/defaults.sh

urls="${urls} \
  ${folder}libreoffice-dictionaries-${pkgver}.tar.xz \
  ${folder}libreoffice-help-${pkgver}.tar.xz"
majorver_grep="^[0-9]+\.[0-9]+\.[0-9]+/?$"

kiin_make() {
  install -dm755 src
  tar -xf ../libreoffice-dictionaries-${pkgver}.tar.xz --no-overwrite-dir --strip-components=1
  ln -sv ../../libreoffice-dictionaries-${pkgver}.tar.xz src/
  ln -sv ../../libreoffice-help-${pkgver}.tar.xz src/
  sed -e "/gzip -f/d" \
    -e "s|.1.gz|.1|g" \
    -i bin/distro-install-desktop-integration
  sed -e "/distro-install-file-lists/d" -i Makefile.in
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
