pkgname=gn
pkgver=0.1576.81ee1967
vcs=git
#FIXME no tag
gittag=81ee1967d3fcbc829bac1c005c3da59739c88df9

build() {
    ./build/gen.py
    ninja -C out gn
}

package() {
    install -D out/gn ${pkgdir}/usr/bin/gn
}
