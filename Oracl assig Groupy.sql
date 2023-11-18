create Table perm (ID number);
create GlOBAL TEMPORARY TABLE temp1
    (ID NUMBER) ON COMMIT DELETE ROWS;
    CREATE GLOBAL TEMPORARY TABLE temp2
                (ID NUMBER) ON COMMIT DELETE ROWS;
 
CREATE TABLE as_heap (ID NUMBER);

    CREATE TABLE as_index (ID NUMBER PRIMARY KEY , name VARCHAR2(100))
            ORganization INDEX;
            

CREATE TABLE TEST (

    C1    char (10),
    c2   VARCHAR2(19));
    
    
    
    INSERT INTO TEST VALUES('text','text');
    
 
INSERT INTO TEST VALUES ('TEXT  ','TEXT');



       CREATE TABLE TEST (
       
        c1 CHAR(10 CHAR),
        c2 VARCHAR2(10 CHAR),
        c3 CHAR (10 BYTE)
        );
        
CREATE TABLE TEST (

        n1 NUMBER,
        n2 NUMBER (10,2),
        n3 NUMBER(3));

    
    insert into test values ('2002-05-02');
    
    
SELECT TO_CHAR (d1,'YYYY-MM-DD');

    CREATE TABLE test (d1 DATAE ,d2 TIMESTAMP (6));
    


INSERT INTO test VALUES (SYSDATE , SYSDATE);




Select *FROM test;



CREATE TABLE test (id NUMBER UNIQUE ,name VARCHAE(254), description VARCHAR2(400));


--INDEX
CREATE TABLE TES(ID NUMBER UNIQUE);
--ETRIT RERROR
INSERT INTO TES VALUES(1)

INSERT INTO TEST VALUES(NULL);
--COMPOSIT INDIX VALUES
CREATE TABLE TEST1(ID1 NUMBER,ID2 NUMBER,UNIQUE(ID1,ID2));
INSERT INTO TEST1 VALUES(1,1);
INSERT INTO TEST1 VALUES(1,NULL);
INSERT INTO TEST1 VALUES(NULL,NULL);
--COMPUND INDEX
CREATE TABLE EMP(ID NUMBER,SALARY NUMBER);
CREATE INDIX IND1 ON EMP(ID,SALARY)
CREATE INDIX IND2 ON EMP(SALARY,ID)
--VEWE

CREATE TABLE test (id NUMBER UNIQUE, name VARCHAR2(256), description VARCHAR2(4000));

CREATE VIEW test_view AS SELECT id, name FROM test;

GRANT SELECT ON test_view TO some_user;

CREATE VIEW test1_view AS 
   SELECT sum(salary), dept_id 
     FROM employees
 GROUP BY dept_id
   HAVING sum(salary) > 10000

Set Operators (INTERSECT, MINUS, UNION, UNION ALL)
DISTINCT
Group Aggregate Functions (AVG, COUNT, MAX, MIN, SUM, etc.)
GROUP BY Clause
ORDER BY Clause
CONNECT BY Clause
START WITH Clause
Collection Expression In A Select List
Subquery In A Select List
Join Query


CREATE SYNONYM s1 FOR test1.table1;
SELECT * FROM s1; 
CREATE PUBLIC SYNONYM s1 FOR test1.table1;
-- any user
SELECT * FROM s1; -- the user still nee




	CREATE SEQUENCE seq2
          INCREMENT BY 1
          START WITH 1
          NOMAXVALUE
          NOCYCLE
          CACHE 10;



INSERT INTO test1 (date_col) VALUES (SYSDATE);
                      
CREATE SEQUENCE s1;
INSERT INTO test1 (id) VALUES (s1.NEXTVAL);
				


SELECT SYSDATE FROM DUAL
  
        
         
  SELECT s1.NEXTVAL FROM DUAL
      
         
         
         
         
         INSERT INTO table1 (id) VALUES (s1.NEXTVAL);
SELECT s1.CURRVAL FROM DUAL;
   OR
SELECT s1.NEXTVAL FROM DUAL;
INSERT INTO table1 (id) 
   VALUES (<value from the previous statement>);


ALTER TABLE table1 ADD CONSTRAINT FK_1
  FOREIGN KEY (col1) REFERENCES table2(id)
  ON DELETE CASCADE;

INSERT INTO table2 VALUES (1);
INSERT INTO table1(id, col1) VALUES (1, 1);
INSERT INTO table1(id, col1) VALUES (1, 2); -- error
       –- referenced record does not exist in table2

DELETE FROM table2 WHERE id = 1;




ALTER TABLE TABLE1 
   ADD CONSTRAINT CHK_1
   CHECK (column1 IN ('A', 'B', 'C'))

ALTER TABLE EVENTS_TABLE
   ADD CONSTRAINT CHK_2
    CHECK (start_date < end_date)



CREATE TABLE tab1 (
  id NUMBER CONSTRAINT pk_tab1 PRIMARY KEY,
  col1 VARCHAR2(256) CONSTRAINT unk_tab1 UNIQUE,
  col2 VARCHAR2(10) CONSTRAINT chk_tab1 
      CHECK (col2 in ('A', 'AB', 'ABC')),
  CONSTRAINT chk_tab2 
     CHECK (length(col1) < length(col2))
);


create table table1 (id number primary key);
create table table2 (id number primary key, 
        col1 number references table1 deferrable);
set constraints all deferred;
insert into table2 values(1, 1);
insert into table1 values(1);
commit; 
set constraints all deferred;
insert into table2 values(2, 2);
commit; 
set constraints all deferred;
insert into table2 values(2, 2);
set constraints all immediate; 




GRANT SELECT ON table1 TO user1 WITH GRANT OPTION;
user1 grants privilege to user2
	GRANT SELECT ON table1 TO user2
owner revokes privilege from user1
	REVOKE SELECT ON table1 FROM user1
  -- privilege is also revoked from user2



CREATE USER test1/test1; GRANT DBA TO test1;
CREATE USER test2/test2; GRANT DBA TO test2;
CONNECT test1/test1;
CREATE TABLE table1 (id NUMBER);
CONNECT test2/test2;
SELECT * FROM test1.table1; -- ok, SELECT ANY DATA
CREATE VIEW test_view AS SELECT * FROM test1.table1;
  -- error - insufficient privileges
CONNECT TEST1/TEST1;
GRANT SELECT ON table1 TO test2;
CONNECT TEST2/TEST2;
CREATE VIEW test_view AS SELECT * FROM TEST1.table1;
  -- ok, explicitly granted privilege
GRANT SELECT ON test_view TO TEST3;
  -- test3 cannot access test_view