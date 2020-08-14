-- method 1
INSERT INTO tbl_1 (login_time, col1, col2)
SELECT now(), 'value1', query_col
FROM tbl_2
WHERE col = 'some value' 

-- method 2
INSERT INTO tbl_1 (login_time, col1, col2)
VALUES (now(), 'value1', (SELECT query_col FROM tbl_2 WHERE col = 'some value'))

-- method 1
UPDATE tbl_1
SET col1 = 'test',
    col2 = subquery.query_col
FROM (
    SELECT query_col FROM tbl_2 
    WHERE col = 'some value'
) subquery
WHERE id = 1

-- method 2
UPDATE tbl_1
SET col1 = 'test',
    col2 = (SELECT query_col FROM tbl_2 WHERE col = 'some value')
WHERE id = 1