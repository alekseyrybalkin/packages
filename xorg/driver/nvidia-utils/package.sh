#!/bin/sh

pkgname=nvidia-utils
pkgver=331.20
urls="ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run \
  ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    sh ${KIIN_HOME}/tarballs/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run --extract-only
  else
    sh ${KIIN_HOME}/tarballs/NVIDIA-Linux-x86-${pkgver}.run --extract-only
  fi
}

kiin_install() {
  if [ -z "${KIIN_LIB32}" ]; then
    cd NVIDIA-Linux-x86_64-${pkgver}-no-compat32
    # X driver
    install -D -m755 nvidia_drv.so ${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so
    # GLX extension module for X
    install -D -m755 libglx.so.${pkgver} ${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver}
    # X doesn't find glx without this link
    ln -s libglx.so.${pkgver} ${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so
    # OpenGL library
    install -D -m755 libGL.so.${pkgver} ${pkgdir}/usr/lib/nvidia/libGL.so.${pkgver}
    # OpenGL core library
    install -D -m755 libnvidia-glcore.so.${pkgver} ${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}
    # VDPAU
    install -D -m755 libvdpau_nvidia.so.${pkgver} ${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}
    # nvidia-tls library
    install -D -m755 tls/libnvidia-tls.so.${pkgver} ${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}
    install -D -m755 libnvidia-cfg.so.${pkgver} ${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}

    install -D -m755 libnvidia-ml.so.${pkgver} ${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}
    # CUDA
    install -D -m755 libcuda.so.${pkgver} ${pkgdir}/usr/lib/libcuda.so.${pkgver}
    install -D -m755 libnvcuvid.so.${pkgver} ${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}
    # DEBUG
    install -D -m755 nvidia-debugdump ${pkgdir}/usr/bin/nvidia-debugdump
    # nvidia-xconfig
    install -D -m755 nvidia-xconfig ${pkgdir}/usr/bin/nvidia-xconfig
    install -D -m644 nvidia-xconfig.1.gz ${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz
    # nvidia-settings
    install -D -m755 nvidia-settings ${pkgdir}/usr/bin/nvidia-settings
    install -D -m644 nvidia-settings.1.gz ${pkgdir}/usr/share/man/man1/nvidia-settings.1.gz
    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh ${pkgdir}/usr/bin/nvidia-bug-report.sh
    # nvidia-smi
    install -D -m755 nvidia-smi ${pkgdir}/usr/bin/nvidia-smi
    install -D -m644 nvidia-smi.1.gz ${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz

    # create soname links
    for _lib in `find "${pkgdir}" -type f -name '*.so*'`; do
        _soname="$(dirname "${_lib}")/$(LC_ALL=C readelf -d "${_lib}" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
        [[ -e "${_soname}" ]] || ln -sv "$(basename "${_lib}")" "${_soname}"
        [[ -e "${_soname/.[0-9]*/}" ]] || ln -sv "$(basename "${_soname}")" "${_soname/.[0-9]*/}"
    done

    mkdir -p ${pkgdir}/usr/lib/xorg/modules/extensions
    ln -s /usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver} ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.${pkgver}
    ln -s libglx.so.${pkgver} ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.1
    ln -s libglx.so.${pkgver} ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

    ln -s /usr/lib/nvidia/libGL.so.${pkgver} ${pkgdir}/usr/lib/libGL.so.${pkgver}
    ln -s libGL.so.${pkgver} ${pkgdir}/usr/lib/libGL.so.1
    ln -s libGL.so.${pkgver} ${pkgdir}/usr/lib/libGL.so
    cd ..
    rm -rf NVIDIA-Linux-x86_64-${pkgver}-no-compat32
  else
    cd NVIDIA-Linux-x86-${pkgver}

    # OpenGL library
    install -D -m755 libGL.so.${pkgver} ${pkgdir}/usr/lib32/nvidia/libGL.so.${pkgver}
    # OpenGL core library
    install -D -m755 libnvidia-glcore.so.${pkgver} ${pkgdir}/usr/lib32/libnvidia-glcore.so.${pkgver}
    # VDPAU
    install -D -m755 libvdpau_nvidia.so.${pkgver} ${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}
    # CUDA
    install -D -m755 libcuda.so.${pkgver} ${pkgdir}/usr/lib32/libcuda.so.${pkgver}
    install -D -m755 libnvcuvid.so.${pkgver} ${pkgdir}/usr/lib32/libnvcuvid.so.${pkgver}
    # nvidia-tls library
    install -D -m755 tls/libnvidia-tls.so.${pkgver} ${pkgdir}/usr/lib32/libnvidia-tls.so.${pkgver}

    install -D -m755 libnvidia-cfg.so.${pkgver} ${pkgdir}/usr/lib32/libnvidia-cfg.so.${pkgver}
    install -D -m755 libnvidia-ml.so.${pkgver} ${pkgdir}/usr/lib32/libnvidia-ml.so.${pkgver}

    # create soname links
    for _lib in $(find "${pkgdir}" -name '*.so*'); do
        _soname="$(dirname ${_lib})/$(LC_ALL=C readelf -d "$_lib" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
        if [ ! -e "${_soname}" ]; then
            ln -sv "$(basename ${_lib})" "${_soname}"
            ln -sv "$(basename ${_soname})" "${_soname/.[0-9]*/}"
        fi
    done

    mkdir -p ${pkgdir}/usr/lib32
    ln -s /usr/lib32/nvidia/libGL.so.${pkgver} ${pkgdir}/usr/lib32/libGL.so.${pkgver}
    ln -s libGL.so.${pkgver} ${pkgdir}/usr/lib32/libGL.so.1
    ln -s libGL.so.${pkgver} ${pkgdir}/usr/lib32/libGL.so

    cd ..
    rm -rf NVIDIA-Linux-x86-${pkgver}
  fi
}
