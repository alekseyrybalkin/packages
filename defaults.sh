#!/bin/sh

# defaults.sh - default settings for packages

# Copyright (C) 2013-2017 Aleksey Rybalkin

# This file is part of kiin-repo.

# kiin-repo is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# kiin-repo is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with kiin-repo.  If not, see <http://www.gnu.org/licenses/>.

if [ -z "${srctar}" ]; then
    srctar=${pkgname}-${pkgver}.tar.${extension}
fi
if [ -n "${major_folder}" ]; then
    folder="${major_folder}${majorver}/"
fi
urls="${folder}${srctar}"
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
