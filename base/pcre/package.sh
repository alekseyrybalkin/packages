pkgname=pcre
pkgver=8.43
vcs=git-svn
vcs_pkgname=pcre-git-svn
gittag=origin/tags/pcre-${pkgver}
relmon_id=2610

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --docdir=/usr/share/doc/pcre \
        --enable-unicode-properties \
        --enable-pcre16 \
        --enable-pcre32 \
        --enable-pcregrep-libz \
        --enable-pcregrep-libbz2 \
        --enable-jit \
        --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
