#!/bin/sh

pkgname=libreoffice
ARCH_NAME=libreoffice-fresh
majorver=5.3.2
pkgver=${majorver}.2
vcs=git
gittag=libreoffice-${pkgver}

kiin_make() {
    python ../libreoffice_prepare_deps.py ${KIIN_HOME}/tarballs/libreoffice

    mkdir -p external/tarballs/tmp
    cp ${KIIN_HOME}/tarballs/libreoffice/* external/tarballs/tmp/
    sed -i -e 's/\$(WGET)/true/g' Makefile.fetch

    sed -e "/gzip -f/d" \
        -e "s|.1.gz|.1|g" \
        -i bin/distro-install-desktop-integration
    sed -e "/distro-install-file-lists/d" -i Makefile.in
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --with-vendor="kiin_gnu_linux" \
        --with-lang="en-US" \
        --with-alloc=system \
        --without-java \
        --without-junit \
        --without-system-dicts \
        --disable-odk \
        --disable-firebird-sdbc \
        --disable-postgresql-sdbc \
        --disable-python \
        --enable-release-build=yes \
        --with-system-apr \
        --with-system-boost \
        --with-system-cairo \
        --with-system-curl \
        --with-system-expat \
        --with-system-icu \
        --with-system-jpeg \
        --with-system-lcms2 \
        --with-system-libpng \
        --with-system-libxml \
        --with-system-nss \
        --with-system-poppler \
        --with-system-serf \
        --with-system-zlib \
        --disable-gstreamer-0.10 \
        --disable-gstreamer-1-0 \
        --disable-dbus \
        --with-parallelism=$(getconf _NPROCESSORS_ONLN)
    make build-nocheck
}

kiin_install() {
    make DESTDIR=${pkgdir} distro-pack-install
    rm -rf ${pkgdir}/gid_Module_*
}
