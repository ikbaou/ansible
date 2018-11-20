
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
\o create.constraints.log

----------------------------------------------------------------------------------


--
-- Name: fk_account_f_authority; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_f_authority FOREIGN KEY (f_authority) REFERENCES authorities(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_account_f_country; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_f_country FOREIGN KEY (f_country) REFERENCES country(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_account_f_principal; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_account_f_principal FOREIGN KEY (f_principal) REFERENCES principal(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_account_role_f_account; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY account_role
    ADD CONSTRAINT fk_account_role_f_account FOREIGN KEY (f_account) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_account_role_f_role; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY account_role
    ADD CONSTRAINT fk_account_role_f_role FOREIGN KEY (f_role) REFERENCES roles(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_authorities_authority_annex; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT fk_authorities_authority_annex FOREIGN KEY (f_authority_annex) REFERENCES authority_annex(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authorities_cpv_code_f_auth; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authorities_cpv_code
    ADD CONSTRAINT fk_authorities_cpv_code_f_auth FOREIGN KEY (f_authorities) REFERENCES authorities(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authorities_cpv_code_f_cc; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authorities_cpv_code
    ADD CONSTRAINT fk_authorities_cpv_code_f_cc FOREIGN KEY (f_cpv_code) REFERENCES cpv_code(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authorities_f_ca_common; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT fk_authorities_f_ca_common FOREIGN KEY (f_ca_common) REFERENCES ca_common(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authorities_f_country; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT fk_authorities_f_country FOREIGN KEY (f_country) REFERENCES country(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authorities_f_country_iss; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT fk_authorities_f_country_iss FOREIGN KEY (f_country_issuer) REFERENCES country(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authorities_f_groups; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT fk_authorities_f_groups FOREIGN KEY (f_groups) REFERENCES groups(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authority_associat_f_auth; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authority_associations
    ADD CONSTRAINT fk_authority_associat_f_auth FOREIGN KEY (f_authorities) REFERENCES authorities(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_authority_associat_f_group; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY authority_associations
    ADD CONSTRAINT fk_authority_associat_f_group FOREIGN KEY (f_groups) REFERENCES groups(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_ca_common_f_ca_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY ca_common
    ADD CONSTRAINT fk_ca_common_f_ca_type FOREIGN KEY (f_ca_type) REFERENCES ca_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_cft_arc_data_f_cont_entry; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY cft_archive_data
    ADD CONSTRAINT fk_cft_arc_data_f_cont_entry FOREIGN KEY (f_content_entry) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_content_entry_creator; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY content_entry
    ADD CONSTRAINT fk_content_entry_creator FOREIGN KEY (creator) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_content_entry_f_entry_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY content_entry
    ADD CONSTRAINT fk_content_entry_f_entry_type FOREIGN KEY (f_entry_type) REFERENCES entry_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_content_entry_f_resource; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY content_entry
    ADD CONSTRAINT fk_content_entry_f_resource FOREIGN KEY (f_resource) REFERENCES resources(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_content_entry_lock_holder; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY content_entry
    ADD CONSTRAINT fk_content_entry_lock_holder FOREIGN KEY (lock_holder) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_content_entry_parent_folder; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY content_entry
    ADD CONSTRAINT fk_content_entry_parent_folder FOREIGN KEY (parent_folder) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_cpv_type_f_cpv_code; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY cpv_type
    ADD CONSTRAINT fk_cpv_type_f_cpv_code FOREIGN KEY (f_cpv_code) REFERENCES cpv_code(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_cpv_type_f_cpv_language; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY cpv_type
    ADD CONSTRAINT fk_cpv_type_f_cpv_language FOREIGN KEY (f_cpv_language) REFERENCES cpv_language(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_depen_roles_f_role_source; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY dependant_roles
    ADD CONSTRAINT fk_depen_roles_f_role_source FOREIGN KEY (f_role_source) REFERENCES roles(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_depen_roles_f_role_target; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY dependant_roles
    ADD CONSTRAINT fk_depen_roles_f_role_target FOREIGN KEY (f_role_target) REFERENCES roles(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_distr_list_f_account; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY distr_list
    ADD CONSTRAINT fk_distr_list_f_account FOREIGN KEY (f_account) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_distr_list_un_f_distr_list; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY distr_list_username
    ADD CONSTRAINT fk_distr_list_un_f_distr_list FOREIGN KEY (f_distr_list) REFERENCES distr_list(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_email_distr_list_f_distr; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY email_distribution_list
    ADD CONSTRAINT fk_email_distr_list_f_distr FOREIGN KEY (f_distr_list) REFERENCES distr_list(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_email_distr_list_f_email; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY email_distribution_list
    ADD CONSTRAINT fk_email_distr_list_f_email FOREIGN KEY (f_email_notification) REFERENCES email_notification(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_email_notif_f_account; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY email_notification
    ADD CONSTRAINT fk_email_notif_f_account FOREIGN KEY (f_account) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_email_notif_f_content_entry; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY email_notification
    ADD CONSTRAINT fk_email_notif_f_content_entry FOREIGN KEY (f_content_entry) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_entry_event_f_account; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY entry_event
    ADD CONSTRAINT fk_entry_event_f_account FOREIGN KEY (f_account) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_entry_event_f_content_entry; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY entry_event
    ADD CONSTRAINT fk_entry_event_f_content_entry FOREIGN KEY (f_content_entry) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_entry_meta_type_f_entry_ty; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY entry_meta_type
    ADD CONSTRAINT fk_entry_meta_type_f_entry_ty FOREIGN KEY (f_entry_type) REFERENCES entry_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_entry_meta_type_f_meta_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY entry_meta_type
    ADD CONSTRAINT fk_entry_meta_type_f_meta_type FOREIGN KEY (f_meta_type) REFERENCES meta_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_entry_type_parent_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY entry_type
    ADD CONSTRAINT fk_entry_type_parent_type FOREIGN KEY (parent_type) REFERENCES entry_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_eo_awarding_cft_id; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY eo_awarding
    ADD CONSTRAINT fk_eo_awarding_cft_id FOREIGN KEY (cft_id) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_eo_awarding_eo_id; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY eo_awarding
    ADD CONSTRAINT fk_eo_awarding_eo_id FOREIGN KEY (eo_id) REFERENCES authorities(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_eo_ranking_cft_id; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY eo_ranking
    ADD CONSTRAINT fk_eo_ranking_cft_id FOREIGN KEY (cft_id) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_eo_ranking_eo_id; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY eo_ranking
    ADD CONSTRAINT fk_eo_ranking_eo_id FOREIGN KEY (eo_id) REFERENCES authorities(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_event_trigger_f_event_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY event_trigger
    ADD CONSTRAINT fk_event_trigger_f_event_type FOREIGN KEY (f_event_type) REFERENCES event_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_event_trigger_f_temp_oper; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY event_trigger
    ADD CONSTRAINT fk_event_trigger_f_temp_oper FOREIGN KEY (f_template_operation) REFERENCES template_operation(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_event_trigger_f_temp_role; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY event_trigger
    ADD CONSTRAINT fk_event_trigger_f_temp_role FOREIGN KEY (f_template_role) REFERENCES template_role(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_event_trigger_new_ev_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY event_trigger
    ADD CONSTRAINT fk_event_trigger_new_ev_type FOREIGN KEY (new_event_type) REFERENCES event_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_groups_f_content_entry; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT fk_groups_f_content_entry FOREIGN KEY (f_content_entry) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_groups_f_template_groups; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT fk_groups_f_template_groups FOREIGN KEY (f_template_groups) REFERENCES template_group(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_last_visit_upd_f_account; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY last_visit_updates
    ADD CONSTRAINT fk_last_visit_upd_f_account FOREIGN KEY (f_account) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_last_visit_upd_f_c_entry; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY last_visit_updates
    ADD CONSTRAINT fk_last_visit_upd_f_c_entry FOREIGN KEY (f_content_entry) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_metadatum_f_content_entry; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY metadatum
    ADD CONSTRAINT fk_metadatum_f_content_entry FOREIGN KEY (f_content_entry) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_metadatum_f_data; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY metadatum
    ADD CONSTRAINT fk_metadatum_f_data FOREIGN KEY (f_data) REFERENCES content_entry_data(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_metadatum_f_meta_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY metadatum
    ADD CONSTRAINT fk_metadatum_f_meta_type FOREIGN KEY (f_meta_type) REFERENCES meta_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_nuts_type_f_nuts_code; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY nuts_type
    ADD CONSTRAINT fk_nuts_type_f_nuts_code FOREIGN KEY (f_nuts_code) REFERENCES nuts_code(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_nuts_type_f_nuts_language; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY nuts_type
    ADD CONSTRAINT fk_nuts_type_f_nuts_language FOREIGN KEY (f_nuts_language) REFERENCES nuts_language(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_operation_f_group; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT fk_operation_f_group FOREIGN KEY (f_group) REFERENCES groups(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_operation_f_resource; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT fk_operation_f_resource FOREIGN KEY (f_resource) REFERENCES resources(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_operation_f_temp_operation; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT fk_operation_f_temp_operation FOREIGN KEY (f_template_operation) REFERENCES template_operation(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_princ_per_resource_f_princ; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY principal_permission_resource
    ADD CONSTRAINT fk_princ_per_resource_f_princ FOREIGN KEY (f_principal) REFERENCES principal(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_princ_per_resource_f_res; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY principal_permission_resource
    ADD CONSTRAINT fk_princ_per_resource_f_res FOREIGN KEY (f_resource) REFERENCES resources(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_qrtz_b_trig_trig_n_trig_gr; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY qrtz_blob_triggers
    ADD CONSTRAINT fk_qrtz_b_trig_trig_n_trig_gr FOREIGN KEY (trigger_name, trigger_group) REFERENCES qrtz_triggers(trigger_name, trigger_group) MATCH FULL DEFERRABLE;


--
-- Name: fk_qrtz_c_trig_trig_n_trig_gr; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY qrtz_cron_triggers
    ADD CONSTRAINT fk_qrtz_c_trig_trig_n_trig_gr FOREIGN KEY (trigger_name, trigger_group) REFERENCES qrtz_triggers(trigger_name, trigger_group) MATCH FULL DEFERRABLE;


--
-- Name: fk_qrtz_job_lis_job_n_job_gr; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY qrtz_job_listeners
    ADD CONSTRAINT fk_qrtz_job_lis_job_n_job_gr FOREIGN KEY (job_name, job_group) REFERENCES qrtz_job_details(job_name, job_group) MATCH FULL DEFERRABLE;


--
-- Name: fk_qrtz_s_trig_trig_n_trig_gr; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY qrtz_simple_triggers
    ADD CONSTRAINT fk_qrtz_s_trig_trig_n_trig_gr FOREIGN KEY (trigger_name, trigger_group) REFERENCES qrtz_triggers(trigger_name, trigger_group) MATCH FULL DEFERRABLE;


--
-- Name: fk_qrtz_trig_l_trig_n_trig_gr; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY qrtz_trigger_listeners
    ADD CONSTRAINT fk_qrtz_trig_l_trig_n_trig_gr FOREIGN KEY (trigger_name, trigger_group) REFERENCES qrtz_triggers(trigger_name, trigger_group) MATCH FULL DEFERRABLE;


--
-- Name: fk_qrtz_triggers_job_n_job_gr; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY qrtz_triggers
    ADD CONSTRAINT fk_qrtz_triggers_job_n_job_gr FOREIGN KEY (job_name, job_group) REFERENCES qrtz_job_details(job_name, job_group) MATCH FULL DEFERRABLE;


--
-- Name: fk_resources_f_res_semantic; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT fk_resources_f_res_semantic FOREIGN KEY (f_resource_semantic) REFERENCES resource_semantic(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_roles_f_group; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT fk_roles_f_group FOREIGN KEY (f_group) REFERENCES groups(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_roles_f_principal; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT fk_roles_f_principal FOREIGN KEY (f_principal) REFERENCES principal(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_roles_f_template_role; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT fk_roles_f_template_role FOREIGN KEY (f_template_role) REFERENCES template_role(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_service_f_groups; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_service_f_groups FOREIGN KEY (f_groups) REFERENCES groups(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_service_f_template_service; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_service_f_template_service FOREIGN KEY (f_template_service) REFERENCES template_service(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_task_completed_f_account; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY task_completed
    ADD CONSTRAINT fk_task_completed_f_account FOREIGN KEY (f_account) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_task_completed_f_task_list; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY task_completed
    ADD CONSTRAINT fk_task_completed_f_task_list FOREIGN KEY (f_task_list) REFERENCES task_list(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_task_list_f_auction; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY task_list
    ADD CONSTRAINT fk_task_list_f_auction FOREIGN KEY (f_auction) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_task_list_f_cft; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY task_list
    ADD CONSTRAINT fk_task_list_f_cft FOREIGN KEY (f_cft) REFERENCES content_entry(f_resource) MATCH FULL DEFERRABLE;


--
-- Name: fk_task_list_f_role; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY task_list
    ADD CONSTRAINT fk_task_list_f_role FOREIGN KEY (f_role) REFERENCES roles(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_task_list_f_task_type; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY task_list
    ADD CONSTRAINT fk_task_list_f_task_type FOREIGN KEY (f_task_type) REFERENCES task_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_temp_role_group_f_t_group; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_role_group
    ADD CONSTRAINT fk_temp_role_group_f_t_group FOREIGN KEY (f_template_group) REFERENCES template_group(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_temp_role_group_f_t_role; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_role_group
    ADD CONSTRAINT fk_temp_role_group_f_t_role FOREIGN KEY (f_template_role) REFERENCES template_role(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_templ_srv_group_f_templ_grp; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_service_group
    ADD CONSTRAINT fk_templ_srv_group_f_templ_grp FOREIGN KEY (f_template_group) REFERENCES template_group(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_templ_srv_group_f_templ_srv; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_service_group
    ADD CONSTRAINT fk_templ_srv_group_f_templ_srv FOREIGN KEY (f_template_service) REFERENCES template_service(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_template_operation_f_t_srv; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_operation
    ADD CONSTRAINT fk_template_operation_f_t_srv FOREIGN KEY (f_template_service) REFERENCES template_service(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_template_role_oper_f_t_oper; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_role_operation
    ADD CONSTRAINT fk_template_role_oper_f_t_oper FOREIGN KEY (f_template_operation) REFERENCES template_operation(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_template_role_oper_f_t_role; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_role_operation
    ADD CONSTRAINT fk_template_role_oper_f_t_role FOREIGN KEY (f_template_role) REFERENCES template_role(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_template_role_oper_f_tgroup; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY template_role_operation
    ADD CONSTRAINT fk_template_role_oper_f_tgroup FOREIGN KEY (f_template_group) REFERENCES template_group(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_users_f_account; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_f_account FOREIGN KEY (f_account) REFERENCES account(f_principal) MATCH FULL DEFERRABLE;


--
-- Name: fk_users_f_authority; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_f_authority FOREIGN KEY (f_authority) REFERENCES authorities(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_vers_cont_entry_prev_vers; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY version_content_entry
    ADD CONSTRAINT fk_vers_cont_entry_prev_vers FOREIGN KEY (previous_version) REFERENCES version_content_entry(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_version_metadatum_ce; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY version_metadatum
    ADD CONSTRAINT fk_version_metadatum_ce FOREIGN KEY (f_v_content_entry) REFERENCES version_content_entry(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_version_metadatum_mt; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY version_metadatum
    ADD CONSTRAINT fk_version_metadatum_mt FOREIGN KEY (f_v_meta_type) REFERENCES version_meta_type(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_voc_type_f_voc_code; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY voc_type
    ADD CONSTRAINT fk_voc_type_f_voc_code FOREIGN KEY (f_voc_code) REFERENCES voc_code(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_voc_type_f_voc_language; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY voc_type
    ADD CONSTRAINT fk_voc_type_f_voc_language FOREIGN KEY (f_voc_language) REFERENCES voc_language(id) MATCH FULL DEFERRABLE;


--
-- Name: fk_workflow_steps_f_cft_phase; Type: FK CONSTRAINT; Schema: public; Owner: e_proc
--

ALTER TABLE ONLY workflow_steps
    ADD CONSTRAINT fk_workflow_steps_f_cft_phase FOREIGN KEY (f_cft_phase) REFERENCES cft_phases(id) MATCH FULL DEFERRABLE;

