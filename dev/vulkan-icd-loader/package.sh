#!/bin/sh

pkgname=vulkan-icd-loader
pkgver=1.0.61.1
vcs=git
vcs_pkgname=vulkan-loaderandvalidationlayers
gittag=sdk-${pkgver}

kiin_make() {
    sed -i -e "s/https:\\/\\/github\\.com\\/KhronosGroup/${SOURCES_HOME//\//\\\/}/g" external_revisions/*
    sed -i -e "s/\\.git//g" external_revisions/*
    sed -i -e 's/SPIRV-Tools/spirv-tools/g' external_revisions/*
    sed -i -e 's/SPIRV-Headers/spirv-headers/g' external_revisions/*
    ./update_external_sources.sh

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_DATADIR=/share \
        -DCMAKE_SKIP_RPATH=True \
        -DBUILD_TESTS=Off \
        -DBUILD_WSI_XCB_SUPPORT=On \
        -DBUILD_WSI_XLIB_SUPPORT=On \
        -DBUILD_WSI_WAYLAND_SUPPORT=Off \
        -DBUILD_WSI_MIR_SUPPORT=Off \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    make
}

kiin_install() {
    cd build

    make DESTDIR=${pkgdir} install

    rm -r ${pkgdir}/etc
    rm -r ${pkgdir}/usr/bin
    rm ${pkgdir}/usr/include/vulkan/*{.h,.hpp}
    rm ${pkgdir}/usr/lib/libVkLayer*.so

    install -m644 ../include/vulkan/vk_icd.h ${pkgdir}/usr/include/vulkan/
}
