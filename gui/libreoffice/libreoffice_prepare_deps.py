#!/usr/bin/env python

import sys
import os
import os.path

import requests


def load_deps(file_path):
    deps = []
    varrs = {}
    with open(file_path, 'r') as w:
        for line in w.readlines():
            line = line.replace('export ', '')
            if ':=' in line:
                var, val = line.split(':=')
                var = var.strip()
                val = val.strip()
                for x, y in varrs.items():
                    val = val.replace('$(' + x + ')', y)
                varrs[var] = val
                if var.endswith('TARBALL'):
                    deps.append(val)
    deps.append('884ed41809687c3e168fc7c19b16585149ff058eca79acbf3ee784f6630704cc-opens___.ttf')
    return deps


def main():
    # create a folder to store archives
    folder = sys.argv[1]
    os.makedirs(folder, exist_ok=True)

    # read all dependencies from workspace files
    deps = load_deps('download.lst')

    # download missing archives
    for dep in deps:
        local_dep = dep
        local_file = os.path.join(folder, local_dep)
        if not os.path.isfile(local_file):
            remote_file = 'http://dev-www.libreoffice.org/src/{}'.format(dep)
            print('Downloading {} to {}'.format(remote_file, local_file))
            tarball = requests.get(remote_file).content
            with open(local_file, 'wb') as f:
                f.write(tarball)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('need folder arg')
        sys.exit(1)
    main()
