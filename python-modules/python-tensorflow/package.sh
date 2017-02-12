#!/bin/sh

pkgname=python-tensorflow
SKIP_ARCH_CHECK=1
pkgver=1.0.0_rc2
vcs=git
vcs_pkgname=tensorflow
gittag=v${pkgver//_/-}
srcdir=${location}/${pkgname}-${pkgver}

# TODO build without network
# see tensorflow/workspace.bzl
# http://bazel-mirror.storage.googleapis.com/bitbucket.org/eigen/eigen/get/60578b474802.tar.gz
# http://bazel-mirror.storage.googleapis.com/curl.haxx.se/download/curl-7.49.1.tar.gz
# http://bazel-mirror.storage.googleapis.com/ftp.exim.org/pub/pcre/pcre-8.39.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/glennrp/libpng/archive/v1.2.53.zip
# http://bazel-mirror.storage.googleapis.com/github.com/google/boringssl/archive/bbcaa15b0647816b9a1a9b9e0d209cd6712f0105.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/google/gemmlowp/archive/a6f29d8ac48d63293f845f2253eccbf86bc28321.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/google/protobuf/archive/008b5a228b37c054f46ba478ccafa5e855cb16db.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/google/re2/archive/b94b7cd42e9f02673cd748c1ac1d16db4052514c.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/grpc/grpc/archive/d7ff4ff40071d2b486a052183e3e9f9382afb745.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/hfp/libxsmm/archive/1.6.1.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/jemalloc/jemalloc/archive/4.4.0.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.1.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/llvm-mirror/llvm/archive/4e9e4f277ad254e02a0cff33c61cd827e600da62.tar.gz
# http://bazel-mirror.storage.googleapis.com/github.com/nanopb/nanopb/archive/1251fa1065afc0d62f635e0f63fec8276e14e13c.tar.gz
# http://bazel-mirror.storage.googleapis.com/pkgs.fedoraproject.org/repo/pkgs/gmock/gmock-1.7.0.zip/073b984d8798ea1594f5e44d85b20d66/gmock-1.7.0.zip
# http://bazel-mirror.storage.googleapis.com/ufpr.dl.sourceforge.net/project/swig/swig/swig-3.0.8/swig-3.0.8.tar.gz
# http://bazel-mirror.storage.googleapis.com/zlib.net/zlib-1.2.8.tar.gz
# https://github.com/cpettitt/dagre/archive/v0.7.4.tar.gz
# https://github.com/cpettitt/graphlib/archive/v1.0.7.tar.gz
# https://github.com/junit-team/junit4/releases/download/r4.12/junit-4.12.jar
# https://github.com/lodash/lodash/archive/3.8.0.tar.gz
# https://github.com/mbostock-bower/d3-bower/archive/v3.5.15.tar.gz
# https://github.com/palantir/plottable/archive/v1.16.1.tar.gz
# https://github.com/polymerelements/iron-list/archive/v1.3.9.tar.gz
# https://github.com/polymerelements/neon-animation/archive/v1.2.2.tar.gz
# https://github.com/web-animations/web-animations-js/archive/2.2.1.tar.gz
# https://github.com/webcomponents/webcomponentsjs/archive/v0.7.22.tar.gz

kiin_make() {
    export PATH=${PATH}:/usr/lib/openjdk/bin

    export PYTHON_BIN_PATH=/usr/bin/python
    export USE_DEFAULT_PYTHON_LIB_PATH=1
    export TF_NEED_CUDA=0
    export TF_NEED_GCP=0
    export TF_NEED_HDFS=0
    export TF_NEED_OPENCL=0
    export TF_ENABLE_XLA=0
    export TF_NEED_JEMALLOC=1
    export CC_OPT_FLAGS="-march=native"

    export TEST_TMPDIR=/tmp/.${USER}-cache/bazel
    ./configure
    bazel build //tensorflow/tools/pip_package:build_pip_package
    bazel-bin/tensorflow/tools/pip_package/build_pip_package ${location}/tmp
    rm -rf ${TEST_TMPDIR}
}

kiin_install() {
    WHEEL=`find ${location}/tmp -name "tensor*.whl"`
    pip install --ignore-installed --upgrade --root ${pkgdir}/ ${WHEEL} --no-dependencies
    find ${pkgdir} -name __pycache__ -exec rm -r {} +
    rm -rf ${location}/tmp
}
