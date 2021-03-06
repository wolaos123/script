
-- Top CPU Processes

SELECT
 'USERNAME'  || CHR(9) ||   ': ' || s.username  || CHR(10) || 
 'SCHEMA'  || CHR(9) || CHR(9) ||  ': ' || s.schemaname || CHR(10) ||
 'OSUSER'  || CHR(9) || CHR(9) ||  ': ' || s.osuser  || CHR(10) ||
 'MODUEL'  || CHR(9) || CHR(9) ||  ': ' || s.module  || CHR(10) || 
 'ACTION'  || CHR(9) || CHR(9) ||  ': ' || s.action  || CHR(10) || 
 'CLIENT_INFO' || CHR(9) ||    ': ' || s.client_info || CHR(10) || 
 'PROGRAM'  || CHR(9) || CHR(9) ||  ': ' || s.program  || CHR(10) || 
 'SPID'   || CHR(9) || CHR(9) ||  ': ' || p.spid   || CHR(10) || 
 'SID'   || CHR(9) || CHR(9) ||  ': ' || s.sid   || CHR(10) || 
 'SERIAL#'  || CHR(9) || CHR(9) ||  ': ' || s.serial#  || CHR(10) || 
 'MACHINE'  || CHR(9) || CHR(9) ||  ': ' || s.machine  || CHR(10) || 
 'TYPE'   || CHR(9) || CHR(9) ||  ': ' || s.type   || CHR(10) || 
 'TERMINAL'  || CHR(9) ||    ': ' || s.terminal  || CHR(10) || 
 'SQL_ID'  || CHR(9) || CHR(9) ||  ': ' || s.sql_id  || CHR(10) || 
 'CHILD_NUM'  || CHR(9) ||    ': ' || q.child_number || CHR(10) || 
 'KILL STRING' || CHR(9) ||    ': ' || 'ALTER SYSTEM KILL SESSION ' || '''' || s.sid || ',' || s.serial# || ''''  || CHR(10) || 
 'ACCESS PLAN' || CHR(9) ||    ': ' || 'SELECT * FROM table( DBMS_XPLAN.DISPLAY_CURSOR(' || '''' || s.sql_id || '''' || ',' || q.child_number || ')) ;' || CHR(10) || 
 'SQL_TEXT'  || CHR(9) ||    ': ' || q.sql_text
FROM v$session s,   v$process p,   v$sql     q
WHERE   s.paddr = p.addr  AND   s.sql_id = q.sql_id(+)  AND   s.status = 'ACTIVE'  AND   p.spid = '&PID_FROM_OS' ; 

