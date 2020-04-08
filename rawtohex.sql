CREATE EXTENSION IF NOT EXISTS plpythonu;
CREATE OR REPLACE FUNCTION rawtohex(input_str text)
RETURNS text
AS
$$
    raw_hex_str = []
    for i in range(len(input_str)):
        ascii_val = ord(input_str[i])
        hex_val = hex(ascii_val)
        raw_val = hex_val[2:]
        raw_hex_str.append(raw_val)
    result = ''.join(raw_hex_str)
    return result    
$$
LANGUAGE plpythonu;