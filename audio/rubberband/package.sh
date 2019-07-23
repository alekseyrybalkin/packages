#!/bin/sh

pkgname=rubberband
pkgver=1.8.2
vcs=mercurial
hgtag=v${pkgver}
relmon_id=4222

kiin_make() {
    sed -i -e '/cp.*JNI_TARGET/d' Makefile.in

    # disable ladspa and vamp plugins
    for plugin in ladspa vamp; do
        sed -i -e "s/ @${plugin}_cflags@//Ig" Makefile.in
        sed -i -e "s/ \$(${plugin}_objects)//Ig" Makefile.in
        sed -i -e "s/ \$(${plugin}_target)//Ig" Makefile.in
        sed -i -e "/${plugin}/Id" Makefile.in configure.ac
    done

    autoreconf -vfi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
