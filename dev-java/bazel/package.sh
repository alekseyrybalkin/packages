#!/bin/sh

pkgname=bazel
SKIP_ARCH_CHECK=1
KIIN_NO_STRIPPING=1
pkgver=0.4.5
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    # to bootstrap:
    # 1. checkout bazel from git
    # 2. download latest release from https://github.com/bazelbuild/bazel/releases
    # 3. copy "derived" folder from downloaded archive to git checkout
    # 4. ./compile.sh
    export PATH=${PATH}:/usr/lib/openjdk/bin
    export TEST_TMPDIR=/tmp/.${USER}-cache/bazel
    ./compile.sh compile /usr/bin/bazel
    bazel shutdown
    rm -rf ${TEST_TMPDIR}
}

kiin_install() {
    install -Dm755 output/bazel ${pkgdir}/usr/bin/bazel
}
