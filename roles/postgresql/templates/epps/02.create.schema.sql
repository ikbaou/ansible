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
\o create.schema.log


----------------------------------------------------------------------------------





--
-- Name: account; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE account (
    f_principal bigint NOT NULL,
    wan_username character varying(255),
    passwd character varying(40),
    username character varying(40),
    last_login timestamp(6) without time zone,
    registration_date timestamp(6) without time zone,
    transaction_number character varying(255),
    email character varying(200) NOT NULL,
    firstname character varying(40),
    lastname character varying(40),
    f_country bigint,
    address character varying(100),
    postalcode character varying(40),
    city character varying(50),
    fax character varying(40),
    lang character varying(40),
    status character varying(255),
    grade character varying(255),
    phone character varying(50),
    site character varying(255),
    user_type character varying(50),
    f_authority bigint,
    mob_phone character varying(50),
    failed_attempts bigint DEFAULT 0,
    reset_account smallint DEFAULT 1,
    firstname_en character varying(40),
    lastname_en character varying(40),
    accepted_agreement_date timestamp(6) without time zone,
    pass_reset_num character varying(40)
) 
TABLESPACE tbs_data;



--
-- Name: account_role; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE account_role (
    f_account bigint NOT NULL,
    f_role bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: auditing_event; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE auditing_event (
    id bigint NOT NULL,
    event_type text,
    date_created timestamp(6) without time zone,
    user_ip text,
    auditing_event_level text,
    error_code text,
    error_desc text,
    audit_action text,
    prim_account text,
    sec_account text,
    prim_content_entry_name text,
    sec_content_entry_name text,
    protocol character varying(60),
    server_name character varying(60),
    specific_desc text,
    success smallint,
    group_id bigint,
    prim_content_entry_id bigint
)
TABLESPACE tbs_data;



--
-- Name: auditing_event_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE auditing_event_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: authorities; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE authorities (
    id bigint NOT NULL,
    name_auth text NOT NULL,
    identity character varying(100),
    identity_issuer character varying(100),
    address character varying(100),
    postalcode character varying(40),
    city character varying(50),
    f_country bigint NOT NULL,
    email character varying(200),
    phone character varying(50),
    fax character varying(40),
    type_auth character varying(40),
    site character varying(255),
    status character varying(255),
    reg_notes text,
    attachment bytea,
    reg_date timestamp(6) without time zone,
    short_name character varying(200),
    f_groups bigint,
    fimas_id text,
    registration_number character varying(100),
    employer_register_number character varying(100),
    taxation_id character varying(100),
    company_activities text,
    f_ca_common bigint,
    name_en text,
    address_en character varying(100),
    city_en character varying(50),
    f_country_issuer bigint,
    attachment_filename text,
    attachment_filetype text,
    f_authority_annex bigint,
    ind_ref_number character varying(40)
)
TABLESPACE tbs_data;



--
-- Name: authorities_cpv_code; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE authorities_cpv_code (
    f_authorities bigint NOT NULL,
    f_cpv_code integer NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: authorities_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE authorities_seq
    START WITH 1004
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: authority_annex; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE authority_annex (
    id bigint NOT NULL,
    resource_key character varying(50) NOT NULL,
    annex_name character varying(64)
)
TABLESPACE tbs_data;



--
-- Name: authority_associations; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE authority_associations (
    f_groups bigint,
    f_authorities bigint,
    status smallint DEFAULT 1 NOT NULL,
    id bigint NOT NULL,
    CONSTRAINT chk_authority_associat_status CHECK (((status)::numeric = ANY (ARRAY[(0)::numeric, (1)::numeric])))
)
TABLESPACE tbs_data;



--
-- Name: authority_associations_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE authority_associations_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: bid_receipt_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE bid_receipt_seq
    START WITH 15
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: binval_content; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE binval_content (
    f_content_entry bigint NOT NULL,
    version_label text NOT NULL,
    binval_data bytea
)
TABLESPACE tbs_data;



--
-- Name: ca_common; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE ca_common (
    id bigint NOT NULL,
    resource_key character varying(50) NOT NULL,
    f_ca_type bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: ca_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE ca_type (
    id bigint NOT NULL,
    resource_key character varying(50) NOT NULL,
    sort_order numeric(6,0)
)
TABLESPACE tbs_data;



--
-- Name: cft_archive_data; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE cft_archive_data (
    id bigint NOT NULL,
    f_content_entry bigint,
    binval_data bytea,
    part_index integer
)
TABLESPACE tbs_data;



--
-- Name: cft_archive_data_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE cft_archive_data_seq
    START WITH 1002
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: cft_phases; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE cft_phases (
    id bigint NOT NULL,
    resource_key character varying(150) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: content_entry; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE content_entry (
    f_resource bigint NOT NULL,
    absolute_path character varying(255),
    workspace character varying(255),
    lock_holder bigint,
    creator bigint,
    lock_token character varying(255),
    status character varying(255),
    parent_folder bigint,
    date_created timestamp(6) without time zone,
    date_last_modified timestamp(6) without time zone,
    f_entry_type bigint,
    version_label character varying(255),
    uuid character varying(765),
    previous_version character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: content_entry_data; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE content_entry_data (
    id bigint NOT NULL,
    data bytea
)
TABLESPACE tbs_data;


--
-- Name: content_entry_data_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE content_entry_data_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: content_entry_sync_log_wh; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE content_entry_sync_log_wh (
    id numeric NOT NULL,
    f_resource numeric,
    action character varying(20) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: content_entry_sync_log_wh_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE content_entry_sync_log_wh_seq
    START WITH 18660
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 20
    CYCLE;



--
-- Name: contract_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE contract_type (
    id bigint NOT NULL,
    resource_key character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: country; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE country (
    id bigint NOT NULL,
    iso_code character varying(2),
    resource_key character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: country_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE country_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: cpc_category; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE cpc_category (
    id bigint NOT NULL,
    resource_key character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: cpv_code; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE cpv_code (
    id integer NOT NULL,
    xmlname character varying(255),
    children integer,
    parent_id character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: cpv_language; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE cpv_language (
    id integer NOT NULL,
    lang_name character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: cpv_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE cpv_type (
    id integer NOT NULL,
    name_cpv_type text,
    f_cpv_code integer,
    f_cpv_language integer
)
TABLESPACE tbs_data;



--
-- Name: db_versions; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE db_versions (
    dbversion character varying(6) NOT NULL,
    record_date timestamp without time zone NOT NULL,
    author character varying(20) NOT NULL,
    reason character varying(200),
    type character varying(50) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: dependant_roles; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE dependant_roles (
    f_role_source bigint NOT NULL,
    f_role_target bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: distr_list; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE distr_list (
    id bigint NOT NULL,
    name_distr_list character varying(255),
    description character varying(255),
    f_account bigint
)
TABLESPACE tbs_data;



--
-- Name: distr_list_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE distr_list_seq
    START WITH 1030
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: distr_list_username; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE distr_list_username (
    id bigint NOT NULL,
    f_distr_list bigint,
    username text,
    is_active boolean
)
TABLESPACE tbs_data;



--
-- Name: distr_list_username_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE distr_list_username_seq
    START WITH 1036
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: dual; Type: VIEW; Schema: public; Owner: e_proc
--

CREATE VIEW dual AS
    SELECT 1;



--
-- Name: eauction_room_events; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE eauction_room_events (
    id bigint NOT NULL,
    account bigint NOT NULL,
    eauction bigint,
    date_created timestamp(6) without time zone NOT NULL,
    auction_event_type character varying(255) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: eauction_room_events_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE eauction_room_events_seq
    START WITH 1007
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: email_distribution_list; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE email_distribution_list (
    f_distr_list bigint NOT NULL,
    f_email_notification bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: email_notification; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE email_notification (
    id bigint NOT NULL,
    classification_level text,
    notification_status text,
    notification_type text,
    recipients text,
    f_content_entry bigint,
    f_account bigint,
    alert_start_type text
)
TABLESPACE tbs_data;



--
-- Name: email_notification_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE email_notification_seq
    START WITH 1086
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: entry_event; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE entry_event (
    id bigint NOT NULL,
    f_account bigint NOT NULL,
    f_content_entry bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: entry_event_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE entry_event_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: entry_meta_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE entry_meta_type (
    f_meta_type bigint NOT NULL,
    f_entry_type bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: entry_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE entry_type (
    id bigint NOT NULL,
    entry_type_key character varying(255),
    jcr_label character varying(255),
    parent_type bigint
)
TABLESPACE tbs_data;



--
-- Name: entry_type_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE entry_type_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: eo_awarding; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE eo_awarding (
    id bigint NOT NULL,
    cft_id bigint NOT NULL,
    eo_id bigint NOT NULL,
    lots character varying(255),
    cpv_code character varying(255),
    contract_value numeric,
    is_accepted numeric DEFAULT 0,
    reply_reason text
)
TABLESPACE tbs_data;



--
-- Name: COLUMN eo_awarding.is_accepted; Type: COMMENT; Schema: public; Owner: e_proc
--

COMMENT ON COLUMN eo_awarding.is_accepted IS '0=normal, 1 = accepted , -1 = rejected -2 = to be reawarded';


--
-- Name: eo_awarding_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE eo_awarding_seq
    START WITH 1002
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: eo_ranking; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE eo_ranking (
    id bigint NOT NULL,
    cft_id bigint NOT NULL,
    cycle_number integer NOT NULL,
    lot_number integer,
    eo_id bigint NOT NULL,
    price numeric,
    overall_score numeric,
    rank numeric,
    status character varying(50),
    tender_recipt_id character varying(255),
    technical_score numeric,
    financial_score numeric,
    qualified boolean,
    selected boolean
)
TABLESPACE tbs_data;



--
-- Name: eo_ranking_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE eo_ranking_seq
    START WITH 1070
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: event_trigger; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE event_trigger (
    id bigint NOT NULL,
    f_event_type bigint,
    condition text,
    f_task_type bigint,
    f_template_operation bigint,
    f_template_role bigint,
    modifier smallint,
    custom_role_group text,
    trigger_type character varying(250),
    cft_status text,
    new_event_type bigint,
    custom_operation_group text
)
TABLESPACE tbs_data;



--
-- Name: event_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE event_type (
    id bigint NOT NULL,
    name character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: groups; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE groups (
    id bigint NOT NULL,
    name character varying(2000),
    description text,
    f_template_groups bigint,
    f_content_entry bigint,
    sort_key numeric(30,0)
)
TABLESPACE tbs_data;



--
-- Name: groups_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE groups_seq
    START WITH 1042
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: hash_receipt_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE hash_receipt_seq
    START WITH 34
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: hilosequences; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE hilosequences (
    sequencename character varying(50) NOT NULL,
    highvalues numeric NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: jbm_counter; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_counter (
    name character varying(255) NOT NULL,
    next_id numeric
)
TABLESPACE tbs_data;



--
-- Name: jbm_dual; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_dual (
    dummy numeric NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: jbm_id_cache; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_id_cache (
    node_id numeric NOT NULL,
    cntr numeric NOT NULL,
    jbm_id character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: jbm_msg; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_msg (
    message_id numeric NOT NULL,
    reliable character(1),
    expiration numeric,
    "timestamp" numeric,
    priority numeric,
    type numeric,
    headers bytea,
    payload bytea
)
TABLESPACE tbs_data;



--
-- Name: jbm_msg_ref; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_msg_ref (
    message_id numeric NOT NULL,
    channel_id numeric NOT NULL,
    transaction_id numeric,
    state character(1),
    ord numeric,
    page_ord numeric,
    delivery_count numeric,
    sched_delivery numeric
)
TABLESPACE tbs_data;



--
-- Name: jbm_postoffice; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_postoffice (
    postoffice_name character varying(255) NOT NULL,
    node_id numeric NOT NULL,
    queue_name character varying(255) NOT NULL,
    cond text,
    selector text,
    channel_id numeric,
    clustered character(1),
    all_nodes character(1)
)
TABLESPACE tbs_data;



--
-- Name: jbm_role; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_role (
    role_id character varying(32) NOT NULL,
    user_id character varying(32) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: jbm_tx; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_tx (
    node_id numeric,
    transaction_id numeric NOT NULL,
    branch_qual bytea,
    format_id numeric,
    global_txid bytea
)
TABLESPACE tbs_data;



--
-- Name: jbm_user; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE jbm_user (
    user_id character varying(32) NOT NULL,
    passwd character varying(32) NOT NULL,
    clientid character varying(128)
)
TABLESPACE tbs_data;



--
-- Name: languages; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE languages (
    iso_code character varying(2) NOT NULL,
    resource_key character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: last_visit_updates; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE last_visit_updates (
    f_account bigint NOT NULL,
    f_content_entry bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: meta_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE meta_type (
    id bigint NOT NULL,
    meta_type_key character varying(255),
    data_type character varying(255),
    jcr_label character varying(255),
    is_multiple integer,
    is_searchable smallint DEFAULT 0 NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: meta_type_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE meta_type_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: metadatum; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE metadatum (
    id bigint NOT NULL,
    metadatum_value text,
    f_data bigint,
    f_content_entry bigint,
    f_meta_type bigint,
    metadatum_index integer
)
TABLESPACE tbs_data;



--
-- Name: metadatum_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE metadatum_seq
    START WITH 6957
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: no_doc_ext_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE no_doc_ext_seq
    START WITH 35
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: notice_email_no_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE notice_email_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: nuts_code; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE nuts_code (
    id integer NOT NULL,
    xmlname character varying(255),
    children integer,
    parent_id character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: nuts_language; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE nuts_language (
    id integer NOT NULL,
    lang_name character varying(255)
)
TABLESPACE tbs_data;




--
-- Name: nuts_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE nuts_type (
    id integer NOT NULL,
    name_nuts_type character varying(255),
    f_nuts_code integer,
    f_nuts_language integer
)
TABLESPACE tbs_data;



--
-- Name: operation; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE operation (
    f_resource bigint NOT NULL,
    f_template_operation bigint,
    f_group bigint
)
TABLESPACE tbs_data;



--
-- Name: principal; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE principal (
    id bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: principal_permission_res_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE principal_permission_res_seq
    START WITH 5535
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: principal_permission_resource; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE principal_permission_resource (
    id bigint NOT NULL,
    permission bigint,
    f_resource bigint,
    f_principal bigint
)
TABLESPACE tbs_data;



--
-- Name: principal_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE principal_seq
    START WITH 1220
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: procedure_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE procedure_type (
    id bigint NOT NULL,
    resource_key character varying(255),
    has_notice integer,
    allow_fa integer
)
TABLESPACE tbs_data;



--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_blob_triggers (
    trigger_name character varying(80) NOT NULL,
    trigger_group character varying(80) NOT NULL,
    blob_data bytea
)
TABLESPACE tbs_data;



--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_calendars (
    calendar_name character varying(80) NOT NULL,
    calendar bytea NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_cron_triggers (
    trigger_name character varying(80) NOT NULL,
    trigger_group character varying(80) NOT NULL,
    cron_expression character varying(80) NOT NULL,
    time_zone_id character varying(80)
)
TABLESPACE tbs_data;




--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_fired_triggers (
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(80) NOT NULL,
    trigger_group character varying(80) NOT NULL,
    instance_name character varying(80) NOT NULL,
    fired_time numeric(13,0) NOT NULL,
    priority numeric(13,0),
    state character varying(16) NOT NULL,
    job_name character varying(80),
    job_group character varying(80),
    is_stateful boolean NOT NULL,
    requests_recovery boolean,
    is_volatile boolean NOT NULL
)
TABLESPACE tbs_data;




--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_job_details (
    job_name character varying(80) NOT NULL,
    job_group character varying(80) NOT NULL,
    description character varying(120),
    job_class_name character varying(128) NOT NULL,
    job_data bytea,
    is_durable boolean NOT NULL,
    is_volatile boolean NOT NULL,
    is_stateful boolean NOT NULL,
    requests_recovery boolean NOT NULL
)
TABLESPACE tbs_data;




--
-- Name: qrtz_job_listeners; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_job_listeners (
    job_name character varying(80) NOT NULL,
    job_group character varying(80) NOT NULL,
    job_listener character varying(80) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_locks (
    lock_name character varying(40) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_paused_trigger_grps (
    trigger_group character varying(80) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_scheduler_state (
    instance_name character varying(80) NOT NULL,
    last_checkin_time numeric(13,0) NOT NULL,
    checkin_interval numeric(13,0) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_simple_triggers (
    trigger_name character varying(80) NOT NULL,
    trigger_group character varying(80) NOT NULL,
    repeat_count numeric(7,0) NOT NULL,
    repeat_interval numeric(12,0) NOT NULL,
    times_triggered numeric(7,0) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: qrtz_trigger_listeners; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_trigger_listeners (
    trigger_name character varying(80) NOT NULL,
    trigger_group character varying(80) NOT NULL,
    trigger_listener character varying(80) NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE qrtz_triggers (
    trigger_name character varying(80) NOT NULL,
    trigger_group character varying(80) NOT NULL,
    job_name character varying(80) NOT NULL,
    job_group character varying(80) NOT NULL,
    description character varying(120),
    next_fire_time numeric(13,0),
    prev_fire_time numeric(13,0),
    priority numeric(13,0),
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time numeric(13,0) NOT NULL,
    end_time numeric(13,0),
    calendar_name character varying(80),
    misfire_instr numeric(2,0),
    job_data bytea,
    is_volatile boolean NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: resource_semantic; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE resource_semantic (
    id bigint NOT NULL,
    name character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: resource_semantic_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE resource_semantic_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: resources; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE resources (
    id bigint NOT NULL,
    f_resource_semantic bigint
)
TABLESPACE tbs_data;



--
-- Name: resources_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE resources_seq
    START WITH 3060
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: roles; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE roles (
    f_principal bigint NOT NULL,
    f_template_role bigint,
    f_group bigint
)
TABLESPACE tbs_data;


--
-- Name: search_metadata; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE search_metadata (
    id bigint NOT NULL,
    search_type text NOT NULL,
    tag_name text NOT NULL,
    the_level smallint NOT NULL,
    search_pattern text NOT NULL,
    in_out_flag character varying(18) NOT NULL,
    value_format text
)
TABLESPACE tbs_data;



--
-- Name: search_metadata_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE search_metadata_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: search_metadatum_wh; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE search_metadatum_wh (
    f_content_entry bigint NOT NULL,
    permission_holder_id bigint,
    metadatum_value_1 text,
    metadatum_value_11 text,
    metadatum_value_23 text,
    metadatum_value_31 text,
    metadatum_value_84 text,
    metadatum_value_85 text,
    metadatum_value_88 text,
    metadatum_value_89 text,
    metadatum_value_90 text,
    metadatum_value_93 text,
    metadatum_value_129 text,
    metadatum_value_130 text,
    metadatum_value_142 text,
    CONSTRAINT "chk_cons_md_wd$md_value_90" CHECK (((COALESCE(metadatum_value_90, ('1'::character varying)::text))::numeric <> (-777.7777)))
)
TABLESPACE tbs_data;



--
-- Name: search_synonyms_xml; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE search_synonyms_xml (
    id bigint NOT NULL,
    file_name character varying(96),
    xml_content text
)
TABLESPACE tbs_data;



--
-- Name: search_synonyms_xml_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE search_synonyms_xml_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: search_temp_content_entry; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE search_temp_content_entry (
    row_number bigint,
    h_level bigint,
    f_resource bigint,
    creator bigint,
    f_entry_type bigint,
    date_created timestamp(6) without time zone,
    date_last_modified timestamp(6) without time zone,
    version_label text,
    absolute_path text,
    parent_folder numeric(19,0),
    status character varying(150),
    lock_token text,
    workspace text,
    lock_holder bigint,
    uuid text
)
TABLESPACE tbs_data;



--
-- Name: search_within_temp; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE search_within_temp (
    session_id bigint NOT NULL,
    id numeric NOT NULL,
    row_number numeric,
    txt text,
    rec_date timestamp(6) without time zone DEFAULT (clock_timestamp())::timestamp(0) without time zone
)
TABLESPACE tbs_data;



--
-- Name: search_within_temp_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE search_within_temp_seq
    START WITH 781
    INCREMENT BY 1
    MAXVALUE 9999999999
    NO MINVALUE
    CACHE 20
    CYCLE;



--
-- Name: service; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE service (
    id bigint NOT NULL,
    f_template_service bigint,
    f_groups bigint
)
TABLESPACE tbs_data;


--
-- Name: service_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE service_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: task_completed; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE task_completed (
    f_task_list bigint NOT NULL,
    f_account bigint NOT NULL
)
TABLESPACE tbs_data;




--
-- Name: task_list; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE task_list (
    id bigint NOT NULL,
    f_task_type bigint NOT NULL,
    f_role bigint NOT NULL,
    date_opened timestamp(6) without time zone NOT NULL,
    f_cft bigint NOT NULL,
    deadline timestamp(6) without time zone,
    f_auction bigint
)
TABLESPACE tbs_data;



--
-- Name: task_list_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE task_list_seq
    START WITH 1306
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: task_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE task_type (
    id bigint NOT NULL,
    description text,
    url text,
    requires_all smallint
)
TABLESPACE tbs_data;



--
-- Name: temp_user_rights; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE temp_user_rights (
    f_resource numeric
)
TABLESPACE tbs_data;



--
-- Name: template_group; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE template_group (
    id bigint NOT NULL,
    name character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: template_group_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE template_group_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: template_operation; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE template_operation (
    id bigint NOT NULL,
    name_tpl_op character varying(100),
    entry_permission_req integer,
    f_template_service bigint,
    operation_set text,
    operation_order numeric
)
TABLESPACE tbs_data;



--
-- Name: template_operation_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE template_operation_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: template_role; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE template_role (
    id bigint NOT NULL,
    name_tpl_role character varying(40)
)
TABLESPACE tbs_data;



--
-- Name: template_role_group; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE template_role_group (
    f_template_group bigint NOT NULL,
    f_template_role bigint NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: template_role_operation; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE template_role_operation (
    id bigint NOT NULL,
    f_template_role bigint,
    f_template_operation bigint,
    f_template_group bigint
)
TABLESPACE tbs_data;



--
-- Name: template_role_operation_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE template_role_operation_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;



--
-- Name: template_role_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE template_role_seq
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 1000
    CACHE 1;


--
-- Name: template_service; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE template_service (
    id bigint NOT NULL,
    resource_key text,
    has_content smallint,
    preselected smallint,
    is_customizable smallint
)
TABLESPACE tbs_data;



--
-- Name: template_service_group; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE template_service_group (
    id bigint NOT NULL,
    f_template_service bigint,
    f_template_group bigint
)
TABLESPACE tbs_data;



--
-- Name: template_service_group_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE template_service_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: template_service_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE template_service_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: tender_receipt_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE tender_receipt_seq
    START WITH 31
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: timers; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE timers (
    timerid character varying(80) NOT NULL,
    targetid character varying(250) NOT NULL,
    initialdate timestamp(6) without time zone NOT NULL,
    timerinterval bigint,
    instancepk bytea,
    info bytea
)
TABLESPACE tbs_data;



--
-- Name: users; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE users (
    f_account bigint NOT NULL,
    f_authority bigint
)
TABLESPACE tbs_data;



--
-- Name: version_content_entry; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE version_content_entry (
    id bigint NOT NULL,
    date_created timestamp(6) without time zone DEFAULT (clock_timestamp())::timestamp(0) without time zone NOT NULL,
    date_last_modified timestamp(6) without time zone DEFAULT (clock_timestamp())::timestamp(0) without time zone NOT NULL,
    version_label character varying(300) NOT NULL,
    previous_version bigint,
    content_entry_id bigint NOT NULL,
    binval_data bytea
)
TABLESPACE tbs_data;



--
-- Name: version_content_entry_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE version_content_entry_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: version_meta_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE version_meta_type (
    id bigint NOT NULL,
    meta_type_key text NOT NULL,
    data_type text NOT NULL,
    jcr_label text,
    is_multiple smallint DEFAULT 0 NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: version_meta_type_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE version_meta_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



--
-- Name: version_metadatum; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE version_metadatum (
    id bigint NOT NULL,
    f_v_meta_type bigint NOT NULL,
    f_v_content_entry bigint,
    metadatum_index smallint,
    metadatum_value text NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: version_metadatum_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE version_metadatum_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: voc_code; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE voc_code (
    id integer NOT NULL,
    xmlname character varying(255),
    children integer,
    parent_id character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: voc_language; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE voc_language (
    id integer NOT NULL,
    lang_name character varying(255)
)
TABLESPACE tbs_data;



--
-- Name: voc_type; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE voc_type (
    id integer NOT NULL,
    name_voc_type character varying(255),
    f_voc_code integer,
    f_voc_language integer
)
TABLESPACE tbs_data;



--
-- Name: workflow_steps; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE workflow_steps (
    id bigint NOT NULL,
    resource_key character varying(150) NOT NULL,
    f_cft_phase bigint NOT NULL,
    availability numeric NOT NULL
)
TABLESPACE tbs_data;



--
-- Name: x_oracle_err_log; Type: TABLE; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE TABLE x_oracle_err_log (
    id bigint NOT NULL,
    err_text text,
    query_text text,
    rec_date timestamp without time zone
)
TABLESPACE tbs_data;



--
-- Name: x_oracle_err_log_seq; Type: SEQUENCE; Schema: public; Owner: e_proc
--

CREATE SEQUENCE x_oracle_err_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;



























--
-- Name: hilo_pk; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY hilosequences
    ADD CONSTRAINT hilo_pk PRIMARY KEY (sequencename);


--
-- Name: pk_account; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT pk_account PRIMARY KEY (f_principal);


--
-- Name: pk_account_role; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY account_role
    ADD CONSTRAINT pk_account_role PRIMARY KEY (f_role, f_account);


--
-- Name: pk_auditing_event; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY auditing_event
    ADD CONSTRAINT pk_auditing_event PRIMARY KEY (id);


--
-- Name: pk_authorities; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT pk_authorities PRIMARY KEY (id);


--
-- Name: pk_authorities_cpv_code; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY authorities_cpv_code
    ADD CONSTRAINT pk_authorities_cpv_code PRIMARY KEY (f_authorities, f_cpv_code);


--
-- Name: pk_authority_annex; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY authority_annex
    ADD CONSTRAINT pk_authority_annex PRIMARY KEY (id);


--
-- Name: pk_authority_associations; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY authority_associations
    ADD CONSTRAINT pk_authority_associations PRIMARY KEY (id);


--
-- Name: pk_binval_content; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY binval_content
    ADD CONSTRAINT pk_binval_content PRIMARY KEY (f_content_entry);


--
-- Name: pk_ca_common; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY ca_common
    ADD CONSTRAINT pk_ca_common PRIMARY KEY (id);


--
-- Name: pk_ca_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY ca_type
    ADD CONSTRAINT pk_ca_type PRIMARY KEY (id);


--
-- Name: pk_cft_archive_data; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY cft_archive_data
    ADD CONSTRAINT pk_cft_archive_data PRIMARY KEY (id);


--
-- Name: pk_cft_phases; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY cft_phases
    ADD CONSTRAINT pk_cft_phases PRIMARY KEY (id);


--
-- Name: pk_content_entry; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY content_entry
    ADD CONSTRAINT pk_content_entry PRIMARY KEY (f_resource);


--
-- Name: pk_content_entry_data; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY content_entry_data
    ADD CONSTRAINT pk_content_entry_data PRIMARY KEY (id);


--
-- Name: pk_content_entry_sync_log_wh; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY content_entry_sync_log_wh
    ADD CONSTRAINT pk_content_entry_sync_log_wh PRIMARY KEY (id);


--
-- Name: pk_contract_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY contract_type
    ADD CONSTRAINT pk_contract_type PRIMARY KEY (id);


--
-- Name: pk_country; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT pk_country PRIMARY KEY (id);


--
-- Name: pk_cpc_category; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY cpc_category
    ADD CONSTRAINT pk_cpc_category PRIMARY KEY (id);


--
-- Name: pk_cpv_code; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY cpv_code
    ADD CONSTRAINT pk_cpv_code PRIMARY KEY (id);


--
-- Name: pk_cpv_language; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY cpv_language
    ADD CONSTRAINT pk_cpv_language PRIMARY KEY (id);


--
-- Name: pk_cpv_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY cpv_type
    ADD CONSTRAINT pk_cpv_type PRIMARY KEY (id);


--
-- Name: pk_db_versions; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY db_versions
    ADD CONSTRAINT pk_db_versions PRIMARY KEY (dbversion);


--
-- Name: pk_dependant_roles; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY dependant_roles
    ADD CONSTRAINT pk_dependant_roles PRIMARY KEY (f_role_source, f_role_target);


--
-- Name: pk_distr_list; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY distr_list
    ADD CONSTRAINT pk_distr_list PRIMARY KEY (id);


--
-- Name: pk_distr_list_username; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY distr_list_username
    ADD CONSTRAINT pk_distr_list_username PRIMARY KEY (id);


--
-- Name: pk_eauction_room_events; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY eauction_room_events
    ADD CONSTRAINT pk_eauction_room_events PRIMARY KEY (id);


--
-- Name: pk_email_distribution_list; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY email_distribution_list
    ADD CONSTRAINT pk_email_distribution_list PRIMARY KEY (f_distr_list, f_email_notification);


--
-- Name: pk_email_notification; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY email_notification
    ADD CONSTRAINT pk_email_notification PRIMARY KEY (id);


--
-- Name: pk_entry_event; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY entry_event
    ADD CONSTRAINT pk_entry_event PRIMARY KEY (id);


--
-- Name: pk_entry_meta_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY entry_meta_type
    ADD CONSTRAINT pk_entry_meta_type PRIMARY KEY (f_entry_type, f_meta_type);


--
-- Name: pk_entry_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY entry_type
    ADD CONSTRAINT pk_entry_type PRIMARY KEY (id);


--
-- Name: pk_eo_awarding; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY eo_awarding
    ADD CONSTRAINT pk_eo_awarding PRIMARY KEY (id);


--
-- Name: pk_eo_ranking; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY eo_ranking
    ADD CONSTRAINT pk_eo_ranking PRIMARY KEY (id);


--
-- Name: pk_event_trigger; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY event_trigger
    ADD CONSTRAINT pk_event_trigger PRIMARY KEY (id);


--
-- Name: pk_event_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY event_type
    ADD CONSTRAINT pk_event_type PRIMARY KEY (id);


--
-- Name: pk_groups; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT pk_groups PRIMARY KEY (id);


--
-- Name: pk_language; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT pk_language PRIMARY KEY (iso_code);


--
-- Name: pk_last_visit_updates; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY last_visit_updates
    ADD CONSTRAINT pk_last_visit_updates PRIMARY KEY (f_account, f_content_entry);


--
-- Name: pk_meta_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY meta_type
    ADD CONSTRAINT pk_meta_type PRIMARY KEY (id);


--
-- Name: pk_metadatum; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY metadatum
    ADD CONSTRAINT pk_metadatum PRIMARY KEY (id);


--
-- Name: pk_nuts_code; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY nuts_code
    ADD CONSTRAINT pk_nuts_code PRIMARY KEY (id);


--
-- Name: pk_nuts_language; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY nuts_language
    ADD CONSTRAINT pk_nuts_language PRIMARY KEY (id);


--
-- Name: pk_nuts_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY nuts_type
    ADD CONSTRAINT pk_nuts_type PRIMARY KEY (id);


--
-- Name: pk_operation; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT pk_operation PRIMARY KEY (f_resource);


--
-- Name: pk_princ_permission_resource; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY principal_permission_resource
    ADD CONSTRAINT pk_princ_permission_resource PRIMARY KEY (id);


--
-- Name: pk_principal; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY principal
    ADD CONSTRAINT pk_principal PRIMARY KEY (id);


--
-- Name: pk_procedure_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY procedure_type
    ADD CONSTRAINT pk_procedure_type PRIMARY KEY (id);


--
-- Name: pk_qrtz_blob_triggers; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_blob_triggers
    ADD CONSTRAINT pk_qrtz_blob_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: pk_qrtz_calendars; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_calendars
    ADD CONSTRAINT pk_qrtz_calendars PRIMARY KEY (calendar_name);


--
-- Name: pk_qrtz_cron_triggers; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_cron_triggers
    ADD CONSTRAINT pk_qrtz_cron_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: pk_qrtz_fired_triggers; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_fired_triggers
    ADD CONSTRAINT pk_qrtz_fired_triggers PRIMARY KEY (entry_id);


--
-- Name: pk_qrtz_job_details; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_job_details
    ADD CONSTRAINT pk_qrtz_job_details PRIMARY KEY (job_name, job_group);


--
-- Name: pk_qrtz_job_listeners; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_job_listeners
    ADD CONSTRAINT pk_qrtz_job_listeners PRIMARY KEY (job_name, job_group, job_listener);


--
-- Name: pk_qrtz_locks; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_locks
    ADD CONSTRAINT pk_qrtz_locks PRIMARY KEY (lock_name);


--
-- Name: pk_qrtz_paused_trigger_grps; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_paused_trigger_grps
    ADD CONSTRAINT pk_qrtz_paused_trigger_grps PRIMARY KEY (trigger_group);


--
-- Name: pk_qrtz_scheduler_state; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_scheduler_state
    ADD CONSTRAINT pk_qrtz_scheduler_state PRIMARY KEY (instance_name);


--
-- Name: pk_qrtz_simple_triggers; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_simple_triggers
    ADD CONSTRAINT pk_qrtz_simple_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: pk_qrtz_trigger_listeners; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_trigger_listeners
    ADD CONSTRAINT pk_qrtz_trigger_listeners PRIMARY KEY (trigger_name, trigger_group, trigger_listener);


--
-- Name: pk_qrtz_triggers; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY qrtz_triggers
    ADD CONSTRAINT pk_qrtz_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: pk_resource_semantic; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY resource_semantic	
    ADD CONSTRAINT pk_resource_semantic PRIMARY KEY (id);


--
-- Name: pk_resources; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT pk_resources PRIMARY KEY (id);


--
-- Name: pk_roles; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (f_principal);


--
-- Name: pk_search_metadata; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY search_metadata
    ADD CONSTRAINT pk_search_metadata PRIMARY KEY (id);


--
-- Name: pk_search_metadatum_wh; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY search_metadatum_wh
    ADD CONSTRAINT pk_search_metadatum_wh PRIMARY KEY (f_content_entry);


--
-- Name: pk_search_synonyms_xml; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY search_synonyms_xml
    ADD CONSTRAINT pk_search_synonyms_xml PRIMARY KEY (id);


--
-- Name: pk_search_within_temp; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY search_within_temp
    ADD CONSTRAINT pk_search_within_temp PRIMARY KEY (session_id, id);


--
-- Name: pk_service; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT pk_service PRIMARY KEY (id);


--
-- Name: pk_task_completed; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY task_completed
    ADD CONSTRAINT pk_task_completed PRIMARY KEY (f_task_list, f_account);


--
-- Name: pk_task_list; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY task_list
    ADD CONSTRAINT pk_task_list PRIMARY KEY (id);


--
-- Name: pk_task_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY task_type
    ADD CONSTRAINT pk_task_type PRIMARY KEY (id);


--
-- Name: pk_template_group; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY template_group
    ADD CONSTRAINT pk_template_group PRIMARY KEY (id);


--
-- Name: pk_template_operation; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY template_operation
    ADD CONSTRAINT pk_template_operation PRIMARY KEY (id);


--
-- Name: pk_template_role; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY template_role
    ADD CONSTRAINT pk_template_role PRIMARY KEY (id);


--
-- Name: pk_template_role_group; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY template_role_group
    ADD CONSTRAINT pk_template_role_group PRIMARY KEY (f_template_role, f_template_group);


--
-- Name: pk_template_role_operation; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY template_role_operation
    ADD CONSTRAINT pk_template_role_operation PRIMARY KEY (id);


--
-- Name: pk_template_service; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY template_service
    ADD CONSTRAINT pk_template_service PRIMARY KEY (id);


--
-- Name: pk_template_service_group; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY template_service_group
    ADD CONSTRAINT pk_template_service_group PRIMARY KEY (id);


--
-- Name: pk_users; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_users PRIMARY KEY (f_account);


--
-- Name: pk_version_content_entry; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY version_content_entry
    ADD CONSTRAINT pk_version_content_entry PRIMARY KEY (id);


--
-- Name: pk_version_meta_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY version_meta_type
    ADD CONSTRAINT pk_version_meta_type PRIMARY KEY (id);


--
-- Name: pk_version_metadatum; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY version_metadatum
    ADD CONSTRAINT pk_version_metadatum PRIMARY KEY (id);


--
-- Name: pk_voc_code; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY voc_code
    ADD CONSTRAINT pk_voc_code PRIMARY KEY (id);


--
-- Name: pk_voc_language; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY voc_language
    ADD CONSTRAINT pk_voc_language PRIMARY KEY (id);


--
-- Name: pk_voc_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY voc_type
    ADD CONSTRAINT pk_voc_type PRIMARY KEY (id);


--
-- Name: pk_workflow_steps; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY workflow_steps
    ADD CONSTRAINT pk_workflow_steps PRIMARY KEY (id);


--
-- Name: pk_x_oracle_err_log; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY x_oracle_err_log
    ADD CONSTRAINT pk_x_oracle_err_log PRIMARY KEY (id);


--
-- Name: sys_c0035999; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_dual
    ADD CONSTRAINT sys_c0035999 PRIMARY KEY (dummy);


--
-- Name: sys_c0036089; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_msg_ref
    ADD CONSTRAINT sys_c0036089 PRIMARY KEY (message_id, channel_id);


--
-- Name: sys_c0036090; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_msg
    ADD CONSTRAINT sys_c0036090 PRIMARY KEY (message_id);


--
-- Name: sys_c0036091; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_tx
    ADD CONSTRAINT sys_c0036091 PRIMARY KEY (transaction_id);


--
-- Name: sys_c0036092; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_counter
    ADD CONSTRAINT sys_c0036092 PRIMARY KEY (name);


--
-- Name: sys_c0036093; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_id_cache
    ADD CONSTRAINT sys_c0036093 PRIMARY KEY (node_id, cntr);


--
-- Name: sys_c0036096; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_user
    ADD CONSTRAINT sys_c0036096 PRIMARY KEY (user_id);


--
-- Name: sys_c0036099; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_role
    ADD CONSTRAINT sys_c0036099 PRIMARY KEY (user_id, role_id);


--
-- Name: sys_c0036100; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY jbm_postoffice
    ADD CONSTRAINT sys_c0036100 PRIMARY KEY (postoffice_name, node_id, queue_name);


--
-- Name: timers_pk; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY timers
    ADD CONSTRAINT timers_pk PRIMARY KEY (timerid, targetid);


--
-- Name: uk_account; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT uk_account UNIQUE (username, user_type);


--
-- Name: uk_authority_annex_res_key; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY authority_annex
    ADD CONSTRAINT uk_authority_annex_res_key UNIQUE (resource_key);


--
-- Name: uk_authority_associations; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY authority_associations
    ADD CONSTRAINT uk_authority_associations UNIQUE (f_groups, f_authorities);


--
-- Name: uk_cpv_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY cpv_type
    ADD CONSTRAINT uk_cpv_type UNIQUE (f_cpv_code, f_cpv_language);


--
-- Name: uk_distr_list_username; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY distr_list_username
    ADD CONSTRAINT uk_distr_list_username UNIQUE (username, f_distr_list);


--
-- Name: uk_search_metadata; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY search_metadata
    ADD CONSTRAINT uk_search_metadata UNIQUE (search_type, tag_name, in_out_flag);


--
-- Name: uk_search_synonyms_xml; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY search_synonyms_xml
    ADD CONSTRAINT uk_search_synonyms_xml UNIQUE (file_name);


--
-- Name: uk_task_list; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY task_list
    ADD CONSTRAINT uk_task_list UNIQUE (f_task_type, f_cft, f_role, f_auction);


--
-- Name: uk_voc_type; Type: CONSTRAINT; Schema: public; Owner: e_proc; Tablespace: 
--

ALTER TABLE ONLY voc_type
    ADD CONSTRAINT uk_voc_type UNIQUE (f_voc_code, f_voc_language);













--
-- Name: idx_qrtz_ft_job_group; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_job_group ON qrtz_fired_triggers USING btree (job_group) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_ft_job_name; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_job_name ON qrtz_fired_triggers USING btree (job_name) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_ft_trig_group; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_trig_group ON qrtz_fired_triggers USING btree (trigger_group) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON qrtz_fired_triggers USING btree (instance_name) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_ft_trig_name; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_trig_name ON qrtz_fired_triggers USING btree (trigger_name) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_ft_trig_nm_gp; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_trig_nm_gp ON qrtz_fired_triggers USING btree (trigger_name, trigger_group) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_t_next_fire_time ON qrtz_triggers USING btree (next_fire_time) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_t_nft_st ON qrtz_triggers USING btree (next_fire_time, trigger_state) TABLESPACE tbs_index;


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX idx_qrtz_t_state ON qrtz_triggers USING btree (trigger_state) TABLESPACE tbs_index;


--
-- Name: ix_account_f_authority; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_account_f_authority ON account USING btree (f_authority) TABLESPACE tbs_index;


--
-- Name: ix_account_f_country; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_account_f_country ON account USING btree (f_country) TABLESPACE tbs_index;


--
-- Name: ix_authorities_cpv_code_f_auth; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_authorities_cpv_code_f_auth ON authorities_cpv_code USING btree (f_authorities) TABLESPACE tbs_index;


--
-- Name: ix_authorities_cpv_code_f_cc; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_authorities_cpv_code_f_cc ON authorities_cpv_code USING btree (f_cpv_code) TABLESPACE tbs_index;


--
-- Name: ix_authorities_f_ca_common; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_authorities_f_ca_common ON authorities USING btree (f_ca_common) TABLESPACE tbs_index;


--
-- Name: ix_authorities_f_country_iss; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_authorities_f_country_iss ON authorities USING btree (f_country_issuer) TABLESPACE tbs_index;


--
-- Name: ix_ca_common_f_ca_type; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_ca_common_f_ca_type ON ca_common USING btree (f_ca_type) TABLESPACE tbs_index;


--
-- Name: ix_cft_arc_data_f_cont_entry; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_cft_arc_data_f_cont_entry ON cft_archive_data USING btree (f_content_entry) TABLESPACE tbs_index;


--
-- Name: ix_content_entry_creator; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_content_entry_creator ON content_entry USING btree (creator) TABLESPACE tbs_index;


--
-- Name: ix_content_entry_f_entry_type; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_content_entry_f_entry_type ON content_entry USING btree (f_entry_type) TABLESPACE tbs_index;


--
-- Name: ix_content_entry_lock_holder; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_content_entry_lock_holder ON content_entry USING btree (lock_holder) TABLESPACE tbs_index;


--
-- Name: ix_content_entry_parent_folder; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_content_entry_parent_folder ON content_entry USING btree (parent_folder) TABLESPACE tbs_index;


--
-- Name: ix_cpv_type_f_cpv_code; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_cpv_type_f_cpv_code ON cpv_type USING btree (f_cpv_code) TABLESPACE tbs_index;


--
-- Name: ix_cpv_type_f_cpv_language; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_cpv_type_f_cpv_language ON cpv_type USING btree (f_cpv_language) TABLESPACE tbs_index;


--
-- Name: ix_ctx_smd_wh_val84; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_ctx_smd_wh_val84 ON search_metadatum_wh USING btree (metadatum_value_84) TABLESPACE tbs_index;


--
-- Name: ix_ctx_smd_wh_val85; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_ctx_smd_wh_val85 ON search_metadatum_wh USING btree (metadatum_value_85) TABLESPACE tbs_index;


--
-- Name: ix_depen_roles_f_role_source; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_depen_roles_f_role_source ON dependant_roles USING btree (f_role_source) TABLESPACE tbs_index;


--
-- Name: ix_depen_roles_f_role_target; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_depen_roles_f_role_target ON dependant_roles USING btree (f_role_target) TABLESPACE tbs_index;


--
-- Name: ix_distr_list_f_account; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_distr_list_f_account ON distr_list USING btree (f_account) TABLESPACE tbs_index;


--
-- Name: ix_distr_list_un_f_distr_list; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_distr_list_un_f_distr_list ON distr_list_username USING btree (f_distr_list) TABLESPACE tbs_index;


--
-- Name: ix_email_distr_list_f_distr; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_email_distr_list_f_distr ON email_distribution_list USING btree (f_distr_list) TABLESPACE tbs_index;


--
-- Name: ix_email_distr_list_f_email; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_email_distr_list_f_email ON email_distribution_list USING btree (f_email_notification) TABLESPACE tbs_index;


--
-- Name: ix_email_notif_f_account; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_email_notif_f_account ON email_notification USING btree (f_account) TABLESPACE tbs_index;


--
-- Name: ix_email_notif_f_content_entry; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_email_notif_f_content_entry ON email_notification USING btree (f_content_entry) TABLESPACE tbs_index;


--
-- Name: ix_entry_event_f_account; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_entry_event_f_account ON entry_event USING btree (f_account) TABLESPACE tbs_index;


--
-- Name: ix_entry_event_f_content_entry; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_entry_event_f_content_entry ON entry_event USING btree (f_content_entry) TABLESPACE tbs_index;


--
-- Name: ix_entry_type_parent_type; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_entry_type_parent_type ON entry_type USING btree (parent_type) TABLESPACE tbs_index;


--
-- Name: ix_eo_awarding_cft_id; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_eo_awarding_cft_id ON eo_awarding USING btree (cft_id) TABLESPACE tbs_index;


--
-- Name: ix_eo_awarding_eo_id; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_eo_awarding_eo_id ON eo_awarding USING btree (eo_id) TABLESPACE tbs_index;


--
-- Name: ix_eo_ranking_cft_id; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_eo_ranking_cft_id ON eo_ranking USING btree (cft_id) TABLESPACE tbs_index;


--
-- Name: ix_eo_ranking_eo_id; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_eo_ranking_eo_id ON eo_ranking USING btree (eo_id) TABLESPACE tbs_index;


--
-- Name: ix_event_trigger_f_event_type; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_event_trigger_f_event_type ON event_trigger USING btree (f_event_type) TABLESPACE tbs_index;


--
-- Name: ix_event_trigger_f_temp_oper; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_event_trigger_f_temp_oper ON event_trigger USING btree (f_template_operation) TABLESPACE tbs_index;


--
-- Name: ix_event_trigger_f_temp_role; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_event_trigger_f_temp_role ON event_trigger USING btree (f_template_role) TABLESPACE tbs_index;


--
-- Name: ix_event_trigger_new_ev_type; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_event_trigger_new_ev_type ON event_trigger USING btree (new_event_type) TABLESPACE tbs_index;


--
-- Name: ix_groups_f_content_entry; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_groups_f_content_entry ON groups USING btree (f_content_entry) TABLESPACE tbs_index;


--
-- Name: ix_groups_f_template_groups; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_groups_f_template_groups ON groups USING btree (f_template_groups) TABLESPACE tbs_index;


--
-- Name: ix_last_visit_upd_f_account; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_last_visit_upd_f_account ON last_visit_updates USING btree (f_account) TABLESPACE tbs_index;


--
-- Name: ix_last_visit_upd_f_c_entry; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_last_visit_upd_f_c_entry ON last_visit_updates USING btree (f_content_entry) TABLESPACE tbs_index;


--
-- Name: ix_metadatum_f_content_entry; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_metadatum_f_content_entry ON metadatum USING btree (f_content_entry) TABLESPACE tbs_index;


--
-- Name: ix_metadatum_f_data; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_metadatum_f_data ON metadatum USING btree (f_data) TABLESPACE tbs_index;


--
-- Name: ix_metadatum_f_meta_type; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_metadatum_f_meta_type ON metadatum USING btree (f_meta_type) TABLESPACE tbs_index;


--
-- Name: ix_nuts_type_f_nuts_code; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_nuts_type_f_nuts_code ON nuts_type USING btree (f_nuts_code) TABLESPACE tbs_index;


--
-- Name: ix_nuts_type_f_nuts_language; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_nuts_type_f_nuts_language ON nuts_type USING btree (f_nuts_language) TABLESPACE tbs_index;


--
-- Name: ix_operation_f_group; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_operation_f_group ON operation USING btree (f_group) TABLESPACE tbs_index;


--
-- Name: ix_operation_f_template_operat; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_operation_f_template_operat ON operation USING btree (f_template_operation) TABLESPACE tbs_index;


--
-- Name: ix_principal_permission_reso2; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_principal_permission_reso2 ON principal_permission_resource USING btree (f_resource) TABLESPACE tbs_index;


--
-- Name: ix_principal_permission_resour; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_principal_permission_resour ON principal_permission_resource USING btree (f_principal) TABLESPACE tbs_index;


--
-- Name: ix_resources_f_resource_semant; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_resources_f_resource_semant ON resources USING btree (f_resource_semantic) TABLESPACE tbs_index;


--
-- Name: ix_roles_f_group; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_roles_f_group ON roles USING btree (f_group) TABLESPACE tbs_index;


--
-- Name: ix_roles_f_template_role; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_roles_f_template_role ON roles USING btree (f_template_role) TABLESPACE tbs_index;


--
-- Name: ix_search_metada_wh$md_val_130; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX "ix_search_metada_wh$md_val_130" ON search_metadatum_wh USING btree (metadatum_value_130) TABLESPACE tbs_index;


--
-- Name: ix_search_metada_wh$md_val_142; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX "ix_search_metada_wh$md_val_142" ON search_metadatum_wh USING btree (upper(metadatum_value_142)) TABLESPACE tbs_index;


--
-- Name: ix_search_metadat_wh$md_val_1; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX "ix_search_metadat_wh$md_val_1" ON search_metadatum_wh USING btree (upper(metadatum_value_1)) TABLESPACE tbs_index;


--
-- Name: ix_search_metadat_wh$md_val_11; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX "ix_search_metadat_wh$md_val_11" ON search_metadatum_wh USING btree (metadatum_value_11) TABLESPACE tbs_index;


--
-- Name: ix_service_f_groups; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_service_f_groups ON service USING btree (f_groups) TABLESPACE tbs_index;


--
-- Name: ix_service_f_template_service; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_service_f_template_service ON service USING btree (f_template_service) TABLESPACE tbs_index;


--
-- Name: ix_task_completed_f_account; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_task_completed_f_account ON task_completed USING btree (f_account) TABLESPACE tbs_index;


--
-- Name: ix_task_completed_f_task_list; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_task_completed_f_task_list ON task_completed USING btree (f_task_list) TABLESPACE tbs_index;


--
-- Name: ix_task_list_f_auction; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_task_list_f_auction ON task_list USING btree (f_auction) TABLESPACE tbs_index;


--
-- Name: ix_task_list_f_cft; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_task_list_f_cft ON task_list USING btree (f_cft) TABLESPACE tbs_index;


--
-- Name: ix_task_list_f_role; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_task_list_f_role ON task_list USING btree (f_role) TABLESPACE tbs_index;


--
-- Name: ix_task_list_f_task_type; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_task_list_f_task_type ON task_list USING btree (f_task_type) TABLESPACE tbs_index;


--
-- Name: ix_templ_srv_group_f_templ_grp; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_templ_srv_group_f_templ_grp ON template_service_group USING btree (f_template_group) TABLESPACE tbs_index;


--
-- Name: ix_templ_srv_group_f_templ_srv; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_templ_srv_group_f_templ_srv ON template_service_group USING btree (f_template_service) TABLESPACE tbs_index;


--
-- Name: ix_template_operation_f_t_srv; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_template_operation_f_t_srv ON template_operation USING btree (f_template_service) TABLESPACE tbs_index;


--
-- Name: ix_template_role_operation_f2; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_template_role_operation_f2 ON template_role_operation USING btree (f_template_operation) TABLESPACE tbs_index;


--
-- Name: ix_template_role_operation_f3; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_template_role_operation_f3 ON template_role_operation USING btree (f_template_role) TABLESPACE tbs_index;


--
-- Name: ix_template_role_operation_f_t; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_template_role_operation_f_t ON template_role_operation USING btree (f_template_group) TABLESPACE tbs_index;


--
-- Name: ix_users_f_authority; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_users_f_authority ON users USING btree (f_authority) TABLESPACE tbs_index;


--
-- Name: ix_vers_cont_entry_ce_id; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_vers_cont_entry_ce_id ON version_content_entry USING btree (content_entry_id) TABLESPACE tbs_index;


--
-- Name: ix_vers_cont_entry_prev_vers; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_vers_cont_entry_prev_vers ON version_content_entry USING btree (previous_version) TABLESPACE tbs_index;


--
-- Name: ix_version_metadatum_ce_mt; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_version_metadatum_ce_mt ON version_metadatum USING btree (f_v_content_entry, f_v_meta_type) TABLESPACE tbs_index;


--
-- Name: ix_voc_code_parent_id; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_voc_code_parent_id ON voc_code USING btree (parent_id) TABLESPACE tbs_index;


--
-- Name: ix_voc_type_f_voc_code; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_voc_type_f_voc_code ON voc_type USING btree (f_voc_code) TABLESPACE tbs_index;


--
-- Name: ix_voc_type_f_voc_language; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_voc_type_f_voc_language ON voc_type USING btree (f_voc_language) TABLESPACE tbs_index;


--
-- Name: ix_workflow_steps_f_cft_phase; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX ix_workflow_steps_f_cft_phase ON workflow_steps USING btree (f_cft_phase) TABLESPACE tbs_index;


--
-- Name: jbm_msg_ref_tx; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE INDEX jbm_msg_ref_tx ON jbm_msg_ref USING btree (transaction_id, state) TABLESPACE tbs_index;


--
-- Name: pk_groups_authority; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE UNIQUE INDEX pk_groups_authority ON authority_associations USING btree (id) TABLESPACE tbs_index;


--
-- Name: uk_groups_authority; Type: INDEX; Schema: public; Owner: e_proc; Tablespace: 
--

CREATE UNIQUE INDEX uk_groups_authority ON authority_associations USING btree (f_groups, f_authorities) TABLESPACE tbs_index;







