pkgname=colm
SKIP_ARCH_CHECK=1
pkgver=0.13.0.7
vcs=git
#FIXME no tag
gittag=46488f5222650183e236ad27e6bb9bf3a428bfb6
#gittag=colm-${pkgver}
relmon_id=12622

build() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
