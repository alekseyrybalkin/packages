#!/bin/sh

pkgname=nginx
ARCH_NAME=nginx-mainline
pkgver=1.17.1
vcs=mercurial
hgtag=release-${pkgver}
urls="http://nginx.org/download/nginx-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=5413

kiin_make() {
    ./auto/configure --prefix=/etc/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --sbin-path=/usr/bin/nginx \
        --pid-path=/run/nginx.pid \
        --lock-path=/run/lock/nginx.lock \
        --user=http \
        --group=http \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --http-client-body-temp-path=/var/lib/nginx/client-body \
        --http-proxy-temp-path=/var/lib/nginx/proxy \
        --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
        --http-scgi-temp-path=/var/lib/nginx/scgi \
        --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
        --with-mail \
        --with-mail_ssl_module \
        --with-stream \
        --with-stream_ssl_module \
        --with-threads \
        --with-ipv6 \
        --with-pcre-jit \
        --with-file-aio \
        --with-http_dav_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_realip_module \
        --with-http_v2_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_addition_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_secure_link_module \
        --with-http_sub_module
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/{var,run}
    mv -v ${pkgdir}/etc/nginx/nginx.conf{,.packaged}
    install -Dm644 ../nginx.service ${pkgdir}/usr/lib/systemd/system/nginx.service
}

kiin_after_install() {
    getent group http >/dev/null || groupadd -g 33 http
    getent passwd http >/dev/null || \
        useradd -c 'nginx' -d /var/lib/nginx -g http \
        -s /bin/false -u 33 http
    chown -R http: /var/log/nginx /var/lib/nginx
}

kiin_after_upgrade() {
    kiin_after_install
}
