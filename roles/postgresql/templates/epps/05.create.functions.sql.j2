---
---  Execute the script from psql as E_PROC user
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
\o create.functions.log

----------------------------------------------------------------------------------



--
-- Name: account_aiud_trig_account(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION account_aiud_trig_account() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE 
     I record;
     
    BEGIN
	IF TG_OP = 'INSERT' or TG_OP = 'UPDATE' THEN
		-- for warehouse
		FOR I IN 
			SELECT DISTINCT G.F_CONTENT_ENTRY as F_CONTENT_ENTRY
			FROM  ACCOUNT_ROLE AR,
			      ROLES R,
			      GROUPS G
			WHERE AR.F_ACCOUNT = NEW.F_PRINCIPAL
			AND AR.F_ROLE = R.F_PRINCIPAL
			AND R.F_GROUP = G.ID
			AND G.F_TEMPLATE_GROUPS = 6 
                LOOP
			INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH (ID, F_RESOURCE, ACTION) VALUES (nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'),I.F_CONTENT_ENTRY,'INS');
                        
		END LOOP;
		return new;
	ELSE
	-- always consider it as insert/update of CE, thus INS operation for CE on delete of ACCOUNT
		-- for warehouse
	
		FOR I IN 
			SELECT DISTINCT G.F_CONTENT_ENTRY as F_CONTENT_ENTRY
			FROM  ACCOUNT_ROLE AR,
			      ROLES R,
			      GROUPS G
			WHERE AR.F_ACCOUNT = OLD.F_PRINCIPAL
			AND AR.F_ROLE = R.F_PRINCIPAL
			AND R.F_GROUP = G.ID
			AND G.F_TEMPLATE_GROUPS = 6
		
		LOOP
			INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
			(ID, F_RESOURCE, ACTION)
			VALUES
			(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), I.F_CONTENT_ENTRY, 'INS');
		END LOOP;
                return old;
	END IF;

END;
    $$;



--
-- Name: authorities_aiud_trig_authorities(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION authorities_aiud_trig_authorities() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

DECLARE 
     I  record;
     J  record;
     K  record;

BEGIN
	IF TG_OP = 'INSERT' or TG_OP = 'UPDATE' THEN
		-- for warehouse
		FOR I IN 
			SELECT DISTINCT G.F_CONTENT_ENTRY as F_CONTENT_ENTRY
			FROM  ACCOUNT A,
				ACCOUNT_ROLE AR,
				ROLES R,
				GROUPS G
			WHERE A.F_AUTHORITY = NEW.ID
			AND A.F_PRINCIPAL = AR.F_ACCOUNT
			AND AR.F_ROLE = R.F_PRINCIPAL
			AND R.F_GROUP = G.ID
			AND G.F_TEMPLATE_GROUPS = 6
		
		LOOP
			INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
			(ID, F_RESOURCE, ACTION)
			VALUES
			(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), I.F_CONTENT_ENTRY, 'INS');
		END LOOP;
		return new;
		
		IF NEW.TYPE = 'template.group.ca' THEN
		-- Sync the change of name of the authority
		
			FOR K IN 
				SELECT G.F_CONTENT_ENTRY as F_CONTENT_ENTRY
				FROM GROUPS G
				WHERE G.ID = NEW.F_GROUPS
			
			LOOP
				FOR J IN 
					SELECT CE.F_RESOURCE as F_RESOURCE
					FROM  CONTENT_ENTRY CE
					WHERE CE.F_ENTRY_TYPE = 8
					AND CE.ABSOLUTE_PATH LIKE '%/a'||TO_CHAR(K.F_CONTENT_ENTRY)||'/%'
				
				LOOP

					UPDATE METADATUM
					SET METADATUM_VALUE = NEW.NAME
					WHERE F_CONTENT_ENTRY = J.F_RESOURCE
					AND F_META_TYPE = 142;

					UPDATE SEARCH_METADATUM_WH
					SET METADATUM_VALUE_142 = NEW.NAME
					WHERE F_CONTENT_ENTRY = J.F_RESOURCE;

				END LOOP;
				return new;
			END LOOP;
			return new;
		END IF;
	ELSE
	-- always consider it as insert/update of CE, thus INS operation for CE on delete of AUTHORITIES
		-- for warehouse
		FOR I IN 
			SELECT DISTINCT G.F_CONTENT_ENTRY as F_CONTENT_ENTRY
			FROM  ACCOUNT A,
				ACCOUNT_ROLE AR,
				ROLES R,
				GROUPS G
			WHERE A.F_AUTHORITY = OLD.ID
			AND A.F_PRINCIPAL = AR.F_ACCOUNT
			AND AR.F_ROLE = R.F_PRINCIPAL
			AND R.F_GROUP = G.ID
			AND G.F_TEMPLATE_GROUPS = 6
		
		LOOP
			INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
			(ID, F_RESOURCE, ACTION)
			VALUES
			(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), I.F_CONTENT_ENTRY, 'INS');
		END LOOP;
		return old;
	END IF;
