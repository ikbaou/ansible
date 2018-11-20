--------------------------------------------------------------------------------------------------------------
---   !!!!!!!!!! IN ORDER TO PRESERVE ERROR LOGS, PLEASE RUN psql WITH stderr REDIRECTED TO stdout !!!!!!!!!!!
--------------------------------------------------------------------------------------------------------------
---
--- Edit script and replace path with the real ones.
---  
--- !!!
--- Before executing this script, manualy create directories i.e.
---
---
---	mkdir /data/postgres/tablespaces/tbs_data
---
---
--- chown the directories to postgres:postgres and chmod them to 700.
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
\o create.tablespaces.log



----------------------------------------------------------------------------------

create tablespace tbs_data
  owner postgres
  location '/data/postgres/tablespaces/tbs_data';
  
  
create tablespace tbs_index
  owner postgres
  location '/data/postgres/tablespaces/tbs_index';



create tablespace tbs_lob
  owner postgres
  location '/data/postgres/tablespaces/tbs_lob';
  
  
----------------------------------------------------------------------------------
--
--