#!/usr/bin/env python

import sys
import os
import string
import sqlite3
from sh import tar, stat

def create_db(conn):
    conn.execute('''
        create table package(
            id integer primary key,
            name text,
            version text,
            timestamp integer)''')
    conn.execute('''
        create table file(
            id integer primary key,
            package_id integer,
            permissions text,
            ownership text,
            name text,
            link text)''')
    conn.execute('create index package_name on package(name)')
    conn.execute('create index file_name on file(name)')
    conn.execute('create index file_package_id on file(package_id)')

def gen_db(conn):
    packages_path = '/sources/installed/'
    installed_packages = os.listdir(packages_path)
    for package_file in installed_packages:
        filename = packages_path + package_file
        package = package_file.replace('kiin.', '').replace('.tar.xz', '')
        timestamp = stat('-c', '%Y', '-t', filename).rstrip("\n")
        tmp = package.split('-')
        version = tmp[len(tmp)-1]
        package = package.replace('-' + version, '')

        c = conn.cursor()
        c.execute('select id,name,version,timestamp from package where name=?',
                  (package,))
        stored_package = c.fetchone()
        if stored_package is None or str(stored_package[3]) != str(timestamp):
            if stored_package is not None:
                c.execute('delete from package where id=?', (stored_package[0],))
                c.execute('delete from file where package_id=?', (stored_package[0],))
            c.execute('''
                insert into package(name, version, timestamp)
                    values (?, ?, ?)''', (package, version, timestamp))
            c.execute('select last_insert_rowid()')
            package_id = c.fetchone()[0]
            files = []
            for line in tar('-tvf', filename, _iter=True):
                line = line.rstrip("\n").split()
                permissions = line[0]
                ownership = line[1]
                name = line[5].replace('kiin-dest', '')
                link = ''
                if len(line) == 8:
                    link = line[7]
                files.append((package_id, permissions, ownership, name, link))
            c.executemany('''
                insert into file(package_id, permissions, ownership,
                                    name, link)
                    values (?, ?, ?, ?, ?)''', files)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        conn = sqlite3.connect('/sources/kiin-db/kiin.sqlite3')
        if sys.argv[1] == 'gen-db': gen_db(conn)
        if sys.argv[1] == 'create-db': create_db(conn)
        conn.commit()
