#!/bin/sh

pkgname=inetutils
pkgver=1.9.4+
vcs=git
#FIXME
# Gnulib requires autoconf 2.63, forced by libtool. (see 80e18f8aea59fd15a91b72bfdf974929e0895eb8)
gittag=a4a331b7eea141b13c04f79feff3fe7d8f4e0507
#gittag=inetutils-${pkgver//\./_}
relmon_id=13805

kiin_make() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --libexecdir=/usr/bin \
        --localstatedir=/var \
        --disable-ifconfig \
        --disable-logger \
        --disable-syslogd \
        --disable-whois \
        --disable-servers \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
