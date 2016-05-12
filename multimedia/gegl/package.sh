#!/bin/sh

pkgname=gegl
ARCH_NAME=gegl02
pkgver=0.2.0
vcs=git
gittag=GEGL_${pkgver//\./_}
urls="http://gd.tuwien.ac.at/graphics/gimp/gegl/0.2/gegl-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    # disable plug-in dir creation
    sed -i -e 's/g_mkdir_with_parents (module_path/0 \&\& g_mkdir_with_parents (module_path/g'  gegl/gegl-init.c
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
