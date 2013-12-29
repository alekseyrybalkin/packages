#!/usr/bin/env python2

import os
import os.path
import shutil
import glob

symlinks = [
             '/usr/man', '/usr/share/man', 'share/man',
             '/usr/doc', '/usr/share/doc', 'share/doc',
             '/usr/info', '/usr/share/info', 'share/info',
             '/lib64', '/lib', 'lib',
             '/usr/lib64', '/usr/lib', 'lib',
             '/var/run', '/run', '/run',
             '/var/lock', '/run/lock', '/run/lock',
            ]
prefix = os.environ.get('pkgdir', '');

i = 0
while True:
    if i >= len(symlinks):
        break

    path = prefix+symlinks[i]
    target = prefix+symlinks[i+1]
    link = symlinks[i+2]
    if os.path.exists(path) and not os.path.islink(path):
        if not os.path.exists(target):
            os.makedirs(target)
        for f in glob.glob(path + '/*'):
            shutil.move(f, target)
        os.rmdir(path)
        # don't think we need this:
        #os.symlink(link, path)

    i += 3
