#!/bin/sh

pkgname=openssh
_ver=8.0
_patch=1
pkgver=${_ver}p${_patch}
vcs=git
gittag=V_${_ver//\./_}_P${_patch}
extension=gz
folder="http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/"
check_server=1
relmon_id=2565

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/openssh \
        --sysconfdir=/etc/ssh \
        --datadir=/usr/share/sshd \
        --with-md5-passwords \
        --build=x86_64-unknown-linux-gnu \
        --with-privsep-path=/var/lib/sshd
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -v -m755 -d ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
    install -v -m644 INSTALL LICENCE OVERVIEW README* \
        ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
    # do not replace ssh{,d}_config, since it is in git repo now
    mv -v ${pkgdir}/etc/ssh/ssh_config{,.packaged}
    mv -v ${pkgdir}/etc/ssh/sshd_config{,.packaged}
    install -Dm644 sshd.pam ${pkgdir}/etc/pam.d/sshd
}

kiin_after_install() {
    getent group sshd >/dev/null || groupadd -g 50 sshd
    getent passwd sshd >/dev/null || \
        useradd -c 'sshd PrivSep' -d /var/lib/sshd -g sshd \
        -s /bin/false -u 50 sshd
    [ -f /etc/ssh/ssh_host_rsa_key ] || ssh-keygen -A
}

kiin_after_upgrade() {
    kiin_after_install
}

known="etc/ssh/ssh_host_dsa_key \
    etc/ssh/ssh_host_rsa_key.pub \
    etc/ssh/ssh_host_dsa_key.pub \
    etc/ssh/ssh_host_ecdsa_key.pub \
    etc/ssh/ssh_host_rsa_key \
    etc/ssh/ssh_host_ecdsa_key \
    etc/ssh/ssh_host_ed25519_key \
    etc/ssh/ssh_host_ed25519_key.pub"
