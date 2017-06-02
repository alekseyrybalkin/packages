#!/bin/sh

pkgname=boost
pkgver=1.64.0
vcs=git
gittag=boost-${pkgver}
_pkgver=${pkgver//\./_}
urls="http://downloads.sourceforge.net/boost/boost_${_pkgver}.tar.bz2"
srctar=${pkgname}_${_pkgver}.tar.bz2
relmon_id=6845

kiin_make() {
    cd libs
    cat ../.gitmodules | grep submodule | sed 's/\[submodule "//g' | sed 's/"\]//g' | sed 's/libs\///g' | while read module; do
        git clone -s -n ${SOURCES_HOME}/boost-${module} ${module}
        cd ${module}
        git checkout ${gittag}
        cd ../
    done
    cd ../
    mv libs/{inspect,boostbook,bcp,build,quickbook,litre,auto_index,boostdep} tools/
    mkdir boost
    for lib in `find libs -maxdepth 1 -mindepth 1 -type d`; do
        if [ -d ${lib}/include/boost ]; then
            cp -rv ${lib}/include/boost/* boost/
            rm -rf ${lib}/include
        fi
    done
    sed -e '/using python/ s@;@: /usr/include/python${PYTHON_VERSION/3*/${PYTHON_VERSION}m} ;@' -i bootstrap.sh
    ./bootstrap.sh --prefix=/usr
    ./b2 stage \
        threading=multi \
        link=shared \
        `sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS}`
}

kiin_install() {
    ./b2 --prefix=${pkgdir}/usr install threading=multi link=shared
}
