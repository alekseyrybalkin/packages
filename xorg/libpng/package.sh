#!/bin/sh

pkgname=libpng
pkgver=1.6.26
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    autoreconf -fi
    if [ -z "$KIIN_LIB32" ]; then
        ./configure --prefix=/usr \
            --disable-static
    else
        ./configure --prefix=/usr \
            --disable-static --program-suffix=-32 --libdir=/usr/lib32
    fi
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    if [ -z "$KIIN_LIB32" ]; then
        mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
        cp README libpng-manual.txt ${pkgdir}/usr/share/doc/${pkgname}
    else
        cd contrib/pngminus
        make PNGLIB="-L${pkgdir}/usr/lib32 -lpng" -f makefile.std png2pnm pnm2png
        rm -rf "${pkgdir}"/usr/{include,share}
        rm "${pkgdir}/usr/bin/libpng-config"
        ln -s "libpng16-config-32" "${pkgdir}/usr/bin/libpng-config-32"
    fi
}
