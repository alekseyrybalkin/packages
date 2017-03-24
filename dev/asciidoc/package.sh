#!/bin/sh

pkgname=asciidoc
pkgver=8.6.9
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=13262

kiin_make() {
    for file in asciidocapi.py a2x.py asciidoc.py filters/music/music2png.py filters/latex/latex2png.py \
            filters/code/code-filter.py filters/graphviz/graphviz2png.py; do
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done
    sed -i -e 's/python/python2/g' Makefile.in
    autoconf
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
