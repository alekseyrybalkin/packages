pkgname=ublock
ARCH_NAME=firefox-ublock-origin
pkgver=1.21.6
vcs=git
gittag=${pkgver}
relmon_id=16686

build() {
    cd ../
    git clone `find_vcs_repo uassets` uAssets
    cd ${pkgname}-${pkgver}
    tools/make-chromium.sh .
}

package() {
    mkdir -p ${pkgdir}/usr/lib/chromium/extensions/
    cp -r dist/build/*.chromium ${pkgdir}/usr/lib/chromium/extensions/ublock
    find ${pkgdir} -type d -exec chmod 0755 {} \;
    find ${pkgdir} -type f -exec chmod 0644 {} \;

    rm -rf ../uAssets
}
