#!/bin/sh

pkgname=nvidia
pkgver=325.15
urls="ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run \
  http://rybalkin.org/kiin-files/nvidia-linux-3.11.patch"

_modules_dir=`ls /lib/modules | tail -n 1`

kiin_make() {
  sh NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run --extract-only
  cd NVIDIA-Linux-x86_64-${pkgver}-no-compat32/kernel
  patch -Np2 -i ../../nvidia-linux-3.11.patch
  make SYSSRC=/lib/modules/${_modules_dir}/build module
}

kiin_install() {
  cd NVIDIA-Linux-x86_64-${pkgver}-no-compat32/kernel
  install -D -m644 nvidia.ko \
    ${pkgdir}/lib/modules/${_modules_dir}/nvidia.ko
  gzip ${pkgdir}/lib/modules/${_modules_dir}/nvidia.ko
  cd ../..
  rm -rf NVIDIA-Linux-x86_64-${pkgver}-no-compat32
}

kiin_after_install() {
  depmod -a
}

kiin_after_upgrade() {
  kiin_after_install
}
