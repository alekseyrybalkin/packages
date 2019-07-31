#vcs=none-by-design
pkgname=initramfs
SKIP_ARCH_CHECK=1
pkgver=1

build() {
    true
}

package() {
    cd ../
    ./mkinitramfs jinni
    ./mkinitramfs arch
    mkdir -p ${pkgdir}/boot
    mv -v initrd-jinni ${pkgdir}/boot
    mv -v initrd-arch ${pkgdir}/boot
}
