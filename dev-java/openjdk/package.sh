#!/bin/sh

pkgname=openjdk
ARCH_NAME=java8-openjdk
# pkgver too complex to parse, we check hg tags instead
SKIP_ARCH_CHECK=1
_java_ver=8
_jdk_update=121
_jdk_build=13
_repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
pkgver=${_java_ver}.u${_jdk_update}
vcs=mercurial
hgtag=${_repo_ver}
_url_src="http://hg.openjdk.java.net/jdk8u/jdk8u"
urls="${_url_src}/archive/${_repo_ver}.tar.bz2"
srctar=${_repo_ver}.tar.bz2
srcdir=${location}/jdk8u-${_repo_ver}

kiin_make() {
    MAKEFLAGS=
    for subproject in corba hotspot jdk jaxws jaxp langtools nashorn; do
        hg clone ${SOURCES_HOME}/openjdk-${subproject} ${subproject}
        cd ${subproject}
        hg update -r ${hgtag}
        cd ../
    done
    # Apply infinality patches
    cd jdk
    patch -p1 < ../../004_add-fontconfig.patch
    patch -p1 < ../../005_enable-infinality.patch
    cd ../

    export PATH=${PATH}:/usr/lib/openjdk/bin
    sh ./configure \
        --with-update-version=${_jdk_update} \
        --with-build-number=b${_jdk_build} \
        --with-milestone=kiin \
        --enable-unlimited-crypto \
        --with-zlib=system \
        --with-extra-cflags="-std=c++98 -Wno-error -fno-delete-null-pointer-checks -fno-lifetime-dse" \
        --with-extra-cxxflags="-std=c++98 -fno-delete-null-pointer-checks -fno-lifetime-dse"
    # --with-giflib=system \
    make SCTP_WERROR= all
    find build/*/images/j2sdk-image -iname \*.diz -delete
    find build/*/images/j2sdk-image -iname \*.debuginfo -delete
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/openjdk
    cp -rv build/linux-x86_64-normal-server-release/images/j2sdk-image/* ${pkgdir}/usr/lib/openjdk/
    rm -vf ${pkgdir}/usr/lib/openjdk/jre/lib/security/cacerts
}
