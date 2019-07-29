pkgname=mpv
vcs=git
pkgver=0.29.1
_wafver=2.0.18
gittag=v${pkgver}
relmon_id=5348

build() {
    # enable lua 5.3
    patch -Np1 -i ../lua53.patch

    git clone -n -s `find_vcs_repo waf` waf-clone
    cd waf-clone
    git checkout waf-${_wafver}
    cd ..
    cp -r waf-clone/{waf-light,waflib} ./
    rm -rf waf-clone
    mv ./waf{-light,}

    ./waf configure --prefix=/usr \
        --confdir=/etc/mpv \
        --disable-pulse \
        --enable-libmpv-shared
    ./waf build
}

package() {
    ./waf install --destdir=${pkgdir}
}
