#!/bin/sh

pkgname=openjdk
ARCH_NAME=java8-openjdk
_java_ver=8
_jdk_update=74
_jdk_build=02
pkgver=${_java_ver}.u${_jdk_update}
_repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
_url_src="http://hg.openjdk.java.net/jdk8u/jdk8u"
# TODO: add all subprojects to urls!
urls="${_url_src}/archive/${_repo_ver}.tar.bz2"
srctar=${_repo_ver}.tar.bz2
srcdir=${location}/jdk8u-${_repo_ver}

kiin_make() {
    MAKEFLAGS=
    for subproject in corba hotspot jdk jaxws jaxp langtools nashorn; do
        if [ ! -f ${KIIN_HOME}/tarballs/${subproject}-${_repo_ver}.tar.bz2 ]; then
            wget -c ${_url_src}/${subproject}/archive/${_repo_ver}.tar.bz2 \
                -O ${KIIN_HOME}/tarballs/${subproject}-${_repo_ver}.tar.bz2
        fi
        mkdir -pv ${subproject}
        tar xf ${KIIN_HOME}/tarballs/${subproject}-${_repo_ver}.tar.bz2 --strip-components=1 -C ${subproject}
    done
    export PATH=${PATH}:/usr/lib/openjdk/bin
    sh ./configure \
        --with-update-version=${_jdk_update} \
        --with-build-number=b${_jdk_build} \
        --with-milestone=kiin \
        --enable-unlimited-crypto \
        --with-zlib=system
    # --with-giflib=system \
    make DEBUG_BINARIES=true all
    find build/*/images/j2sdk-image -iname \*.diz -delete
    find build/*/images/j2sdk-image -iname \*.debuginfo -delete
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/openjdk-${pkgver}
    ln -sv openjdk-${pkgver} ${pkgdir}/usr/lib/openjdk
    cp -rv build/linux-x86_64-normal-server-release/images/j2sdk-image/* ${pkgdir}/usr/lib/openjdk-${pkgver}/
}
