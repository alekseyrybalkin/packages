#!/usr/bin/env python2

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
    conn.execute('''
        create table depends(
            id integer primary key,
            user_id integer,
            provider_id integer)''')
    conn.execute('create index package_name on package(name)')
    conn.execute('create index file_name on file(name)')
    conn.execute('create index file_package_id on file(package_id)')
    conn.execute('create index user_package_id on depends(user_id)')
    conn.execute('create index provider_package_id on depends(provider_id)')

def gen_db(conn):
    packages_path = '/var/kiin/installed/'
    installed_packages = os.listdir(packages_path)
    actual_package_list = []
    for package_file in installed_packages:
        filename = packages_path + package_file
        package = package_file.replace('kiin.', '').replace('.tar.xz', '')
        timestamp = stat('-c', '%Y', '-t', filename).rstrip("\n")
        tmp = package.split('-')
        version = tmp[len(tmp)-1]
        package = package.replace('-' + version, '')
        actual_package_list.append(package)

        c = conn.cursor()
        c.execute('select id,name,version,timestamp from package where name=?',
                  (package,))
        stored_package = c.fetchone()
        if stored_package is None or str(stored_package[3]) != str(timestamp):
            depending_list = []
            if stored_package is not None:
                c.execute('delete from file where package_id=?', (stored_package[0],))
                c.execute('delete from package where id=?', (stored_package[0],))
                c.execute('delete from depends where user_id=?', (stored_package[0],))
                for depending in c.execute('''select package.id from depends
                        join package on depends.user_id=package.id where
                        depends.provider_id=? and provider_id <> user_id''',
                        (stored_package[0],)):
                    depending_list.append(depending[0])
                c.execute('delete from depends where provider_id=?', (stored_package[0],))
            print package+'-'+version
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
                if not line[5].startswith('kiin-dest'):
                    continue
                name = line[5].replace('kiin-dest', '')
                link = ''
                if len(line) == 8:
                    link = line[7]
                files.append((package_id, permissions, ownership, name, link))
            c.executemany('''
                insert into file(package_id, permissions, ownership,
                                    name, link)
                    values (?, ?, ?, ?, ?)''', files)
            for depending in depending_list:
                c.execute('''
                    insert into depends(user_id, provider_id)
                        values (?, ?)''', (depending, package_id))
    # now delete stale packages from db
    actual_package_set = set(actual_package_list)
    package_ids_to_delete = []
    for row in c.execute('select id,name from package'):
        if row[1] not in actual_package_set:
            package_ids_to_delete.append(row[0])
    for package_id in package_ids_to_delete:
        c.execute('delete from file where package_id=?', (package_id,))
        c.execute('delete from package where id=?', (package_id,))
        c.execute('delete from depends where user_id=?', (package_id,))
        c.execute('delete from depends where provider_id=?', (package_id,))

def list_untracked(conn):
    c = conn.cursor()
    for line in sys.stdin:
        line = line.rstrip("\n")
        if c.execute("select count(*) from file where name='" + line + "'",
                ).fetchone()[0] == 0:
            print "nobody owns", line

if __name__ == "__main__":
    if len(sys.argv) > 1:
        conn = sqlite3.connect('/var/kiin/kiin-db/kiin.sqlite3')
        if sys.argv[1] == 'gen-db': gen_db(conn)
        if sys.argv[1] == 'create-db': create_db(conn)
        if sys.argv[1] == 'list-untracked': list_untracked(conn)
        conn.commit()
