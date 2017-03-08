#!/bin/sh

pkgname=rust
pkgver=1.15.1
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    SOURCES_HOME_ESCAPED=${SOURCES_HOME//\//\\\/}
    sed -i -e "s/https:\\/\\/github\\.com\\/rust-lang/${SOURCES_HOME_ESCAPED}/g" .gitmodules
    sed -i -e 's/llvm\.git/rust-llvm/g' .gitmodules
    sed -i -e 's/compiler-rt\.git/rust-compiler-rt/g' .gitmodules
    sed -i -e 's/hoedown\.git/rust-hoedown/g' .gitmodules
    sed -i -e 's/jemalloc\.git/rust-jemalloc/g' .gitmodules
    sed -i -e 's/rust-installer\.git/rust-installer/g' .gitmodules
    sed -i -e 's/libc\.git/rust-libc/g' .gitmodules

    ./configure \
        --prefix=/usr \
        --release-channel=stable \
        --llvm-root=/usr \
        --disable-codegen-tests \
        --disable-docs \
        --enable-local-rust \
        --disable-rustbuild

    export RUSTFLAGS="${RUSTFLAGS} -C link-args=-lffi"
    export CFLAGS="${CFLAGS} -fPIC -w"
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    cd ${pkgdir}/usr/lib

    rm rustlib/{components,manifest-rustc,rust-installer-version}
    ln -sf rustlib/x86_64-unknown-linux-gnu/lib/*.so .

    rm -rf ${pkgdir}/usr/share/doc
}
