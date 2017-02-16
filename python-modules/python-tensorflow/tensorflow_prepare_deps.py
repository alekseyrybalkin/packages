#!/usr/bin/env python3

import re
import sys
import os
import os.path
import shutil

import requests


value_re = re.compile('".*"')
filename_re = re.compile('^.*\/(.*)$')
dep_tags = (
    'new_http_archive',
    'http_archive',
    'http_file',
    'native.new_http_archive',
    'native.http_archive',
    'native.http_jar',
    'temp_workaround_http_archive',
)
workspace_files = ('WORKSPACE', 'tensorflow/workspace.bzl')


class Dep:
    def __init__(self, name=None, urls=None):
        if urls is None:
            urls = []
        self.name = name
        self.urls = list(urls)

    def get_filename(self):
        if len(self.urls) < 1:
            return None
        return self.name + '-' + filename_re.search(self.urls[0]).group(1)

    def get_url(self):
        if len(self.urls) < 1:
            return None
        return self.urls[0]


def load_deps(file_path):
    deps = []
    dep = None
    parsing_urls = False
    with open(file_path, 'r') as w:
        for index, line in enumerate(w.readlines()):
            line = line.strip()
            for dep_tag in dep_tags:
                if line.startswith(dep_tag):
                    dep = Dep()
            if dep is not None and line.startswith('name ='):
                dep.name = value_re.search(line).group().replace('"', '')
            if dep is not None and line.startswith('url ='):
                dep.urls.append(value_re.search(line).group().replace('"', ''))
            if dep is not None and line.startswith('urls ='):
                parsing_urls = True
            if dep is not None and line.startswith(')'):
                deps.append(dep)
                dep = None
                parsing_urls = False
            if dep is not None and parsing_urls and line.startswith(']'):
                parsing_urls = False
            if dep is not None and parsing_urls and line.startswith('"'):
                dep.urls.append(value_re.search(line).group().replace('"', ''))
    return deps


def fix_urls(file_path, folder, deps):
    tmp_file_path = file_path + '.new'
    with open(file_path, 'r') as old, open(tmp_file_path, 'w') as new:
        for line in old.readlines():
            for dep in deps:
                local_file = os.path.join(folder, dep.get_filename())
                line = line.replace(dep.get_url(), 'file://{}'.format(local_file))
            new.write(line)
    shutil.move(tmp_file_path, file_path)


def main():
    # create a folder to store archives
    folder = sys.argv[1]
    os.makedirs(folder, exist_ok=True)

    # read all dependencies from workspace files
    deps = []
    for f in workspace_files:
        deps += load_deps(f)

    # download missing archives
    for dep in deps:
        local_file = os.path.join(folder, dep.get_filename())
        if not os.path.isfile(local_file):
            print('Downloading {}'.format(dep.get_url()))
            tarball = requests.get(dep.get_url()).content
            with open(local_file, 'wb') as f:
                f.write(tarball)

    # fix urls in workspace files
    for f in workspace_files:
        fix_urls(f, folder, deps)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('need folder arg')
        sys.exit(1)
    main()
