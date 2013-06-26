if [ -z "${srctar}" ]; then
  srctar=${pkgname}-${pkgver}.tar.${extension}
fi
if [ -n "${major_folder}" ]; then
  folder="${major_folder}${majorver}/"
fi
urls="${folder}${srctar}"
if [ -z "${srcdir}" ]; then
  srcdir=${location}/${pkgname}-${pkgver}
fi
if [ -n "${check_server}" ]; then
  if [ -n "${major_folder}" ]; then
    majorver_grep="^[0-9]+\.[0-9]+/?$"
    majorver_seds() {
      sed -r "s/\///g"
    }
  fi
  ver_grep="^${pkgname}-[^-]*\.tar\.${extension}$"
  ver_seds() {
    sed -r "s/^${pkgname}-//g" | sed -r "s/\.tar\.${extension}$//g"
  }
fi
