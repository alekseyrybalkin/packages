pkgname=xorg-server
pkgver=1.20.5
vcs=git
gittag=xorg-server-${pkgver}
relmon_id=5250

build() {
    # use openssl for sha1 implementation instead of nettle
    sed -i -e "s/'nettle'/'openssl'/g" meson.build
    sed -i -e "s/sha1_dep = nettle_dep/sha1_dep = cc.find_library('crypto', required : false)/g" meson.build
    sed -i -e '/HAVE_SHA1_IN_LIBNETTLE/d' include/meson.build
    # rootless xorg patch from Arch Linux
    patch -Np1 -i ../0001-v2-FS-58644.patch

    mkdir build
    meson --prefix=$XORG_PREFIX \
        -D libexecdir=/usr/lib \
        -D os_vendor="Jinni GNU/Linux" \
        -D ipv6=true \
        -D xcsecurity=true \
        -D xorg=true \
        -D xephyr=false \
        -D dri1=true \
        -D dri2=true \
        -D dri3=true \
        -D glamor=true \
        -D udev=true \
        -D systemd_logind=true \
        -D suid_wrapper=true \
        -D xkb_dir=/usr/share/X11/xkb \
        -D xkb_output_dir=/var/lib/xkb \
        . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
    ln -s /usr/bin/Xorg ${pkgdir}/usr/bin/X

    mkdir -pv ${pkgdir}/etc/X11/xorg.conf.d
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}
