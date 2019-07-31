NON_FREE=1
pkgname=linux-firmware
pkgver=20190717
ARCH_VERSION=20190717.bf13a71
vcs=git
gittag=${pkgver}

build() {
    :
}

package() {
    mkdir -pv ${pkgdir}/usr/lib/firmware
    cp -v ./iwlwifi-6*.ucode ${pkgdir}/usr/lib/firmware/
    cp -v ./iwlwifi*7265* ${pkgdir}/usr/lib/firmware/
}
