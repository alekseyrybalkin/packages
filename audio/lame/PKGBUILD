pkgname=lame
pkgver=3.100
vcs=git-svn
vcs_pkgname=lame-git-svn
gittag=origin/tags/RELEASE__${pkgver//\./_}
relmon_id=12523
relmon_rules="skip_big_first"

build() {
    cd lame
    ./configure --prefix=/usr \
        --enable-mp3rtp \
        --disable-static
    make
}

package() {
    cd lame
    make DESTDIR=${pkgdir} pkghtmldir=/usr/share/doc/lame-${pkgver} install
}
