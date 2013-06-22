#!/usr/bin/env python2

from HTMLParser import HTMLParser
import sys

class MyHTMLParser(HTMLParser):
    def handle_data(self, data):
        if data and len(data.strip()) > 0:
            print data.strip()

if len(sys.argv) > 1:
    parser = MyHTMLParser()
    try:
        parser.feed(open(sys.argv[1], "r").read())
    except IOError:
        print "IOError on http file"
else:
    print "package name expected"
