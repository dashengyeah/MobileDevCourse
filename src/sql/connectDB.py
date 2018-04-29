#!/bin/baaash/env python
# -*- coding:utf-8 -*-

# Usage:
#     connect the Database
#   DB name: test
#

import pymysql

def connectDB():
    host = "127.0.0.1"
    port = 3306
    user = "root"
    passwd = "2269"
    db = "test"
    
    try:
        conn = pymysql.connect(host=host, port=port, user=user, passwd=passwd, db=db, charset='utf8')
        print("->DB connect sucess!")
    except Exception:
        print("->DB connect Failed!")

    return conn


if __name__ == "__main__":
    connectDB().close()
