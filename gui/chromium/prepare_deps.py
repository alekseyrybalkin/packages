#!/usr/bin/env python

import os
import os.path
import sys

import deps


sources_home = sys.argv[1]


class Dep:
    def __init__(self, path, url, commit, repo_name):
        self.path = path
        self.url = url
        self.commit = commit
        self.repo_name = repo_name


def sub_vars(s):
    for k, v in deps.vars.items():
        if '{{{}}}'.format(k) in s:
            s = s.replace('{{{}}}'.format(k), str(v))
    return s


parsed_deps = []

raw_deps = deps.deps
if hasattr(deps, 'deps_os'):
    raw_deps.update(deps.deps_os['unix'])

fail = False
repos = set()
for k, v in raw_deps.items():
    k = sub_vars(k)
    if isinstance(v, dict):
        if 'url' in v and ('condition' not in v or 'linux' in v['condition']):
            v = v['url']
        else:
            continue
    v = sub_vars(v)

    path = k.replace('src/', '', 1)
    url, commit = v.split('@')
    repo_name = url.split('/')[-1].replace('.git', '')

    # manual exceptions
    if repo_name == 'src':
        repo_name = 'webrtc'
    if repo_name == 'py':
        repo_name = 'selenium-py'

    if repo_name in repos:
        print('repo name {} is duplicated'.format(repo_name))
        fail = True
    repos.add(repo_name)

    if not os.path.exists('{}/chromium-{}'.format(sources_home, repo_name)):
        print('git clone', url, '{}/chromium-{}'.format(sources_home, repo_name))
        fail = True

    parsed_deps.append(Dep(path, url, commit, repo_name))

if fail:
    sys.exit(1)

with open('filldeps.sh', 'w') as fd:
    fd.write('set -e\n')
    for d in parsed_deps:
        if not os.path.isdir(d.path) or not os.listdir(d.path):
            fd.write('git clone {}/chromium-{} {}\n'.format(sources_home, d.repo_name, d.path))
            fd.write('git --git-dir={}/.git --work-tree={} checkout {}\n'.format(d.path, d.path, d.commit))
            if d.repo_name != 'skia':
                fd.write('rm -rf {}/.git\n'.format(d.path))
