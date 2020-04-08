CREATE OR REPLACE FUNCTION hextoraw(str text)
RETURNS text AS
$FUNCTION$
DECLARE
	result text;
	val int;
	v_char char(1);
	str_count int;
	ex  text;
BEGIN
		str_count := length(str);
		FOR i IN 1..str_count LOOP
			v_char := substr(str,i,1);
			val := ascii(UPPER(v_char));
			ex := str || ' 字符串包含无效的十六进制字符 ' || v_char;
			IF val > 70 THEN
				RETURN ex;
				EXIT;
			END IF;
		END LOOP;
		RETURN UPPER(str);
END;
$FUNCTION$
LANGUAGE PLPGSQL;
/*
Example:
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
postgres=# SELECT hextoraw('adg12f');
               hextoraw                
---------------------------------------
 adg12f 字符串包含无效的十六进制字符 g
 
*/