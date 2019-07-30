pkgname=tmux
pkgver=3.0
vcs=git
#FIXME tag 3.0 used actually for RC releases (and it changes)
gittag=${pkgver}
relmon_id=4980

build() {
    git revert --no-edit 1015b124d5ccb4c9d32f0c5aae820f7a1ac98c5c
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
