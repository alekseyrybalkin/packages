pkgname=libsndfile
pkgver=1.0.28
vcs=git
gittag=${pkgver}
relmon_id=13277

build() {
    # disable tests build
    sed -i -e 's/examples tests/examples/g' Makefile.am
    sed -i -e 's/regtest tests/regtest/g' Makefile.am
    sed -i -e 's/tests\/Makefile//g' configure.ac
    sed -i -e 's/tests\/pedantic-header-test.sh//g' configure.ac
    sed -i -e 's/tests\/test_wrapper.sh//g' configure.ac

    autoreconf -fi
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --disable-sqlite \
        --disable-test-coverage
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
