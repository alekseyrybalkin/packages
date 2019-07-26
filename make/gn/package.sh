pkgname=gn
pkgver=0.1568+
vcs=git
#FIXME no tag
gittag=c599fdbbcdb7eb6c7e345e36e1ae5de16a91509f

build() {
    ./build/gen.py
    ninja -C out gn
}

package() {
    install -D out/gn ${pkgdir}/usr/bin/gn
}
