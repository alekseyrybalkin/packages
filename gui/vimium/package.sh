pkgname=vimium
pkgver=1.64.5
vcs=git
gittag=v${pkgver}

build() {
    # fix copying to clipboard with no JS
    git apply ../clipboard.diff

    rm -rf .git
    cake build
}

package() {
    mkdir -p ${pkgdir}/usr/lib/chromium/extensions/
    cp -r . ${pkgdir}/usr/lib/chromium/extensions/vimium
}
