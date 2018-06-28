#!/bin/sh

pkgname=asciidoc
pkgver=8.6.10
vcs=git
gittag=${pkgver}
relmon_id=13262

undead_make() {
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' asciidocapi.py
    sed -i -e 's/python/python2/g' Makefile.in
    autoconf
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
