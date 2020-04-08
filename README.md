# UDF-For-PostgreSQL
Using udf in PostgreSQL achieve similar hextoraw() and rawtohex()'s function in Oracle

Excute Function hextoraw.sql 

#Using hextoraw function

***Initializing in PostgreSQL hextoraw function:***

psql -U postgres -d postgres -f hextoraw.sql


Next,Logging your PostgreSQL database and test this function:


psql -U postgres -d postgres


**Example:**

In Oracle：

    SQL> SELECT hextoraw('adbe123f') FROM DUAL;
    
    HEXTORAW
    --------
    ADBE123F
    
    SQL> SELECT hextoraw('abg12f') FROM DUAL;
    SELECT hextoraw('abg12f') FROM DUAL
                       *
    第 1 行出现错误:
    ORA-01465: 无效的十六进制数字


In PostgreSQL:

    postgres=# SELECT hextoraw('adbe123f');
     hextoraw 
    ----------
     ADBE123F
    (1 row)
    postgres=# SELECT hextoraw('abg12f');
       hextoraw
    ---------------------------------------
     abg12f 字符串包含无效的十六进制字符 g
    (1 row)



#using rawtohex function
***Initializing in PostgreSQL rawtohex function:***

You need execute extension for plpythonu in PostgreSQL

example:

loging your database for PostgreSQL execute fllowing statements;

CREATE EXTENSION plpythonu;

Next,create rawtohex function in PostgreSQL

psql -U postgres -d postgres -f rawtohex.sql 

**Example:**

    In Oracle：
    
    SQL> select rawtohex('reae23raer') as x from dual;
    
    X
    --------------------
    72656165323372616572
    
    SQL> select rawtohex('ASi@abda') as x from dual;
    
    X
    ----------------
    4153694061626461


In PostgreSQL:

    postgres=# select rawtohex('reae23raer');
       rawtohex   
    ----------------------
     72656165323372616572
    (1 row)
    
    postgres=# select rawtohex('ASi@abda');
     rawtohex 
    ------------------
     4153694061626461
    (1 row)
