#!/bin/sh

pkgname=rubberband
pkgver=1.8.2
vcs=mercurial
hgtag=v${pkgver}
relmon_id=4222

kiin_make() {
    patch -Np1 -i ../kissfft.patch

    sed -i -e '/cp.*JNI_TARGET/d' Makefile.in

    # disable ladspa and vamp plugins
    for plugin in ladspa vamp; do
        sed -i -e "s/ @${plugin}_cflags@//Ig" Makefile.in
        sed -i -e "s/ \$(${plugin}_objects)//Ig" Makefile.in
        sed -i -e "s/ \$(${plugin}_target)//Ig" Makefile.in
        sed -i -e "/${plugin}/Id" Makefile.in configure.ac
    done

    # use kissfft instead of fftw
    sed -i -e '/fftw/Id' configure.ac
    sed -i -e 's/ -DHAVE_FFTW3 -DFFTW_DOUBLE_ONLY/ -DUSE_KISSFFT/g' Makefile.in
    sed -i -e "s/ @fftw_cflags@//Ig" Makefile.in
    sed -i -e "s/ @fftw_libs@//Ig" Makefile.in

    autoreconf -vfi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
