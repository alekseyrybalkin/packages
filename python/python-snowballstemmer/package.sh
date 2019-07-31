pkgname=python-snowballstemmer
pkgver=1.2.1
vcs=git
vcs_pkgname=snowball_py
#FIXME no tag
gittag=04f57de7f961bbec80efde2fe933fedf5e56ea71
# lists versions from https://github.com/snowballstem/snowball which might not be the latest and greatest for python
#relmon_id=7853

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
