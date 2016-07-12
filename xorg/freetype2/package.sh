#!/bin/sh

pkgname=freetype2
pkgver=2.6.5
vcs=git
gittag=VER-${pkgver//\./-}
srcdir=${location}/freetype-${pkgver}

kiin_make() {
    ./autogen.sh
    sed -e "/AUX.*.gxvalid/s@^# @@" -e "/AUX.*.otvalid/s@^# @@" \
        -i modules.cfg
    sed -e "/#.*.FT_CONFIG_OPTION_SUBPIXEL_RENDERING/s@/\* @@" -e "/#.*.FT_CONFIG_OPTION_SUBPIXEL_RENDERING/s@ \*/@@" \
        -i include/freetype/config/ftoption.h
    sed -e "/#.*.TT_CONFIG_OPTION_SUBPIXEL_HINTING\ \ 2/s@/\* @@" -e "/#.*.TT_CONFIG_OPTION_SUBPIXEL_HINTING\ \ 2/s@ \*/@@" \
        -i include/freetype/config/ftoption.h
    if [ -z "${KIIN_LIB32}" ]; then
        ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    else
        ./configure --prefix=/usr --disable-static --with-harfbuzz=no --libdir=$LIBDIR
    fi
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
