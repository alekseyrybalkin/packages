#!/usr/bin/env python

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


parsed_deps = []

raw_deps = deps.deps
if hasattr(deps, 'deps_os'):
    raw_deps.update(deps.deps_os['unix'])

fail = False
repos = set()
for k, v in raw_deps.items():
    path = k.replace('src/', '', 1)
    url, commit = v.split('@')
    repo_name = url.split('/')[-1].replace('.git', '')

    # manual exceptions
    if repo_name == 'src':
        repo_name = 'breakpad-src'
    if repo_name == 'py':
        repo_name = 'selenium-py'
    if repo_name == 'lib':
        repo_name = 'bidichecker-lib'
    if repo_name == 'webrtc' and commit == '80b8183191cb5703a22c589e8f6b893fcc41d4ea':
        commit = '1abcfb59a01e17050dc41b5635e52ee591962018'

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
        fd.write('git clone {}/chromium-{} {}\n'.format(sources_home, d.repo_name, d.path))
        fd.write('git --git-dir={}/.git --work-tree={} checkout {}\n'.format(d.path, d.path, d.commit))
        if d.repo_name != 'skia':
            fd.write('rm -rf {}/.git\n'.format(d.path))
