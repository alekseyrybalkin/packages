#!/bin/sh

pkgname=python-tensorflow
SKIP_ARCH_CHECK=1
pkgver=1.0.0
vcs=git
vcs_pkgname=tensorflow
gittag=v${pkgver//_/-}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python ../tensorflow_prepare_deps.py ${KIIN_HOME}/tarballs/tensorflow

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
    bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package
    bazel-bin/tensorflow/tools/pip_package/build_pip_package ${location}/tmp
    rm -rf ${TEST_TMPDIR}
}

kiin_install() {
    WHEEL=`find ${location}/tmp -name "tensor*.whl"`
    pip install --ignore-installed --upgrade --root ${pkgdir}/ ${WHEEL} --no-dependencies
    find ${pkgdir} -name __pycache__ -exec rm -r {} +
    rm -rf ${location}/tmp
}
