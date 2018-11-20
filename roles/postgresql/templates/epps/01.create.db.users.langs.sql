--------------------------------------------------------------------------------------------------------------
---   !!!!!!!!!! IN ORDER TO PRESERVE ERROR LOGS, PLEASE RUN psql WITH stderr REDIRECTED TO stdout !!!!!!!!!!!
--------------------------------------------------------------------------------------------------------------
---
---
---  Execute the script from psql as postgres user
---



--
-- set some client variables
set client_min_messages to error;
set statement_timeout = 0;
set client_encoding = 'utf8';
set standard_conforming_strings = off;
set check_function_bodies = false;
set client_min_messages = warning;
set escape_string_warning = off;


-- 
-- Spool output to log file
\o create.db.users.langs.log


----------------------------------------------------------------------------------

create procedural language plpgsql;


create database e_proc encoding='utf8';


--
-- Create general E_PROC role which will be inherited by new users
--
create role e_proc_role 
	inherit 
	createdb 
	nocreaterole;
update pg_authid set rolcatupdate=false where rolname='e_proc_role';



create role e_proc login
  password 'e_proc'
  nosuperuser inherit nocreatedb nocreaterole;
grant e_proc_role to e_proc;




-- grant rights to tablespaces
grant all on tablespace tbs_data to e_proc;
grant all on tablespace tbs_index to e_proc;
grant all on tablespace tbs_lob to e_proc;



----------------------------------------------------------------------------------
--
--