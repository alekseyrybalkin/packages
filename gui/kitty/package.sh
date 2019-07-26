pkgname=kitty
pkgver=0.14.2
vcs=git
gittag=v${pkgver}
relmon_id=17405

build() {
    python setup.py linux-package --update-check-interval=0
}

package() {
    cp -r linux-package ${pkgdir}/usr
}
