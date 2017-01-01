#!/bin/sh

pkgname=rust
pkgver=1.14.0
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git apply ../build-fixes.diff

    ./configure \
        --prefix=/usr \
        --release-channel=stable \
        --llvm-root=/usr \
        --disable-codegen-tests \
        --disable-docs \
        --enable-local-rust

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