END;
   $$;




--
-- Name: content_entry_aiud_trig_content_entry(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION content_entry_aiud_trig_content_entry() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
	IF TG_OP = 'INSERT' or TG_OP = 'UPDATE' THEN
		-- for warehouse
		INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
		(ID, F_RESOURCE, ACTION)
		VALUES
		(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), NEW.F_RESOURCE, 'INS');
		return new;
	ELSE
		-- for warehouse
		INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
		(ID, F_RESOURCE, ACTION)
		VALUES
		(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), OLD.F_RESOURCE, 'DEL');
		return old;
	END IF;
END;
    $$;




--
-- Name: create_temp_objects(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION create_temp_objects() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE 

	obj_name text;
	
BEGIN


-- create temp sequence
CREATE TEMPORARY SEQUENCE GENERIC_TEMP_PRESERVE_SEQ;

-- create temp table
CREATE GLOBAL TEMPORARY TABLE GENERIC_TEMP_PRESERVE
(
  num1 numeric,
  num2 numeric,
  num3 numeric,
  num4 numeric,
  num5 numeric,
  date1 timestamp without time zone,
  date2 timestamp without time zone,
  date3 timestamp without time zone,
  date4 timestamp without time zone,
  date5 timestamp without time zone,
  vc1 text,
  vc2 text,
  vc3 text,
  vc4 text,
  vc5 text
);

END;
    $$;




--
-- Name: drop_temp_objects(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION drop_temp_objects() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE 

	obj_name text;
	
BEGIN



-- the objects are already created
SELECT INTO obj_name relname FROM pg_class WHERE relname='generic_temp_preserve';
IF FOUND THEN
	DROP SEQUENCE GENERIC_TEMP_PRESERVE_SEQ;
	DROP TABLE GENERIC_TEMP_PRESERVE;
END IF;


END;
    $$;




--
-- Name: get_content_xml(text, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION get_content_xml(pinput_crit_xml text, INOUT psearch_within character varying, ppage character varying, pnumber_of_rows character varying, porder_array character varying, pasc_desc_array character varying, OUT ptotal character varying, OUT pstatus character varying, OUT perr_msg text, OUT precord_xml refcursor) RETURNS record
    LANGUAGE plpgsql
    AS $_$
DECLARE
	vcollist    text;
	vcolumns    text;
	is_synonym_search_enabled smallint;
	metadata_cnt smallint;
	vfrom text;
	vwhere text;
	vwhere2 text;
	
	en text;
	em text;
	us text;

	bptotal int4;
	
	ordby_c_arr varchar[];
	ordby_ad_arr varchar[];

	flag smallint;
	vorder_by text;
	sql_txt text;
	
	doc xml;
	xml_rec record;
	mdrec record;
	ndlist xml;
	val record;
	oper text;
	toper text;
	
	val1 text;
	val2 text;
	csv_val text;
	
	metadata_search_pattern text;

	vsearch_within  VARCHAR(200);
	
BEGIN
	vcolumns := '';
        vcollist := '';
        is_synonym_search_enabled := 0;
        metadata_cnt := 0;
	vsearch_within :=  trim(psearch_within);

	
	--
	-- invoke function to create temporary objects: table and sequence
	--
	EXECUTE create_temp_objects();


        -- check if there is starting page
        IF pnumber_of_rows IS NULL THEN
            RAISE EXCEPTION '%', '"Number Of Rows" parameter is NULL. It must be supplied!';
        END IF;
        

        -- check if there is starting page
        IF ppage IS NULL THEN
            RAISE EXCEPTION '%', '"Starting Page" parameter is NULL. It must be supplied!';
        END IF;

        
        
        -------------------------------------------------------------------------------
        -- There is no output XML, so hardcode columns
	vcollist := 'F_RESOURCE, TITLE, AUTHORITY, DATE_CREATED, CREATOR, F_ENTRY_TYPE, VERSION_LABEL, ABSOLUTE_PATH, PARENT_FOLDER, STATUS, SUBMISSION_DEADLINE ';
	-------------------------------------------------------------------------------
        vcolumns :=  'SELECT CE.F_RESOURCE F_RESOURCE, '||
			'MD.METADATUM_VALUE_1 TITLE, '||
			'MD.METADATUM_VALUE_142 AUTHORITY, '||
			'TO_CHAR(CE.DATE_CREATED, ''DD/MM/YYYY'') DATE_CREATED, '||
			'CE.CREATOR CREATOR, '||
			'CE.F_ENTRY_TYPE F_ENTRY_TYPE, '||
			'CE.VERSION_LABEL VERSION_LABEL, '||
			'CE.ABSOLUTE_PATH ABSOLUTE_PATH, '||
			'CE.PARENT_FOLDER PARENT_FOLDER, '||
			'CE.STATUS STATUS, '||
			'MD.METADATUM_VALUE_23 SUBMISSION_DEADLINE ';        
        vfrom := 'FROM CONTENT_ENTRY CE, '||
			'SEARCH_METADATUM_WH MD '; 			
        vwhere := 'WHERE MD.F_CONTENT_ENTRY = CE.F_RESOURCE ';

        vwhere2 := '';

	
        
        -------------------------------------------------------------------------------
        -- creating order by clause
        IF porder_array IS NOT NULL AND pasc_desc_array IS NOT NULL THEN
        -- if there is order by ...
        -- first parse columns
            ordby_c_arr := string_to_array(trim(trailing ';' from porder_array), '|');
        -- now, parse asc and desc values
            ordby_ad_arr := string_to_array(trim(trailing ';' from pasc_desc_array), '|');
        -- check arrays are different in number of elements

	RAISE NOTICE ' % ', array_length(ordby_c_arr,1);
	RAISE NOTICE ' % ', array_length(ordby_ad_arr,1);
        
            IF array_length(ordby_c_arr,1) != array_length(ordby_ad_arr,1) THEN
		RAISE EXCEPTION '%', '"Order By" arrays are different in number of elements.';
            END IF;

            flag := 0;
            vorder_by := '';

            FOR i IN 1..array_length(ordby_c_arr,1) LOOP
                IF trim(ordby_c_arr[i]) IS NULL OR trim(ordby_ad_arr[i]) IS NULL THEN
                    RAISE EXCEPTION '%', 'Arrays passed for "Order By" contain NULL elements';
                END IF;

                IF ordby_c_arr[i] != '-1' THEN
                    IF flag = 0 THEN
                        vorder_by := ' order by '||ordby_c_arr[i]||' ';
                        IF ordby_ad_arr[i] != '-1' THEN
                            vorder_by := vorder_by || ordby_ad_arr[i];
                        ELSE
                            vorder_by := vorder_by || 'asc';
                        END IF;
                        flag := 1;
                    ELSE
                        vorder_by := vorder_by || ', '||ordby_c_arr[i]||' ';
                        IF ordby_ad_arr[i] != '-1' THEN
                            vorder_by := vorder_by || ordby_ad_arr[i];
                        ELSE
                            vorder_by := vorder_by || 'asc';
                        END IF;
                    END IF;
                END IF;
            END LOOP;
            vorder_by := vorder_by ||' ';
        ELSE
            vorder_by := ' ';
        END IF;




 	
        
	-- preserve the order of metadata tags as it was sent in the input XML
	FOR xml_rec IN (
		select trim(trailing '/' from substr(trim(node::text),2,strpos(node::text,'>')-2)) as tagname, node
		from 
		(
			select unnest( xpath( '/ROWSET/ROW/*'::text, cast(pinput_crit_xml as xml) )
        	)::text as node ) a	
        	WHERE ( node LIKE '<MD_%'
					or node like '<CE_DATE_RANGE%'
					or node like '<CE_F_RESOURCE%'
					or node like '<CE_VERSION_LABEL%'
		)
	)
	LOOP
		INSERT INTO generic_temp_preserve (num1, vc1)
		VALUES (nextval('generic_temp_preserve_seq'), xml_rec.tagname);
	END LOOP;
        -- reuse flag to see if brackets are needed
        flag := 0;












	FOR mdrec IN (
		SELECT sm.ID as ID, sm.search_type as search_type, sm.tag_name as tag_name, sm.the_level as the_level, sm.search_pattern as search_pattern, sm.value_format as value_format
				FROM search_metadata sm,
					generic_temp_preserve gtp
				WHERE sm.tag_name = gtp.vc1
				AND search_type = 'CONTENT_ENTRY'
				AND in_out_flag = 'IN'
		ORDER BY gtp.num1
        )
        LOOP
            IF mdrec.the_level = 1 THEN
            -- plain "name/value" pairs
                FOR val IN  (
			select unnest( xpath( '/ROWSET/ROW/'::text || tag_name || '/text()', cast(pinput_crit_xml as xml) ) ) a
		) LOOP
			IF flag = 0 THEN
			    vwhere2 := vwhere2 || 'AND (';
			    vwhere2 := vwhere2 ||REPLACE(mdrec.search_pattern, '$#$#VALUE$#$#', val.a[0])||' ';
			    flag := 1;
			ELSE
			    vwhere2 := vwhere2 ||' AND '||REPLACE(mdrec.search_pattern, '$#$#VALUE$#$#', val.a[0])||' ';
		       END IF;
		END LOOP; 
	    ELSIF mdrec.the_level = 2 THEN
	            -- operator + value - but level 2 is only for MetaData tags!!!
	            
	            -- extract operator
	    	    oper := array_to_string(xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/OPERATOR/text()', cast(pinput_crit_xml as xml)),'');
		
		   
		    -- get the search pattern so you can replace it eventually
		    metadata_search_pattern := mdrec.search_pattern;
	    	    
	    	    
	    	    -- iterate over values
	            FOR val IN  
	            (
		    	select unnest( xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/VALUE/text()', cast(pinput_crit_xml as xml) ) ) a
		    ) LOOP 
		     	IF flag = 0 THEN
			    vwhere2 := vwhere2 || 'AND (';
			    -- In case that the first MD elemet has operator NOT
			    IF oper = 'AND NOT' THEN
			     toper := ' NOT ';
			    ELSE
			     toper := '';
			    END IF;
			    vwhere2 := vwhere2 || toper || REPLACE(metadata_search_pattern, '$#$#VALUE$#$#'::text, val.a::text)||' ';
			    flag := 1;
		     	ELSE
			    vwhere2 := vwhere2 ||' '||oper||' '||REPLACE(metadata_search_pattern, '$#$#VALUE$#$#'::text, val.a::text)||' ';
		     	END IF;
		    
		    END LOOP; 
		    
		    
		ELSIF mdrec.the_level = 3 THEN
	            -- operator + value - but level 2 is only for MetaData tags!!!
	            
	            -- extract operator
	    	    oper := array_to_string(xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/OPERATOR/text()', cast(pinput_crit_xml as xml)),'');
		
		   
		    -- get the search pattern so you can replace it eventually
		    metadata_search_pattern := mdrec.search_pattern;
	    	    
	    	    
	    	    -- iterate over values
	            FOR val IN  
	            (
		    	select unnest( xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/VALUE/text()', cast(pinput_crit_xml as xml) ) ) a
		    ) LOOP 
		     	IF flag = 0 THEN
			    vwhere2 := vwhere2 || 'AND (';
			    -- In case that the first MD elemet has operator NOT
			    IF oper = 'AND NOT' THEN
			     toper := ' NOT ';
			    ELSE
			     toper := '';
			    END IF;
			    vwhere2 := vwhere2 || toper || REPLACE(metadata_search_pattern, '$#$#VALUE$#$#'::text, val.a::text)||' ';
			    flag := 1;
		     	ELSE
			    vwhere2 := vwhere2 ||' '||oper||' '||REPLACE(metadata_search_pattern, '$#$#VALUE$#$#'::text, val.a::text)||' ';
		     	END IF;
		    
		    END LOOP; 
		    
		    
		ELSIF mdrec.the_level = 4 THEN
	            -- Only for DATES in range -> From/To with BETWEEN
	            
	            -- extract operator
	    	    oper := array_to_string(xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/OPERATOR/text()', cast(pinput_crit_xml as xml)),'');
		    val1 := ( (xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/VALUE/text()', cast(pinput_crit_xml as xml)))[1] )::text ;
		    val2 := ( (xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/VALUE/text()', cast(pinput_crit_xml as xml)))[2] )::text ;
		    
		    -- get the search pattern so you can replace it eventually
		    metadata_search_pattern := mdrec.search_pattern;
	    	    
	    	    if flag = 0 then
			vwhere2 := vwhere2 || 'AND (';
			flag := 1;
		    end if;


	    	    if upper(trim(val1)) != 'X' and upper(trim(val2)) != 'X' then
		    -- use BETWEEN			
			vwhere2 := vwhere2 ||oper||replace(metadata_search_pattern, '$#$#VALUE$#$#', ''''||val1||'''' || ' AND ' || ''''||val2||'''')||' ';
			
		    elsif upper(trim(val1)) != 'X' and upper(trim(val2)) = 'X' then
		    -- use >= 
			    vwhere2 := vwhere2 ||oper||replace(replace(metadata_search_pattern, 'BETWEEN', '>='), '$#$#VALUE$#$#', ''''||val1||'''')||' ';			    
		    elsif upper(trim(val1)) = 'X' and upper(trim(val2)) != 'X' then
		    -- use <= 
			vwhere2 := vwhere2 ||oper||replace(replace(metadata_search_pattern, 'BETWEEN', '<='), '$#$#VALUE$#$#', ''''||val2||'''')||' ';
                    end if;

		    
		  
             
             
             ELSIF mdrec.the_level = 5 THEN
                    -- Plain Multiple <VALUE> tags translated into CSV, for numbers only
	     	    if flag = 0 then
			vwhere2 := vwhere2 || 'AND (';
			flag := 1;
	    	    end if;
	    
	    	    csv_val := '';
	    
	    	    FOR val IN  
	     	    (
	     		select unnest( xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/VALUE/text()', cast(pinput_crit_xml as xml) ) ) a
		    ) LOOP 
			
			
			csv_val := csv_val || ',' || val.a::text;
	            
	     
	           END LOOP;

	           vwhere2 := vwhere2 ||REPLACE(mdrec.search_pattern, '$#$#VALUE$#$#', substr(csv_val,2))||' ';
             
             
             
             
             
	     		    
 	      ELSIF mdrec.the_level = 6 THEN
	     	            -- Only for DATES in range -> From/To with BETWEEN
	     	            
	     	            -- extract operator
	     	    	    oper := array_to_string(xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/OPERATOR/text()', cast(pinput_crit_xml as xml)),'');
	     		    val1 := ( (xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/VALUE/text()', cast(pinput_crit_xml as xml)))[1] )::text ;
	     		    val2 := ( (xpath( '/ROWSET/ROW/'::text || mdrec.tag_name || '/VALUE/text()', cast(pinput_crit_xml as xml)))[2] )::text ;
	     		    
	     		    -- get the search pattern so you can replace it eventually
	     		    metadata_search_pattern := mdrec.search_pattern;
	     	    	    
	     	    	    if flag = 0 then
	     			vwhere2 := vwhere2 || 'AND (';
	     			flag := 1;
	     		    end if;
	     
	     
	     	    	    if upper(trim(val1)) != 'X' and upper(trim(val2)) != 'X' then
	     		    -- use BETWEEN			
	     			vwhere2 := vwhere2 ||oper||replace(metadata_search_pattern, '$#$#VALUE$#$#',  val1 || ' AND ' || val2 )||' ';
	     			
	     		    elsif upper(trim(val1)) != 'X' and upper(trim(val2)) = 'X' then
	     		    -- use >= 
	     			    vwhere2 := vwhere2 ||oper||replace(replace(metadata_search_pattern, 'BETWEEN', '>='), '$#$#VALUE$#$#',  val1 )||' ';			    
	     		    elsif upper(trim(val1)) = 'X' and upper(trim(val2)) != 'X' then
	     		    -- use <= 
	     			vwhere2 := vwhere2 ||oper||replace(replace(metadata_search_pattern, 'BETWEEN', '<='), '$#$#VALUE$#$#',  val2 )||' ';
             		    end if;
             
             
             
             
             
             
             
             
             
             
             
             END IF;
             
             
             
             
             
            
	END LOOP;
	
	
	 -- close the bracket
	IF flag = 1 THEN
		vwhere2 := vwhere2 || ') ';
        END IF;




	csv_val := '';


        FOR val IN (
		select unnest( xpath( '/ROWSET/ROW/CE_ENTRY_TYPE/VALUE/text()', cast(pinput_crit_xml as xml) ) ) a
	) LOOP 

		csv_val := csv_val || ',' || val.a::text;

	END LOOP;

	if csv_val != '' then 
		vwhere2 := vwhere2 ||' AND CE.F_ENTRY_TYPE IN ('||substr(csv_val,2)||') ';
	end if;


       -------------------------------------------------------------------------------
        -- if search within results is activated
        IF vsearch_within IS NOT NULL THEN
            vfrom := vfrom ||', SEARCH_WITHIN_TEMP T ';
            vwhere := vwhere ||' AND T.SESSION_ID = '||vsearch_within|| ' AND MD.PERMISSION_HOLDER_ID = T.ID ';
        END IF;

        
        
        -- now perform whole select
        sql_txt := vcolumns||vfrom||vwhere||vwhere2||vorder_by;
        sql_txt := sql_txt || ' limit ' || pnumber_of_rows || ' offset ' || ((ppage::integer-1)*pnumber_of_rows::integer)::text;


	-- perform count
	EXECUTE 'select count(*) ' ||vfrom||vwhere||vwhere2 into bptotal;
	

        OPEN precord_xml FOR EXECUTE sql_txt;
        
	

	ptotal := bptotal::varchar;
	pstatus := '1';
	perr_msg := '';

	RAISE NOTICE '%', sql_txt;


	--
	-- invoke function to drop temporary objects: table and sequence
	--
	EXECUTE drop_temp_objects();
	
	
	
	
	-- handle exceptions
	EXCEPTION
	WHEN OTHERS THEN
	    us := 'e_proc';
	    en := SQLSTATE;
	    em := SQLERRM;

	    ptotal := '0';
	    pstatus := en;
	    perr_msg := em;


	    EXECUTE log_error ( us, en, em, sql_txt );


	    OPEN precord_xml FOR
		SELECT CE.F_RESOURCE as F_RESOURCE, 
			MD.METADATUM_VALUE_1 as TITLE,
			initcap(MD.METADATUM_VALUE_142) as AUTHORITY,
			TO_CHAR(CE.DATE_CREATED, 'DD/MM/YYYY') as DATE_CREATED,
			CE.CREATOR as CREATOR, 
			CE.F_ENTRY_TYPE as F_ENTRY_TYPE, 
			CE.VERSION_LABEL as VERSION_LABEL, 
			CE.ABSOLUTE_PATH as ABSOLUTE_PATH, 
			CE.PARENT_FOLDER as PARENT_FOLDER, 
			CE.STATUS as STATUS
		FROM CONTENT_ENTRY CE, 
			SEARCH_METADATUM_WH MD 
		WHERE MD.F_CONTENT_ENTRY = CE.F_RESOURCE 
		AND CE.F_ENTRY_TYPE = 8
		AND 1 = 0;
    

END;
    $_$;




--
-- Name: log_error(text, text, text, text); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION log_error(_us text, _en text, _em text, _query_text text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	
       INSERT INTO x_oracle_err_log (ID, err_text, query_text, rec_date)
       VALUES (nextval('x_oracle_err_log_seq'), (_us ||' - get_content_xml - '|| _en ||'- '|| _em)::text, _query_text, now());
       
END;
    $$;




--
-- Name: metadatum_aiud_trig_metadatum(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION metadatum_aiud_trig_metadatum() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
	IF TG_OP = 'INSERT' or TG_OP = 'UPDATE' THEN
		IF NEW.F_CONTENT_ENTRY IS NOT NULL THEN
			-- for warehouse
			INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
			(ID, F_RESOURCE, ACTION)
			VALUES
			(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), NEW.F_CONTENT_ENTRY, 'INS');
		END IF;
		return new;
	ELSE
	-- always consider it as insert/update of CE, thus INS operation for CE on delete of metadatum
		IF OLD.F_CONTENT_ENTRY IS NOT NULL THEN
			-- for warehouse
			INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
			(ID, F_RESOURCE, ACTION)
			VALUES
			(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), OLD.F_CONTENT_ENTRY, 'INS');
		END IF;
		return old;
	END IF;
END;
    $$;




--
-- Name: reset_no_doc_ext_seq(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION reset_no_doc_ext_seq() RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

		execute 'ALTER SEQUENCE NO_DOC_EXT_SEQ RESTART WITH 1';
		
END;
     $$;




--
-- Name: reset_notice_email_no_seq(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION reset_notice_email_no_seq() RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN


		execute 'ALTER SEQUENCE NOTICE_EMAIL_NO_SEQ RESTART WITH 1';

END;
     $$;




--
-- Name: roles_aiud_trig_roles(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION roles_aiud_trig_roles() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

      DECLARE 
         I record;
     
      BEGIN
	IF TG_OP = 'INSERT' THEN
			IF NEW.F_GROUP IS NOT NULL THEN
				-- for warehouse
				FOR I IN 
					SELECT F_CONTENT_ENTRY
					FROM GROUPS
					WHERE ID = NEW.F_GROUP
				
				LOOP
					INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
					(ID, F_RESOURCE, ACTION)
					VALUES
					(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), I.F_CONTENT_ENTRY, 'INS');
				END LOOP;
				return new;
			END IF;

	ELSIF TG_OP = 'UPDATE' THEN
			IF NEW.F_GROUP IS NOT NULL THEN
				-- for warehouse
				FOR I IN 
					SELECT F_CONTENT_ENTRY
					FROM GROUPS
					WHERE ID IN ( NEW.F_GROUP, OLD.F_GROUP)
				
				LOOP
					INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
					(ID, F_RESOURCE, ACTION)
					VALUES
					(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), I.F_CONTENT_ENTRY, 'INS');
				END LOOP;
				return new;
			END IF;
	ELSE
	-- always consider it as insert/update of CE, thus INS operation for CE on delete of metadatum
			IF OLD.F_GROUP IS NOT NULL THEN
				-- for warehouse
				FOR I IN 
					SELECT F_CONTENT_ENTRY
					FROM GROUPS
					WHERE ID = OLD.F_GROUP
				
				LOOP
					INSERT INTO CONTENT_ENTRY_SYNC_LOG_WH
					(ID, F_RESOURCE, ACTION)
					VALUES
					(nextval('CONTENT_ENTRY_SYNC_LOG_WH_SEQ'), I.F_CONTENT_ENTRY, 'INS');
				END LOOP;
				return old;
			END IF;
	END IF;
END;    
     $$;




--
-- Name: search_metadatum_wh_trg_search_metadatum_wh(); Type: FUNCTION; Schema: public; Owner: e_proc
--

CREATE FUNCTION search_metadatum_wh_trg_search_metadatum_wh() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
	NEW.METADATUM_VALUE_11 = UPPER(NEW.METADATUM_VALUE_11);
	NEW.METADATUM_VALUE_23 = UPPER(NEW.METADATUM_VALUE_23);
	NEW.METADATUM_VALUE_31 = UPPER(NEW.METADATUM_VALUE_31);
	NEW.METADATUM_VALUE_84 = UPPER(NEW.METADATUM_VALUE_84);
	NEW.METADATUM_VALUE_85 = UPPER(NEW.METADATUM_VALUE_85);
	NEW.METADATUM_VALUE_88 = UPPER(NEW.METADATUM_VALUE_88);
	NEW.METADATUM_VALUE_89 = UPPER(NEW.METADATUM_VALUE_89);
	NEW.METADATUM_VALUE_90 = UPPER(NEW.METADATUM_VALUE_90);
	NEW.METADATUM_VALUE_93 = UPPER(NEW.METADATUM_VALUE_93);
	NEW.METADATUM_VALUE_129 = UPPER(NEW.METADATUM_VALUE_129);
	NEW.METADATUM_VALUE_130 = UPPER(NEW.METADATUM_VALUE_130);
	return new;
END;
    $$;








--
-- Name: account_aiud_trig; Type: TRIGGER; Schema: public; Owner: e_proc
--

CREATE TRIGGER account_aiud_trig
    AFTER INSERT OR DELETE OR UPDATE ON account
    FOR EACH ROW
    EXECUTE PROCEDURE account_aiud_trig_account();


--
-- Name: authorities_aiud_trig; Type: TRIGGER; Schema: public; Owner: e_proc
--

CREATE TRIGGER authorities_aiud_trig
    AFTER INSERT OR DELETE OR UPDATE ON authorities
    FOR EACH ROW
    EXECUTE PROCEDURE authorities_aiud_trig_authorities();


--
-- Name: content_entry_aiud_trig; Type: TRIGGER; Schema: public; Owner: e_proc
--

CREATE TRIGGER content_entry_aiud_trig
    AFTER INSERT OR DELETE OR UPDATE ON content_entry
    FOR EACH ROW
    EXECUTE PROCEDURE content_entry_aiud_trig_content_entry();


--
-- Name: metadatum_aiud_trig; Type: TRIGGER; Schema: public; Owner: e_proc
--

CREATE TRIGGER metadatum_aiud_trig
    AFTER INSERT OR DELETE OR UPDATE ON metadatum
    FOR EACH ROW
    EXECUTE PROCEDURE metadatum_aiud_trig_metadatum();


--
-- Name: roles_aiud_trig; Type: TRIGGER; Schema: public; Owner: e_proc
--

CREATE TRIGGER roles_aiud_trig
    AFTER INSERT OR DELETE OR UPDATE ON roles
    FOR EACH ROW
    EXECUTE PROCEDURE roles_aiud_trig_roles();


--
-- Name: search_metadatum_wh_trg; Type: TRIGGER; Schema: public; Owner: e_proc
--

CREATE TRIGGER search_metadatum_wh_trg
    BEFORE INSERT OR UPDATE ON search_metadatum_wh
    FOR EACH ROW
    EXECUTE PROCEDURE search_metadatum_wh_trg_search_metadatum_wh();




