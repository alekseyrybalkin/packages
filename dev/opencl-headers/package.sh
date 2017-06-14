#!/bin/sh

pkgname=opencl-headers
pkgver=2.2.20170516
vcs=git
# FIXME
gittag=ec2566b59dbd907e8ce223ed2b931d42e703c05b

kiin_make() {
    git clone ${SOURCES_HOME}/opencl-clhpp
}

kiin_install() {
    cd opencl22/CL
    install -dm755 ${pkgdir}/usr/include/CL

    for h in *.h; do
        install -m 644 ${h} ${pkgdir}/usr/include/CL/
    done
    rm ${pkgdir}/usr/include/CL/{cl_d3d,cl_dx9}*.h

    cd ../../opencl-clhpp
    python gen_cl_hpp.py -i input_cl.hpp -o cl.hpp
    install -m 644 cl.hpp ${pkgdir}/usr/include/CL/
    install -m 644 input_cl2.hpp ${pkgdir}/usr/include/CL/cl2.hpp
}
