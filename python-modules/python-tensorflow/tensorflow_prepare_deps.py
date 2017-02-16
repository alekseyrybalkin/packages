#!/usr/bin/env python3

import re
import sys
import os
import os.path


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


class Dep:
    def __init__(self, name=None, build_file=None, urls=None, strip_prefix=None, line_numbers=None):
        if line_numbers is None:
            line_numbers = {}
        if urls is None:
            urls = []
        self.name = name
        if self.name:
            self.name = name.replace('"', '')
        self.build_file = build_file
        if self.build_file:
            self.build_file = build_file.replace('"', '')
        self.urls = list(urls)
        for i, url in enumerate(self.urls):
            self.urls[i] = url.replace('"', '')
        self.strip_prefix = strip_prefix
        if self.strip_prefix:
            self.strip_prefix = strip_prefix.replace('"', '')
        self.line_numbers = dict(line_numbers)

    def __repr__(self):
        return 'Dep({}, {}, {}, {}, {})'.format(self.name, self.build_file, self.urls, self.strip_prefix, self.line_numbers)

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
                dep.line_numbers['name'] = index
            if dep is not None and line.startswith('build_file ='):
                dep.build_file = value_re.search(line).group().replace('"', '')
            if dep is not None and line.startswith('url ='):
                dep.urls.append(value_re.search(line).group().replace('"', ''))
            if dep is not None and line.startswith('urls ='):
                parsing_urls = True
            if dep is not None and line.startswith('strip_prefix ='):
                dep.strip_prefix = value_re.search(line).group().replace('"', '')
            if dep is not None and line.startswith(')'):
                deps.append(dep)
                dep = None
                parsing_urls = False
            if dep is not None and parsing_urls and line.startswith(']'):
                parsing_urls = False
            if dep is not None and parsing_urls and line.startswith('"'):
                dep.urls.append(value_re.search(line).group().replace('"', ''))
    return deps


def main():
    deps = []
    deps += load_deps('WORKSPACE')
    deps += load_deps('tensorflow/workspace.bzl')

    folder = sys.argv[1]
    os.makedirs(folder, exist_ok=True)
    for dep in deps:
        if not os.path.isfile(folder + '/' + dep.get_filename()):
            print(dep)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('need arg')
        sys.exit(1)
    main()
