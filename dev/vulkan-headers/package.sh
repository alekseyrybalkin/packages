#!/bin/sh

pkgname=vulkan-headers
ARCH_NAME=vulkan-docs
pkgver=1.0.65
vcs=git
gittag=v${pkgver}-core
vcs_pkgname=vulkan-docs

kiin_make() {
    :
}

kiin_install() {
    install -dm755 ${pkgdir}/usr/include/vulkan
    install -dm755 ${pkgdir}/usr/share/vulkan

    install -m644 src/vulkan/vk_platform.h ${pkgdir}/usr/include/vulkan/
    install -m644 src/vulkan/vulkan.h ${pkgdir}/usr/include/vulkan/
    install -m644 src/spec/vk.xml ${pkgdir}/usr/share/vulkan/
}
