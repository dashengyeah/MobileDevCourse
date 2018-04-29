#!/bin/baaash/env python
# -*- coding:utf-8 -*-

import pymysql
from connectDB import connectDB

conn = connectDB()
cursor = conn.cursor()

def resetTables():
    fd = open("dropAll.sql")
    sql = fd.read()
    #sql = " ".join(fd.read().split('\n'))
    fd.close()
    print("[SQL] \n"+sql)
    try:
        cursor.execute(sql)
    except Exception as e:
        print("[SQL] sql execution failed.")
        print(e)

def inertSchools():
    fd = open("schools.txt")
    sql = "insert into schools(name) values('%s');"
    for school in fd.readlines():
        print(school)
        if not school=="" and not school=='\n':
            try:
                cursor.execute(sql % school)
            except Exception as e:
                print("[SQL] sql execution failed.")
                print(e)

    fd.close()

def insertUsers():
    sql = "insert into users(id, passwd, school) values('%s', '%s', %s);"
    for i in range(1,100):
        user = [i, str(i)*6, i]
        try:
            cursor.execute(sql % (user[0], user[1], user[2]))
        except Exception as e:
            print("[SQL] sql execution failed.")
            print(e)

def insert
    
if __name__ == "__main__":
    #connectDB().close()
    #resetTables()

    inertSchools()
    insertUsers()
    
    conn.commit()
    conn.close()
