#!/usr/bin/env python
# coding: utf-8

import sqlite3

in_filename = 'data_setup.sql'
out_filename = 'burgers_and_beers.db'

with open(in_filename) as in_file:
    conn = sqlite3.connect(out_filename)
    conn.executescript(in_file.read())
    conn.commit()
    conn.close()
