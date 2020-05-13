connect sys as sysdba;

-- Oradoc_db1
alter session set "_ORACLE_SCRIPT"=true;


--Grant 

SELECT * FROM all_users ORDER BY created;

-- drop user dummy cascade;
-- create user rajat identified by rajat;


create user rajat identified by rajat;
grant all privileges to rajat; 
commit;




create user Administrators identified by admin;
grant user Administrator dba;



create user Users identified by user;
grant 






drop user rajat cascade;
drop user administrators cascade;
drop user users cascade;
