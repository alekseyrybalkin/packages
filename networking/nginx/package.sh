#!/bin/sh

pkgname=nginx
pkgver=1.8.0
urls="http://nginx.org/download/nginx-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/etc/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --sbin-path=/usr/bin/nginx \
    --pid-path=/run/nginx.pid \
    --lock-path=/run/lock/nginx.lock \
    --user=${PACMAN} \
    --group=${PACMAN} \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --http-client-body-temp-path=/var/lib/nginx/client-body \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    --with-imap \
    --with-imap_ssl_module \
    --with-ipv6 \
    --with-pcre-jit \
    --with-file-aio \
    --with-http_dav_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_spdy_module \
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
}

kiin_after_install() {
  getent group nginx >/dev/null || groupadd -g 333 nginx
  getent passwd nginx >/dev/null || \
    useradd -c 'nginx' -d /var/lib/nginx -g nginx \
    -s /bin/false -u 333 nginx
}

kiin_after_upgrade() {
  kiin_after_install
}