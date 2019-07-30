pkgname=kitty
pkgver=0.14.3
vcs=git
gittag=v${pkgver}
relmon_id=17405

build() {
    patch -Np1 -i ../remove_canberra.patch
    python setup.py linux-package --update-check-interval=0
}

package() {
    cp -r linux-package ${pkgdir}/usr
}
