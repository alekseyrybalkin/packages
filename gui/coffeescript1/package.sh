pkgname=coffeescript1
SKIP_ARCH_CHECK=1
pkgver=1.12.8
vcs=git
vcs_pkgname=coffeescript
gittag=${pkgver}

build() {
    rm -rf .git .gitignore
    cd ../
    cp -r coffeescript{1,}-${pkgver}
    tar cvf coffeescript-${pkgver}.tgz coffeescript-${pkgver}
    rm -rf coffeescript-${pkgver}
}

package() {
    cd ..
    npm install -g --user root --prefix ${pkgdir}/usr coffeescript-${pkgver}.tgz

    rm coffeescript-${pkgver}.tgz
}