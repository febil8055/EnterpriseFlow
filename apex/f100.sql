prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>6801933967122558
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'ENTERPRISEFLOW'
);
end;
/
 
prompt APPLICATION 100 - EnterpriseFlow
--
-- Application Export:
--   Application:     100
--   Name:            EnterpriseFlow
--   Date and Time:   10:31 Saturday August 15, 2026
--   Exported By:     FEBIL
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     28
--       Items:                  133
--       Validations:             23
--       Processes:               37
--       Regions:                 53
--       Buttons:                 56
--       Dynamic Actions:         11
--     Shared Components:
--       Logic:
--         Processes:              2
--         Build Options:          1
--         AI Agents:              1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:             15
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--         LOVs:                   9
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         26.1.0
--   Instance ID:     2400177991129344
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'ENTERPRISEFLOW')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'EnterpriseFlow')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'ENTERPRISEFLOW')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'078351F21191F1285AB7E376CA49C9D1E44F07C1DB7CFE6880713443AF7DDD75'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'26.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(7409092493361191)
,p_application_tab_set=>0
,p_logo_type=>'C'
,p_logo=>'<span class="t-Header-branding" style="display:flex;align-items:center;gap:10px;"><svg width="30" height="20" viewBox="0 0 48 32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="EnterpriseFlow"><defs><linearGradient id="efGrad" x1="0" y1="0'
||'" x2="48" y2="32" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#42a5ff"/><stop offset="1" stop-color="#0071e3"/></linearGradient></defs><circle cx="16" cy="16" r="11" fill="none" stroke="url(#efGrad)" stroke-width="5"/><circle cx="32" '
||'cy="16" r="11" fill="none" stroke="url(#efGrad)" stroke-width="5"/></svg><span style="font-weight:700;font-size:17px;letter-spacing:-0.02em;color:#f5f5f7;">EnterpriseFlow</span></span>'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'EnterpriseFLow'
,p_created_on=>wwv_flow_imp.dz('20260717204346Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815102524Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461268095951
,p_version_scn=>'10984452'
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
,p_ai_remote_server_id=>7403594274235009
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(7409985283361200)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_css_file_urls=>'#APP_FILES#custom#MIN#.css'
,p_javascript_file_urls=>'#APP_FILES#widget#MIN#.js'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(7410785407361269)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --workspace/credentials/credentials_for_gemini_ai
begin
wwv_imp_workspace.create_credential(
 p_id=>7403140768235001
,p_name=>'Credentials for gemini ai'
,p_static_id=>'credentials-for-gemini-ai'
,p_authentication_type=>'HTTP_HEADER'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://generativelanguage.googleapis.com/v1beta',
''))
,p_prompt_on_install=>true
,p_created_on=>wwv_flow_imp.dz('20260717202245Z')
,p_updated_on=>wwv_flow_imp.dz('20260717202245Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --workspace/remote_servers/gemini_ai
begin
wwv_imp_workspace.create_remote_server(
 p_id=>7403594274235009
,p_name=>'Gemini AI'
,p_static_id=>'gemini-aigemini-ai'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('gemini-aigemini-ai'),'https://generativelanguage.googleapis.com/v1beta')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('gemini-aigemini-ai'),'')
,p_server_type=>'GENERATIVE_AI'
,p_credential_id=>7403140768235001
,p_ai_provider_type=>'GEMINI'
,p_ai_is_builder_service=>false
,p_ai_is_default_for_new_apps=>true
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('gemini-aigemini-ai'),'gemini-flash-lite-latest')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('gemini-aigemini-ai'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('gemini-aigemini-ai'),'')
,p_ai_max_tokens=>nvl(wwv_flow_application_install.get_remote_server_ai_maxtokens('gemini-aigemini-ai'),'')
,p_prompt_on_install=>false
,p_created_on=>wwv_flow_imp.dz('20260717202245Z')
,p_updated_on=>wwv_flow_imp.dz('20260814143547Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7404700521361170)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>'SH256:NcagEyRP_F17oe14bnrSYSYienkBgpdRSvH17g_NxoE'
,p_created_on=>wwv_flow_imp.dz('20260717204346Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7405094038361181)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>'SH256:FJR60MFzlfEjx0PvnpYBK4631rNeUHXaF3eGFKxcTgE'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7405265290361181)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>'SH256:dQTHqehcDG0h-d-qmHe5lf-DuViElEHDw9zMkscLr6M'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7405558205361182)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:CU9J9l4sUtY-UffjdBCosfDW6ER-I0swXpw8GekLiYQ'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7405815545361182)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>'SH256:jJTPfH8wphTXe7ahDytF6PbWlPl1mXrDRYylCDda0k0'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7406147947361182)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>'SH256:oAqKgc-cSRXHDMjfwwNIgo78WqYXKjQz8MWGBG6Euj0'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7406498241361183)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>'SH256:uT4QhQbZQY61UFxAGl7ieo2urrCo8jUsFNprrg7lGHo'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7406769514361183)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>'SH256:wAjuCAsVhoIbbuKGWTMQ__Rd_YS_sY9KgWhpqOO11mc'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7407021159361183)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:GIeRbUJQ8yKfen6-dFvkghmSUZXFoUAXCCTNRhCJgh0'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7407355327361184)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>'SH256:4M27aN0U-JyQ0prILtI8ITLXOphqUdO-xWNcwkSL1SI'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7407634059361184)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>'SH256:tNGqNT-VaoKqWOwKbAdEqb6C0QO-GMcYRZJLXjScHMo'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7407921350361184)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>'SH256:vJP7K77hiNj1R2RE6dHVyRAhlmxDg6KGn4yRE20J9Qw'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7408227879361184)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>'SH256:fiSZ-OfcUl-d0e0dtJUYffG7q61xKsHlomsv7ZU1BMw'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7408512043361185)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>'SH256:dRkCWi6vQMhdQUSqb0QlRls9iYcsZ93IPYrbTqFqJFE'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/ai_agent/enterpriseflow_assistant
begin
wwv_flow_imp_shared.create_ai_agent(
 p_id=>wwv_flow_imp.id(9414333057959253)
,p_name=>'EnterpriseFlow Assistant'
,p_static_id=>'enterpriseflow-assistant'
,p_system_prompt=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You are the EnterpriseFlow Assistant, embedded inside the EnterpriseFlow SaaS application. EnterpriseFlow tracks: Organizations, Departments, Roles, Employees, User Accounts, Clients, Locations, Projects, Tasks, Statuses (lookup for Project/Task stat'
||'es) and Priorities (lookup for Task priority levels). Employees belong to a Department and a Role. Projects belong to an Organization and optionally a Client, and have a Status. Tasks belong to a Project, can be assigned to an Employee, and have a St'
||'atus and a Priority.',
'',
'Every message you receive starts with a "Live EnterpriseFlow data snapshot" block containing the current, authoritative state of all records. Always answer data questions (counts, lists, specific records, workload, overdue items, completion rates, et'
||'c.) using only that snapshot - never guess or invent numbers, and never claim you looked something up if it is not in the snapshot.',
'',
'Be concise and direct. Use plain text, short paragraphs or bullet lists. If a question is ambiguous, ask a brief clarifying question instead of assuming.'))
,p_welcome_message=>'Hi, I''m your EnterpriseFlow Assistant. Ask me about your organizations, projects, tasks, employees, or workload, and I will look it up for you.'
,p_version_scn=>'SH256:MAGR2SB4awRdMLpKhIVfrkwS-TgktJsqZ-Km-1HV8AY'
,p_created_on=>wwv_flow_imp.dz('20260809143009Z')
,p_updated_on=>wwv_flow_imp.dz('20260814141308Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(7410785407361269)
,p_name=>'Navigation Bar'
,p_static_id=>'navigation-bar'
,p_version_scn=>'SH256:vnb1-G39r80BPE-5P2Enpuf0sMSVvBeNQDVbFiNwRto'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7423846175361419)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_static_id=>'app-user'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7424464655361420)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_static_id=>'list_item'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(7423846175361419)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7424919277361423)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_static_id=>'sign-out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(7423846175361419)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(7409985283361200)
,p_name=>'Navigation Menu'
,p_static_id=>'navigation-menu'
,p_version_scn=>'SH256:FMzEt5mi4VXH05CB29r7HkD63PrHqzOuBUr2boTlziQ'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102510Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9416106852091512)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'AI Assistant'
,p_static_id=>'ai-assistant'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-comments-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'49'
,p_created_on=>wwv_flow_imp.dz('20260809145212Z')
,p_updated_on=>wwv_flow_imp.dz('20260809145212Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9856121141566740)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Audit Log'
,p_static_id=>'audit-log'
,p_list_item_link_target=>'f?p=&APP_ID.:51:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'51'
,p_created_on=>wwv_flow_imp.dz('20260815102510Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102510Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8657724021282118)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Clients'
,p_static_id=>'clients'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-handshake-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'19,20'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9400638230089969)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_static_id=>'dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:48:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-tachometer'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'48'
,p_created_on=>wwv_flow_imp.dz('20260809120516Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8432984840108190)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Departments'
,p_static_id=>'departments'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-sitemap'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'9,10'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8456719396116493)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Employees'
,p_static_id=>'employees'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13,14'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9018729718378291)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Locations'
,p_static_id=>'locations'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-map-marker'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4,7'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8413095541090159)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Organizations'
,p_static_id=>'organizations'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-building'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5,6'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260809121455Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9304499168985838)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Priorities'
,p_static_id=>'priorities'
,p_list_item_link_target=>'f?p=&APP_ID.:46:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-exclamation-circle'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'46,47'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9233452914954213)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Projects'
,p_static_id=>'project'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-folder-open-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'40,41'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8612870260266937)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Roles'
,p_static_id=>'roles'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-id-badge'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'15,16'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9285132969979529)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Statuses'
,p_static_id=>'statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:44:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-flag-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'44,45'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9263549567971550)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Tasks'
,p_static_id=>'tasks'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-check-square-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'42,43'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8635635848272211)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'User Accounts'
,p_static_id=>'user-accounts'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-user-circle-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17,18'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260809122141Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/files/custom_css
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '3A726F6F747B0D0A2020202020202D2D65662D616363656E743A233030373165333B0D0A20202020202020202D2D65662D616363656E742D323A233432613566663B0D0A202020202020202020202D2D65662D696E6B3A233164316431663B0D0A202020';
wwv_flow_imp.g_varchar2_table(2) := '2020202020202020202D2D65662D6D757465643A233665366537333B0D0A20202020202020202020202020202D2D65662D62673A236635663566373B0D0A202020202020202020202020202020202D2D65662D636172643A236666666666663B0D0A2020';
wwv_flow_imp.g_varchar2_table(3) := '202020202020202020202020202020202D2D65662D626F726465723A7267626128302C302C302C2E3036293B0D0A20202020202020202020202020202020202020202D2D65662D736861646F773A302032707820387078207267626128302C302C302C2E';
wwv_flow_imp.g_varchar2_table(4) := '3034292C203020313270782033327078202D31367078207267626128302C302C302C2E3132293B0D0A202020202020202020202020202020202020202020202D2D65662D7261646975733A313670783B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(5) := '202020207D0D0A0D0A20202020202020202020202020202020202020202020626F64792C202E742D426F64792C202E742D50616765426F64797B0D0A202020202020202020202020202020202020202020202020666F6E742D66616D696C793A2D617070';
wwv_flow_imp.g_varchar2_table(6) := '6C652D73797374656D2C426C696E6B4D616353797374656D466F6E742C2253462050726F20446973706C6179222C2253462050726F2054657874222C225365676F65205549222C526F626F746F2C48656C7665746963612C417269616C2C73616E732D73';
wwv_flow_imp.g_varchar2_table(7) := '657269662021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020206261636B67726F756E643A766172282D2D65662D6267292021696D706F7274616E743B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(8) := '202020202020202020636F6C6F723A766172282D2D65662D696E6B293B0D0A202020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202023745F426F64795F';
wwv_flow_imp.g_varchar2_table(9) := '6E61762C202E742D547265654E61767B0D0A2020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A233164316431662021696D706F7274616E743B0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(10) := '202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202E742D547265654E61762D636F6E74656E747B0D0A20202020202020202020202020202020202020202020202020202020202020206261636B';
wwv_flow_imp.g_varchar2_table(11) := '67726F756E643A7472616E73706172656E742021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202E';
wwv_flow_imp.g_varchar2_table(12) := '742D547265654E6176202E612D54726565566965772D636F6E74656E747B0D0A20202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A313070783B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(13) := '20202020202020202020202020202020202020202020206D617267696E3A32707820313070783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020207472616E736974696F6E3A6261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(14) := '202E31357320656173653B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202E742D547265654E';
wwv_flow_imp.g_varchar2_table(15) := '6176202E612D54726565566965772D6E6F64652E69732D73656C6563746564203E202E612D54726565566965772D636F6E74656E747B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B';
wwv_flow_imp.g_varchar2_table(16) := '67726F756E643A766172282D2D65662D616363656E74292021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(17) := '20202020202020202020202020202020202020202E742D547265654E6176202E612D54726565566965772D636F6E74656E743A686F7665727B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(18) := '206261636B67726F756E643A72676261283235352C3235352C3235352C2E3038292021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(19) := '202020202020202020202020202020202020202020202020202020202020202020202E742D547265654E6176202E612D54726565566965772D6C6162656C7B0D0A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(20) := '202020202020202020666F6E742D7765696768743A3530303B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C65747465722D73706163696E673A2D302E3031656D3B0D0A2020';
wwv_flow_imp.g_varchar2_table(21) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202023745F4865';
wwv_flow_imp.g_varchar2_table(22) := '616465722C202E742D4865616465727B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A233164316431662021696D706F7274616E743B0D0A2020';
wwv_flow_imp.g_varchar2_table(23) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D626F74746F6D3A6E6F6E652021696D706F7274616E743B0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(24) := '2020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E742D426F64792D7469746C652C202E74';
wwv_flow_imp.g_varchar2_table(25) := '2D4865616465722D6272616E64696E67202E742D4865616465722D6C6F676F2D746578747B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D77656967';
wwv_flow_imp.g_varchar2_table(26) := '68743A3730303B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C65747465722D73706163696E673A2D302E3032656D3B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(27) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(28) := '202E742D426F64792D7469746C652D777261707B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A766172282D2D65662D6267';
wwv_flow_imp.g_varchar2_table(29) := '292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D626F74746F6D3A31707820736F6C696420766172';
wwv_flow_imp.g_varchar2_table(30) := '282D2D65662D626F72646572292021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(31) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202068312E742D426F64792D7469746C652C202E742D426F64792D7469746C652068317B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(32) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D73697A653A333270782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(33) := '2020202020202020202020202020202020202020202020202020202020202020666F6E742D7765696768743A3730302021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(34) := '202020202020202020202020202020202020202020202020206C65747465722D73706163696E673A2D302E3032656D2021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(35) := '202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D696E6B292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(36) := '20202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E742D';
wwv_flow_imp.g_varchar2_table(37) := '526567696F6E7B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A766172282D2D65662D';
wwv_flow_imp.g_varchar2_table(38) := '726164697573292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465723A3170';
wwv_flow_imp.g_varchar2_table(39) := '7820736F6C696420766172282D2D65662D626F72646572292021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(40) := '20202020202020202020626F782D736861646F773A766172282D2D65662D736861646F77292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(41) := '202020202020202020202020202020202020202020202020206F766572666C6F773A68696464656E3B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(42) := '20202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E742D526567';
wwv_flow_imp.g_varchar2_table(43) := '696F6E2D6865616465727B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A';
wwv_flow_imp.g_varchar2_table(44) := '766172282D2D65662D63617264292021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(45) := '202020202020626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D65662D626F72646572292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(46) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E673A3138707820323270782021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(47) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(48) := '202020202020202020202020202020202020202020202020202020202020202020202E742D526567696F6E2D7469746C657B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(49) := '20202020202020202020202020202020202020202020202020202020202020202020666F6E742D73697A653A313770782021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(50) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D7765696768743A3730302021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(51) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C65747465722D73706163696E673A2D302E3031656D2021696D706F7274616E743B0D0A202020';
wwv_flow_imp.g_varchar2_table(52) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D';
wwv_flow_imp.g_varchar2_table(53) := '696E6B292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(54) := '2020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E742D';
wwv_flow_imp.g_varchar2_table(55) := '526567696F6E2D626F64797B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(56) := '202020206261636B67726F756E643A766172282D2D65662D63617264292021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(57) := '2020202020202020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(58) := '202020202020202020202020202020202020202020202020202020202E742D427574746F6E7B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(59) := '2020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A313070782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(60) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D7765696768743A3530302021696D706F7274616E743B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(61) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C65747465722D73706163696E673A2D30';
wwv_flow_imp.g_varchar2_table(62) := '2E3031656D3B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(63) := '2020202020207472616E736974696F6E3A7472616E73666F726D202E31357320656173652C20626F782D736861646F77202E31357320656173652C206261636B67726F756E64202E31357320656173653B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(64) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465723A6E6F6E652021696D706F';
wwv_flow_imp.g_varchar2_table(65) := '7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(66) := '20202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(67) := '20202020202020202020202E742D427574746F6E2D2D686F747B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(68) := '2020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A766172282D2D65662D616363656E74292021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(69) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A3020327078203870782072676261';
wwv_flow_imp.g_varchar2_table(70) := '28302C3131332C3232372C2E3235293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(71) := '202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(72) := '20202020202020202020202020202020202020202020202020202020202E742D427574746F6E2D2D686F743A686F7665727B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(73) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A233030373765642021696D706F7274616E743B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(74) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472';
wwv_flow_imp.g_varchar2_table(75) := '616E73666F726D3A7472616E736C61746559282D317078293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(76) := '20202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A30203670782031367078207267626128302C3131332C3232372C2E3332293B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(77) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020';
wwv_flow_imp.g_varchar2_table(78) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(79) := '202020202E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D686F74293A686F7665727B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(80) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E73666F726D3A7472616E736C61746559282D317078293B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(81) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A0D0A';
wwv_flow_imp.g_varchar2_table(82) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(83) := '2020202020202020202020202E612D4952522D7461626C652C202E742D5265706F7274207461626C652C207461626C652E742D5265706F72747B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(84) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A313270783B0D0A2020202020';
wwv_flow_imp.g_varchar2_table(85) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(86) := '20202020202020202020206F766572666C6F773A68696464656E3B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(87) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(88) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E612D4952522D7461626C652074686561642074682C202E742D5265706F727420746865';
wwv_flow_imp.g_varchar2_table(89) := '61642074682C202E742D5265706F72742D7461626C654865616465727B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(90) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A236661666166612021696D706F7274616E743B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(91) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(92) := '20636F6C6F723A766172282D2D65662D6D75746564292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(93) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D7765696768743A3630302021696D706F7274616E743B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(94) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(95) := '2020202020202020202020746578742D7472616E73666F726D3A7570706572636173653B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(96) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D73697A653A313170782021696D706F7274616E743B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(97) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(98) := '20202020202020202020202020202020202020206C65747465722D73706163696E673A2E3034656D3B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(99) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D626F74746F6D3A31707820736F6C696420766172';
wwv_flow_imp.g_varchar2_table(100) := '282D2D65662D626F72646572292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(101) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(102) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E612D4952522D746162';
wwv_flow_imp.g_varchar2_table(103) := '6C652074626F64792074723A686F7665722C202E742D5265706F72742074626F64792074723A686F7665727B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(104) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A236637663966632021696D';
wwv_flow_imp.g_varchar2_table(105) := '706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(106) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(107) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E612D4952522D7461626C652074642C202E742D526570';
wwv_flow_imp.g_varchar2_table(108) := '6F72742074647B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(109) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D65662D626F72646572292021696D706F7274616E743B0D0A202020';
wwv_flow_imp.g_varchar2_table(110) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(111) := '20202020202020202020202020202020202020202020202020202020202020202070616464696E673A3132707820313670782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(112) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(113) := '7D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(114) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202E617065782D6974656D2D746578742C202E617065782D6974656D2D74657874617265612C202E617065782D6974656D2D73656C6563742C20696E';
wwv_flow_imp.g_varchar2_table(115) := '7075742E617065782D6974656D2D746578742C2073656C6563742E617065782D6974656D2D73656C6563747B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(116) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A3130';
wwv_flow_imp.g_varchar2_table(117) := '70782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(118) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465723A31707820736F6C6964207267626128302C302C302C2E3132292021696D706F7274616E743B';
wwv_flow_imp.g_varchar2_table(119) := '0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(120) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E673A3130707820313270782021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(121) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(122) := '202020202020202020202020202020202020207472616E736974696F6E3A626F726465722D636F6C6F72202E31357320656173652C20626F782D736861646F77202E31357320656173653B0D0A2020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(123) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(124) := '2020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(125) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E617065782D6974656D2D746578743A666F6375732C202E617065782D697465';
wwv_flow_imp.g_varchar2_table(126) := '6D2D74657874617265613A666F6375732C202E617065782D6974656D2D73656C6563743A666F6375737B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(127) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D636F6C';
wwv_flow_imp.g_varchar2_table(128) := '6F723A766172282D2D65662D616363656E74292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(129) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A3020302030203370';
wwv_flow_imp.g_varchar2_table(130) := '78207267626128302C3131332C3232372C2E3135292021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(131) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F75746C696E653A6E6F6E65202169';
wwv_flow_imp.g_varchar2_table(132) := '6D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(133) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(134) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(135) := '20202020202020202020202020202E742D466F726D2D6C6162656C436F6E7461696E6572206C6162656C7B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(136) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E';
wwv_flow_imp.g_varchar2_table(137) := '742D7765696768743A3530303B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(138) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D696E6B293B0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(139) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(140) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(141) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(142) := '202020202E742D42726561646372756D6220617B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(143) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D6D757465642920';
wwv_flow_imp.g_varchar2_table(144) := '21696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(145) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(146) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(147) := '202020202020202020202020202020202020202020202020202020202E742D42726561646372756D6220613A686F7665727B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(148) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(149) := '20202020202020202020636F6C6F723A766172282D2D65662D616363656E74292021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(150) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(151) := '202020207D0D0A0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(152) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203A3A2D7765626B69742D7363726F6C6C6261727B77696474683A313070783B6865';
wwv_flow_imp.g_varchar2_table(153) := '696768743A313070783B7D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(154) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203A3A2D7765626B69742D7363726F6C6C6261722D7468756D627B626163';
wwv_flow_imp.g_varchar2_table(155) := '6B67726F756E643A7267626128302C302C302C2E3138293B626F726465722D7261646975733A3870783B7D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(156) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(157) := '2020203A3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F7665727B6261636B67726F756E643A7267626128302C302C302C2E33293B7D0D0A202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(158) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(159) := '202020202020202020202020202020202020202020200D0A7D0D0A0D0A2F2A204669782069636F6E2D707265666978656420696E70757473206C6F73696E67207468656972207265736572766564206C6566742070616464696E67202A2F0D0A2E617065';
wwv_flow_imp.g_varchar2_table(160) := '782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578747B0D0A202070616464696E672D6C6566743A343470782021696D706F7274616E743B0D0A20207D0D0A0D0A20202F2A203D3D3D3D3D204C6F67696E207061676520E280942064';
wwv_flow_imp.g_varchar2_table(161) := '61726B2C204170706C652D696E737069726564203D3D3D3D3D202A2F0D0A2020626F64792E742D50616765426F64792D2D6C6F67696E7B0D0A202020206261636B67726F756E643A72616469616C2D6772616469656E7428636972636C65206174203230';
wwv_flow_imp.g_varchar2_table(162) := '25203230252C20233163316331652030252C2023303030303030203535252C20233030303030302031303025292021696D706F7274616E743B0D0A2020202020206D696E2D6865696768743A31303076683B0D0A2020202020207D0D0A20202020202062';
wwv_flow_imp.g_varchar2_table(163) := '6F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D636F6E7461696E6572426F64797B0D0A2020202020202020646973706C61793A666C65783B0D0A20202020202020202020616C69676E2D6974656D733A63656E7465723B0D';
wwv_flow_imp.g_varchar2_table(164) := '0A2020202020202020202020206A7573746966792D636F6E74656E743A63656E7465723B0D0A20202020202020202020202020206D696E2D6865696768743A31303076683B0D0A20202020202020202020202020207D0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(165) := '2020626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D726567696F6E7B0D0A202020202020202020202020202020206261636B67726F756E643A72676261283235352C3235352C3235352C2E3036292021696D706F727461';
wwv_flow_imp.g_varchar2_table(166) := '6E743B0D0A2020202020202020202020202020202020206261636B64726F702D66696C7465723A626C75722832347078293B0D0A20202020202020202020202020202020202020202D7765626B69742D6261636B64726F702D66696C7465723A626C7572';
wwv_flow_imp.g_varchar2_table(167) := '2832347078293B0D0A20202020202020202020202020202020202020202020626F726465723A31707820736F6C69642072676261283235352C3235352C3235352C2E3130292021696D706F7274616E743B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(168) := '20202020202020626F726465722D7261646975733A323470782021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020626F782D736861646F773A3020323470782038307078207267626128302C302C302C2E';
wwv_flow_imp.g_varchar2_table(169) := '3535292C20302032707820387078207267626128302C302C302C2E33292021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202070616464696E673A3434707820343070782021696D706F7274616E743B';
wwv_flow_imp.g_varchar2_table(170) := '0D0A20202020202020202020202020202020202020202020202020202020202077696474683A34303070783B0D0A20202020202020202020202020202020202020202020202020202020202020206D61782D77696474683A393276773B0D0A2020202020';
wwv_flow_imp.g_varchar2_table(171) := '2020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D6C6F676F7B0D';
wwv_flow_imp.g_varchar2_table(172) := '0A2020202020202020202020202020202020202020202020202020202020202020202066696C7465723A64726F702D736861646F772830203870782032347078207267626128302C3131332C3232372C2E333529293B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(173) := '202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D7469746C657B0D0A20';
wwv_flow_imp.g_varchar2_table(174) := '2020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A236635663566372021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(175) := '666F6E742D73697A653A323670782021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D7765696768743A3730302021696D706F7274616E743B0D0A202020';
wwv_flow_imp.g_varchar2_table(176) := '2020202020202020202020202020202020202020202020202020202020202020202020202020206C65747465722D73706163696E673A2D302E3032656D2021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(177) := '20202020202020202020202020202020202020746578742D616C69676E3A63656E7465723B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(178) := '202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D466F726D2D6C6162656C436F6E7461696E6572206C6162656C7B0D0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(179) := '202020202020202020202020202020202020202020202020202020202020636F6C6F723A236131613161362021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(180) := '2020202020666F6E742D7765696768743A3530303B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D73697A653A313370783B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(181) := '202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D';
wwv_flow_imp.g_varchar2_table(182) := '50616765426F64792D2D6C6F67696E202E617065782D6974656D2D746578742C0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D';
wwv_flow_imp.g_varchar2_table(183) := '2D6C6F67696E20696E7075742E617065782D6974656D2D746578747B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A72676261283235';
wwv_flow_imp.g_varchar2_table(184) := '352C3235352C3235352C2E3036292021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465723A31707820736F6C69642072';
wwv_flow_imp.g_varchar2_table(185) := '676261283235352C3235352C3235352C2E3134292021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A23663566';
wwv_flow_imp.g_varchar2_table(186) := '3566372021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A313270782021696D706F72';
wwv_flow_imp.g_varchar2_table(187) := '74616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(188) := '2020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D746578743A3A706C616365686F6C6465727B0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(189) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A233665366537332021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(190) := '2020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D506167';
wwv_flow_imp.g_varchar2_table(191) := '65426F64792D2D6C6F67696E202E617065782D6974656D2D746578743A666F6375737B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202062';
wwv_flow_imp.g_varchar2_table(192) := '6F726465722D636F6C6F723A766172282D2D65662D616363656E74292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(193) := '202020202020626F782D736861646F773A302030203020337078207267626128302C3131332C3232372C2E3238292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(194) := '20202020202020202020202020202020202020202020202020206261636B67726F756E643A72676261283235352C3235352C3235352C2E3039292021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(195) := '20202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(196) := '20202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E612D49636F6E2C20626F64792E742D50616765426F64792D2D6C6F67696E202E742D49636F6E7B0D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(197) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A233865386539332021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(198) := '20202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(199) := '202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D427574746F6E2D2D686F747B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(200) := '2020202020202020202020202020202077696474683A313030253B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(201) := '2070616464696E673A313370782021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(202) := '20666F6E742D73697A653A313570782021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(203) := '2020202020626F726465722D7261646975733A313270782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(204) := '2020202020202020202020202020206261636B67726F756E643A766172282D2D65662D616363656E74292021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(205) := '202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A30203470782031367078207267626128302C3131332C3232372C2E34292021696D706F7274616E743B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(206) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(207) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D427574746F6E2D2D686F743A686F7665727B0D0A20';
wwv_flow_imp.g_varchar2_table(208) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A2330303737656420';
wwv_flow_imp.g_varchar2_table(209) := '21696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020747261';
wwv_flow_imp.g_varchar2_table(210) := '6E73666F726D3A7472616E736C61746559282D317078293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(211) := '202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64';
wwv_flow_imp.g_varchar2_table(212) := '792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D616374696F6E7320612C0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(213) := '20202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E20617B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(214) := '2020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A236131613161362021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(215) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(216) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D616374696F6E7320613A686F7665722C0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(217) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E2061';
wwv_flow_imp.g_varchar2_table(218) := '3A686F7665727B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C';
wwv_flow_imp.g_varchar2_table(219) := '6F723A233432613566662021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(220) := '2020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(221) := '202020626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D73696E676C652D636865636B626F78206C6162656C7B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(222) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A236131613161362021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(223) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(224) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(225) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E617065782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578742C20696E7075742E617065';
wwv_flow_imp.g_varchar2_table(226) := '782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578747B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(227) := '2020202020202020202020202020202020202020202020202070616464696E672D746F703A313070782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(228) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D72696768743A313270782021696D706F7274616E743B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(229) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D626F74746F6D3A313070782021696D';
wwv_flow_imp.g_varchar2_table(230) := '706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(231) := '202020202020202070616464696E672D6C6566743A343470782021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(232) := '202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(233) := '2020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578747B0D0A2020';
wwv_flow_imp.g_varchar2_table(234) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207061';
wwv_flow_imp.g_varchar2_table(235) := '6464696E672D746F703A313270782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(236) := '20202020202020202020202020202020202020202020202020202020202070616464696E672D72696768743A313470782021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(237) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D626F74746F6D3A313270782021696D706F7274616E743B0D0A20';
wwv_flow_imp.g_varchar2_table(238) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(239) := '202020202070616464696E672D6C6566743A343670782021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(240) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(241) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200D0A0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(242) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2A20556E69667920757365726E616D652F70617373776F7264206669656C642076697375616C';
wwv_flow_imp.g_varchar2_table(243) := '20776964746820E280942070617373776F726420777261707065722063617272696573207468650D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(244) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E642F626F726465722C2074686520696E70757420697473656C6620676F657320626F726465726C6573';
wwv_flow_imp.g_varchar2_table(245) := '7320736F20697420616E64207468650D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(246) := '202020202020202020202020202020202020202020202020202020202073686F772F6869646520746F67676C652072656164206173206F6E65207365616D6C6573732070696C6C206D61746368696E672074686520757365726E616D65206669656C6420';
wwv_flow_imp.g_varchar2_table(247) := '2A2F0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(248) := '20202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D67726F75702D2D70617373776F72647B0D0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(249) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A72676261283235';
wwv_flow_imp.g_varchar2_table(250) := '352C3235352C3235352C2E3036292021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(251) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465723A31707820736F6C69642072676261283235352C3235352C3235352C2E3134292021696D706F7274616E743B0D0A20202020';
wwv_flow_imp.g_varchar2_table(252) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(253) := '2020202020202020202020202020626F726465722D7261646975733A313270782021696D706F7274616E743B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(254) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A666C65782021696D706F7274616E743B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(255) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(256) := '2020202020202020202020202020616C69676E2D6974656D733A63656E7465723B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(257) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(258) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C';
wwv_flow_imp.g_varchar2_table(259) := '6F67696E202E617065782D6974656D2D67726F75702D2D70617373776F72643A666F6375732D77697468696E7B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(260) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D636F6C6F723A766172282D2D65662D616363656E7429';
wwv_flow_imp.g_varchar2_table(261) := '2021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(262) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A302030203020337078207267626128302C3131332C3232372C2E3238292021696D706F7274616E743B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(263) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(264) := '20202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(265) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D67726F75702D2D70617373776F7264202E';
wwv_flow_imp.g_varchar2_table(266) := '617065782D6974656D2D746578747B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(267) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A7472616E73706172656E742021696D706F7274616E743B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(268) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(269) := '2020202020202020202020626F726465723A6E6F6E652021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(270) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A6E6F6E652021696D706F7274616E743B0D0A202020';
wwv_flow_imp.g_varchar2_table(271) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(272) := '20202020202020202020202020202020202020202020202020202020202020666C65783A313B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(273) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(274) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(275) := '2020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D67726F75702D2D70617373776F7264202E742D427574746F6E2D2D70617373776F72645669736962696C6974797B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(276) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(277) := '2020202020202020202020202020202020202020202020202020202020636F6C6F723A233865386539332021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(278) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B6772';
wwv_flow_imp.g_varchar2_table(279) := '6F756E643A7472616E73706172656E742021696D706F7274616E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(280) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(281) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(282) := '2020202020202020200D0A0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(283) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2A205265706C6163652064656661756C7420726F636B6574206170702D69636F6E206F6E20746865206C6F67696E2073';
wwv_flow_imp.g_varchar2_table(284) := '637265656E20776974682074686520456E7465727072697365466C6F77206D61726B202A2F0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(285) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E20';
wwv_flow_imp.g_varchar2_table(286) := '2E742D4C6F67696E2D6C6F676F7B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(287) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A6E6F6E652021696D706F7274616E743B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(288) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(289) := '202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(290) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D686561';
wwv_flow_imp.g_varchar2_table(291) := '6465727B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(292) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706F736974696F6E3A72656C61746976653B0D0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(293) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(294) := '20202020202020202020202070616464696E672D746F703A393670783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(295) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(296) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(297) := '20202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D6865616465723A3A6265666F72657B0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(298) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(299) := '2020202020202020202020202020202020636F6E74656E743A22223B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(300) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706F736974696F6E3A6162736F6C7574653B0D0A2020';
wwv_flow_imp.g_varchar2_table(301) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(302) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020746F703A303B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(303) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(304) := '20202020202020206C6566743A3530253B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(305) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E73666F726D3A7472616E736C61746558282D353025293B';
wwv_flow_imp.g_varchar2_table(306) := '0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(307) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202077696474683A373270783B0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(308) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(309) := '20202020202020202020202020202020202020202020202020202020206865696768743A373270783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(310) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(311) := '202020626F726465722D7261646975733A323070783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(312) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A6C696E';
wwv_flow_imp.g_varchar2_table(313) := '6561722D6772616469656E74283133356465672C233432613566662C23303037316533293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(314) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(315) := '202020626F782D736861646F773A30203870782032347078207267626128302C3131332C3232372C2E3335293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(316) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(317) := '20202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(318) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F64792E742D50616765426F64792D2D6C6F67696E';
wwv_flow_imp.g_varchar2_table(319) := '202E742D4C6F67696E2D6865616465723A3A61667465727B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(320) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6E74656E743A';
wwv_flow_imp.g_varchar2_table(321) := '22223B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(322) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706F736974696F6E3A6162736F6C7574653B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(323) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(324) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020746F703A323370783B0D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(325) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(326) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C6566743A3530253B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(327) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(328) := '202020202020202020202020202020202020202020202020202020202020207472616E73666F726D3A7472616E736C61746558282D353025293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(329) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(330) := '20202020202020202020202020202020202020202020202020202020202020202020202077696474683A343070783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(331) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(332) := '2020202020202020202020202020202020202020202020202020206865696768743A323770783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(333) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(334) := '2020202020202020202020202020202020202020206261636B67726F756E642D7265706561743A6E6F2D7265706561743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(335) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(336) := '2020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E642D73697A653A636F6E7461696E3B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(337) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(338) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E642D696D6167653A75726C2822646174613A696D6167652F7376672B786D6C2C25334373766720786D6C6E733D276874';
wwv_flow_imp.g_varchar2_table(339) := '74703A2F2F7777772E77332E6F72672F323030302F737667272076696577426F783D2730203020343820333227253345253343636972636C652063783D273136272063793D2731362720723D273131272066696C6C3D276E6F6E6527207374726F6B653D';
wwv_flow_imp.g_varchar2_table(340) := '27776869746527207374726F6B652D77696474683D2735272F253345253343636972636C652063783D273332272063793D2731362720723D273131272066696C6C3D276E6F6E6527207374726F6B653D27776869746527207374726F6B652D7769647468';
wwv_flow_imp.g_varchar2_table(341) := '3D2735272F2533452533432F73766725334522293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(342) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(343) := '202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(344) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200D0A0D0A2020';
wwv_flow_imp.g_varchar2_table(345) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(346) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2A20414920436861742070616765202A2F';
wwv_flow_imp.g_varchar2_table(347) := '0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(348) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861747B0D0A202020';
wwv_flow_imp.g_varchar2_table(349) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(350) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A666C65783B0D0A20202020';
wwv_flow_imp.g_varchar2_table(351) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(352) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666C65782D646972656374696F6E3A636F6C756D';
wwv_flow_imp.g_varchar2_table(353) := '6E3B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(354) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743A63616C6328';
wwv_flow_imp.g_varchar2_table(355) := '3130307668202D203232307078293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(356) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(357) := '206D696E2D6865696768743A35323070783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(358) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(359) := '202020206261636B67726F756E643A766172282D2D65662D63617264293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(360) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(361) := '20202020202020202020202020202020626F726465723A31707820736F6C696420766172282D2D65662D626F72646572293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(362) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(363) := '202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A766172282D2D65662D726164697573293B0D0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(364) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(365) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A766172282D2D65662D736861646F77293B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(366) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(367) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F766572666C6F773A68696464656E3B0D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(368) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(369) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(370) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(371) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861742D6865616465727B0D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(372) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(373) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A666C65783B0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(374) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(375) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616C69676E2D6974656D733A63656E7465723B0D0A20202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(376) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(377) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206761703A313270783B0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(378) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(379) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D746F703A313670783B0D0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(380) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(381) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D72696768743A323070783B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(382) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(383) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D626F74746F6D3A313670783B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(384) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(385) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D6C6566743A323070783B0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(386) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(387) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D626F74746F6D3A31707820736F6C69642076';
wwv_flow_imp.g_varchar2_table(388) := '6172282D2D65662D626F72646572293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(389) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(390) := '20206261636B67726F756E643A766172282D2D65662D63617264293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(391) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(392) := '20202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(393) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(394) := '202E65662D636861742D6865616465722D69636F6E7B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(395) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(396) := '202020202020202077696474683A333670783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(397) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(398) := '20202020206865696768743A333670783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(399) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(400) := '202020626F726465722D7261646975733A313170783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(401) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(402) := '2020202020202020646973706C61793A666C65783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(403) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(404) := '20202020202020616C69676E2D6974656D733A63656E7465723B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(405) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(406) := '2020202020202020202020206A7573746966792D636F6E74656E743A63656E7465723B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(407) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(408) := '2020202020202020202020202020202020202020206261636B67726F756E643A6C696E6561722D6772616469656E74283133356465672C766172282D2D65662D616363656E742D32292C766172282D2D65662D616363656E7429293B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(409) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(410) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A3020347078203130707820';
wwv_flow_imp.g_varchar2_table(411) := '7267626128302C3131332C3232372C2E3238293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(412) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(413) := '202020202020666C65782D736872696E6B3A303B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(414) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(415) := '2020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(416) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861';
wwv_flow_imp.g_varchar2_table(417) := '742D6865616465722D746578747B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(418) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(419) := '646973706C61793A666C65783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(420) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202066';
wwv_flow_imp.g_varchar2_table(421) := '6C65782D646972656374696F6E3A636F6C756D6E3B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(422) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(423) := '202020202020206C696E652D6865696768743A312E32353B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(424) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(425) := '202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(426) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E6566';
wwv_flow_imp.g_varchar2_table(427) := '2D636861742D7469746C657B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(428) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F';
wwv_flow_imp.g_varchar2_table(429) := '6E742D7765696768743A3730303B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(430) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(431) := '666F6E742D73697A653A313570783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(432) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(433) := '206C65747465722D73706163696E673A2D302E3031656D3B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(434) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(435) := '20202020202020202020636F6C6F723A766172282D2D65662D696E6B293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(436) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(437) := '202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(438) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(439) := '2020202E65662D636861742D7375627B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(440) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(441) := '2020666F6E742D73697A653A313270783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(442) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(443) := '202020636F6C6F723A766172282D2D65662D6D75746564293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(444) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(445) := '20202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(446) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65';
wwv_flow_imp.g_varchar2_table(447) := '662D636861742D6E65777B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(448) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206D6172';
wwv_flow_imp.g_varchar2_table(449) := '67696E2D6C6566743A6175746F3B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(450) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(451) := '626F726465723A31707820736F6C696420766172282D2D65662D626F72646572293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(452) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(453) := '20202020202020202020202020202020202020206261636B67726F756E643A766172282D2D65662D63617264293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(454) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(455) := '2020202020202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D6D75746564293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(456) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(457) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D73697A653A313270783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(458) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(459) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D7765696768743A3630303B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(460) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(461) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D746F703A3770783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(462) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(463) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D72696768743A313270783B0D0A20202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(464) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(465) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D626F74746F6D3A3770783B0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(466) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(467) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D6C6566743A313270783B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(468) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(469) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A323070783B0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(470) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(471) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020637572736F723A706F696E7465723B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(472) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(473) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E736974696F6E3A6261636B67726F756E64202E31357320656173652C636F6C';
wwv_flow_imp.g_varchar2_table(474) := '6F72202E31357320656173653B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(475) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D';
wwv_flow_imp.g_varchar2_table(476) := '0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(477) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861742D6E65773A68';
wwv_flow_imp.g_varchar2_table(478) := '6F7665727B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(479) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E';
wwv_flow_imp.g_varchar2_table(480) := '643A766172282D2D65662D6267293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(481) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(482) := '20636F6C6F723A766172282D2D65662D696E6B293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(483) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(484) := '202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(485) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D6368';
wwv_flow_imp.g_varchar2_table(486) := '61742D6C6F677B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(487) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666C65783A313B';
wwv_flow_imp.g_varchar2_table(488) := '0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(489) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F766572666C6F772D793A617574';
wwv_flow_imp.g_varchar2_table(490) := '6F3B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(491) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A666C6578';
wwv_flow_imp.g_varchar2_table(492) := '3B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(493) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666C65782D646972656374696F';
wwv_flow_imp.g_varchar2_table(494) := '6E3A636F6C756D6E3B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(495) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206761703A31';
wwv_flow_imp.g_varchar2_table(496) := '3470783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(497) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D746F';
wwv_flow_imp.g_varchar2_table(498) := '703A323270783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(499) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E67';
wwv_flow_imp.g_varchar2_table(500) := '2D72696768743A323470783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(501) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207061';
wwv_flow_imp.g_varchar2_table(502) := '6464696E672D626F74746F6D3A323270783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(503) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(504) := '2020202070616464696E672D6C6566743A323470783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(505) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(506) := '20202020202020206261636B67726F756E643A766172282D2D65662D6267293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(507) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(508) := '2020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(509) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(510) := '20202020202E65662D6D73677B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(511) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206D';
wwv_flow_imp.g_varchar2_table(512) := '61782D77696474683A3732253B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(513) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070';
wwv_flow_imp.g_varchar2_table(514) := '616464696E672D746F703A313170783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(515) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(516) := '202070616464696E672D72696768743A313570783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(517) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(518) := '2020202020202070616464696E672D626F74746F6D3A313170783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(519) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(520) := '2020202020202020202020202070616464696E672D6C6566743A313570783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(521) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(522) := '2020202020202020202020202020202020626F726465722D7261646975733A313670783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(523) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(524) := '20202020202020202020202020202020202020202020666F6E742D73697A653A313470783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(525) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(526) := '20202020202020202020202020202020202020202020206C696E652D6865696768743A312E353B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(527) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(528) := '2020202020202020202020202020202020202020202020202077686974652D73706163653A7072652D777261703B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(529) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(530) := '2020202020202020202020202020202020202020202020202020202020202020776F72642D627265616B3A627265616B2D776F72643B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(531) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(532) := '202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(533) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(534) := '2020202020202020202020202020202020202020202020202020202E65662D6D73672D757365727B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(535) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(536) := '2020202020202020202020202020202020202020202020202020616C69676E2D73656C663A666C65782D656E643B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(537) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(538) := '20202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A6C696E6561722D6772616469656E74283133356465672C766172282D2D65662D616363656E742D32292C766172282D2D65662D616363656E74';
wwv_flow_imp.g_varchar2_table(539) := '29293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(540) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A2366666666';
wwv_flow_imp.g_varchar2_table(541) := '66663B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(542) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D626F7474';
wwv_flow_imp.g_varchar2_table(543) := '6F6D2D72696768742D7261646975733A3470783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(544) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(545) := '2020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(546) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D6D7367';
wwv_flow_imp.g_varchar2_table(547) := '2D617373697374616E747B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(548) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616C69';
wwv_flow_imp.g_varchar2_table(549) := '676E2D73656C663A666C65782D73746172743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(550) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(551) := '20202020206261636B67726F756E643A766172282D2D65662D63617264293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(552) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(553) := '2020202020202020202020202020202020636F6C6F723A766172282D2D65662D696E6B293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(554) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(555) := '2020202020202020202020202020202020202020202020626F726465723A31707820736F6C696420766172282D2D65662D626F72646572293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(556) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(557) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D626F74746F6D2D6C6566742D7261646975733A3470783B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(558) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(559) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(560) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(561) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D6D73672D617373697374616E742E65662D747970696E677B0D0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(562) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(563) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D6D75746564293B0D0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(564) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(565) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D7374796C653A6974616C69633B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(566) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(567) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(568) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(569) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861742D696E7075746261727B0D0A202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(570) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(571) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A666C65783B0D0A20202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(572) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(573) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616C69676E2D6974656D733A666C65782D656E643B0D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(574) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(575) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206761703A313070783B0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(576) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(577) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D746F703A313470783B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(578) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(579) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D72696768743A313670783B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(580) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(581) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D626F74746F6D3A313470783B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(582) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(583) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D6C6566743A313670783B0D0A2020';
wwv_flow_imp.g_varchar2_table(584) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(585) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D746F703A31707820736F6C';
wwv_flow_imp.g_varchar2_table(586) := '696420766172282D2D65662D626F72646572293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(587) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(588) := '2020202020206261636B67726F756E643A766172282D2D65662D63617264293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(589) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(590) := '2020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(591) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(592) := '20202020202E65662D636861742D74657874617265617B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(593) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(594) := '202020202020202020666C65783A313B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(595) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(596) := '2020726573697A653A6E6F6E653B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(597) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(598) := '6D61782D6865696768743A31343070783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(599) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(600) := '202020626F726465723A31707820736F6C6964207267626128302C302C302C2E3132293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(601) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(602) := '20202020202020202020202020202020202020202020626F726465722D7261646975733A313470783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(603) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(604) := '20202020202020202020202020202020202020202020202020202070616464696E672D746F703A313070783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(605) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(606) := '20202020202020202020202020202020202020202020202020202020202070616464696E672D72696768743A313470783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(607) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(608) := '202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D626F74746F6D3A313070783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(609) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(610) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202070616464696E672D6C6566743A313470783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(611) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(612) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D73697A653A313470783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(613) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(614) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666F6E742D66616D696C793A696E68657269743B0D0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(615) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(616) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C696E652D6865696768743A312E343B0D0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(617) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(618) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D696E6B293B0D0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(619) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(620) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A766172282D2D65662D6267293B0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(621) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(622) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(623) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(624) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861742D74657874617265613A666F6375737B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(625) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(626) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F75746C696E653A6E6F6E653B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(627) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(628) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D636F6C6F723A766172282D2D65662D616363656E74293B0D0A2020';
wwv_flow_imp.g_varchar2_table(629) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(630) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A30203020302033';
wwv_flow_imp.g_varchar2_table(631) := '7078207267626128302C3131332C3232372C2E3135293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(632) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(633) := '2020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(634) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D';
wwv_flow_imp.g_varchar2_table(635) := '636861742D73656E647B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(636) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202077696474';
wwv_flow_imp.g_varchar2_table(637) := '683A333870783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(638) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743A';
wwv_flow_imp.g_varchar2_table(639) := '333870783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(640) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261';
wwv_flow_imp.g_varchar2_table(641) := '646975733A3530253B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(642) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465';
wwv_flow_imp.g_varchar2_table(643) := '723A6E6F6E653B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(644) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020666C65782D7368';
wwv_flow_imp.g_varchar2_table(645) := '72696E6B3A303B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(646) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C6179';
wwv_flow_imp.g_varchar2_table(647) := '3A666C65783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(648) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616C69676E2D6974';
wwv_flow_imp.g_varchar2_table(649) := '656D733A63656E7465723B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(650) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206A7573';
wwv_flow_imp.g_varchar2_table(651) := '746966792D636F6E74656E743A63656E7465723B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(652) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(653) := '2020202020206261636B67726F756E643A766172282D2D65662D616363656E74293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(654) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(655) := '2020202020202020202020202020202020202020637572736F723A706F696E7465723B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(656) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(657) := '2020202020202020202020202020202020202020207472616E736974696F6E3A6261636B67726F756E64202E31357320656173652C7472616E73666F726D202E31357320656173653B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(658) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(659) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(660) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(661) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861742D73656E643A686F7665727B0D0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(662) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(663) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A233030373765643B0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(664) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(665) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E73666F726D3A7472616E736C61746559282D317078293B0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(666) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(667) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(668) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(669) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861742D73656E643A64697361626C65647B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(670) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(671) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F7061636974793A2E34353B0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(672) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(673) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020637572736F723A64656661756C743B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(674) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(675) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E73666F726D3A6E6F6E653B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(676) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(677) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(678) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(679) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D636861742D74657874617265613A64697361626C65647B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(680) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(681) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F7061636974793A2E363B0D0A202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(682) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(683) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(684) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(685) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2A20476C6F62616C20666C6F6174696E67204149206368617420776964676574202A2F0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(686) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(687) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D726F6F747B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(688) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(689) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706F736974696F6E3A66697865643B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(690) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(691) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202072696768743A323470783B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(692) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(693) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F74746F6D3A323470783B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(694) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(695) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207A2D696E6465783A393939393B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(696) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(697) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(698) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(699) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D627562626C657B0D0A20202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(700) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(701) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202077696474683A353870783B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(702) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(703) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743A353870783B0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(704) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(705) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975733A3530253B0D0A2020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(706) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(707) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465723A6E6F6E653B0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(708) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(709) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A666C65783B0D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(710) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(711) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020616C69676E2D6974656D733A63656E7465723B0D0A202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(712) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(713) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206A7573746966792D636F6E74656E743A63656E7465723B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(714) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(715) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A6C696E6561722D6772616469656E742831';
wwv_flow_imp.g_varchar2_table(716) := '33356465672C766172282D2D65662D616363656E742D32292C766172282D2D65662D616363656E7429293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(717) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(718) := '2020202020202020202020202020202020202020202020202020202020626F782D736861646F773A30203870782032347078207267626128302C3131332C3232372C2E3335293B0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(719) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(720) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020637572736F723A706F696E7465723B0D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(721) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(722) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E736974696F6E3A7472616E73666F726D202E31387320656173652C6F706163697479202E3138';
wwv_flow_imp.g_varchar2_table(723) := '7320656173653B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(724) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020';
wwv_flow_imp.g_varchar2_table(725) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(726) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D627562626C653A686F';
wwv_flow_imp.g_varchar2_table(727) := '7665727B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(728) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(729) := '7363616C6528312E3036293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(730) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D';
wwv_flow_imp.g_varchar2_table(731) := '0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(732) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D62756262';
wwv_flow_imp.g_varchar2_table(733) := '6C652D68696464656E7B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(734) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F706163';
wwv_flow_imp.g_varchar2_table(735) := '6974793A303B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(736) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E73666F72';
wwv_flow_imp.g_varchar2_table(737) := '6D3A7363616C652830293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(738) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706F69';
wwv_flow_imp.g_varchar2_table(739) := '6E7465722D6576656E74733A6E6F6E653B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(740) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(741) := '2020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(742) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D776964676574';
wwv_flow_imp.g_varchar2_table(743) := '2D70616E656C7B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(744) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706F736974696F';
wwv_flow_imp.g_varchar2_table(745) := '6E3A66697865643B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(746) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202072696768743A';
wwv_flow_imp.g_varchar2_table(747) := '323470783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(748) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F74746F6D3A3234';
wwv_flow_imp.g_varchar2_table(749) := '70783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(750) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202077696474683A3338307078';
wwv_flow_imp.g_varchar2_table(751) := '3B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(752) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743A35363070783B';
wwv_flow_imp.g_varchar2_table(753) := '0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(754) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206D61782D6865696768743A63616C';
wwv_flow_imp.g_varchar2_table(755) := '63283130307668202D2034387078293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(756) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(757) := '20207472616E73666F726D3A7363616C6528302E3835293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(758) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(759) := '202020202020202020207472616E73666F726D2D6F726967696E3A626F74746F6D2072696768743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(760) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(761) := '20202020202020202020202020202020202020202020202020206F7061636974793A303B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(762) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(763) := '20202020202020202020202020202020202020202020706F696E7465722D6576656E74733A6E6F6E653B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(764) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(765) := '202020202020202020202020202020202020202020202020202020207472616E736974696F6E3A7472616E73666F726D202E31387320656173652C6F706163697479202E31387320656173653B0D0A202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(766) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(767) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F782D736861646F773A3020323070782036307078207267626128302C302C302C2E3232';
wwv_flow_imp.g_varchar2_table(768) := '293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(769) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(770) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(771) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D70616E656C2E65662D7769646765';
wwv_flow_imp.g_varchar2_table(772) := '742D6F70656E7B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(773) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206F706163697479';
wwv_flow_imp.g_varchar2_table(774) := '3A313B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(775) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207472616E73666F726D3A73';
wwv_flow_imp.g_varchar2_table(776) := '63616C652831293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(777) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020706F696E7465';
wwv_flow_imp.g_varchar2_table(778) := '722D6576656E74733A6175746F3B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(779) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(780) := '7D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(781) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D636C';
wwv_flow_imp.g_varchar2_table(782) := '6F73657B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(783) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206D617267696E2D6C6566';
wwv_flow_imp.g_varchar2_table(784) := '743A6175746F3B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(785) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202077696474683A32';
wwv_flow_imp.g_varchar2_table(786) := '3870783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(787) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743A323870';
wwv_flow_imp.g_varchar2_table(788) := '783B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(789) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465722D7261646975';
wwv_flow_imp.g_varchar2_table(790) := '733A3530253B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(791) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F726465723A6E';
wwv_flow_imp.g_varchar2_table(792) := '6F6E653B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(793) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(794) := '3A7472616E73706172656E743B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(795) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202063';
wwv_flow_imp.g_varchar2_table(796) := '6F6C6F723A766172282D2D65662D6D75746564293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(797) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(798) := '20202020202020666F6E742D73697A653A323070783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(799) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(800) := '20202020202020206C696E652D6865696768743A313B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(801) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(802) := '2020202020202020637572736F723A706F696E7465723B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(803) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(804) := '2020202020202020207472616E736974696F6E3A6261636B67726F756E64202E31357320656173652C636F6C6F72202E31357320656173653B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(805) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(806) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(807) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(808) := '2020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D636C6F73653A686F7665727B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(809) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(810) := '2020202020202020202020202020202020202020202020202020202020202020202020202020206261636B67726F756E643A766172282D2D65662D6267293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(811) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(812) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020636F6C6F723A766172282D2D65662D696E6B293B0D0A2020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(813) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(814) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(815) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(816) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020406D6564696120286D61782D77696474683A3438307078297B0D0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(817) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(818) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D70616E656C7B0D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(819) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(820) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202072696768743A313270783B0D0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(821) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(822) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F74746F6D3A313270783B0D0A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(823) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(824) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C6566743A313270783B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(825) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(826) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202077696474683A6175746F3B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(827) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(828) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020206865696768743A63616C63283130307668202D2039367078293B0D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(829) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(830) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(831) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(832) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E65662D7769646765742D627562626C657B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(833) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(834) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202072696768743A3870783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(835) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(836) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020626F74746F6D3A3870783B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(837) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(838) := '202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(839) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(840) := '2020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(841) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(842) := '202020202020202020202020202020202F2A2044617368626F61726420706167653A206869646520726564756E64616E7420706167652D7469746C652068656164696E6720286865726F20616C72656164792073686F77732077656C636F6D6529202A2F';
wwv_flow_imp.g_varchar2_table(843) := '0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(844) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E706167652D3438202E742D4272';
wwv_flow_imp.g_varchar2_table(845) := '6561646372756D622D6C6162656C7B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(846) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(847) := '20646973706C61793A6E6F6E653B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(848) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(849) := '7D0D0A0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(850) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202E706167652D3438202E74';
wwv_flow_imp.g_varchar2_table(851) := '2D42726561646372756D62526567696F6E2D2D75736542726561646372756D625469746C65202E742D42726561646372756D622D6974656D3A6C6173742D6368696C64202E742D42726561646372756D622D6C6162656C7B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(852) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(853) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020646973706C61793A6E6F6E652021696D706F7274616E743B0D0A';
wwv_flow_imp.g_varchar2_table(854) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(855) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A0D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(856) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(857) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202F2A20436F6C6C617073652074686520656D70747920706167652D';
wwv_flow_imp.g_varchar2_table(858) := '7469746C652F62726561646372756D62206261722073686F776E206F6E206576657279207061676520287469746C6520262062726561646372756D622074657874206172652068696464656E206279207468656D652C206275742074686520726567696F';
wwv_flow_imp.g_varchar2_table(859) := '6E207374696C6C2072657365727665642068656967687429202A2F0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(860) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(861) := '2020202020202020202020202023745F426F64795F7469746C657B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(862) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(863) := '202020202020202020202020202020646973706C61793A6E6F6E652021696D706F7274616E743B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(864) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(865) := '2020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(866) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(867) := '202020202020202020202020202020200D0A0D0A2F2A2046697820666C6F6174696E672D6C6162656C206F7665726C6170206F6E206564697420666F726D733A206669656C6473207769746820616E206578697374696E672076616C75650D0A20202028';
wwv_flow_imp.g_varchar2_table(868) := '2E6A732D73686F772D6C6162656C202F202E69732D6163746976652920646F6E2774207265736572766520656E6F75676820746F702070616464696E6720666F72207468650D0A202020736872756E6B206C6162656C2C20736F20746865206C6162656C';
wwv_flow_imp.g_varchar2_table(869) := '20746578742076697375616C6C7920636F6C6C696465732077697468207468652076616C756520746578742E202A2F0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E6A732D73686F772D6C6162656C';
wwv_flow_imp.g_varchar2_table(870) := '202E742D466F726D2D696E707574436F6E7461696E657220696E7075742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E69732D616374697665202E742D466F726D2D696E707574436F6E7461696E';
wwv_flow_imp.g_varchar2_table(871) := '657220696E7075742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E6A732D73686F772D6C6162656C202E742D466F726D2D696E707574436F6E7461696E65722073656C6563742C0D0A2E742D466F';
wwv_flow_imp.g_varchar2_table(872) := '726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E69732D616374697665202E742D466F726D2D696E707574436F6E7461696E65722073656C6563742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D66';
wwv_flow_imp.g_varchar2_table(873) := '6C6F6174696E674C6162656C2E6A732D73686F772D6C6162656C202E742D466F726D2D696E707574436F6E7461696E65722074657874617265612C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E69';
wwv_flow_imp.g_varchar2_table(874) := '732D616374697665202E742D466F726D2D696E707574436F6E7461696E65722074657874617265617B0D0A202070616464696E672D746F703A323070782021696D706F7274616E743B0D0A202070616464696E672D626F74746F6D3A3470782021696D70';
wwv_flow_imp.g_varchar2_table(875) := '6F7274616E743B0D0A7D0D0A';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(9407234001233939)
,p_file_name=>'custom.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260815095951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815095951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/custom_min_css
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '3A726F6F747B2D2D65662D616363656E743A233030373165333B2D2D65662D616363656E742D323A233432613566663B2D2D65662D696E6B3A233164316431663B2D2D65662D6D757465643A233665366537333B2D2D65662D62673A236635663566373B';
wwv_flow_imp.g_varchar2_table(2) := '2D2D65662D636172643A236666666666663B2D2D65662D626F726465723A7267626128302C302C302C2E3036293B2D2D65662D736861646F773A302032707820387078207267626128302C302C302C2E3034292C203020313270782033327078202D3136';
wwv_flow_imp.g_varchar2_table(3) := '7078207267626128302C302C302C2E3132293B2D2D65662D7261646975733A313670783B7D626F64792C202E742D426F64792C202E742D50616765426F64797B666F6E742D66616D696C793A2D6170706C652D73797374656D2C426C696E6B4D61635379';
wwv_flow_imp.g_varchar2_table(4) := '7374656D466F6E742C2253462050726F20446973706C6179222C2253462050726F2054657874222C225365676F65205549222C526F626F746F2C48656C7665746963612C417269616C2C73616E732D73657269662021696D706F7274616E743B6261636B';
wwv_flow_imp.g_varchar2_table(5) := '67726F756E643A766172282D2D65662D6267292021696D706F7274616E743B636F6C6F723A766172282D2D65662D696E6B293B7D23745F426F64795F6E61762C202E742D547265654E61767B6261636B67726F756E643A233164316431662021696D706F';
wwv_flow_imp.g_varchar2_table(6) := '7274616E743B7D2E742D547265654E61762D636F6E74656E747B6261636B67726F756E643A7472616E73706172656E742021696D706F7274616E743B7D2E742D547265654E6176202E612D54726565566965772D636F6E74656E747B626F726465722D72';
wwv_flow_imp.g_varchar2_table(7) := '61646975733A313070783B6D617267696E3A32707820313070783B7472616E736974696F6E3A6261636B67726F756E64202E31357320656173653B7D2E742D547265654E6176202E612D54726565566965772D6E6F64652E69732D73656C656374656420';
wwv_flow_imp.g_varchar2_table(8) := '3E202E612D54726565566965772D636F6E74656E747B6261636B67726F756E643A766172282D2D65662D616363656E74292021696D706F7274616E743B7D2E742D547265654E6176202E612D54726565566965772D636F6E74656E743A686F7665727B62';
wwv_flow_imp.g_varchar2_table(9) := '61636B67726F756E643A72676261283235352C3235352C3235352C2E3038292021696D706F7274616E743B7D2E742D547265654E6176202E612D54726565566965772D6C6162656C7B666F6E742D7765696768743A3530303B6C65747465722D73706163';
wwv_flow_imp.g_varchar2_table(10) := '696E673A2D302E3031656D3B7D23745F4865616465722C202E742D4865616465727B6261636B67726F756E643A233164316431662021696D706F7274616E743B626F726465722D626F74746F6D3A6E6F6E652021696D706F7274616E743B7D2E742D426F';
wwv_flow_imp.g_varchar2_table(11) := '64792D7469746C652C202E742D4865616465722D6272616E64696E67202E742D4865616465722D6C6F676F2D746578747B666F6E742D7765696768743A3730303B6C65747465722D73706163696E673A2D302E3032656D3B7D2E742D426F64792D746974';
wwv_flow_imp.g_varchar2_table(12) := '6C652D777261707B6261636B67726F756E643A766172282D2D65662D6267292021696D706F7274616E743B626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D65662D626F72646572292021696D706F7274616E743B7D68312E74';
wwv_flow_imp.g_varchar2_table(13) := '2D426F64792D7469746C652C202E742D426F64792D7469746C652068317B666F6E742D73697A653A333270782021696D706F7274616E743B666F6E742D7765696768743A3730302021696D706F7274616E743B6C65747465722D73706163696E673A2D30';
wwv_flow_imp.g_varchar2_table(14) := '2E3032656D2021696D706F7274616E743B636F6C6F723A766172282D2D65662D696E6B292021696D706F7274616E743B7D2E742D526567696F6E7B626F726465722D7261646975733A766172282D2D65662D726164697573292021696D706F7274616E74';
wwv_flow_imp.g_varchar2_table(15) := '3B626F726465723A31707820736F6C696420766172282D2D65662D626F72646572292021696D706F7274616E743B626F782D736861646F773A766172282D2D65662D736861646F77292021696D706F7274616E743B6F766572666C6F773A68696464656E';
wwv_flow_imp.g_varchar2_table(16) := '3B7D2E742D526567696F6E2D6865616465727B6261636B67726F756E643A766172282D2D65662D63617264292021696D706F7274616E743B626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D65662D626F72646572292021696D';
wwv_flow_imp.g_varchar2_table(17) := '706F7274616E743B70616464696E673A3138707820323270782021696D706F7274616E743B7D2E742D526567696F6E2D7469746C657B666F6E742D73697A653A313770782021696D706F7274616E743B666F6E742D7765696768743A3730302021696D70';
wwv_flow_imp.g_varchar2_table(18) := '6F7274616E743B6C65747465722D73706163696E673A2D302E3031656D2021696D706F7274616E743B636F6C6F723A766172282D2D65662D696E6B292021696D706F7274616E743B7D2E742D526567696F6E2D626F64797B6261636B67726F756E643A76';
wwv_flow_imp.g_varchar2_table(19) := '6172282D2D65662D63617264292021696D706F7274616E743B7D2E742D427574746F6E7B626F726465722D7261646975733A313070782021696D706F7274616E743B666F6E742D7765696768743A3530302021696D706F7274616E743B6C65747465722D';
wwv_flow_imp.g_varchar2_table(20) := '73706163696E673A2D302E3031656D3B7472616E736974696F6E3A7472616E73666F726D202E31357320656173652C20626F782D736861646F77202E31357320656173652C206261636B67726F756E64202E31357320656173653B626F726465723A6E6F';
wwv_flow_imp.g_varchar2_table(21) := '6E652021696D706F7274616E743B7D2E742D427574746F6E2D2D686F747B6261636B67726F756E643A766172282D2D65662D616363656E74292021696D706F7274616E743B626F782D736861646F773A302032707820387078207267626128302C313133';
wwv_flow_imp.g_varchar2_table(22) := '2C3232372C2E3235293B7D2E742D427574746F6E2D2D686F743A686F7665727B6261636B67726F756E643A233030373765642021696D706F7274616E743B7472616E73666F726D3A7472616E736C61746559282D317078293B626F782D736861646F773A';
wwv_flow_imp.g_varchar2_table(23) := '30203670782031367078207267626128302C3131332C3232372C2E3332293B7D2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D686F74293A686F7665727B7472616E73666F726D3A7472616E736C61746559282D317078293B7D2E612D49';
wwv_flow_imp.g_varchar2_table(24) := '52522D7461626C652C202E742D5265706F7274207461626C652C207461626C652E742D5265706F72747B626F726465722D7261646975733A313270783B6F766572666C6F773A68696464656E3B7D2E612D4952522D7461626C652074686561642074682C';
wwv_flow_imp.g_varchar2_table(25) := '202E742D5265706F72742074686561642074682C202E742D5265706F72742D7461626C654865616465727B6261636B67726F756E643A236661666166612021696D706F7274616E743B636F6C6F723A766172282D2D65662D6D75746564292021696D706F';
wwv_flow_imp.g_varchar2_table(26) := '7274616E743B666F6E742D7765696768743A3630302021696D706F7274616E743B746578742D7472616E73666F726D3A7570706572636173653B666F6E742D73697A653A313170782021696D706F7274616E743B6C65747465722D73706163696E673A2E';
wwv_flow_imp.g_varchar2_table(27) := '3034656D3B626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D65662D626F72646572292021696D706F7274616E743B7D2E612D4952522D7461626C652074626F64792074723A686F7665722C202E742D5265706F72742074626F';
wwv_flow_imp.g_varchar2_table(28) := '64792074723A686F7665727B6261636B67726F756E643A236637663966632021696D706F7274616E743B7D2E612D4952522D7461626C652074642C202E742D5265706F72742074647B626F726465722D626F74746F6D3A31707820736F6C696420766172';
wwv_flow_imp.g_varchar2_table(29) := '282D2D65662D626F72646572292021696D706F7274616E743B70616464696E673A3132707820313670782021696D706F7274616E743B7D2E617065782D6974656D2D746578742C202E617065782D6974656D2D74657874617265612C202E617065782D69';
wwv_flow_imp.g_varchar2_table(30) := '74656D2D73656C6563742C20696E7075742E617065782D6974656D2D746578742C2073656C6563742E617065782D6974656D2D73656C6563747B626F726465722D7261646975733A313070782021696D706F7274616E743B626F726465723A3170782073';
wwv_flow_imp.g_varchar2_table(31) := '6F6C6964207267626128302C302C302C2E3132292021696D706F7274616E743B70616464696E673A3130707820313270782021696D706F7274616E743B7472616E736974696F6E3A626F726465722D636F6C6F72202E31357320656173652C20626F782D';
wwv_flow_imp.g_varchar2_table(32) := '736861646F77202E31357320656173653B7D2E617065782D6974656D2D746578743A666F6375732C202E617065782D6974656D2D74657874617265613A666F6375732C202E617065782D6974656D2D73656C6563743A666F6375737B626F726465722D63';
wwv_flow_imp.g_varchar2_table(33) := '6F6C6F723A766172282D2D65662D616363656E74292021696D706F7274616E743B626F782D736861646F773A302030203020337078207267626128302C3131332C3232372C2E3135292021696D706F7274616E743B6F75746C696E653A6E6F6E65202169';
wwv_flow_imp.g_varchar2_table(34) := '6D706F7274616E743B7D2E742D466F726D2D6C6162656C436F6E7461696E6572206C6162656C7B666F6E742D7765696768743A3530303B636F6C6F723A766172282D2D65662D696E6B293B7D2E742D42726561646372756D6220617B636F6C6F723A7661';
wwv_flow_imp.g_varchar2_table(35) := '72282D2D65662D6D75746564292021696D706F7274616E743B7D2E742D42726561646372756D6220613A686F7665727B636F6C6F723A766172282D2D65662D616363656E74292021696D706F7274616E743B7D3A3A2D7765626B69742D7363726F6C6C62';
wwv_flow_imp.g_varchar2_table(36) := '61727B77696474683A313070783B6865696768743A313070783B7D3A3A2D7765626B69742D7363726F6C6C6261722D7468756D627B6261636B67726F756E643A7267626128302C302C302C2E3138293B626F726465722D7261646975733A3870783B7D3A';
wwv_flow_imp.g_varchar2_table(37) := '3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F7665727B6261636B67726F756E643A7267626128302C302C302C2E33293B7D7D2E617065782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578747B70616464696E';
wwv_flow_imp.g_varchar2_table(38) := '672D6C6566743A343470782021696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E7B6261636B67726F756E643A72616469616C2D6772616469656E7428636972636C6520617420323025203230252C2023316331633165';
wwv_flow_imp.g_varchar2_table(39) := '2030252C2023303030303030203535252C20233030303030302031303025292021696D706F7274616E743B6D696E2D6865696768743A31303076683B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D636F6E7461696E';
wwv_flow_imp.g_varchar2_table(40) := '6572426F64797B646973706C61793A666C65783B616C69676E2D6974656D733A63656E7465723B6A7573746966792D636F6E74656E743A63656E7465723B6D696E2D6865696768743A31303076683B7D626F64792E742D50616765426F64792D2D6C6F67';
wwv_flow_imp.g_varchar2_table(41) := '696E202E742D4C6F67696E2D726567696F6E7B6261636B67726F756E643A72676261283235352C3235352C3235352C2E3036292021696D706F7274616E743B6261636B64726F702D66696C7465723A626C75722832347078293B2D7765626B69742D6261';
wwv_flow_imp.g_varchar2_table(42) := '636B64726F702D66696C7465723A626C75722832347078293B626F726465723A31707820736F6C69642072676261283235352C3235352C3235352C2E3130292021696D706F7274616E743B626F726465722D7261646975733A323470782021696D706F72';
wwv_flow_imp.g_varchar2_table(43) := '74616E743B626F782D736861646F773A3020323470782038307078207267626128302C302C302C2E3535292C20302032707820387078207267626128302C302C302C2E33292021696D706F7274616E743B70616464696E673A3434707820343070782021';
wwv_flow_imp.g_varchar2_table(44) := '696D706F7274616E743B77696474683A34303070783B6D61782D77696474683A393276773B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D6C6F676F7B66696C7465723A64726F702D736861646F7728302038707820';
wwv_flow_imp.g_varchar2_table(45) := '32347078207267626128302C3131332C3232372C2E333529293B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D7469746C657B636F6C6F723A236635663566372021696D706F7274616E743B666F6E742D73697A653A';
wwv_flow_imp.g_varchar2_table(46) := '323670782021696D706F7274616E743B666F6E742D7765696768743A3730302021696D706F7274616E743B6C65747465722D73706163696E673A2D302E3032656D2021696D706F7274616E743B746578742D616C69676E3A63656E7465723B7D626F6479';
wwv_flow_imp.g_varchar2_table(47) := '2E742D50616765426F64792D2D6C6F67696E202E742D466F726D2D6C6162656C436F6E7461696E6572206C6162656C7B636F6C6F723A236131613161362021696D706F7274616E743B666F6E742D7765696768743A3530303B666F6E742D73697A653A31';
wwv_flow_imp.g_varchar2_table(48) := '3370783B7D626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D746578742C0D0A626F64792E742D50616765426F64792D2D6C6F67696E20696E7075742E617065782D6974656D2D746578747B6261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(49) := '3A72676261283235352C3235352C3235352C2E3036292021696D706F7274616E743B626F726465723A31707820736F6C69642072676261283235352C3235352C3235352C2E3134292021696D706F7274616E743B636F6C6F723A23663566356637202169';
wwv_flow_imp.g_varchar2_table(50) := '6D706F7274616E743B626F726465722D7261646975733A313270782021696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D746578743A3A706C616365686F6C6465727B636F6C6F723A2336';
wwv_flow_imp.g_varchar2_table(51) := '65366537332021696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D746578743A666F6375737B626F726465722D636F6C6F723A766172282D2D65662D616363656E74292021696D706F7274';
wwv_flow_imp.g_varchar2_table(52) := '616E743B626F782D736861646F773A302030203020337078207267626128302C3131332C3232372C2E3238292021696D706F7274616E743B6261636B67726F756E643A72676261283235352C3235352C3235352C2E3039292021696D706F7274616E743B';
wwv_flow_imp.g_varchar2_table(53) := '7D626F64792E742D50616765426F64792D2D6C6F67696E202E612D49636F6E2C20626F64792E742D50616765426F64792D2D6C6F67696E202E742D49636F6E7B636F6C6F723A233865386539332021696D706F7274616E743B7D626F64792E742D506167';
wwv_flow_imp.g_varchar2_table(54) := '65426F64792D2D6C6F67696E202E742D427574746F6E2D2D686F747B77696474683A313030253B70616464696E673A313370782021696D706F7274616E743B666F6E742D73697A653A313570782021696D706F7274616E743B626F726465722D72616469';
wwv_flow_imp.g_varchar2_table(55) := '75733A313270782021696D706F7274616E743B6261636B67726F756E643A766172282D2D65662D616363656E74292021696D706F7274616E743B626F782D736861646F773A30203470782031367078207267626128302C3131332C3232372C2E34292021';
wwv_flow_imp.g_varchar2_table(56) := '696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D427574746F6E2D2D686F743A686F7665727B6261636B67726F756E643A233030373765642021696D706F7274616E743B7472616E73666F726D3A7472616E73';
wwv_flow_imp.g_varchar2_table(57) := '6C61746559282D317078293B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D616374696F6E7320612C0D0A626F64792E742D50616765426F64792D2D6C6F67696E20617B636F6C6F723A236131613161362021696D70';
wwv_flow_imp.g_varchar2_table(58) := '6F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D616374696F6E7320613A686F7665722C0D0A626F64792E742D50616765426F64792D2D6C6F67696E20613A686F7665727B636F6C6F723A2334326135';
wwv_flow_imp.g_varchar2_table(59) := '66662021696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D73696E676C652D636865636B626F78206C6162656C7B636F6C6F723A236131613161362021696D706F7274616E743B7D2E6170';
wwv_flow_imp.g_varchar2_table(60) := '65782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578742C20696E7075742E617065782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578747B70616464696E672D746F703A313070782021696D706F7274616E74';
wwv_flow_imp.g_varchar2_table(61) := '3B70616464696E672D72696768743A313270782021696D706F7274616E743B70616464696E672D626F74746F6D3A313070782021696D706F7274616E743B70616464696E672D6C6566743A343470782021696D706F7274616E743B7D626F64792E742D50';
wwv_flow_imp.g_varchar2_table(62) := '616765426F64792D2D6C6F67696E202E617065782D6974656D2D6861732D69636F6E2E617065782D6974656D2D746578747B70616464696E672D746F703A313270782021696D706F7274616E743B70616464696E672D72696768743A313470782021696D';
wwv_flow_imp.g_varchar2_table(63) := '706F7274616E743B70616464696E672D626F74746F6D3A313270782021696D706F7274616E743B70616464696E672D6C6566743A343670782021696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974';
wwv_flow_imp.g_varchar2_table(64) := '656D2D67726F75702D2D70617373776F72647B6261636B67726F756E643A72676261283235352C3235352C3235352C2E3036292021696D706F7274616E743B626F726465723A31707820736F6C69642072676261283235352C3235352C3235352C2E3134';
wwv_flow_imp.g_varchar2_table(65) := '292021696D706F7274616E743B626F726465722D7261646975733A313270782021696D706F7274616E743B646973706C61793A666C65782021696D706F7274616E743B616C69676E2D6974656D733A63656E7465723B7D626F64792E742D50616765426F';
wwv_flow_imp.g_varchar2_table(66) := '64792D2D6C6F67696E202E617065782D6974656D2D67726F75702D2D70617373776F72643A666F6375732D77697468696E7B626F726465722D636F6C6F723A766172282D2D65662D616363656E74292021696D706F7274616E743B626F782D736861646F';
wwv_flow_imp.g_varchar2_table(67) := '773A302030203020337078207267626128302C3131332C3232372C2E3238292021696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D67726F75702D2D70617373776F7264202E617065782D';
wwv_flow_imp.g_varchar2_table(68) := '6974656D2D746578747B6261636B67726F756E643A7472616E73706172656E742021696D706F7274616E743B626F726465723A6E6F6E652021696D706F7274616E743B626F782D736861646F773A6E6F6E652021696D706F7274616E743B666C65783A31';
wwv_flow_imp.g_varchar2_table(69) := '3B7D626F64792E742D50616765426F64792D2D6C6F67696E202E617065782D6974656D2D67726F75702D2D70617373776F7264202E742D427574746F6E2D2D70617373776F72645669736962696C6974797B636F6C6F723A233865386539332021696D70';
wwv_flow_imp.g_varchar2_table(70) := '6F7274616E743B6261636B67726F756E643A7472616E73706172656E742021696D706F7274616E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D6C6F676F7B646973706C61793A6E6F6E652021696D706F727461';
wwv_flow_imp.g_varchar2_table(71) := '6E743B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D6865616465727B706F736974696F6E3A72656C61746976653B70616464696E672D746F703A393670783B7D626F64792E742D50616765426F64792D2D6C6F6769';
wwv_flow_imp.g_varchar2_table(72) := '6E202E742D4C6F67696E2D6865616465723A3A6265666F72657B636F6E74656E743A22223B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A3530253B7472616E73666F726D3A7472616E736C61746558282D353025293B776964';
wwv_flow_imp.g_varchar2_table(73) := '74683A373270783B6865696768743A373270783B626F726465722D7261646975733A323070783B6261636B67726F756E643A6C696E6561722D6772616469656E74283133356465672C233432613566662C23303037316533293B626F782D736861646F77';
wwv_flow_imp.g_varchar2_table(74) := '3A30203870782032347078207267626128302C3131332C3232372C2E3335293B7D626F64792E742D50616765426F64792D2D6C6F67696E202E742D4C6F67696E2D6865616465723A3A61667465727B636F6E74656E743A22223B706F736974696F6E3A61';
wwv_flow_imp.g_varchar2_table(75) := '62736F6C7574653B746F703A323370783B6C6566743A3530253B7472616E73666F726D3A7472616E736C61746558282D353025293B77696474683A343070783B6865696768743A323770783B6261636B67726F756E642D7265706561743A6E6F2D726570';
wwv_flow_imp.g_varchar2_table(76) := '6561743B6261636B67726F756E642D73697A653A636F6E7461696E3B6261636B67726F756E642D696D6167653A75726C2822646174613A696D6167652F7376672B786D6C2C25334373766720786D6C6E733D27687474703A2F2F7777772E77332E6F7267';
wwv_flow_imp.g_varchar2_table(77) := '2F323030302F737667272076696577426F783D2730203020343820333227253345253343636972636C652063783D273136272063793D2731362720723D273131272066696C6C3D276E6F6E6527207374726F6B653D27776869746527207374726F6B652D';
wwv_flow_imp.g_varchar2_table(78) := '77696474683D2735272F253345253343636972636C652063783D273332272063793D2731362720723D273131272066696C6C3D276E6F6E6527207374726F6B653D27776869746527207374726F6B652D77696474683D2735272F2533452533432F737667';
wwv_flow_imp.g_varchar2_table(79) := '25334522293B7D2E65662D636861747B646973706C61793A666C65783B666C65782D646972656374696F6E3A636F6C756D6E3B6865696768743A63616C63283130307668202D203232307078293B6D696E2D6865696768743A35323070783B6261636B67';
wwv_flow_imp.g_varchar2_table(80) := '726F756E643A766172282D2D65662D63617264293B626F726465723A31707820736F6C696420766172282D2D65662D626F72646572293B626F726465722D7261646975733A766172282D2D65662D726164697573293B626F782D736861646F773A766172';
wwv_flow_imp.g_varchar2_table(81) := '282D2D65662D736861646F77293B6F766572666C6F773A68696464656E3B7D2E65662D636861742D6865616465727B646973706C61793A666C65783B616C69676E2D6974656D733A63656E7465723B6761703A313270783B70616464696E672D746F703A';
wwv_flow_imp.g_varchar2_table(82) := '313670783B70616464696E672D72696768743A323070783B70616464696E672D626F74746F6D3A313670783B70616464696E672D6C6566743A323070783B626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D65662D626F726465';
wwv_flow_imp.g_varchar2_table(83) := '72293B6261636B67726F756E643A766172282D2D65662D63617264293B7D2E65662D636861742D6865616465722D69636F6E7B77696474683A333670783B6865696768743A333670783B626F726465722D7261646975733A313170783B646973706C6179';
wwv_flow_imp.g_varchar2_table(84) := '3A666C65783B616C69676E2D6974656D733A63656E7465723B6A7573746966792D636F6E74656E743A63656E7465723B6261636B67726F756E643A6C696E6561722D6772616469656E74283133356465672C766172282D2D65662D616363656E742D3229';
wwv_flow_imp.g_varchar2_table(85) := '2C766172282D2D65662D616363656E7429293B626F782D736861646F773A30203470782031307078207267626128302C3131332C3232372C2E3238293B666C65782D736872696E6B3A303B7D2E65662D636861742D6865616465722D746578747B646973';
wwv_flow_imp.g_varchar2_table(86) := '706C61793A666C65783B666C65782D646972656374696F6E3A636F6C756D6E3B6C696E652D6865696768743A312E32353B7D2E65662D636861742D7469746C657B666F6E742D7765696768743A3730303B666F6E742D73697A653A313570783B6C657474';
wwv_flow_imp.g_varchar2_table(87) := '65722D73706163696E673A2D302E3031656D3B636F6C6F723A766172282D2D65662D696E6B293B7D2E65662D636861742D7375627B666F6E742D73697A653A313270783B636F6C6F723A766172282D2D65662D6D75746564293B7D2E65662D636861742D';
wwv_flow_imp.g_varchar2_table(88) := '6E65777B6D617267696E2D6C6566743A6175746F3B626F726465723A31707820736F6C696420766172282D2D65662D626F72646572293B6261636B67726F756E643A766172282D2D65662D63617264293B636F6C6F723A766172282D2D65662D6D757465';
wwv_flow_imp.g_varchar2_table(89) := '64293B666F6E742D73697A653A313270783B666F6E742D7765696768743A3630303B70616464696E672D746F703A3770783B70616464696E672D72696768743A313270783B70616464696E672D626F74746F6D3A3770783B70616464696E672D6C656674';
wwv_flow_imp.g_varchar2_table(90) := '3A313270783B626F726465722D7261646975733A323070783B637572736F723A706F696E7465723B7472616E736974696F6E3A6261636B67726F756E64202E31357320656173652C636F6C6F72202E31357320656173653B7D2E65662D636861742D6E65';
wwv_flow_imp.g_varchar2_table(91) := '773A686F7665727B6261636B67726F756E643A766172282D2D65662D6267293B636F6C6F723A766172282D2D65662D696E6B293B7D2E65662D636861742D6C6F677B666C65783A313B6F766572666C6F772D793A6175746F3B646973706C61793A666C65';
wwv_flow_imp.g_varchar2_table(92) := '783B666C65782D646972656374696F6E3A636F6C756D6E3B6761703A313470783B70616464696E672D746F703A323270783B70616464696E672D72696768743A323470783B70616464696E672D626F74746F6D3A323270783B70616464696E672D6C6566';
wwv_flow_imp.g_varchar2_table(93) := '743A323470783B6261636B67726F756E643A766172282D2D65662D6267293B7D2E65662D6D73677B6D61782D77696474683A3732253B70616464696E672D746F703A313170783B70616464696E672D72696768743A313570783B70616464696E672D626F';
wwv_flow_imp.g_varchar2_table(94) := '74746F6D3A313170783B70616464696E672D6C6566743A313570783B626F726465722D7261646975733A313670783B666F6E742D73697A653A313470783B6C696E652D6865696768743A312E353B77686974652D73706163653A7072652D777261703B77';
wwv_flow_imp.g_varchar2_table(95) := '6F72642D627265616B3A627265616B2D776F72643B7D2E65662D6D73672D757365727B616C69676E2D73656C663A666C65782D656E643B6261636B67726F756E643A6C696E6561722D6772616469656E74283133356465672C766172282D2D65662D6163';
wwv_flow_imp.g_varchar2_table(96) := '63656E742D32292C766172282D2D65662D616363656E7429293B636F6C6F723A236666666666663B626F726465722D626F74746F6D2D72696768742D7261646975733A3470783B7D2E65662D6D73672D617373697374616E747B616C69676E2D73656C66';
wwv_flow_imp.g_varchar2_table(97) := '3A666C65782D73746172743B6261636B67726F756E643A766172282D2D65662D63617264293B636F6C6F723A766172282D2D65662D696E6B293B626F726465723A31707820736F6C696420766172282D2D65662D626F72646572293B626F726465722D62';
wwv_flow_imp.g_varchar2_table(98) := '6F74746F6D2D6C6566742D7261646975733A3470783B7D2E65662D6D73672D617373697374616E742E65662D747970696E677B636F6C6F723A766172282D2D65662D6D75746564293B666F6E742D7374796C653A6974616C69633B7D2E65662D63686174';
wwv_flow_imp.g_varchar2_table(99) := '2D696E7075746261727B646973706C61793A666C65783B616C69676E2D6974656D733A666C65782D656E643B6761703A313070783B70616464696E672D746F703A313470783B70616464696E672D72696768743A313670783B70616464696E672D626F74';
wwv_flow_imp.g_varchar2_table(100) := '746F6D3A313470783B70616464696E672D6C6566743A313670783B626F726465722D746F703A31707820736F6C696420766172282D2D65662D626F72646572293B6261636B67726F756E643A766172282D2D65662D63617264293B7D2E65662D63686174';
wwv_flow_imp.g_varchar2_table(101) := '2D74657874617265617B666C65783A313B726573697A653A6E6F6E653B6D61782D6865696768743A31343070783B626F726465723A31707820736F6C6964207267626128302C302C302C2E3132293B626F726465722D7261646975733A313470783B7061';
wwv_flow_imp.g_varchar2_table(102) := '6464696E672D746F703A313070783B70616464696E672D72696768743A313470783B70616464696E672D626F74746F6D3A313070783B70616464696E672D6C6566743A313470783B666F6E742D73697A653A313470783B666F6E742D66616D696C793A69';
wwv_flow_imp.g_varchar2_table(103) := '6E68657269743B6C696E652D6865696768743A312E343B636F6C6F723A766172282D2D65662D696E6B293B6261636B67726F756E643A766172282D2D65662D6267293B7D2E65662D636861742D74657874617265613A666F6375737B6F75746C696E653A';
wwv_flow_imp.g_varchar2_table(104) := '6E6F6E653B626F726465722D636F6C6F723A766172282D2D65662D616363656E74293B626F782D736861646F773A302030203020337078207267626128302C3131332C3232372C2E3135293B7D2E65662D636861742D73656E647B77696474683A333870';
wwv_flow_imp.g_varchar2_table(105) := '783B6865696768743A333870783B626F726465722D7261646975733A3530253B626F726465723A6E6F6E653B666C65782D736872696E6B3A303B646973706C61793A666C65783B616C69676E2D6974656D733A63656E7465723B6A7573746966792D636F';
wwv_flow_imp.g_varchar2_table(106) := '6E74656E743A63656E7465723B6261636B67726F756E643A766172282D2D65662D616363656E74293B637572736F723A706F696E7465723B7472616E736974696F6E3A6261636B67726F756E64202E31357320656173652C7472616E73666F726D202E31';
wwv_flow_imp.g_varchar2_table(107) := '357320656173653B7D2E65662D636861742D73656E643A686F7665727B6261636B67726F756E643A233030373765643B7472616E73666F726D3A7472616E736C61746559282D317078293B7D2E65662D636861742D73656E643A64697361626C65647B6F';
wwv_flow_imp.g_varchar2_table(108) := '7061636974793A2E34353B637572736F723A64656661756C743B7472616E73666F726D3A6E6F6E653B7D2E65662D636861742D74657874617265613A64697361626C65647B6F7061636974793A2E363B7D2E65662D7769646765742D726F6F747B706F73';
wwv_flow_imp.g_varchar2_table(109) := '6974696F6E3A66697865643B72696768743A323470783B626F74746F6D3A323470783B7A2D696E6465783A393939393B7D2E65662D7769646765742D627562626C657B77696474683A353870783B6865696768743A353870783B626F726465722D726164';
wwv_flow_imp.g_varchar2_table(110) := '6975733A3530253B626F726465723A6E6F6E653B646973706C61793A666C65783B616C69676E2D6974656D733A63656E7465723B6A7573746966792D636F6E74656E743A63656E7465723B6261636B67726F756E643A6C696E6561722D6772616469656E';
wwv_flow_imp.g_varchar2_table(111) := '74283133356465672C766172282D2D65662D616363656E742D32292C766172282D2D65662D616363656E7429293B626F782D736861646F773A30203870782032347078207267626128302C3131332C3232372C2E3335293B637572736F723A706F696E74';
wwv_flow_imp.g_varchar2_table(112) := '65723B7472616E736974696F6E3A7472616E73666F726D202E31387320656173652C6F706163697479202E31387320656173653B7D2E65662D7769646765742D627562626C653A686F7665727B7472616E73666F726D3A7363616C6528312E3036293B7D';
wwv_flow_imp.g_varchar2_table(113) := '2E65662D7769646765742D627562626C652D68696464656E7B6F7061636974793A303B7472616E73666F726D3A7363616C652830293B706F696E7465722D6576656E74733A6E6F6E653B7D2E65662D7769646765742D70616E656C7B706F736974696F6E';
wwv_flow_imp.g_varchar2_table(114) := '3A66697865643B72696768743A323470783B626F74746F6D3A323470783B77696474683A33383070783B6865696768743A35363070783B6D61782D6865696768743A63616C63283130307668202D2034387078293B7472616E73666F726D3A7363616C65';
wwv_flow_imp.g_varchar2_table(115) := '28302E3835293B7472616E73666F726D2D6F726967696E3A626F74746F6D2072696768743B6F7061636974793A303B706F696E7465722D6576656E74733A6E6F6E653B7472616E736974696F6E3A7472616E73666F726D202E31387320656173652C6F70';
wwv_flow_imp.g_varchar2_table(116) := '6163697479202E31387320656173653B626F782D736861646F773A3020323070782036307078207267626128302C302C302C2E3232293B7D2E65662D7769646765742D70616E656C2E65662D7769646765742D6F70656E7B6F7061636974793A313B7472';
wwv_flow_imp.g_varchar2_table(117) := '616E73666F726D3A7363616C652831293B706F696E7465722D6576656E74733A6175746F3B7D2E65662D7769646765742D636C6F73657B6D617267696E2D6C6566743A6175746F3B77696474683A323870783B6865696768743A323870783B626F726465';
wwv_flow_imp.g_varchar2_table(118) := '722D7261646975733A3530253B626F726465723A6E6F6E653B6261636B67726F756E643A7472616E73706172656E743B636F6C6F723A766172282D2D65662D6D75746564293B666F6E742D73697A653A323070783B6C696E652D6865696768743A313B63';
wwv_flow_imp.g_varchar2_table(119) := '7572736F723A706F696E7465723B7472616E736974696F6E3A6261636B67726F756E64202E31357320656173652C636F6C6F72202E31357320656173653B7D2E65662D7769646765742D636C6F73653A686F7665727B6261636B67726F756E643A766172';
wwv_flow_imp.g_varchar2_table(120) := '282D2D65662D6267293B636F6C6F723A766172282D2D65662D696E6B293B7D406D6564696120286D61782D77696474683A3438307078297B2E65662D7769646765742D70616E656C7B72696768743A313270783B626F74746F6D3A313270783B6C656674';
wwv_flow_imp.g_varchar2_table(121) := '3A313270783B77696474683A6175746F3B6865696768743A63616C63283130307668202D2039367078293B7D2E65662D7769646765742D627562626C657B72696768743A3870783B626F74746F6D3A3870783B7D7D2E706167652D3438202E742D427265';
wwv_flow_imp.g_varchar2_table(122) := '61646372756D622D6C6162656C7B646973706C61793A6E6F6E653B7D2E706167652D3438202E742D42726561646372756D62526567696F6E2D2D75736542726561646372756D625469746C65202E742D42726561646372756D622D6974656D3A6C617374';
wwv_flow_imp.g_varchar2_table(123) := '2D6368696C64202E742D42726561646372756D622D6C6162656C7B646973706C61793A6E6F6E652021696D706F7274616E743B7D23745F426F64795F7469746C657B646973706C61793A6E6F6E652021696D706F7274616E743B7D2E742D466F726D2D66';
wwv_flow_imp.g_varchar2_table(124) := '69656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E6A732D73686F772D6C6162656C202E742D466F726D2D696E707574436F6E7461696E657220696E7075742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C';
wwv_flow_imp.g_varchar2_table(125) := '6F6174696E674C6162656C2E69732D616374697665202E742D466F726D2D696E707574436F6E7461696E657220696E7075742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E6A732D73686F772D6C';
wwv_flow_imp.g_varchar2_table(126) := '6162656C202E742D466F726D2D696E707574436F6E7461696E65722073656C6563742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E69732D616374697665202E742D466F726D2D696E707574436F';
wwv_flow_imp.g_varchar2_table(127) := '6E7461696E65722073656C6563742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E6A732D73686F772D6C6162656C202E742D466F726D2D696E707574436F6E7461696E6572207465787461726561';
wwv_flow_imp.g_varchar2_table(128) := '2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E69732D616374697665202E742D466F726D2D696E707574436F6E7461696E65722074657874617265617B70616464696E672D746F703A3230707820';
wwv_flow_imp.g_varchar2_table(129) := '21696D706F7274616E743B70616464696E672D626F74746F6D3A3470782021696D706F7274616E743B7D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(9407491312233949)
,p_file_name=>'custom.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260809122916Z')
,p_updated_on=>wwv_flow_imp.dz('20260815095951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_144_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000090000000900806000000E746E2B8000014C249444154785EED9D79705BC77DC7BF8B8B200980E07D1F3A285222458AD4653B4E4C50A463BBAD9DC41DC79D49D3B87162279E366DA7D3E3AFA67F35339D1E';
wwv_flow_imp.g_varchar2_table(2) := '399D366EEAB669623BC738755A2B2145C88E1D4724254A3C24D132255E3245E120081037DEDBCE2EA5174602AF0790C253F633E3A1BD8F14F6511FEFFBEDEE6F7F8F40204801A2FC9B40A002219020258440829410020952420824480921902025844082';
wwv_flow_imp.g_varchar2_table(3) := '9410020952420824480921902025844082941002095242082448898C14A8E1ADB7AC86783C17800594F2AF4427E7E840CC4ACFEF6264D008957521004B2024C8BE268CC6E0F8FDF70732EDB6EFAC409492FD274F3610484741E9510A728410B4003066DA';
wwv_flow_imp.g_varchar2_table(4) := '2F2A4388538A610A9CD211F453E84F8D74748C83107AA7FAB7AD02ED7EF3CDE29C44E25E403E4A098E104A0F8390BC3B75F37705942E52420628E8291DD19D924CF1B7C7EE7BC8BB5DF7B67D02B1D1C6D9FB2840FE8210DCB75D37F81B05A56FCB847C69';
wwv_flow_imp.g_varchar2_table(5) := 'B4E3D8FF6ED7A8B4E5021D1C1C34C696163E4564F2E720D8F31BF5177A87A014E394E0EFB3ACF6FF3C7DE8507C2BBBB1A502B59E38512913FA6342705069146C1B147430ACCF7AE4BD0F7DC8B5551FBA650235BDD9BB4F9FC0CF4050A9340AB61D4A3121';
wwv_flow_imp.g_varchar2_table(6) := '41F7D8F9CECEB1ADF8F02D11A8C9D973BF9EE2272240CE1058A00DFD63239D9D6FA4BB4769176879E4A1032024476914DC79280D25A03F92EE9128AD02550C0EE614FA7D0384609FD228C81C28C6DC36FB91F70F1D628B946921AD02ED77F6BE48803F50';
wwv_flow_imp.g_varchar2_table(7) := '1A04190705FE63C4D1F5A974752C6D02ED779EF81401FD77A54190B15090A7461CC75E4C4707D32250D52F7E919D1F0D5D2540BED228C85828A55E8F2DBF3A1D8FB2B408D4EC3CF1AC0EF479A54190F1C8209F1B751CFB66AA1D4D5D20BE4571E2022168';
wwv_flow_imp.g_varchar2_table(8) := '50DA04190F05BD30D2D1D594EA9647CA02B5387B1F02F0BAD220D0120F0F3BBA8EA7D2E13408D4731C201F561A041A82FE74D8D1CD0600D5A424509DD369B6D2449010A2531A059A81522A2F98732DB3F7DD1756DBE994046A76F674E8409C4A834073C8';
wwv_flow_imp.g_varchar2_table(9) := 'A08E5147F749B51D4F49A0FDCE9EBF22207FA73408340705FDEB1147F797D4763C55815E25208F290D02CD41417F3CE2E8FE88DA8EAB176879FAEE2204854A9B4073508AF991CEAE32B51D572D5093D359A68734A73408344B4C42D1C5AE2E8F9A1B502D';
wwv_flow_imp.g_varchar2_table(10) := 'D0BEBEBE260391479506816649505DB3DA340FD502359DEC3DACA7E8571A049A45223832D6D135A0E606540BB4BFAFEF014264D5D33F41E640A9AE436DB6A26A81C416C65D85EA2D0DD50235F7F57C4C47C80F9506817621E4D1E18E63AFA9B901F50239';
wwv_flow_imp.g_varchar2_table(11) := '7B3FA103FE4B6910681699D2C7473BBB7FA4E606540BB4FF64CF5384926F2B0D77199452C8A110E46814BAEC6CE8CC6610A2FAD795D1C8C0EF8F3ABABEA3A693AA7F2377F308C4E4918241241616B840FAEC6C18F2F3B94877A34442A0344265F9863C3E';
wwv_flow_imp.g_varchar2_table(12) := '98640926BD0191441C92D10443C1DD299110284DF0916769898F3C4649465D49094A6C36CC7A3C98F57A20994C30B2912827E7AE1A8984406940796C7917609012A82B2EC69EF24AD8B2CDF02E0571E1EA2CAE7A3DA066330C050577554C24044A035228';
wwv_flow_imp.g_varchar2_table(13) := '84B87701FA681435C54568ACA882FDC64823530ACF5200E76766F0BE6F01C8C98191499495A5FCBC961102A5080B94E35E2F100AA12ABF00FBAAAB919F6B816EC5AC8B49747DD187B19919CC07FCD059ADCB81B551FBC5D4844029401309C47D3E247C3E';
wwv_flow_imp.g_varchar2_table(14) := '94DBF2D054538362AB0D7ADDED59BA922CE3EA821763D353F086C3FC5166B0D940F47AE57BB4881048253CEEF10710F77A906732A1A9BA06D5858530E85617222E49786FFE1A2ECECE204C088C85859A0FAA85402A91C261C43D5E98E271345456A2BEAC';
wwv_flow_imp.g_varchar2_table(15) := '1CE60D3C9296A2518CCDCE60F2FA3CE49BF190C9A45CD71A4220155049E2718FECF7A3B6A808CD5535C8CBD978459AEB013F462627712DE05F7E94E5E5812479EC690121900A126CBDC7E381DD68424B6D2D2AF20B7E2D685E0F160F5DBE3ECF6766411D';
wwv_flow_imp.g_varchar2_table(16) := '81B1A8087AB336CB580B8136090F9C3D1ED0A525EC2A2DC3CEB23264190CCAF58D128AC5303E3BCB036B5D7EFEF228A4C1805A08B4491281001788C4E2C8B758909BC2C8B1180AC21F0A8164672F8F42D9D9CA35AD2004DA0437479F9C680C35F63CE4A5';
wwv_flow_imp.g_varchar2_table(17) := '20CF4D3CA11066FC7EC42C1618EC76CDC54242A04DC0F6BA9840F79595E3D1864694E7B25771A4C6E4E222BE3F368AD14000C6A242CDC54242A00DC276DA993CA650089F39D086271AF7215745EC732BFE580CDF1C3A8D1FBDFB2E247BDE722CB48980FC';
wwv_flow_imp.g_varchar2_table(18) := '4E2304DA207CDDC7ED46535E1E9E6B3F8C7BCACB956BA9C016248F4F4DE25B436730158FC358A8AD752121D006892F2C20E1F5E2C9BD4D78AAA51525AB04BC7159C664C08FCB8B8B08C7E3B0984CA8CFCF47654E2E0CABACF5CC0497F095FE53E89D9D81';
wwv_flow_imp.g_varchar2_table(19) := '8905D3168B722DD311026D00FEF872B9901B8DE18F0E1DC647EAF7249521108FE3E73333E89DBC8269FF22A25202D9062376E5E7E3915DBB71B0B40C39491E7B4CBA7F3D3B84EF9E1F45CC665B0EA635F21813026D00BEE3EE72A139CF8ECF1F3C84A3A5';
wwv_flow_imp.g_varchar2_table(20) := 'B71F07673BEE7D33D378F1DC59B82361D4E417C09A65822F1CC1F48217BBF30B78ECD4565C92548ED7A7AEE05B67CE605A9696738692889689088136C0CDB59F8FECAAC7A75B0FA02AC9ECCB1D89E0F933837863661AEDD5D5682DAF408ED188402C8AFE';
wwv_flow_imp.g_varchar2_table(21) := 'E9695C9C9FC7137BF7E1C9BDFB6033DEBEF735BEE8C3D706FAF1B6EBBAA656A685401BE066FCF35CDB417CA2793FCC49568C87BD1E7C7DB01FBE581C9DF5F5A8B2D9946BEF79BD38F1EE389A8A8AF928B4D3FAAB6B37618FBF7F3CF50E5EBD72990B64D0';
wwv_flow_imp.g_varchar2_table(22) := '481C24045A07364B62B3AFEC50187F76E4283EBA277941D9218F1BDF18EC4784523876D7A374C52835BDB888DEF171ECB4DBF19903EDD89377FB8B16D923F0EB6706F1DFE7CF43CEB7F3E9BC161002AD035B7D8EB95CA8319AF0C7870EC3515DA35C5B09';
wwv_flow_imp.g_varchar2_table(23) := '9B497DB9FF1446DC2E1CABDF83C69212E809E11BA78357AFE2E713137878D72E3CD57200C5ABAC60BF74F102BE7DEE2C16B24C3C63510B3BF442A075E001B4DB8DB6FC027CAEFD200E169728D756129124FC60FC22BE37368A6C93090DA5A5B06699E10B';
wwv_flow_imp.g_varchar2_table(24) := '8730363707934E8FA7DBDAD055530B6392191CE3A7D353F8D699D39894129A09A48540EB2045227C06F6C1F20A3C73A01DFBF2577F23C3CCD2125E9BB884D72F5D823F1AE50966E1780C65162B1E6B68C483B575285E65FD88F1F6B5397CF3F420CE8782';
wwv_flow_imp.g_varchar2_table(25) := 'CBD98A1B4850BBD30881D6819FB8F07870ACB21A9F3DD086FA356213162FCD854238777D1E933E1F1F956C4623761716F200BA302B2BE914FE26832E179E1FECC7D9807F59200D642A0A81D6819DF762023D52BB034FB71E409DD5AA5C5B0D1610872509';
wwv_flow_imp.g_varchar2_table(26) := '315942B6DE9074D6968CD1052F9FCA0F78BDCB029933FFE88F10681DB8406E377E7BC74E3CDDDA869A2D9C5E5F5CF4E1AB03A7F08ECB056321CB0F4A1E6C671242A0755816C88387EAEAF099D603D891640D275D8C2D2CE06B83FD38E51602AD8996AA73';
wwv_flow_imp.g_varchar2_table(27) := '48A1E55DF8CEAA2A1E03EDC9B32BF7916ECEB897D792867C3EF1085B0B2D0924472288B9DDB8AFA414CFB6B5A3B960EB4A5B2BB3B0209B856923AD433CC2D6410AB02C44379A0B8BF0DC2A1BA9E9E2759617C4D681C2A1E5182867F5297FA620045A0536';
wwv_flow_imp.g_varchar2_table(28) := '2597C3615EAE450A865065CFC3170E1D41776D9DF23D6BB1108D229088C36ECAE253F98DF09D0B6378F1EC59B8C321E82DECFCBC9D1761586BEA7FA7110225811F5B0E8578A12863220EF65E3EB62DF1A7878FE2771B1B95EF5B8BE39357706AEE7D7CB8';
wwv_flow_imp.g_varchar2_table(29) := '6E07EE29AF50DA5743A2145F1D1CC0CB17C600A2E3FF2D65652D17613067AE4442A05BF8953C0B302524D41617F16A7E332E173ED1DC8C4F36B7C0B28111E5F9332CCF791C9F6B3B888F3524DF805D094B07F9A7FE5FE2CDD959D41617231889609695C9';
wwv_flow_imp.g_varchar2_table(30) := 'E312D933B6A690106805BF268F2461477109EACBCA108846F951E42315E57C2D28593AC6AD7C4311A81D8F37AC3F6A9DE5BBF903980D85B0BFA6969F741D9FBB8A59AF9757375B1E8932AF58A71068053C71DEEB455642C2CE9212EC2E2B83C56C462012';
wwv_flow_imp.g_varchar2_table(31) := 'C5D09509E4198C78AEFD10EEDD4042FD6605FA9FCB137861E80CCC39D9BCD2478EC9045F3084F1B9F731E3712391658691D559CCB0C25442A01BC8F1382F51678C46B0938F3CE55C1E464296716EF20AAE79BD3CA5F5A3ABE444AF643302B13D3376B4E7';
wwv_flow_imp.g_varchar2_table(32) := '07172FF24A1F7BCA2B941A43BE501017AF5EC5CC821752AE05467B1E4806A5BB0A816E90F02D425A58405D61019AAA6A60BB65D77CE2FA3C2F0EC592E3594E4FE91ABBEA8CCD0834E1F7E32B032C97C88DD6BA1DA8BC65C79F95C81B9E9AC2B5E0120C85';
wwv_flow_imp.g_varchar2_table(33) := '8519756A4308A4248DB9619124B4D6D5A1BAA0F0B6A9B33714C4D92B97516236E3F3ED8770649DF5A0CD08F4DAE5CB7861E8348C66337F7C596F4938639BB3EF5E9BC385D91944594D21966CB6C10DDAAD4608C4621F96B2E176A3C696C703D8BC24A30B';
wwv_flow_imp.g_varchar2_table(34) := 'AB2E363C3D8539AF079F3DD08EC7F734206B8DBFC48D0AB4C84FA69EC14FDEBBA414AA4A56228FD514628F51773C9151DB1C4220F6F8F2FB79CAC6BEB272ECABAA5EB55CCBB4D78391A9491C2DAFE0C9F1BB6CABE7066D54A0FEEBF3787E70007391085A';
wwv_flow_imp.g_varchar2_table(35) := '6B6B798DC5640463519CB93C81193F3B435F047DEEC60B5A6D2542201EFFF878B9BA96AA2AECADAA5E354066274D87A726110E85F04C7B3B1EAEDBB9EAF76E44209633F4E2C8397CFFC279D49494F2E0D9B48ABC3129C1059AF078602C2A86C1BA756925';
wwv_flow_imp.g_varchar2_table(36) := '9B4108B4E2D84E6B7535F65656277D84DCE48ACB85F333D3B8BFAA0A7FB8467AC746043AE372F1DDF7A9A5251E7B95ADB1D39F90259C9E98C07B2CD5A39809B47E62DB762004BA21101B810ED4AC2F10AB2C363A33856030C40F19FED6CE5D4963A1F504';
wwv_flow_imp.g_varchar2_table(37) := '62E7C05E1C19C6ABEF8EA3BAB818F5E5E5C832ACBEC22DDD10E81213888D40362150C6BC2F6C330251505CF32DF258A831BF00CFB4B5A3A9F0F6148FB50462B3AA376667F851663F95799DC582DCB51F4942A015645A3ED0660462B019D9C8F4145F58FC';
wwv_flow_imp.g_varchar2_table(38) := '68E35E7CBC71EF6DD53AD612E892CF8717CE0DE117333368A8AAC2EEB2F25563A99B088156A06581D8E8E10EF8717E76964FE92BAC367CBAAD1D0FD6EDF8B5CA1BAB09C4D23CBE7B610C3F3C3FC68FFED49494A0B1A212F939B9B7AD3DAD4408B402AD0A';
wwv_flow_imp.g_varchar2_table(39) := 'C44E99CEF91670696E8EAFCB4806035F843C70E3CCFBE1B272E5D0603281A29284E3939779CECF5424CCDB8CB28C72BB1DF5E51528B258571DFD84402BD0A240B1440257BD5E5C9A7B1FDE7008C8C985DE66E529AFBA40001F28AFE085A758E6221B496E';
wwv_flow_imp.g_varchar2_table(40) := '15888D5CEFCCBD8F7F3B3B846156DA97D5003218F81A1409875162B1624F45054AF3EC302609CA85402BD09A40E1580C536E1726E6E6B0188F4367B52CBF2885E505B1AAF53E1FCCE1301EA8AAC1076B6B61CBCAC24FDE1DC75BD3D3F89D86067CA0BA86';
wwv_flow_imp.g_varchar2_table(41) := 'BF60E56713EF61E0FA3C12AC22EB8D17ADB0A3D389C545D0A520F2B3CDA8AFA8445541C16D333221D00AB424903F1CC615D73CAECCCF2324CBD0E7E5F1CDCC95C78EE5588C4B901D8DA134DB8C1CA309D702017843219459AD28C8C9E1F18E2B1A412C3B';
wwv_flow_imp.g_varchar2_table(42) := '1B7A9BEDB69F970201487E3F4F7FDD59568EDAA262E4AE48DD1002AD400B02B1E9BA776989BF5D67D6ED4654A7E3A5E7F4B9B9493732B904EC4DCDE108A894008DC5787CC44629FE8FC1C00B89B3575E263BF3CEBE97BD4241F2F990A3D3A1B6B8043B4B';
wwv_flow_imp.g_varchar2_table(43) := '4B79560001ABF221D68114325D2026CFF5C5452ECFB5051F249391CBC3DFBC9C449E9BB05A8A4C04F63216961E222F2D416F5F1EB19840EC67D72AD9C27E8EBF3AD3C75EDA2BA3B2A0808F4685B9161050B19078934C15A8CA6E47499E1DE158142EFF22';
wwv_flow_imp.g_varchar2_table(44) := '7CE130A8391B067BDE723AE91A7FF9B7C2D243A4C5455E3C9CC9B7519884EC9DF34C225D2C86028B0545561B8F89663D2EB84221B1129D6902DDDC8D374832F47A1DAF9A2AEB0DD05B7261B05841B24C6BAED12483BD439555B66709F19BDDB7E2478A22';
wwv_flow_imp.g_varchar2_table(45) := '91E5B82818845E96F98BEC125202B2D12476E39BFB7A3EA623E487CA6FEC0EC3D259D91930F6F8E1E8743C4EE167B256D91D5F0F36BBE23190C99434E6D908BC5F11F6E7C49955BC8DFD79ECD5506AFB956E644A1F1FEDECFE91D2B00936F7BFE40A5A9C';
wwv_flow_imp.g_varchar2_table(46) := 'BD0FB183984A8340CB3C3CECE83AAEE606540BB4BFAFEF0142E4934A8340B350AAEB18E9EC7C43CD0DA816A8E964EF613D45BFD220D02C12C191B18EAE013537A05AA07D7D7D4D06228F2A0D02CD92A0BAE6F39D9D636A6E40B540FB7FDEBB932430A134';
wwv_flow_imp.g_varchar2_table(47) := '08340B3560D7C807BB2EABB901D50235399D657A48734A8340B348D0978F391CD7D4DC806A810E0E0E1A63019F9F00995F0450B02A148898AC76DBE94387E24AE326502D10637F5FCF4942C8034A834073504ADF18E9ECEE50DBF194046A71F67C11207F';
wwv_flow_imp.g_varchar2_table(48) := 'A334083408FDDB6147F717D5763C25819A9D3D1D3A10A7D220D01C32A863D4D1AD7A3D2F2581EA9C4EB315D2828883B4098B7F02D0E74F3A1C11B5779092408C1667EF4B003EAE3408B4C4CBC38EAE2753E9701A04EAB90720EF280D020D41EF1D7674FF';
wwv_flow_imp.g_varchar2_table(49) := '32950EA72C10A3A5AFE79720E4A8D220C87C283D35DCD97D4FAA1D4D8B404DCEDE27F5C0F7940641C62301BF37E6E862E1474AA44520389D86FD90AE10A04A6913642E14578789BE0E0EC78DE429F5A447A0E545C5C70821AF2A0D82CC859047873B8EBD';
wwv_flow_imp.g_varchar2_table(50) := '968E0EA64D20468BB3F79F017C41691064225F1E7674FD49BA3A9656816EEC8FBD4D80C34AA32063A014A74D36FBBD6AF7BD92915681188D4E679D09D210808D1F63106C3994623E41C9D10BC78E4DA5F3C3D22E1063DF1B3D6D0699B024ED8DBDD544B0';
wwv_flow_imp.g_varchar2_table(51) := 'B5504C49D03D36D6D9794E694B135B2210A3B1B7B7D0A8C74B04E8521A05DB0F455F4CC61317BBBA3C5BF1E15B2610E79557F42DC5F95F03C8B34A9B603BF9876197F72FF1C413D2567DE8D60A748366E789670995BF4C0831298D822D83521AA3847C72';
wwv_flow_imp.g_varchar2_table(52) := 'D4D1F5B2D2B8456C8B408CD613272A65423F0D429F2620D5373E5F904628304B405E20325E3877ECD855E5C216B26D0229BCF28ABEB9A4F0511D959FA1200F923BD187BB094A2510F27F32A5FF32EA5E38BE958FAB646CBF402BD8D9D393976BD2B51299';
wwv_flow_imp.g_varchar2_table(53) := 'B651A00DA0ED04642F80CC38F39B792428E80542310482214AF54341493A7BB9BB7BF14E75F58E0AB41A0D6FBD6535C4E3B9002CA0947F253A394707F21B91C02F8346A8AC0B0158022141F635613406C7EFBF3FA0FC9232848C1448A01D844082941002';
wwv_flow_imp.g_varchar2_table(54) := '09524208244809219020258440829410020952420824480921902025844082941002095242082448092190202584408294F87FB8CD4D2725035A570000001064654247464538383541383731444135373134462ACFF78C0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(7412106698361297)
,p_file_name=>'icons/app-icon-144-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C070000149B49444154785EEDDD797054C79D07F0EF489A198D2410082474CE088110081020EEC3E630608C31D818B398C3F6C61B6F6D3629277136956437A92455D9DD78';
wwv_flow_imp.g_varchar2_table(2) := '93ADCD66CB761CDBB1C106136CCC15B0B1C3692E73891B1DE8460249480224CDA999ADEE69BD0C429A796F343A70FF3E7FF5A329EBB998AFA65FBFEE5FEB72F67FE1012192D2510088CC2800446A140022350A00911A0580488D0240A446012052A30010';
wwv_flow_imp.g_varchar2_table(3) := 'A9510088D42800446A140022350A00911A0580488D0240A446012052A30010A9510088D42800446A140022350A00911A0580488D0240A446012052A30010A9510088D42800446A140022350A00911A0580488D0240A446012052A30010A9510088D42800';
wwv_flow_imp.g_varchar2_table(4) := '446A140022350A00911A0580488D0240A446012052A30010A9510088D42800446A140022350A00911A0580488D0240A446012052A300F412B7D3097B7905A0038C696908D3EB7BE94EE44601E8056E8703F68A4A785C4EFED375117A18D352116630F4C2';
wwv_flow_imp.g_varchar2_table(5) := 'DDC88D02D0C3F887BFBC1C9ED6D67B7EB22E3C1C46B39942D0C328003DC86DB3C15E59A97CF8634C267800345BADFC9A872035156191913D785772A300F49056AB158ECAEBF0B8DB3EFC5158306E1C6F7F969787169B0841180B410AC24C267E4DBA1705';
wwv_flow_imp.g_varchar2_table(6) := 'A007B00F3F1BF6B469FBF0471B8CFCBAD961BF3704BA3018D252114E21E87614806EC6C7FC65E5F7FDE66FFBF0B7B92F046C3864B1D0EC5037A30074238FDB0D7B59190F0113658CC4C2091310D3EEC3DFE6AED381CF4E9F86CD61E7D76106238C163374';
wwv_flow_imp.g_varchar2_table(7) := '6161E26F9050A30074235B7905DCD616DED647E8F1686E2E0644FA1FDB375A5BF0E9E9D370896F8CF0A8683E454ABA0705A09B386EDC80EBF66DDED6418747264C4062BFFEA2D7BFEB8D0D3870FE3C3C7C8E0888183810868404D14B428902D00D5C0D0D';
wwv_flow_imp.g_varchar2_table(8) := '70D4D428D733B3C760E8E0C1CAB51AF937AB71323F5FB936242622223656B926A141010831B7D50A9BCF8CCFA8F4744C34A72BD75A7C55720D051515CA75647A3AC28C1D3F3F90E0500042C8E3F1C05E5AAA3CF40E8E1D8045E3C68B5EEDD800684FDE59';
wwv_flow_imp.g_varchar2_table(9) := 'D4DFF10EA5F84371BA053A9D4EFC0DD25514801062C31E36FC610C06039E983819A62E2E726B72D8F19753A7E014EB86F47183A08FD7369C229DA30084486B4B0BEC3EC39547C64F4052FFD08CD92B1A1B70F0FC3971A583D19C462FC942840210026CBE';
wwv_flow_imp.g_varchar2_table(10) := 'DF5652AAACEE1C69B66052FA50D11B1AC78BAFA1A8D21B309D5E8FC8A14369281402148010F09DF28C8D89C113B993444FE8B83C6EEC3C7912CDE24D71C48001300C19227A49B028005DC45678DACACA94EB4513276170748C721D4A55776E635FDE5971';
wwv_flow_imp.g_varchar2_table(11) := 'A54364BA856685BA8802D0456CCA934D7D3219C9C998317C84E8E91E870AF2517EA39AB7C3A3A3F9F269123C0A4017B43635C17EFD3A6FB3A50E4F4E9D0A637884E8ED1EB65617B69F38A1CC0AB14D34B46A347814802EB095942873FE53478E426642CF';
wwv_flow_imp.g_varchar2_table(12) := '8CC97DDF12B3CD3391160B6F13ED280041723536C271F3A672DD9B0CC9C988E8D7AF376FE181450108027BE36BBB560C4FAB4BF9B3DEC4A6454D1919BD790B0F2C0A4010FAD26FFF36F42D101C0A4010ACC5C5F038BD0FA1FFBE683116A7A6899E9EB5BB';
wwv_flow_imp.g_varchar2_table(13) := 'B2023FF97437FFA16C0F71A4D9DCB337F0354001D0A8B5B999577660064445E1AFABD620BC97766C39DCAD7874F326343437F3FBA1D5A2DA51003462D39E6CFA93F9876933F0ED3163454FEFF8FD85F378FBC431FEC3D97E01B66F80A84701D0809533B4';
wwv_flow_imp.g_varchar2_table(14) := '1597F085CA61BA30EC59B30E437AB986CF0D9B158F7DF03E3C1E37AF2611392C836FA827EA50003470D4D6C2555FCFDBF3468CC47F3F3C5BF4F4AE970FEEC7C1C2027E13FAF878E8E3E27AF7861E2014000DAC6CEA53BC817D7DD953981EDF37F6E91EA9';
wwv_flow_imp.g_varchar2_table(15) := 'B9897FDEB18DDF17BD18D38602A092DB6E87ADB494B7FB459A7078ED73A2479B92E6267C5C5880FCDA5A14D57AF70D0F8F1F829109F158317C042CD1D1E26F6A336BC37B68B2DB78DB346C187411DDBB24E3EB8202A092F3D62D38EBEA787B51F668FCE7';
wwv_flow_imp.g_varchar2_table(16) := '8C59A247BD372E5FC41B478F8ACD8E1DD1E195D973B02E53FB82BA1F1C3E842FF2AFF0366DA0578F02A092EFAACF5F2D5A8CC735CEFDFFFACC296C3A735AB9F6E79F66CCC23F668F56AED5D856568A9F7FFE196F87C7C4C09892227A883F140015583567';
wwv_flow_imp.g_varchar2_table(17) := '6BD135F19B5B8703CFBF80017AF5B5FC3F292BC52FC48793310F4EC0A25123911015C5AF6B5A5AF0E9952B28AFAB157F03F8DD92A5989D98A45C075267B763FE8677799B15D88D1C3E8C768CA9400150C175FB0E1C620D7E4E6A2AD62F7A5CF4A8336FE3';
wwv_flow_imp.g_varchar2_table(18) := '07A86FF1BE3B1867B160C598B1685FECD00D60CB85F3382F4AAA640C8EC7D627978B5E7556EDDA81ABE23ED93E01B65F80F8470150C171E3265CB71B79FB5B331FC24BA3B2454F60276FD5E19B9F7CCCDB468301FF32771E4C9D3CA0B6B85CF8CDBE7DB0';
wwv_flow_imp.g_varchar2_table(19) := '3BBD4BACB73DBB06E91A7697FDDFC50B78EB387BC600F4830641AFB118978C28002AB02D8F6CEB23F3DAB2A73043C3F4E7A66B45F8F5FEBFF276564A0A9E1B3F41F4746CFDD933C8AFAAE26DADEB8C0EDCA8C67777EDE06D7A0E508702A082B5A090BF69';
wwv_flow_imp.g_varchar2_table(20) := '65F6AE7D1E091ADEFEBE9D7F05BF3F7C88B71FC9CEC6BCA1FE972DEF2DBE868357BCB339DF7D780E5E1891257A02AB6869C6131BDFE76D5A22AD0E052000B6E38BEDFC62FA9B4C38B446DBFCFFD6D212FCF28BBDBC9D95928CE7C6E78A9E8EADCF3B83FC';
wwv_flow_imp.g_varchar2_table(21) := 'EBDE6F809F2F78144F5AB495559CF2EE3B70889775A6CC4C2AAD1E00052000DF7DBF932DE9F8E38247458F3A971A1BB1E6A3CDBC1D6930E095B9F310D5C93380D5E5C27FF93C036C5EB90A591A8B6BADDDBD0B17ABBCF7CB9647D3514BFE510002F07D01';
wwv_flow_imp.g_varchar2_table(22) := 'B67AE224FC70C244D1A3DEC2CD9B5073F70E6FE7582C7846C52C50DAC038EC7CFA19D1ABDECFBF3A8E6DA28A9C21310911B1EA4AB2CB8A021080A3BA1AAE3BDE0FEF4FE72FC4D341547CDB595E8E9FEEDDA35CAB790FF03F4B96628E86F7006D361416E0';
wwv_flow_imp.g_varchar2_table(23) := 'B707F7F376445C1C0CF1F1A2877484021000DBFCC236C1305A5F4EF97A35EF0C369E3AA95CFBF39D590FE1C591EAA75A7DEDA9ACC08FC52E31DA1F1018052000DF25106F3DF534260D0A7E6EFD0F972FE1F5A35F2AD7F7D3E14773E761D5B0E1CA9F68F5';
wwv_flow_imp.g_varchar2_table(24) := '65CD4D7C5BAC0CA5A9D0C0280001B0A2B76E7168DDA667566154174F6929BC7B17DBAE15E26A4D0D5F0D1AA6D361E490248C881F8C9599239062F20E8B8295D7508F173EDEC2DB61A628449AD5BF479011052000DF0DF0BB56AF43AA18B7F755C54D4D58';
wwv_flow_imp.g_varchar2_table(25) := 'FEE107FCF6D8811A9143B54DA3CA86021080B5A8882F8663F63FF7F7186850BF08AE37D4DA6D58B0E13DFEA375117A9886F97FF1263B0A40002DF96CABA177FDFE99175FE24396BECCDADA8AE97F7A8BDF22DB236C1A91D9976FB7D7510002F00DC057DF';
wwv_flow_imp.g_varchar2_table(26) := 'F8260CBD5402452D87DB8D29EFFC515CE91095A57D738D4C280001580B8BE01187563F0843A006870373D7FF89DF2FDB1760CA0C7E464906148000D84698B61AA03B57AF455A54DF5E635FDED28CA56D0BE2C223601A3E8CB749C7280001F8CE027DB872';
wwv_flow_imp.g_varchar2_table(27) := '15466A5C9BD3D32EDF6EC4EA2DDEB5476106033F4B8C748E021040285F84F584AFEA6AF1D2B6ADFC47D17B80C0280001D8AF57A1B5E92E6FBFBA78091626F7EDCDE6BE4B21C2FBF5873139B8A51BB2A00004E0BB16E83B0F3D8C17B346899EBEE9CD2B97';
wwv_flow_imp.g_varchar2_table(28) := 'F1DA91C3FCE6E80CB1C028007EF8EE0566968E198B5F4E9BA15CF7453F3E7A047B2E5F546E2D2276000C893D7374D3838802D009DFB37FDB045311A2A73DBB6B07AE88CA106D28049DA30074A0FD6FFE36C16C89ECCC4D9B0DCF6EFD98BDABC2E6E52B10';
wwv_flow_imp.g_varchar2_table(29) := '6F342A7D5D31EDDD7760135B227D51083A460168A7FD87DF9C98A49CCBCB7CBEEE79C41BD56F8AEFCC3BF957F1BF870FF2F6F71E9E83E7356C7EEF4C654B0B966CDCA05CB7BF770AC1FD28003EDA0F7BD29392313333139F9FBF809A466F59F4DF3CBE04';
wwv_flow_imp.g_varchar2_table(30) := 'F393BA3E13F4E6954B78ED88776FC0B766CEC24BA3B49542ECC85F2A2BF0AF62062861601C168C1D8B23858528ADF66EB2676893CCBD280042FB0FFFB094144CE71B53743857518E0B25C5FCCFD74D9E8257C6F9AFEDA3467704E057A74E624BDE19DECE';
wwv_flow_imp.g_varchar2_table(31) := 'C9C8404E2A3B33CC8363D78A704D6CEC6728047F4301E8E0C39F996AC6D40CF606D5BBF2B3EACE6DECCB3BCBDB635352B0E1B125BCDD15DD118015DB3F514AAECF9F908BC47E6D1BE23D38515C82C24AEF867B8642E0257D00DA8FF9475A2C9864B977F9';
wwv_flow_imp.g_varchar2_table(32) := '80D3DD8A3F7F7998AF098D080BC391E7BF0163178F210A75005859C519EFBECDDB2CB6AB663D84F0B07BEFF1545909AE969529D7110306C03044EE2952A903E0AC6F8053FCC664B2870E456E9A45B9F6B53BEF2CEAEF78BF25DE7C7239A60CEE5AB58550';
wwv_flow_imp.g_varchar2_table(33) := '07E0E08D6ABC2CCA220E1E38108BC68E133DF73A535186CBA2D01763484840C4C081CAB56CA40D80EF71A7CCE8F40C4CF073CEEEB9CA0A5C286625D281951372F1938993454F70421D807F3B7E14BB2E5EE0ED71C387636C72AAE8B9DFE9F2525C11A7DD';
wwv_flow_imp.g_varchar2_table(34) := '30C6B43484F7F1AD9EDD45CA00783C1E7EDA63DB795FE989C99835C2FFC691BB761BB69F38CEDBB12613F6AF5ECB4F8A0C562803C0CE0B7E78FD7BCAFCFFB2A9D3D02FC054EDE1FCAB28BB7983B7591D51B66A54D7C777BB75072903E0ACAF87B3D65B84';
wwv_flow_imp.g_varchar2_table(35) := 'AA5F743496A9FC6DBEEBEC19348A0A6F5AAB44B717CA00ECADBA8E1FEEDEC5DB83FAF7C76301EA8FB6F9E4E409348B95AEFAF804E8E3E41B0A491900DF8DEED3B3C76098CA3AFA17AB2A915754C4DBCBC6E6E01753A78B1EED421980EF1D3A88FD055779';
wwv_flow_imp.g_varchar2_table(36) := '3B37330BD949EA568016D6DCC489ABDE4AD4B26E9E912E00AD562BECA2FEA6C91889A7A74EE36D357C8741D10623F6AD5917F46C50A80250EF70609ED802C92C9F311351117AE53A902DC78FC12EEA1E455A2CFC985599481700676D1D9CF5B7F8BF7196';
wwv_flow_imp.g_varchar2_table(37) := 'D98CC9E9DACA86EC3E7716F5E29DC18FE63E127415B75005E00F572EE175F1DF891F188747C7E6881E758E5D2B545E92B11365D8C93232912E00B6F20AB8AD2DFCDF78DEF80948D6B8C5B1A8AE16C72F5FE26D73DC206C7FEAE9A01E1E431100A7DB8DF9';
wwv_flow_imp.g_varchar2_table(38) := '9B3EC06DF1FF336BCC18A4C7A91BCEB5296FA8C7A10BE7795BC6FD03D205C0778FEFB2E933D04FC3698F4CABC78D6D274EC02A860DBF7B6219660F4914BDEA8522003BCACBF0B3BD9FF27654A409CBA74C153DEADDB659B1F3AB13BC2D632539F902E073';
wwv_flow_imp.g_varchar2_table(39) := 'DCD1EA87660755E8CAF761784AFA50BC397FA1E8512F140158BE6D2B8A4549F5495959BCC6A856EC2DF7E62FBD3BC8642CA3225D005AF2F3C53F3DB0F6E1394A5B0BBBCB854F8E1F834BD40B5ABF62257206689B42EC6A00F6DDA8C2F777EDE46D835E8F';
wwv_flow_imp.g_varchar2_table(40) := 'A7A64E83BEDDD207B5DE3F7440694765757D59F683840210A453A525B85AEE5D57333A39191F2C7E42F4A8D39500B8DC6E2CDDFA11AA1A1BF8F598A119189FD6F95BEC4028001209C53700D3E27460EB31EF99BCCC7F2C5A8CC7341C69DA95006CBC5688';
wwv_flow_imp.g_varchar2_table(41) := '57F7EFE36D7DB81E4BA74D8529BCE373C7D4A00048245401602E565F475E61216F0FE91F8B9D2B9E8141E53024D800DC753AB1F8C38DFC9D0413ECD8DF17054022A10C80071EEC387D0A7783289B126C007C8F5A8A8DE98725B9B9D0897D0BC1A2004824';
wwv_flow_imp.g_varchar2_table(42) := '9401606EDEBD83CFCF7A77611922F4D8FE77CF22C96412BD9D0B2600ACECE19A8FB628B3588B264EC2E0E818D11B3C0A8044421D00E64851014AAABCFB6E2759D2F1968AB384B506A0D5EDC6F2ED5B5176CBFB163B2339193386FB5FC1AA16054022DD11';
wwv_flow_imp.g_varchar2_table(43) := '80F6EBEB7FB6602196B7DB55D69ED600BC71F922DE387A44B9CE4E4F47AE3934C71F51002412CA00B83D1E1C2DBAB7EA02136D8CC4CE95AB10E7A7D68F96009434DDC5337FDEACBC7768C3AA56CC189E19D4CB3C5F140089842A008E56170E5CBE8C9A06';
wwv_flow_imp.g_varchar2_table(44) := '6FB91446171EAE2CB3CE355BF81B62B687B8236A03606D7561CDCE9D28AEF36EDDF4FD190C2B7F32273B1B069A060D0ABD080B4293C38E2FCE9F43538B77111AC38A4EE9E307C3565AA6EC34F3574B544D00D8CEB5970FEEC7A122EF542BDFB965B1F015';
wwv_flow_imp.g_varchar2_table(45) := 'ADBE1BF963A2A2303F671C620C9D7FE3F843DF0012E9EA37406D73130E9C3F07BB5850C76A301812E2958DE56E9B0DF6F20A65A6E6FBB3E7E0B9CCFB9717A80980EFB89F1D7867B49811268655AE8606386AD83A20EFF96546BD1E7372C6213E8859210A';
wwv_flow_imp.g_varchar2_table(46) := '8044BA1280B2FA5B3872E9221FFB33EC4369484EE227B2FBF27E38C59045A7C3EB4B9FC4B476DB270305C0B7CA0363484CE4B57C7CB53635C15155AD848D3D0BCC1C3D0696386D6BFA290012092600EC85D785CA0A9C2FF6568763D819BCC6D414E53772';
wwv_flow_imp.g_varchar2_table(47) := '7BBE076B303F98330F8F99CD182486299D05A0CE6EC79EF232FCF6E07E7ECDF83BE8C26DB7C35E795D1976313919C390A36159060540225A03E0F6B8F1654101CA45050526CC1809635A2A7F20ED8CC7ED86ADA4F49E0F6630F8B83F3D1DBA4E1EA619F6';
wwv_flow_imp.g_varchar2_table(48) := '506CAFA8845B2C8F60CC431279A50B35952B280012D112007BAB0BFB2F5F425D8377D525C3863B86A424BF1FC8366E8783EF3FF69DB5D18205CC6836F3C3EE026181735457F361511B56206B5EF6E8803344140089A80D005B6CF6C5B97368B679CB8630';
wwv_flow_imp.g_varchar2_table(49) := '11717130C46BAB08C73EFCEC99C0D5785B396E351036BC8A1810CB4B17FAFB96E9087BF6603FAF0D9B217A646C8EDF3A41140089A809005BDF73F0E205387C677A1287DCF710DA15CEBA3A38C5B206B6119D6D480F1556E897D53C6D9B21621B66E6FA99';
wwv_flow_imp.g_varchar2_table(50) := '21A20048245000AEDEA8C6A982BFFD1DB64DD090921CF2D281DD190086957EE433443E6F8F27676521AB83A5D3140089741480FA9666DCBC730705D72B95A5CD0C7B0035A6A6AA1A836BD5DD0160F8334845E53D0FE2AC12DEC8D43424C4C66260A477D5';
wwv_flow_imp.g_varchar2_table(51) := '2A054022BE01F027CC6482312545F3185CAD9E0800C367882A2BF90B3A35684FF0D79C9A00B0B7BAAC6C7877F2AD4FAA8F8F873E2E4EF4748FF60FC79DA1007CCDF956866BC3863A6C6E3FBC5F0C9FE65433C5D9556EA713F6326F89C6C8740B7411FEA7';
wwv_flow_imp.g_varchar2_table(52) := '2A43814D95B6DE6DE22FE8DC36FB7DEF28BA6B28D69749B7188E105F140022350A00911A0580488D0240A446012052A30010A9510088D42800446A140022350A00911A0580488D0240A446012052A30010A9510088D42800446A140022350A00911A0580';
wwv_flow_imp.g_varchar2_table(53) := '488D0240A446012052A30010A9510088D42800446A140022350A00911A0580488D0240A446012052A30010A9510088D42800446A140022350A00911A0580488D0240A446012052A30010A9510088D42800446A140022350A00911A0580488D0240A44601';
wwv_flow_imp.g_varchar2_table(54) := '2052A30010A9510088D4FE1F35CFF948B2404BC300000010646542473230423134453637314137393041374636832F0D0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(7412409738361309)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_256_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000001000000010008060000005C72A8660000200049444154785EEDDD09745C579927F0FF7DB568DF376B972559B6A3CD891D2FB11DBB14298134019A252C678606063AC0C034307D589B697AE00C30F434E96E';
wwv_flow_imp.g_varchar2_table(2) := '26814E131AE81E960E0408D010D9AE1867711C2F5A2C79932559B2B56F25A924D5F6EE9C7BABF422C9925C25A916D5FB7EE7E4103D157E552F7EFFBAEF2EDF652084E816D3ED272784500010A267D4022044C7280008D1310A0042748C0280101DA30020';
wwv_flow_imp.g_varchar2_table(3) := '44C7280008D1310A0042748C0280101DA3002044C7280008D1310A0042748C0280101DA3002044C7280008D1310A0042748C0280101DA3002044C7280008D1310A0042748C0280101DA3002044C7280008D1310A8025CA7FF7BB98C4B8B83817100B93DB';
wwv_flow_imp.g_varchar2_table(4) := 'AC70665400A39BC3C800A30266E46E46D72D023123E72AB89B036E23835B05DC2AE36EB88C4E1330373D3B3BDBF1F0C38E087CEB61A3CBBFC855C78F9781A9B50CAC168CD732A0181CD9602C2F6CFF2548E870DE0786210EDC0067CD1CBC99995853EBE1';
wwv_flow_imp.g_varchar2_table(5) := 'FACED0BD89C8A08B00A8B43EBF4B61CA235051CFC07783B184C8B8FC24A2706EE7C059301C53B9E1B9B6BABAE6887A7F4110950150D9D666560607EB193C6FE20C6F626085DA2726C46FBC0B60BF06579FF3E4E49F6AABAC746ABF8A1251150095566BB9';
wwv_flow_imp.g_varchar2_table(6) := '817B3E08E07D60C88F92FF46241270DC02F0030F337CBFCD62E98884B7B411367D00545AAD898CBB1F55183E00B043DA272324784E71B0A75528CFB4592CD3DAD14D68530740D50BC7FF5451F957C050B909AF3DD9E438C73915FC8B6D750D7FD8AC1F65';
wwv_flow_imp.g_varchar2_table(7) := '53064095B5F12803BEC6C0F66FD60B4FA207073FCD81CF5FB434BCB0D93ED5A60A00D1DC37C0F31480776FB60B4DA21F07FE5585E1A39BE9B160D30440D5C9E3F7310FFF1163288DFEBF4A64B3E21CD701E55DAD7575E736C367D814015073A2F17D1C78';
wwv_flow_imp.g_varchar2_table(8) := '8A3166DE0C1795E81BE7DCC9800FB7D435FC30D2AF44640700E7ACC67AFCAB60F842A45F484296E2E05F6DB5347C493B1081223600C4641EC360DF8FC1D8DB22F0BA11E21FCE7FE8C9C9FB70A44E228ACC00B05A8D35F03C0BE04DDA85246493E29CFFBA';
wwv_flow_imp.g_varchar2_table(9) := '9519DF0E8BC51D691F212203A0E644E3FF0363EF89B48B45C85A891182564BFD7FD60E4488880B806AEBB1AF33E0B311727D08D9301CF846ABA5FE73DA810810510150636DFC24C0BE1501D7859020E19F6AB1343CAEFD186611130095274E1C54E0F923';
wwv_flow_imp.g_varchar2_table(10) := '634C09F33521247838F778188EB6591A5ED48E855144048077F96E7F3B63280BE3B52024243878879A9D5719092303111100F4DC4FF42652FA03C21E0035566B15B8BB098C19F4F69780E818E71E6EC0DDAD471A5AC37915C21E00D5D6C65F32B0B784F3';
wwv_flow_imp.g_varchar2_table(11) := '2210120E1CFC57AD9686B786E3DCF3C21A0062818FA2F297B4774388CE78C00F87B34330AC01507DE2D84B8CE13E9DFD372744C3393FD95AD770543B1062610B806AEBB1B732404CF72544EFDED862A9FF7D382E42F802E044E30B8CB123E1F8D0844492';
wwv_flow_imp.g_varchar2_table(12) := '70B602C212003B8F1F2F362ABC8B85B90F829048C001CE144F59CB9187BA42FD7EC2120035D6C62F03ECAF43FD6109895CFC6F5A2C0D5F0EF5FB0B7D00788B7C7481A138D41F9690C8C5BB5A8ED69781311ECAF718F200A8B136EE07D82BA1FC90846C0E';
wwv_flow_imp.g_varchar2_table(13) := 'FC408BA5E17428DF6BC80380A6FD12B292D03F06843E004E1C6B620CB5DA6726847871FE6A4B5D4348F7BA0869006C7FF1F93CB34BB949BDFF84DC4E8C06D8DD3CADB3A1C1A61D0CB2900640B5F5F8FB19F8F7B5B3134216F100EF69B3D4FF443B106421';
wwv_flow_imp.g_varchar2_table(14) := '0E8063DF61C063DAD909218B70E0BBAD96FA8F6807822CA4015073A2F13418DBA79D9D10B25888FB014217009C2B352F1C175B29C7691F9610B218E7332D96FA2430A66AC78228640150697D7E9701CA05EDCC849065711876B65A2C97B5034114B200A8';
wwv_flow_imp.g_varchar2_table(15) := 'B21EFF8802FEA4766642C8B242D91118B200A8A60E4042FC12CA7A81210C002AFD45883F42592A2C740140330009F10BE7686EADABDFA51D08A25006C00063C8D1CE4C085916E7186CADABDFA21D08A2D004807708D001C0A89D9910B21257CBD1076243';
wwv_flow_imp.g_varchar2_table(16) := '3114189200C83B7B363E736AC2AE7D3C42C8AA46925213FAF6EC99D10E044948026097D59AAAC233AE9D9510B22A0586B4268B65423B10242109809A97FE900DA761503B2B216475664F4ECBC18786B49F83242401209601C7B8945BDA590921AB7298D4';
wwv_flow_imp.g_varchar2_table(17) := 'FC2B871EECD30E04494802A0EAE4C9424575F568672584AC4A554C45178F1CE9D50E044948026087D55A628627E4258F09D9AC9C306CBD6CB17407FBFD872400AA8E1F2F5314DEA19D9510B22A5565E5171F78E0BA762048421200957F3C7697C18336ED';
wwv_flow_imp.g_varchar2_table(18) := 'AC24ECB8AA42753AE5AC13C56C0633D0EEEC918419B1BDF970FDD560BFA7900440D5C9C69D8ACADAB5B392B01237BF6766066E9B0DF0A8302627C19094442110415485DF75F148C3A560BF250A009DD16EFEF109A833DEB959CC6C86312D0DC6C4443023';
wwv_flow_imp.g_varchar2_table(19) := '4DD68C04140064C3718FEFE69F18873AB37892990C81D4341893280422010500D950DE9BDFEEFDE69F9D01630C09B1B1301B8C9898B14355555F08A4C2281E07A8251056140064C3708FE7F566BFEFE64F4948C0B6DC3CC4C7C4E06ADF2D0C4E4C7843C0';
wwv_flow_imp.g_varchar2_table(20) := 'E40B81640A8170A200201BE2F56FFE71A8B3B3DACDBF23BF002559D9B21368687212ED377B1687401AB504C2890280AC9BB7C36F16EEB1B145DFFCF337BF5151E4EB3CAA7A7B0898CD30A5A5D1E8409850009075E19C439D9B834BDCFCD3D3F29B3E3921';
wwv_flow_imp.g_varchar2_table(21) := '113B0A0AB075C1CD3F6F3E04DA7A45088CCBFFBF12130B63463A0C0909604B5E4F828B0280AC99B879B9D3296F7ECFD4949CEC9314172F6FFEB29C1C1895E527FD881018B04DE062CF0D0C8B390262596A5C1C8C191930C4C7CB1604090D0A00B226F2E6';
wwv_flow_imp.g_varchar2_table(22) := '77B9E09E9890FF889B3F3E261615F9F9D8B625173177E8DD777B3CB8353E86D61B3730619F061883121F0F534606945851A4864220142800C89AA82E37DC36DFCDEFF120D66446596E2EB6E7E523DE6CD65EB71A87DB8D1B23C3B8D4DB8BA9D919405160';
wwv_flow_imp.g_varchar2_table(23) := '484C84293D1D4A4C8CF63A123C1400246062B8CF3D39253BFDB8DB05B3D188A2EC1C541614222936567B9D3F669D4E5C1F1AC4955B3731EB700006038CC9C93204688E40F051009080C84E3FFB0C5CA3A350E766615014E4A667A0AAA818998989DAEB02';
wwv_flow_imp.g_varchar2_table(24) := '31353787CB7DB770BDBF4F3E1A30934906802139993A05838C0280F86D51A7DFE4A43C969E94246FFEA28C4CDFAB02C7018C4D4FA1A5E706FA4647BD23037171306566CA4E41123C1400C46FAA5B3CF7DBE01E1B07548F9CE22BC6FAC54CBFA5C37D8112';
wwv_flow_imp.g_varchar2_table(25) := '2303FD13E368BED18D7131A2C0989C1B2042403199B4D7918D450140FC2227FBD8EDB2E9CF1D0E988D266CCDD982AAC242C4F9D9E97727A253B06B78086D3D37647F80E803900B875253680971905000903B92CFFD0E075CA362B2CF1414F1DC9F968E9A';
wwv_flow_imp.g_varchar2_table(26) := 'E21264ACF1B97F25B23FE0D64D74F4F7C3A37ABC93843233BC9384686870C35100903B924DFFF171F98F18EF4F894F405571B19CE9170CC3939368EAEE923305E5A380181A148F021BD4D220AFA30020AB12DFFE9E693B5C23C3B203D06434A234678BFC';
wwv_flow_imp.g_varchar2_table(27) := 'F6BFD3649FB572793CE81E1E42737717E69C4EEFA3405ABA5C3844AD808D45014056A5BA5CDE5E7F31E10740766A2A6A4BB6222739C5F78AE0B0CDCECAF5025D0303621B6B18E21360CACEA209421B8C0280ACC8FBED3F0DD7F0B09CF61B678EC1F6827C';
wwv_flow_imp.g_varchar2_table(28) := 'ECCC2B90E3FFC1A4722EA70A5FE8ECC4A428296630C0243A04D3D3686EC006A200202B12D57CE5B7BFCD2657F9E5A4A5A3BAB818C971A1199B17B304AF0DF4A1A3AFEFF5B901595930C4C569EF91AC0F050059961CF69B9A826B7804DCE396CFDE62D2CF';
wwv_flow_imp.g_varchar2_table(29) := '96B434ED35A160B3CFA06F6C54D60E806290438262C1102D1BDE181400645972D86F64443E024412B15250B6026886E086A00020B799FFF6770E0FCB957E114551604C498529935A011B810280DC463EFB8F8AF9FE3659D4636B6A2A76666468BF0F877E';
wwv_flow_imp.g_varchar2_table(30) := 'BB1DAD43439873BBBC7D01D9D93004B8F290DC8E02802CA28DFB0F0FC99EFFBCE414BC7FD7DD78B462BBF69A70383B3880C75F3B838B03FDBE790169F21F9A17B03E14006411EE76C32566FD8D8D41610C878A4BF0E97D07509294A4BD261C46E6E6F0E3';
wwv_flow_imp.g_varchar2_table(31) := 'F636FCCB8573F070EE9D1D989D4D0B85D68902802C22EAFA8B717F51E8332D3E1EEFA9AAC67FA9AE81810577DCFF4EC4BC803FDEECC5DF9E7E05376D13DE6AC2E9E930A604774252B4A300201AD1F9E79EB0C969BF62CEFF3D79F9F88BBDFB519BB9F6B5';
wwv_flow_imp.g_varchar2_table(32) := 'FE1BA9777A1ADF6F6DC62FDA2ECA3502B272505616AD145C070A00A291E5BD4747E5D09FA8EBF7D6ED3BF189DD7B1017A439FF8172AA2AFED0D589FF73FA154CCCCED090E006A0002092ECFC13EBFD0787649DBF6D9959F8F3DD7BD05058B4A62B249AEC';
wwv_flow_imp.g_varchar2_table(33) := 'D32E1786666731E974C8893C89E61864C6C5212D260686352EED6D1B1BC513E7CFE3A5EE4E3083514E0D168F02646D280088E46DFE4FC8E77FE17071093E77DF21E427240474855C62E38F99195C1D1B43C7C4383A262630689F865B5591199F80ADC929';
wwv_flow_imp.g_varchar2_table(34) := 'D89E9E866DE919284C4A8239C03505630E87EC0C7CEADC6BF2675137D09C9D4D8F016B440140BC7F11C4CC3F5FADBF18A3097FBA6327FE72EFBE804A7D393C1E5C1D1FC76FAE77E094A8EF67F3AE205C2A2D3E01070A0BF12765E5D89DB305B186E53710';
wwv_flow_imp.g_varchar2_table(35) := '598E1801F88FCEEBF8DACB2FC2EE70C83901E6AC2CF9BF247014004412CD7FE79058F3EF40616A1A3E70F73D785B59B9DF5747DC98E2E6FF97D6161CBFDE01B7EA9D411867322329CEBBD18758DC33353B2B8B808AD584BB7273F1A15DBBB177CB96801E';
wwv_flow_imp.g_varchar2_table(36) := '09CE0D0DE2F1B367D0DAD7A75510163B0D93C0510010EFF3BFCD06E7D090ECFDDF9D5F804FEE3B80EA009EAD876767F1D3CB97F0A3E62638DC2EC4984CD8929C8C92F40CE4A6A4C80018B7DBD1393282BE491BA6E7E6644191BAD2327C7CF7BD013D6A78';
wwv_flow_imp.g_varchar2_table(37) := '47035AF08BB656EF6880981A9C9D459382D6800280C8A21FF325BFC437F31BCAB7E173070E22C9CF6ABCA2C3EF95FE3E7CEBCCABE81819968F10DB72B2B1BF642B0A9393B5C708F1BA9199199CBBD98BA6DE5E4C3B1C28484995AD8DB7976FF3FD697736';
wwv_flow_imp.g_varchar2_table(38) := 'E376E3D9AB57F0ADD32FCBBE05252101E69C1C9A14B4061400049ED959B9F24F9D99F14DFEA9C19FD7D4FA7D65446FFFCF2E5FC23FBCFA8AFCB9283D030D3B76A07485A5C3C3763B4E5EEFC085DE5E190E0F6FABC0670F1C444200C38D277B7BF0F5575E';
wwv_flow_imp.g_varchar2_table(39) := '46FFA40D2C260666B187C0061728D5030A0022C7FD45F35FCCFD2FCFCCC263010EFFF5DA7D4DF28BAD30190CB8A7B0086FD8B973C51E7EF1ADDDDC770BBF6D6B93A5C0F71716E12F0FDC87F200CA8C5D1C1DC5B72F9CC3E9EE2E30A3C93B1CB842E09095';
wwv_flow_imp.g_varchar2_table(40) := '5100E89C7CFE174B7F07067CCFFFF9F8E4BEFB027AFEEFB0D9F04FCD17F0FCD52B488A8BC3C1D2521C2ED9AAFD7E39578787F1DBF6768C4C4FA17A4B2E3EB1773FF666FB5F65B8677A1A4FB736E3976256A058229C9A2A470348602800746EE9F8FFD192';
wwv_flow_imp.g_varchar2_table(41) := 'ADF8FCC1C3C8096058AD7372124FB534E13F2E5F42626C2CEE2B2DC5FD5B4B6519B1E5885180F90018F505C0C7F7EEC3BEEC1CED357732EEF4CE07F8A7B30BE603E4E450A5A0005100E8DCA20E40A6E0918A0A7CE1E0E1159BEFCB199E9BC5BFB65DC40F';
wwv_flow_imp.g_varchar2_table(42) := '2E9C979D88B505057878E75D2B4E21767A3C387FEB267EDFDE2E4B80DF271E01EE3B88D2A464ED357722261CFDF2EA157CEDA553B2735176048AD581B47740402800744E9D133BFE784B7F89ADBDDF5559858FDFBD3BA0AB226EC6DF5EEFC0375F791976';
wwv_flow_imp.g_varchar2_table(43) := 'A7430EFBD5556CC77651BA6BC9F8BEB859FBA7A6F0C2F50EB4F7F521D668C49BB7EFC0A7F7EE43AC61F9C05849637717BEFAD28BB0897501B499E89A5000E89C5CFE3B340CD53187FC945459FCE39DDB2A02BE2A2D23C3F8F6B9B338D3DB233B024B33B3';
wwv_flow_imp.g_varchar2_table(44) := 'B0AFA404F9292988371AE5E380982938343D8DE65BB7D074EB26E644A76346A65C73F06051B1F667F9EBD5817EFCDD6B67706570C0BB3C382343AE1024FEA300D0393902E05B00B43D2B1B1FBD772F8EE6E5077C55265D4EFCAEF33AFEF9FC398CD8EDF2';
wwv_flow_imp.g_varchar2_table(45) := '51205BCCFBCFC9968B7F0006BBCB89AED131748F8EC8A67F724C2CDEB47D073E545B8BF498C0CB7BB58F8DE189A67378B1B3D35B25283D9D4602024401A0736E51FA7B7010DCE3416D6E1EFEDBBEFDD89DB9B6DEF4DEE9293C73E5327E73F50A46ED76ED';
wwv_flow_imp.g_varchar2_table(46) := 'F87292626271FFD6AD78EF5D55A80C60C461A1859D8F72E390B434D90A20FEA300D039F7E4249C838380AACA29C09FDA7F0055696BBB21C590A20881DF765EC7A91B37D03B69930B76C473BF204A8C89B501B94949D89B9F8F3F29AFC05DE9E92B8E16DC';
wwv_flow_imp.g_varchar2_table(47) := '89180A1405429EA5A1C035A300D0391900BE3900FB7C1372B60530216739934E275A4647D0DC3F8061FB14A69C4EA81C48349BE492E09DD9D9D89D93838C3534FB17EA9F99C10FDB5AF1E3E626EF9A0031172080B904840240D7E424A0F900006401D0CF';
wwv_flow_imp.g_varchar2_table(48) := 'DC770845012CCCB913314230E572C9D582C92613620258FA7B27A250E8BFB5B7E1FBE7CFCA9FC5A220F316FFE712100A005D1301E0B6D9641F80601193800EDD8FEC4D526F5F743CFEE4523B9E38F3AA7CFF7232D0962DB42A3000F408A0637216A00800';
wwv_flow_imp.g_varchar2_table(49) := 'B10C1840436919FEEAF0FD48319937C55511AB029FB972097FF7CACBF2FD1A448521311B70035B19D18E0240C7964E031601F0A5C34764537D3398F5B8F1F3CB97F1B7AFBC24DF2E0540E02800746C690BA06E6B29BE70E83032D7D939172AA26FE16797';
wwv_flow_imp.g_varchar2_table(50) := 'DBF18FAF9E96A79401201E010298C6AC7714003A26FB00440BC01700B210E8C1C3C8DF243BEF2EBB2088FA00024201A0634B47010E148961C083280B60514E380DF91621FDF0C279F9360CC92988C9DD12CEB7B4E95000E8DCC27900F716888940F7E1AE';
wwv_flow_imp.g_varchar2_table(51) := 'D4CD5158A36FC68E1F5C6CC54F5B9A7DB50153642720F11F0580CE89A9C0B218A8DBBDEEA9C0A1D63D3585EFB536E3B9F6365914444E058E906DCC360B0A009D5B580EAC222B0B8FEDD98B07F20B36C555691F1FC39317CEE354E7755A0BB04614003A26';
wwv_flow_imp.g_varchar2_table(52) := 'B602979D80E31380EA415E4A0ADE5F7B0F1EAD087C3970389C1918C0B7CEBE8A4BE2118631EF96E1191950E4EA43E20F0A009D9237BFCD260340FCBB901C1B8B775756E36377DFB329AECA899E1BF85F2FBF8891E969EFFB55143914281E052804FC4301';
wwv_flow_imp.g_varchar2_table(53) := 'A043CBDDFC8228D1FD96ED3BF085FB0EDD56C967AD6C4E87DC1F5054FF2D4B4B434E5CBCF6BBF5106B0B9EBB76155F7DF194B60B91442110100A009DF1DEFC93704F8CCB7F174B741953E0F1DD44723AF0A1FB91B201B5F5C432E03303FD78E2FC394C3B';
wwv_flow_imp.g_varchar2_table(54) := '1D78F4AE4ABCB362C78684CBB4DB857FBF74097FEFDB8B60D1E7A010F01B05804E88317F71C38B717FF7844D5600529882B4A424C49A4CE81F1B9537ECBEC242FCF7FD075191B2BE25C1825355F18B2B97F1F5974EC99FDF58568EFF71FF51C46DC05CFD';
wwv_flow_imp.g_varchar2_table(55) := '854380224E52139390101B8B81F131B83D22040C302425D2E3C01D5000E8C0FCCD2FC6FC3DBE66BFA228C8484AC2F6FC02286038D7D901FBDC1CB6898D41F6DC8BFA82C2755F99398F073FBF7219DF7CF945F9F383A5E5F8D2E1FBFDDE726C3517C746F1';
wwv_flow_imp.g_varchar2_table(56) := '7FCF9FC32BDD5D301B4DA8C8CB4741463ADA6FDE44DFD8A82F04146FC7A0283A6236D32AC165500044B9956FFE64ECC8CF47614606C6EC76347777CB56407A7C02DE5B5D830F55D7ACFBCA042B00C467FAE3CD5E7CE3F4CBE8B3D990929080EAE2121465';
wwv_flow_imp.g_varchar2_table(57) := '64626C7A1A976EF5E2D6E8E21030FA3A06C526A5E4751400516CB59B7F67BEF8C6CC908F01A26C57FBAD5E5CB9795316F37CA4623B3E7FE0E0BA8B77042B00C4BE02BFBC7615FFFBE5976407604E6A1A769795213D21517E661102E2F35008DC19054014';
wwv_flow_imp.g_varchar2_table(58) := '537DBDFD0B6FFECC64F1CD5F8082F47479F30BE29BF2DA403FCE775E9737D0A1A2627CE6A0A80CB4BECD368315004BD7009464E7606FF936987D1B91BC1E02377D21E0D63A06454BC040F304341400514A54F915D37CDD636372969FF866CF1465BAB59B';
wwv_flow_imp.g_varchar2_table(59) := '7F7153B8676404673AAE61CEE9C08EEC1C7C74CF5E1CC9CBD37EBF16C10A00EF0CC07338D5D90993D188ED7905D85552A2FD5E9021609FF6F6098C8EC22542C06090FB0618D3D2A19802DB84245A51004421B1CE5F6EF8313A0A3E3727BFE9335392B1B3';
wwv_flow_imp.g_varchar2_table(60) := 'A010F9E22FFF32CFC1C3535368BAD185C1B1316D8B70D10FB0DC6BFD158C00102315D6DE1E7CF3F4CB18989C44B278FE2F2AC1D665360615AF1DF785C0ADD111D9D2913B09A7A5CA85435439885A0051497588EDBE46E5AEBFF34364954545B2936CA51B';
wwv_flow_imp.g_varchar2_table(61) := '7AC6E5C4E55BB7D0DE7343BEA6BEB40C9F39701099EBA80F188C00B0399DF8E9A5763CF9DAAB7293D1BCF40CEC2E2F474AECF29B998A9680D880F4626F8F7C1C103F2BB1B172D19061038B9F6E56D40288325A959F911159EB5F8C8D6FCF2F44456EAE9C';
wwv_flow_imp.g_varchar2_table(62) := 'E9B712F16DD933328CD73A3AE070397157760E3E76EF5E1CCA5DFB63403002E0B26F01D0C9CEEB30198CD89697279BFFF3FD19CBF1A82AFA27C6D172A31B635353DAD26111027A6F0550004419CFDC1C5C23A350EDD3F2B9BF282B1BBBB69622C18F997D';
wwv_flow_imp.g_varchar2_table(63) := '23D35368BED18DFED151A4C5C5E3DD55D5F8704DED8AAD863BD9E800102125E6FF7FF3F42B189C9A446A62A21CFE2BCEC8D45EB3123115B963B01FADDDDDDE478198181900C6C4F575746E7614005144346F3D93BEF5FDAA478E8F571515636B967F9B65';
wwv_flow_imp.g_varchar2_table(64) := '88CD3AAFF4DF92370903435D69293E7BE020B2E3966F5EDFC94607C084C321CB807FF7EC19D9FC2FCCCCC29EB27224F8D9AB3F3C3589A6EE2E0C8E8FCB5101D90AC8CAD2F5DC000A80282287FDC6C765CFBFB8818BB2BD3788D88ECB1F22407A464770F6';
wwv_flow_imp.g_varchar2_table(65) := '7A07661D0E946564E2C3BBF7E00D6BD8B957D8C80010EFAD796418FF78EE2CCEDDEC95B3FFB6E7E7A3B67871EFFF6A442BE05A7F1F9ABBBBBC7D010909B28290B286F7132D2800A2882A9BFF23F0D8ED883199B1A3A000D58545017DC271BB1D2D3DDDE8';
wwv_flow_imp.g_varchar2_table(66) := '1D1E966B04DE54B11D7FB167EF9A6EDA8D0C00BBDB855F5DBB867F38735AB654D2939251BB752BF2032C5FD63B3A82D7AE7760666E4E3E06984567A08E1F032800A288B8F19DC3C3E00E87ECF9AF292941517A60BBE58A6DBBAF0F0EA0B9AB4B8E9D576F';
wwv_flow_imp.g_varchar2_table(67) := 'D9828FDFBB0FFB72022FB6B9910170657C0CDF69BA00EBF50ED9B7B135670BEEDE5A8A18DFE41F7F2DECE7104382629D801816D42B0A8028E29E9EF66EF5ED76232B2515BB4A4B91B3860ABF724E807C561E934542DE7157151EABDD15F0D4E08D0A0087';
wwv_flow_imp.g_varchar2_table(68) := 'C783DF7777E2F1574F637C66469BFB5FB286DA85B6D9593924D835D0EF2D23962AEA08061692D18402208A2CDCEA3B274DCC8F2F978B7B02257BCC07FAD1D2DD2DD7D7DF5B50884FEFDB8F9D016E1BBE5101D03D3589EFB534E3B94BED72B8AF383B1BF7';
wwv_flow_imp.g_varchar2_table(69) := '9496FADDB7B1D0B4C3814BB76EE2CACD5EDA5198260245978525BE73D3D3B1A76C1B52D6D8833F68B3E17C572746276D32441EADACC29F555521CEE07F937B230240FC19C76E74E3DB67CFC8997F497171A82C2A46F91A1E498419A71397FB6EA2BDA787';
wwv_flow_imp.g_varchar2_table(70) := '4A8953004497DB03A01C296B2CC1E51D12EC435BCF0DA8AA8ABB73F3F089BDFB708F9F438AC27A0340F4D477D86C78AAF9029EBF7655CE4728CCCA92CFFE896BDCBE6CD6E9C4250A000D3D0244918D0C0061D036E16B054C223126066FDEB1138FD5DEED';
wwv_flow_imp.g_varchar2_table(71) := '77B9B0F506C0B4CB85E7AE77E0C9B3AF61726E164971F1724AF35ABFFD050A80C52800A2C8460780E80B102302176F74C3E97663BBAC16B40796FC42BF26CFAC2700C4ACBF9691113C71FE2CCEF4F6C06830A0383B478EFBC7FB1940CBA100588C02208A';
wwv_flow_imp.g_varchar2_table(72) := '6C74000862496DEB8D1BE81D1996436E0F9695E3BFEEBE175BFCD840743D01303A37877FBF7C09DF6F3A2F8348143111C39A6235E37A50002C460110458211006E5545EFC8089ABA3B65CDC0FC9414FCA79A5D785BF9B63B0E0BAE350044C59F17FB6EE1';
wwv_flow_imp.g_varchar2_table(73) := '897367D12182C76442796E1EAA8B8A6054563FE79D50002C46011045821100C2D4DC9C2CB1D5D1D7073109FFEEBC3C7CFCDEBDB83B73F579F46B0900D1F177DD36817F6E6EC2EFAF5D957FFE96B434D4966C45666292F6BAB5A200588C02208A042B00E6';
wwv_flow_imp.g_varchar2_table(74) := '6707367575CA95746265E11BB755E0B15DF7206B9561C6B504C0B8C38167AF5EC1D34DE7E598BD2863264A7EDDB3B5544E4D5E2F0A80C52800A2483002C0E97163687212D7FAFA64B96DF10D2D14A5A6E2CF6AEFC623656530AFD02C0F340044D3FFE5FE';
wwv_flow_imp.g_varchar2_table(75) := '3E3C79EE2CAE0C0FC96362519358F65B919F8782F48C354DFE59880260310A8028B29101C0C1E170B9D1373E2667050E4D4C68BF13C498FC3D79F9F8E8EE3DD89595BDEC6E3F810480E8F5BF363181A79B9BF0878EABDAF179620290E80728CACC42626C';
wwv_flow_imp.g_varchar2_table(76) := '8C0C86B5A000588C02208A6C5400886F793163AE6774181DFD03B0D9BD9B6F32A311CC1C0378DCB2EC9868921F2E2EC1876A77A12235EDB6FE007F03409CAFDF6EC78F2FB5E399F636CCBA9CF25CA28EBFEA72813B9DF275713131721A7059CE16A4C6C5';
wwv_flow_imp.g_varchar2_table(77) := 'DF763E7F50002C46011045362200C437F1F4DC2C3A8706D139382897CD0ACC6486312559D6D1F3CCCECA9A83F078E462A187CAB7E1FDD535C85F5246DCDF00189B9BC3AFAF5FC38F5A5A302AC24694F04E4E86293555068D7B7C422E7516ED1251FA3B3F';
wwv_flow_imp.g_varchar2_table(78) := '331315B979721F00B132301014008B51004491F50680A89D679B99914DFEEEA12138DD2EEF53784C8CAC9E634C4E9235F454A7D35B78C46693E7CA4E4CC2DB2BBD1B7FA62FA8CEE34F008875FE2FF4F6E27B4DE7D12942853128F1F1306564C01017A755';
wwv_flow_imp.g_varchar2_table(79) := '389621303B23CF673018B025350DDBF3F2912DCA7CDF613872210A80C52800A2C87A0240F4EE8F4E4FE36A7F1F6E8E0CCB309037636C2C8CA9A9B268065BF06D2B6A0FBA45E561BB5D9EAF38350DEFA8AC425D5111B6C427C83E81D50240B4344489AF33';
wwv_flow_imp.g_varchar2_table(80) := '830378E6521BCEDEBC295F23CF27D6E827BD3EE4271E11440B40848E3C9FAACA3E880CDF2627220CFCAD0B4001B018054014596B008869BE03B60974F4F7A37F7CCCDBD32F9AE1F1F1F29B5F94CE5AFABC2D6F4ADFA3803A33238FE52425E1FEE212D929';
wwv_flow_imp.g_varchar2_table(81) := '981A1B071757F1626F0F9E69BB287F7F4F6E1EDE5B5D2B77071665C8AF8C8DE1546FCFEB3DFE66B32CD02176F0591836823C9FC3018FCD26EB1EC0ED96C753131251919787828C4CBFA60853002C46011045020D00D1D32F56FDDD1C1B43477F9F5CF423';
wwv_flow_imp.g_varchar2_table(82) := '190CDE0D35535264337C255AF35C8480AFAF40100B87321392E49F3FE598939B8F0A62FE40466292FCF69E9E9BC388AF73516026B161479A77C38E559EEB45A7A0DCEE6C7252EE782424C4C6A12C3717255959488A8D5D7584800260310A802812480078';
wwv_flow_imp.g_varchar2_table(83) := '7BFA1DE81E113DFDFD98F27D8B8BDE774352328CA92950FCF846952160B7C33D31F9B9BD80000008DA4944415421BFA145C7604014459E4774FA896DBBFCA9D32F373C15DB9E4DD8C09D0E792CD6EC1D2128CFC9416AFCED2D967914008B510044117F03';
wwv_flow_imp.g_varchar2_table(84) := '403C7F4FCDCEF7F40FC80AC08268828B9B50DC8C8154CA1521206E7ED53EE31DB6533DF23D887FC4CD3A3F8C275A1662684FF42D08E2661775F9442B43898F5BF59B7F29B1F7A1163CB3DE1102B14F607E4606B68B1182C4A4654708280016A3008822FE';
wwv_flow_imp.g_varchar2_table(85) := '0480E8DC9B98B1CB6FFDEEE161B8444F3F63727C5F7CEB8BCE377FBE855722C240DC9CF2E617AD03DF06A582E84B90BBF1880050146F002C7393FA4BFEF9B3B3B27350F643881102C5809CD45459323C3B3905A6259F850260310A802872A700109D7D23';
wwv_flow_imp.g_varchar2_table(86) := '539372984FEC93A7F5F4C7C5799FF797F4F4AF97B841C537B46B7858FE2C3AF7441DFEF504CC528B470866E486282260C4F261D139989B96B668FA3005C06214005164610064A6A4E0AEC2226FE92CCE65896F51F3FFC6F030866DBE69BDB2A73F410EF3';
wwv_flow_imp.g_varchar2_table(87) := 'C926F80ACFCD6B158A0090E71121E074C2333101CFF4B47CEC10C4F4E1929C2DC84A4E964B8A45E7A0C3ED429778F4E9EFA79A801400D1656100C49ACD72118D9824236E9039A7139362CB70DFCD31DFD32F66DB89B1F760085500CC13FD0F1EDB24DC93';
wwv_flow_imp.g_varchar2_table(88) := '366D84403C1224C6C7C94D52C5E883AA8AFE8F196FA7A76F9350D12AD12B6A0144111900BEB2E02B92CFFB66EF309FE8ECF3A3A77FAD6400889D8AC55E85417A04584A8E104C4FCB6142392A71876B215A3FE66CFF0B9D461B0A802822C6E4C5D660A239';
wwv_flow_imp.g_varchar2_table(89) := 'BC14630A98D120A7F58AF9FC62924F306F4441B43C44935C6E552E3AE8C4FCFE8C8C0D7FD4584A048F3AE780677A4AF60FC891886582400C798A16900801BDA2008822E22FBAE815D786DD344C76EEB118B31C860BF68DBF906896AB33B3E05C8521360E';
wwv_flow_imp.g_varchar2_table(90) := '4AAC7F3BF96E0419046278D2E1942B1897922B0EE3E3031AF28C36511500B5A78E557037AE44DB7F244282455559F9C5071EB8AE1D0892E0B6F97CAA8E1F2F5314DEA11D2084ACCA09C3D6CB164BB77620484212003BACD612333C5DDA590921AB521553';
wwv_flow_imp.g_varchar2_table(91) := 'D1C523477AB50341129200A83A79B250515D3DDA590921AB7298D4FC2B871EECD30E0449480260FB8BCFE7C5B8945BDA590921AB337B725A0E3EE41DA70DA29004C02EAB355585675C3B2B2164550A0C694D16CBE28AAF41109200A86C6B331B86FABD4B';
wwv_flow_imp.g_varchar2_table(92) := 'DB082177E4C9CE8D69ABAC5C3A6EBCE142120042F589C639C658E8069B09D9A438E78ED6BA86E0CC035F2264015073E25837188AB533134296C771A3A5AEBE44FB39884218008DA7C1D83EEDCC84906571CE4FB6D6351CD50E0451C802A0DADAF84B06F6';
wwv_flow_imp.g_varchar2_table(93) := '16EDCC849095FCB4C552FF6EEDA7200A61001CFB3A033EAB9D9910B22C0E7CA3D552FF39ED4010852C002AADC7DE6D007EAC9D9910B22C0FF09E364BFD4FB4034114B200A8B65A7730782E696726842C8BC3B0B3D562B9AC1D08A290050038576AACC726';
wwv_flow_imp.g_varchar2_table(94) := 'C15882767642C8629CCFB458EA93C0D8ED85128220740120E7021C6B620CB5F32727842CC1F9AB2D750DFBB59F832CA40150633D269E6BDEA59D9D10B20807BEDB6AA9FF887620C8421A0055D6E31F51C09FD4CE4E08594405FBE845CB03DFD10E045948';
wwv_flow_imp.g_varchar2_table(95) := '03A0C66A2DE0F0F4B0109F9790CD40ECD9E434A905A158063C2FA40120503F0021CBE31CCDAD75F5BBB4032110FA00A00941842C2B941380E6853C00AAAC8D471530ABF60E08213EFC408BA5E174282F47C80360F7D9B326D7E4C4355A1948C8EB38E73D';
wwv_flow_imp.g_varchar2_table(96) := 'ADCC58068BE5F63AE94114F200106AAC8D5F06D85FFBDE032104FC6F5A2C0D5F0EF585084B00EC3C7EBCD8A4F06B00F4BBF30321AF737B4CBCACED5043C80BE7862500045A1E4C881707FF55ABA5E1ADE1B81E610B00EA0C24C44B05B75CB434BC108EEB';
wwv_flow_imp.g_varchar2_table(97) := '11B600106AAC8DBF07D843E1F8E0844406FE87164BC31BC2F55EC21A0095274ED41A98DA14AE0F4F48B87185D7B41E69680DD7FB086B0008D41740F42A9CCFFEF3C21E0095566BB902CF0506246AEF8A9068C7B95DE54A6D2876005E4DD80340A8B1367E';
wwv_flow_imp.g_varchar2_table(98) := '1260DFF2BD2742A25EA857FDAD242202003FFB99A1262BED05801DD2DE1921D18AF3975AEA1A22E2EF7A640400408F02441F22A4E93F2F620240A839D1F8760EFC8C31A6F8DE1F21518373AE724579C7C5A30F3C1B291F2AA20240A8B6367E8E817D2D52';
wwv_flow_imp.g_varchar2_table(99) := '2E10211B877FAAC5D2F0B8F6630488B80010AA4F343ECD18FB40045C1F4236CADFB758EA3FA9FD1421223200C49261E7D4C46F19D01021D7899035E3C0B3AD471F7847A84A7D0722220340C83B7B363E7372FC4760EC6DBEF74AC8A62326FB8C26A5BDB7';
wwv_flow_imp.g_varchar2_table(100) := '6FCF9E99487CF3111B0012E7ACFA8563FF9381FD55245E3C4256C5F1B516CB035F04635C3B1661223B007C6A4E34BE8F034F31C6CC1176FD08B90DE7DC09C63ED86AA9FF37ED6084DA140120D49C38B18F43FD2EED2C442219076FE5E01FBC6879F06C24';
wwv_flow_imp.g_varchar2_table(101) := 'BFCF799B260004594F706AFC8B00FB0255132211C6C539BE6E4E4EFDCAB93D7B5C11F6DE56B4A902605EEDA96315AA8B7F058CBD93361921E12436F300F0731586CFB7592C1DE17C2F6BB12903605E95F5F93D0A678F83B183DA41424284032F7814FEE9';
wwv_flow_imp.g_varchar2_table(102) := 'F6230D174274CA0DB7A903605E8DB5713F383EC68147196331DA2F08D9609C7307187B46E5CA936D75752F69BFD8A4A22200E65558AD99B170BF9F73F611C650A6FD829075E21C9D00BEEB6086A7AF5A2C23DA2F36B9A80A80852A4F343EC4C0DECC187F';
wwv_flow_imp.g_varchar2_table(103) := '8481156ABF20C44F1CBC9771FC4655D8B3178FD6376ABF8822511B000B89DA830AF33C02CE1A18F86E3096A0FD9290799CDB39D8392838A672F5B936CB83515FAF521701B054F5A963A5DCC57731B05A305ECB8062706483B13CED45247A71DE0786210E';
wwv_flow_imp.g_varchar2_table(104) := 'DC0067CD1CBC195C690E7779AE70D06500ACA6FC77BF8B498C8B8B7301B130B9CD0A67460530BA398C0C302A6046EE6674DD22103372AE82BB39E03632B855C0AD32EE86CBE8340173D3B3B3B31D0F3FEC88C0B71E36F41799101DA3002044C7280008D1';
wwv_flow_imp.g_varchar2_table(105) := '310A0042748C0280101DA3002044C7280008D1310A0042748C0280101DA3002044C7280008D1310A0042748C0280101DA3002044C7280008D1310A0042748C0280101DA3002044C7280008D1310A0042748C0280101DA3002044C7280008D1310A004274';
wwv_flow_imp.g_varchar2_table(106) := '8C0280101DFBFF8EDEDC3C4EB2EF450000001064654247433445333635313638413142374644344A4B89CA0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(7412758339361318)
,p_file_name=>'icons/app-icon-256-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF400000256494441545847ED95CF6B134114C7BFBBD9D4A44D768D8936126DAC16412C89D880CDC18A547A50100FE21F20BD88148A7A10C49B07C183B742C183F71EBC88';
wwv_flow_imp.g_varchar2_table(2) := '1E4C2B22D652DB626A8B85B686B4D1FA23BB75A79B346E7EC98E71B107CB6CB014613F97D9F766063E3CE6BDE522CF13556C239C2D6057C0AEC07F5D01E7EA2A9D20459FAFEE495277059C2AC199D656189713A9144A9268EE59A12E81723E8F93FE0082';
wwv_flow_imp.g_varchar2_table(3) := 'A244E3CF44C54B4586C3EDAE9D60A72E814AE6130E37EF316383F9AFDFC085F69A312B9605CA9A8681137174ECF29B398309398BAB13E37034369A39162C0B4884E0E9B9F320C522AE0C3F03C70183DD3D703B1C38FBE43188E835CFB26059A0CBB90377';
wwv_flow_imp.g_varchar2_table(4) := '3BE3985F5BC3C3B959FA087B8FB4E3A0C7831B63A3182DEAE659162C0B5C9476E25AE418FD1E4A7D8093E771217C80C6F7926FF1887CA7DFAC5816B824F9D01F899AF19FDC9F4E6248FD351B58B1245052097A02BB71A7334EE32F85025D9B5D2EBADE7C';
wwv_flow_imp.g_varchar2_table(5) := 'FD0A238A0C41649F09CC0246EFC74409255DC7E0A9D33437A9C8E0001CAF75C4E59161B8DC2E4C1295B91B9805025A0E5D87DA9052B2B8DE1EA58F6E4A91E99E21F05E553130378BB0CF8F178B0B903D4DB59B9BC32CD0562C21B26F3FCAD50A742D87DB';
wwv_flow_imp.g_varchar2_table(6) := '1DB10D15B8353E064992C0733C921F97B12808E6DDCDB02C60F0269D465F340AB7205001E547010F666610AB75C37466190BCE2D10381A0A616A6909690E107279740783742FB1B282B2A709617088B5B4E05D26F3EF05C4AC8C0A0710AF177C4303CD95';
wwv_flow_imp.g_varchar2_table(7) := 'D7D7E9FAFB2754D175889A06BE5205096C1CD57F835960ABB005EC0AD815D8F60AFC0429630C304656C6730000001064654247364537343935303036324231313046310468FA330000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(7411818834361296)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA0000200049444154785EEDDD77785CD779EFFB773A00A2110009802040B0F72AB1886A14454AA2BAAC42D9B244C9CA89E3DCEBEBD829BE769273EC24BE717CED63E524';
wwv_flow_imp.g_varchar2_table(2) := '3E7193AD4E355BC51225AAB148A458C44EB1820D0009902041A20E6630E53C7B242E4B30F6CCA0EE3DB3BE9F7FAC77FB793C6B16F478FF66EFB5DEE598B1E69DA8000000AD3808000000E887000000808608000000688800000080860800000068880000';
wwv_flow_imp.g_varchar2_table(3) := '00808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000';
wwv_flow_imp.g_varchar2_table(4) := '80860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080';
wwv_flow_imp.g_varchar2_table(5) := '86080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086';
wwv_flow_imp.g_varchar2_table(6) := '08000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608';
wwv_flow_imp.g_varchar2_table(7) := '00000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800';
wwv_flow_imp.g_varchar2_table(8) := '00006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000';
wwv_flow_imp.g_varchar2_table(9) := '00688800000080860800000068880000008086080000006888000000808608000000688800000080860800000068880000008086080000006888000000808608000000688800006826D2D9299D0D6725D2DE16FBE6AE2143C45D54244E8F47B39900F446';
wwv_flow_imp.g_varchar2_table(10) := '00003412F6FB25587B52A291F0E7BEB5C3E912EFC832716566AA6B00D21B0100D044B8AD4D82274F49341AE9F61B3B1C4EF1968D883D110090FE08008006C2ADAD1238794A44A209BEAD43BC234AC59D93A3AE00484F040020CD859A9A25585F9FC4CDFF';
wwv_flow_imp.g_varchar2_table(11) := '2287784B4AC49D97ABAE00483F0400208D7536364A674343AFBEA177F870710F1DAA6A00E9850000A4A9E09933123A7FBE4FDFCE5350289E6145AA06903E0800401A0AD69F9650D3857EF966EEFC7CF11617AB1A407A200000692670AA4EC22DCDFDFAAD';
wwv_flow_imp.g_varchar2_table(12) := 'DC7979B1750100D20701004823C1BA3A09352777F3CFCECA8AFD676B7BFBA757E273E7E58BB784270140BA20000069A227BFFC8D9BFFF53367C556FCAFDEB5A3072180270140BA20000069A02737FFFCEC1C593273A664B8DCB1BA23D4296FEFDA294D6D';
wwv_flow_imp.g_varchar2_table(13) := '9FB4064E841000A407020090E27A72F31F9A9B274BA74F17EFA737FF8B02E190BCBD6B975C686D51D7E271E7E68AB7B454D500520F010048614677BF709237EDC2BC7C59327DBA789C2E75EDB382E190BCB777AF9C4D72F7002100486D04002045F564C1';
wwv_flow_imp.g_varchar2_table(14) := 'DFB0A105B278EA54D39BFF459D91B0BCBB778F9CBD906408604D0090B20800400A0A363448A8B131A9910FFFF4E6EF4E70F3BF281409CB3B1FEF95B3493611F214168AA788664140AA2100002926D4D4F4696FFFC47A7AF3BFA8A721C05B52CAD901408A';
wwv_flow_imp.g_varchar2_table(15) := '21000029C438D237507B32A9837D7A7BF3BFA86721C021BEF291E2FAB4B70000FB2300002922120848E044B544A3918423EEEBCDFFA29E840087D325BE8A7271FA7CEA1A00FB2200002920D2D929811327241A0E271C6DD1D0A1B264EAB43EDFFC2F3242';
wwv_flow_imp.g_varchar2_table(16) := 'C0DB7B76CBB9A62675CD8CC3E5968CCA51E2707F7E9B2100FB2100003667DCF403D5D5120906138EB420274F96CE9C9170B57F4F195B0457EFDC9154B320A7D727BE5115E2703AD53500F64300006C2C1A8D4AA0A646227E7FC2511AED7D97CD9E23BE2E';
wwv_flow_imp.g_varchar2_table(17) := '4D7EFA8B3FD4296F6CDF2EED1D89C7E2CA1A125B1300C0BE0800808D25DBE52FC3EB931B2FB944B23C5E756D2034073AE4CD1DDB2598C4D3087A0400F64600006CAAB3B1513A1B1A128ECEE3F6C80D73E6485E46A6BA3690CEB5B7CADBDB77C4D60624E2';
wwv_flow_imp.g_varchar2_table(18) := '2D2E16777EBEAA01D8070100B0A164B7FBB99C2E593A7BB6140DC956D706435D7393BCB773A744138C2FB63DB0A25C5C9983134E00248F0000D88CB1D82FB6DD2F895FD857CF9829E5F943553D988E9D3B2B1B3EDE9BF0231D2E97F8468D12A7C7A3AE01';
wwv_flow_imp.g_varchar2_table(19) := 'B01E0100B0916824221DC78F4BB4B333E1A8668D1B27D34658BBD06E6775B5EC3D7E548DC94C6C6780B13DD0E150D700588B0000D848A0A656C2ED89B7DA8D2A2E912B274E52B575A2B266FF3E3999C45A0557768EF8CA46A81A80B50800804D04CF9C91';
wwv_flow_imp.g_varchar2_table(20) := '50121DF786E6E6C90D33678ACB618F7DF6C662C0D53B77CAF9248E25360E0D320E0F02603D02006003E1D656099C3416FDC597E9F5C94D73E74AC600EDF5EFADF6CEA0BCBEED230924DC1EC89901805D1000008B454321E938763CE1A23F63C5FFB24B2E';
wwv_flow_imp.g_varchar2_table(21) := '91FC4C7B1EB8D3D0D62A6F6DDB96706740AC5DF0E8CAD8E24000D621000016EB30DAFC26D1E9EF8AE9D3A572A8BD1F9F1F3A735AB61CD8AFC66CC6356488F8465ABB8011D01D0100B05067C359E96C3C977004E3CBCA65FED8B1AAB6B375070E48CD99FA';
wwv_flow_imp.g_varchar2_table(22) := '8443F40C1B2E9E026BB63002A00F006099B0DF2F81EA9A84CD7EF2B37364D9ECD9B659F4974867242CAF6FDB26ADFE7675AD7B8ED8C9811C1F0C5883270080058C13FE62EFFDC3A1B89F6EB4F9357AFCE7F832D4B55470C1DF2E6F6CDB26E104EB1A1C1E';
wwv_flow_imp.g_varchar2_table(23) := '8F64545672722060010200608164F7FB5F33739694E5A5662FFDC3A7EB65F3C103EABB9871E7E68AB7B454D500060701001864C65E7F63CF7F2213CBCB65EEE8D478EF6F26D9F500460030820080C14300000651ACCFFFF113128D46E27EEAD09C5CB969';
wwv_flow_imp.g_varchar2_table(24) := 'F61C55A7AAD87A80EDDBA4B53DFE7A00634B60C6E8D16C0D040611010018441DD5351249B038CEED74C59AFDA4DA7B7F33E7DBDB64D5471F25EC0F40AB6060701100804112BA704182A74F27FCB4F91327C9F8E21255A7833D276B65D791AA845FC55756';
wwv_flow_imp.g_varchar2_table(25) := '26AEECC13DDA18D01501001804C976FB1B397CB82C9A3445D5E964F59E5DD290E0AC03BA0402838700000C826456FD67787D72EBDCB9E2B5599FFFFE629C17F0DAD6AD120CC53FEAD89D9727DE92F47A0202D81101001860A1E66609D6D5A9DACC92D973';
wwv_flow_imp.g_varchar2_table(26) := 'A42427BD57C21F6B3C2B1BF6EE55DFD98CD126D868170C60E010008001F449C39F63B1FF8C674279B9CC4BF12D7FC95A7760BFD49C89BF1622D620C8D815E070A86B00FA1701001840C62F7FE309403C99BE0CB96DEEDCD8EA7F1D74843AE5952D5BA433';
wwv_flow_imp.g_varchar2_table(27) := 'D1AB808202F10E1BA66A00FD8B00000C904F7AFD57ABDACC55D36748C5D00255EBE0C0E93AF9E8E0C1045FD5113B36D8E9F5AA2B00FA0F01001820C6AAFF4830A0EAEE941414C99269D354AD0BA327C0AA1D3BE47C4BFCA723CECC2CC9A828573580FE43';
wwv_flow_imp.g_varchar2_table(28) := '0000064032ED7E5D4E97DC326F9E647B7DEA9A4E1A3F6D1094E834447A030003830000F4B3D8C2BFA3C712EEF99F357EBC4C2B2D53B58EB61E3B22076B8C2391CDB1201018180400A09F05EB4F4BA8E982AABB933B6488DC7AC95C55EBCA382BE0E52D5B';
wwv_flow_imp.g_varchar2_table(29) := '2490E05589A7B0503C4545AA06D0770400A01F453A3AA4E3C409559BB9E1924BA568082D6F0DC7CF9D950F3E8EDF1BC0E1708ACF5810E8F1A86B00FA860000F4A38EE3272412E8507577469594CA951326AA1A22EF7EBC57EACE9D8D3B151C1604F42F02';
wwv_flow_imp.g_varchar2_table(30) := '00D04F92E9F867ECF5BFFDB2CB24234DDBFDF6566B30207FD8B245C209D64D64545488333353D5007A8F0000F413FFD1A312ED8CDFDC66CEF80932A57484AAF147BB6AAB65CFD1A3AAEE0EDB0281FE430000FA41A8A94982F5F5AAEE4E7656566CE19F93';
wwv_flow_imp.g_varchar2_table(31) := 'F6B6DD0A4723F2EAD6ADD2D6E157D7BAC3390140FF2000007D148D463FD9F697A0B5EDD2D973A438CD0FFBE9AB53CD4DF2DECE1DAAEE8EF10AC0781500A06F0800401F25D3F407FD8BE64040DF1100803E88FDFA3F7254A2E190BA8681E7F4654846E5A8';
wwv_flow_imp.g_varchar2_table(32) := '81FF20208D1100803EE86C3C2F9D0DFCFAB78277C40871E7E458F1D1405A200000BD148D44A4C358F91F8EBF750D03C3E9F5C54E0B04D03B0400A097F8F56F3D9E0200BD4700007AC96FBCFB4FB0F21F038B1D0140EF1100805E08B5B448F0D42955C33A';
wwv_flow_imp.g_varchar2_table(33) := '7407047A870000F442323DFF31385C39B9E21B513A381F06A4110200D04361BF5F02D5D5AAEECEADD3A6CB3F2D58A86AF4DE7FDFB4515EDDBB47D57FCA219963C788C3ED565700244600007A2870F294845B5B54DD9DDFDDFB25199BCD16B5FE50D5D22C';
wwv_flow_imp.g_varchar2_table(34) := '773DB752D5DD7117148877D8305503488C0000F440A4B333D6F65724AAAE7575F9D871F2B36BAE5535FAEE2FDF7B47361E3DA2EAAE1C4E9764184F019C4E750D407C0400A0078C96BF46EBDF787E79FB17645E11BF46FBD3A68606F98B577EAFEAEE7887';
wwv_flow_imp.g_varchar2_table(35) := '0F17F7D0A1AA06101F01004852ACF18FB1F52FCE99F5138A4BE4F95B6E5335FACFF2D75E9583F575AAEECAE9F54AC6E8D1AA06101F010048523247FEFE70D98D724359B9AAD17F56D5D6C877DF5CA5EAEEF82A2AC49599A96A00E6080040923AAAAB25E2';
wwv_flow_imp.g_varchar2_table(36) := '373FAB7E786E9EBC71D73DE2E23DF48008472272E38BCFCBE9E62675AD2B776EAE784BD91208248300002421120C4AC73163F19FB9BFBEFA1AB97FFC0455A3FF3D76E8A03CB27EADAABB93396E9C385C2E5503E81E01004842B0A141428D8DAAEECAE372';
wwv_flow_imp.g_varchar2_table(37) := 'CB9AFB5748367BD107D4F96040AE7DF209894423EA5A57DEE26271E7E7AB1A40F708004002D168543A8E1C897BEADF7593A7CA8F2EBF42D51838DF5ABF4EDE3B7440D55D3933322463D4285503E81E0100482099BEFFFFFBB63B64E1B0E1AAC6C0597FBA';
wwv_flow_imp.g_varchar2_table(38) := '5EFE9F3FBCA2EAEE18BB018C5D0100CC1100800402B5B5126E6B537557C373F2E4CD7B968BD3E150D7307022D1A82C79F619696C6B55D7BA32FA01187D01009823000071444321F11F31EF4067F8EA6597CBD7A64E533506DEBFEFD925BFDDBCC9F4838C';
wwv_flow_imp.g_varchar2_table(39) := '4580C6624000E60800401C46D73FA3FB5F3C6FDEF78094B0F77C509D686B93DB563E15F7337D23478A6BC8105503F83C02001047A2BDFFF32BC7C82F962C553506CF8AD5AB64574D8DE907BAF3F2C55B52AC6A009F4700004C24F3F8FF9FAEBB416EAD60';
wwv_flow_imp.g_varchar2_table(40) := 'C5B9155E3876547EF0EEDBA61FCD6B00203E02006022F1E37F87AC5FF190E47A3CEA8A5D35043A64E3E97AD95E57279B4F9C90FA2EDDF44A72F364FEA851726969995C565C2C453E9FFAEFECAA311890C54F3C1EF764465E0300E6080080898EEA1A89F8';
wwv_flow_imp.g_varchar2_table(41) := 'DB55DD95DD1FFFD777F8E58903FB65E3B16372FCDC5935EE648C292A928595A365C5E42932CC97A1AEDBCD8A3757C9AE5A5E0300BD410000BA6134FDF157198FFFCD7F5D7E77F112B967CC5855DB45201C9647F7EF935F6EDAD8E721795D2EF9EAC2CBE5';
wwv_flow_imp.g_varchar2_table(42) := 'E18993D5353B79E2F021F99FEBD6980E89D70080390200D08DC48FFF45DEBEFF411966B347E5EB4ED7CB0FD6AE91332DCD6A9CFDA12C7FA87CEF9AC532B7B0485DB38393FE76B9E9E927E30EC5575E2EAEAC2C5503F8040100E846A2C7FFD3CB46CA93CB';
wwv_flow_imp.g_varchar2_table(43) := '6E52B5D58C5FFDDFDFBC4956EDDB3BA043593EE712F9CE9C4B556D0777BDFAB2549D396D3A14E35C00E37C00009F470000BA884622E23F5C15F7F1FF5F5DB5481E9C3051D556BAD01994AFAD7E53F6D7D70DCA30E6558E967FBFE65AC9B4C9897BFFF5F1';
wwv_flow_imp.g_varchar2_table(44) := '5EF9C5871B4CBFBBC3E391CC3163540DE0130400A08B706BAB044E9E547577DEFCF203529291A96AAB18BFFCBFB27A957C9CE0AC82FE76F9D8B1F21F8BAEB545FBE383CDCDB2FCF9956A6CDDC91833469C29B05B03184C0400A00BE3DDBFB106C04C65E1';
wwv_flow_imp.g_varchar2_table(45) := '3079F98E2FA8DA4A7FF3FE7A79E7E07E4B86F0E0BC05F25733665AF2D95D5DF7DCCAB8EB1EBC2525E2CECB5335009E00007FA2E3D871890403AAEEEA8B732E916FDBE03DF8335587E5476BDF53E34A24CBE793692347CAA4E1C552909925B9DE4FFA1734';
wwv_flow_imp.g_varchar2_table(46) := '073BA5D1DF2E07CE9C96BDB5B5D21E30FFEE5DFDC72DB7C995C525AAB6CA7FDFFCA1BCBA67B7E9C7BB7272C537A254D5000800C0E77CB2FDCF78FF6FEE919B6F954525D6DE4CCE063AE4A695CF4820D4A9C665266F48962C9E3459661797882BC18985A1';
wwv_flow_imp.g_varchar2_table(47) := '685476D4D7CB9A03FBA5A9DD7C11E445C373F3E4B5BBEE16AFD3A5AE59E1F59A1AF9FBD5AB4C3F9AED80C09FE21500F019A1E66609D6C55B4CE7900F1EFC8A64BBDDEA8A15FE61D346796DEF9E841F3DB5A242EE9E365D3C096EFC5D754622F2C29E3DF2';
wwv_flow_imp.g_varchar2_table(48) := '719C263B177DFD8AABE4E149D6F60968080464E9938FA9317527A3B2529C36DBB609588900007C46B0BE5E424D9F6F93FB59D3CBCAE4C96537ABDA0A35EDC649784F4B246ABE4BC1B068F2145932668CF4ECD6FF47C6FFFA5B5555B2FEE00175AD3B7999';
wwv_flow_imp.g_varchar2_table(49) := '99F2D6BDF789CFE25D0177BCFC3B3976D6BCE3A167D870F1140C5535A03B0200F01946F7BF6838A4EAAEFEDB8285F27F4D9BAE6A2BFC60DB567961C7F6B81F3DBD6294DC337DBA38D595DE8988C8F3BB77C99E38A7EE19ECD015F187DB3F9267B76F5363';
wwv_flow_imp.g_varchar2_table(50) := 'EACA959D2DBEB2325503BA2300009F8A74764AC7D1A371E7E35777DC696937BC602422573FF584F8E32C522CCECD93AF5D71458F1FFB9B315E07FCFC830FA43ECE2AFB29A523E4999B6E51B515D6D4D7C9375F7BD5F4A31D4E97648E1FA76A40770400E0';
wwv_flow_imp.g_varchar2_table(51) := '53A1961609C6D94FEF737BE4FD075658BAE0CD68F5FB8D3FBCA2C6D49D2FCE5F20D38AFAB765EF9ED367E4D98FB6A8BA3BEFDCBF428A2C3C38A8B9B353163DF19844A2C6738BEE658C1E2D4EAF57D580CE0800C0A7820D0D126A6C349D8FB9A346CBAF96';
wwv_flow_imp.g_varchar2_table(52) := '5EA76A2BFC64D70E7972ABF98DB830374FBE75E595AAEE4F3F59BB561ADB5A55DDD50F6EB8516E1A59AE6A2B2CFFC3AB72F0B4F9224E6F69A9B87373550DE88C00007C2A50532BE1F636D3F97868FE02F9C6746B1BDF7CE5AD37657BF50935A6AE164D9E';
wwv_flow_imp.g_varchar2_table(53) := '2C4B07E884C255870EC986C38754DDD50373E7CBB766CE52B515FEE5A32DF2E2CE1DA61FED2E2810EFB061AA06744600003EE53F7458A2711E1FFFF8A69B6549A9B58BC8AE79E629391F27A43C7CE595322677603ADE1D3EDF288F6D343F62F8EAF113E4';
wwv_flow_imp.g_varchar2_table(54) := 'DFAFBE46D55678E9C471F9FEDBAB4D3FDA9999251915D63EA500EC820000180B008341E938762CEE5CACBAEF011991696DFFFF59BFFE851A4F77FE66C952193A407BDD1BFC7E79E4BD7755DDD5B861C3E5C5DBEE50B5150E3437C9BDCF3F6BFAD12C0404';
wwv_flow_imp.g_varchar2_table(55) := 'FE88000024D10028C79721EFDFBF42D55630F6FDCF79F497713FFA7BCB6E148FB3AF9BFFBAD7110EC93FBFF9A6AABBCAF665C80716CF51281291CB1EFFAD74C6D9CAC94240E013040020890580578E1B173BFDCE6AF37EFBA804E3DCDCFEF18665923140';
wwv_flow_imp.g_varchar2_table(56) := '0D793AC261F9E737DF5075575E975BB63CF4B0AAAD72FF1BAFCB9E93B5A61FCF4240E0130400C0B8B955D748C46FDEFBFE6B0BAF90AF4E99AA6AAB5CFDF413D2E4F79B7EFC5F2D5E22C3323354DD9F1AFC1DF2C87BEFA8BAAB82AC6C79EF4BF7A9DA2A3F';
wwv_flow_imp.g_varchar2_table(57) := 'DAB14D9ED9F691E9C7B31010F80401003016001EAE9268246C3A17FF79EBED72C5F062555BE5AE575E96AA86D3A61FFFF01557CA98013AF6F668D30579F4830F54DDD5E492525979F3ADAAB6CA6B35D5F20FABCD9F54B8860C11DFC891AA0674450080F6';
wwv_flow_imp.g_varchar2_table(58) := '92390170F597574871C6C0FCB2EE89BF7E7F9DBC1BA737FFD59327CB7503B40DF0AD2355B2EE80F9672F9B324DFE75E1E5AAB6CAC1E66659FEFC4AD38F77783C9239668CAA015D1100A0BDB0DF2F81EA6AD379303A006E7EF02BAAB6D2A307F6CB7F7CB0';
wwv_flow_imp.g_varchar2_table(59) := 'DE740885B9B9F2AD2BAF52757FFAC9FA75D2D8D2A2EAAEFE66D162F9F2B8F1AAB64A30129679BFF975DC8FCF9C30411CFDD42A1948550400682FD4D42CC17AF31D00138B4BE5B95BAC7FB46DD8D1D8280FFDFE854F47D6BD7BE7CD97E9FDDCEC66CF9906';
wwv_flow_imp.g_varchar2_table(60) := '7976EB66557767E53DF7CAE401EA41D0534B9F5B290D71CE2E602700C01A00403A1BCE4A67E339D399B86EF254F9D1E557A8DA4AC636B7EB9E5B19B725EFD0EC6CF9C65557F7EB61408FAC5B2717E234201A919F2FAFDF798F6D7E55FFD95BABE5A3EAE3';
wwv_flow_imp.g_varchar2_table(61) := '6A7C5D19A7021AA703023AE30900B41738794AC2ADE68FB61F9E7F997C7DFA0C555BEDA7BB77CAE35BE2FF1A9F51314A964FEFFBB1C5465FC4E776ED96BDB5E6AF480CFFF71557CA9F4D9AA26AABFDD3D62DF2FB5DE62D813DC38689A7A040D5808E0800';
wwv_flow_imp.g_varchar2_table(62) := 'D05EC7B1E3128973BCEE3F5FB74C6EA9A850B5D5CE063AE486A79F8C3D0D88E7EAC953E4BA3E2E767BA3EAB07C70F0A0AABB93E9F1CA5BF77D5972DC1E75CD6A8F1F3A283F5DBFD67418EEBC7CF19658BFAB03B0120100DA4B7406C06377DE2DB386DAEB';
wwv_flow_imp.g_varchar2_table(63) := 'D762A25FB8174D1B354AEE993A4D5C3D7C1D603CF67F7ECF1ED9575BA3AE99B1DB1312C39AFA3AF9E66BAF7E3AC23FC59900006B00A0B9682824FE2347E2CEC29A071E92A1363B43FE7C3020373EBB52FC719E5C5C949F3D44164D982C734A8A13068150';
wwv_flow_imp.g_varchar2_table(64) := '342A3B4FD7CB7BFBF74B53BB7963A48B0A8664CB6B772F972CB75B5DB383AA9616B9EBB9674C87E2707B24736CDF9E8E00A98E2700D05AA4A3433A4E981FAF3BC4EB930D0F3CA86A3B79EE6895FC6B9CC379BACAF2F964DAC87299545C2C05199992EBFD';
wwv_flow_imp.g_varchar2_table(65) := 'E4917D73B053CEB5B7CBFE3375B2AFF694B427112A2E7AE4E65B655149A9AAEDC2685BBCE0B7F1B702664D9CA8FE19D01101005A0BB7B64AE0E449D339A8282C9457EFB84BD576F3B71FAC97B70FECB76458F75D3A57FE76D61C4B3E3B19973FF198B4C5';
wwv_flow_imp.g_varchar2_table(66) := '093399E3C6896380CE4D00520101005A0B353549B0BEDE740EE6548C92DF5C7783AAED26100ECB036FBC2E07E3F43118080BC78C95FFBC66B1381D0373F2607FB8F5A517A5FA9CF9F64E7A014077040068ADB3B1513A1B1A4CE760E9A4C9F2FF5F31309D';
wwv_flow_imp.g_varchar2_table(67) := 'F5FACBF96050BEBAFA0D3974DA3CC8F4A7F99563E4916B164BA6CD7F3DAF787395EC8AB388D1575121AECC4C5503BA2100406BC133672474FEBCE91CDC3BE712F97FE75CAA6ABB6A0F87E4BB1B3E90B587E26FD9EB2BBB3FF6FFAC6FAD5F27EF1D323FBB';
wwv_flow_imp.g_varchar2_table(68) := 'C03B6284B87372540DE8860000AD05EBEA24D46CDE32F62F2FBF52FE7CB27D1ADC24F2E6C91AF9D1BAF5D2D86EDE29B037461715C93F5EB548E61414AA6B76F7838FB6CA0B3BB79B0ED35B5C2CEEFC7C5503BA2100406B819A5A09C76971FB8F4B96CA9D';
wwv_flow_imp.g_varchar2_table(69) := '95A9B55DAC2D14929FEDD925CF6CFB487D8FDECAF2FAE4AB0B2E931513526FC5FCCFF7ED959F6FDCA0BE4B579EC242F11415A91AD00D01005A4BD405D0AEDBDC9271A2AD4D9E39B85FD61C3E2C67E21C8CD39D09C38B6561E568593169B2ED7A20242BD1';
wwv_flow_imp.g_varchar2_table(70) := '3649E3D7BFF11400D01501005AF31F392AD150A7E91C3C7EE7DD32D3665D007BA3A6BD4D369D3E2D1F9D3A255B4F9CF893570495854532B7BC422E2D2D95B9C3864B81CD1A1FF5C65BA74ECADFAD7A4DD55DB97272C537C27E3D0C80C1420080D6FC5547';
wwv_flow_imp.g_varchar2_table(71) := '241A0E99CEC10BCBBF28E37372558DD4B1B1E18CFCE52B2F990ED8380DD0381510D01501005AF3575549341C369D8397BF789F540EE1D8D854B4ADF19C3CFCFB174D87EECA1A22BEF291AA0674430080D6120580D7EFBB5FCA32B3548DD4F1F1850B72DF';
wwv_flow_imp.g_varchar2_table(72) := '8BCF990ED899992919363AE511186C040068CD7FB84AA211F300F0F6FD2B64982F43D5481D475A5BE4CE67CD0F0472FA3224A37294AA01DD1000A0B5444701AF5DF190E47BBCAA46EAA86D6F979B9F79D274C04EAF37D60E18D01501005A4B1400363CF8';
wwv_flow_imp.g_varchar2_table(73) := 'B00CB1D951B748CED94040963CF998AABBE24860E88E0000ADB51F8CDF3A77CB57FE9B789DF63DF006E65A439D72C563BF517557C64980C6898080AE0800D05AA200B0F3CFBEAAFE19A925148DC8A58FFECA74D00E875332278C5735A01B0200B4D67EF0';
wwv_flow_imp.g_varchar2_table(74) := '9088444DE760DBC37F2E2E8743D5481DE168542E79F4977106EC90AC89135405E8860000AD25DA05B0F1A18725CBE5563552877126C2E58F3D6A3A6087D32599E37905007D1100A0B5449D00D73CF050CAF6C2D7DDF96050AE79E2B7A6D3E070B92573DC';
wwv_flow_imp.g_varchar2_table(75) := '585503BA2100406BFEA34725DA697E16C0EA2FAF90E20CFA00A4A23ABF5F963DFD84E9D01D1E8F648E49AD931E81FE440080D63A8E1D934830683A07AF7EE9CB52913544D5481DC7DB5AE5F6954F9B0ED8E9F549C6E84A5503BA2100406B1DC74F4824D0';
wwv_flow_imp.g_varchar2_table(76) := '613A071C0694BA0E3437C9BDCF3F6BFA059C191992318A4E80D01701005AEBA8AE9688DF6F3A074FDFB55CA6E6E7AB1AA963D7F94659F1BB174C07ECCCCC928C8A725503BA2100406B819A5A09B7B799CEC12F6EFF82CC2F1AA66AA48E8D674ECB5FBEFA';
wwv_flow_imp.g_varchar2_table(77) := 'B2E980390D10BA2300406B81932725DCDA6A3A07FFB6EC26B9BE8C236353D1EBB535F2F76FAE321DBA2B3B5B7C6565AA0674430080D6827575126A6E369D83EF2CBE56968F61AF782A7AAAEAB0FC78ED7BA64377E7E589B7A444D5806E0800D05AB0A141';
wwv_flow_imp.g_varchar2_table(78) := '428D8DA673F0B58557C857A74C553552C77FEEDD23BFDEB4D174C09E8242F10C2B5235A01B0200B4D6D9785E3A1BCE98CEC117E75C22DF9E73A9AA913AFE79EB16F9DDAE1DA603F60E1F2EEEA143550DE8860000AD198FFF8DD700666E9832557EB8F00A';
wwv_flow_imp.g_varchar2_table(79) := '5523757C73FD5A5973C8FCB027EF8811E2CEC95135A01B0200B4166E6F97404D8DE91C2C183D467E7EED525523753CB8FA0DD959536D3A605F4585B83233550DE8860000AD195D008D6E8066461715C94BB7DFA96AA48E1B5F7C4E4E5DB8603AE08CD1A3';
wwv_flow_imp.g_varchar2_table(80) := 'C5E9F5AA1AD00D01005A8B86C3E2AFAA329D03B7D3255B1F7A581C1C099C5222D188CC79F45771C79C397EBC389C4E5503BA2100407BFE4387251A8D98CEC33BF73F28453E9FAA617F27FDED72D3D34F9A0ED4E1704AE684F1AA0674440080D6221D1DD2';
wwv_flow_imp.g_varchar2_table(81) := '71E244DC3978E2AE7B64463EABC553C996B30DF2E72FFF3EEE908D73008CF300005D1100A02DE3E61FA8AD8DBD0688E787CB6E941BCAE8199F4A5E3E715CBEF7F6EAB84376B85CE21B399210006D1100A0A5646FFE86AF5F79953C3C71B2AA617F3FDBBB';
wwv_flow_imp.g_varchar2_table(82) := '477E15A709D0458400E88C0000EDF4E4E66FB873E66CF9C7B9F3540DFBFBEE871B64D5C77B931A282100BA2200402B3DBDF91BE6548C92DF5C7783AA617FF7BEF6AA1CA8376FF0D4552C0494978B93C59ED0080100DA880402B1A63F3DB9F91B86F83264';
wwv_flow_imp.g_varchar2_table(83) := 'C3FD2B540D7B8B44A3B2E0F1DF4A30D4D9A3811202A01B0200B4D0DB9BFF45EF3E843F0F5F00001F6049444154F0A0147AD90A980A6ADADBE496679EEAD5500901D009010069AFAF377FC3AFEEB853E616A6C7C9718DC1A07CFFC30DB2FB646DECBBCD1A';
wwv_flow_imp.g_varchar2_table(84) := '592EFFE3B28592EF498FAE786BEBEBE4AF5E7BF5D3BF5CCF1102A00B0200D25A7FDCFC0DDF59BC44968F19ABEA5465DCFCEFF9FD8B72B6B5E5735FA124374F9EBFE34EC9F578D4B554F5E8C1FDF21FEFAFEFD3F00901D001010069ABBF6EFE86E5732E91';
wwv_flow_imp.g_varchar2_table(85) := 'EFA4C1B1C0FFB069A3BCB6778FFA5E9F75F7AC39F2F797CE5575AAFAFB0F37C8EB49EE0088871080744700405AEAC9CDDF680B5B3E7CB8549FAE57D7BABAA462943C9A063B01963CBB52CEB636ABEFF559C5B979B2FA9E7B559DAAEEF9C32B7228CEDFB2';
wwv_flow_imp.g_varchar2_table(86) := 'BCB8446ACF9C89DBFEF9A25808A8A8E0D020A4250200D28E71C25FA0BA3AA99BBFCBE992C5B366894344DEDABE4D5DEF2AD3E3950D0F3C28CE143F1468D6AF7FA1BE537776FED957D53FA7A260242C0B7EFB686C278099EBE75C22C6ADFFBD9D3B251C49';
wwv_flow_imp.g_varchar2_table(87) := 'FCEF88C3E5165F4539210069870080B4F2C9CDDFF8E51F4AF8BD8C93FEAE99354B8AB373241C8DC8B3EFBF2F5131BF71BCB8FC4B322E2747D5A928DD03C08EC64679E8F72F98FE691CE2907BAFBC525C0EA79C6E6D2104406B0400A48D9EDEFC97CC9E2D';
wwv_flow_imp.g_varchar2_table(88) := '4543B2D5B5D7776C97F32DDD3F1E377C6FE9F572FBA84A55A7A2740F004F1C3E28FF73DD5AD33F4D616EAE2C9B3547D58400E88C0080B4D0D79BBF61F3912372F8648DAABB4A8796C0E91E00FEFAFD75F2EEC103EA6FD6D584F2729937FAF3BB398C10B0';
wwv_flow_imp.g_varchar2_table(89) := '66E74E09F13A009A210020E5F5C7CDDF5075B64136EDFB58D55D8D1B562C2FDE76BBAA5351BA07806B563E25E7DBDA4CFF340BA74C953145C3547DD1D9B6567967C70E4200B44200404AEBAF9BBFE182BF5D5EDBBA45D5DDF9E0C18725DBED5675AA49E7';
wwv_flow_imp.g_varchar2_table(90) := '0050E7F7CBB2A79F88FB27B975DE7CC9CDC854F5671102A01B020052564F6EFE1EB747AE9D39D3F4E67FD1B31B3E90509CFFBD9FDFF6055930EC4F7F41A68A740E00AB4FD6CAB7DF78DDF44FE1757BE49E8597ABBA3B0D6DADF22E4F02A009020052524F';
wwv_flow_imp.g_varchar2_table(91) := '6FFE4B67CD9282AC21EA9A99F7F6ED955367CFAABAAB87E75F265F9F3E43D5A9269D03C0F7B76C969776EF34FD938C1C3E5C164D9AA26A333C09802E080048390375F337ECABAB93ED870FAABAABC925A5B2F2E65B559D6AD239002C5EF9B434B6B59AFE';
wwv_flow_imp.g_varchar2_table(92) := '49E64E9C24138B4B541D8F1102DEDDB54B3A933851903E0148550400A49481BCF91B1ADBDB64D5475B55DD9DF71FFC8AE4B853B3677EBA0680636DAD72C7CAA7D5DFA83BB7CC9B2F7926EFFFBB63FCBBF0F6CE9D8400A42D02005246ECE65F532BD1247E';
wwv_flow_imp.g_varchar2_table(93) := '95793D1E593263A6142478E7DF9D17366D944030A8EAAE7EB8EC46B9A1AC5CD5A9245D03C0CA2355F26F6BDE35FD5364F832E4AEF90B549D2CE389C2DBC93E09707B3EE9189806072A410F0400A404A3AD6FC7891312ED4CFC7FC4C662AFA5B367CBD0CC';
wwv_flow_imp.g_varchar2_table(94) := '2C75AD27D61F3A28D5F575AAEEEAF61933E57BF37A7E33B183740D005F5FFBAEBC5F55653AC563478C90CBC64D50754FF4E84980C72319A346C5CE1000EC8E0000DB8B4622B1C7FE914047C2B1F6F5E66FA83A735A361DD8AFEAAE0AB373E4DD7BBFA4EA';
wwv_flow_imp.g_varchar2_table(95) := '54928E0120128DC8658F3F26813837E88553A7C998C22255F7544F428033232376809023C5CF8D40FA2300C0F602B5B5128ED3DCE522E3B1FFD2597DBBF91B5A82017965D387AAEECE0BCBBF24E353F05C80740C001F369C91AFBDF292FADB74E7EE8597';
wwv_flow_imp.g_varchar2_table(96) := '8BAF8FEB368C10F0CEAE9D124CE229942B3B5B7C6565AA06EC8800005B0B363448A8B131E11863EFFC67CD96823EDEFC2F7A69EB6669F3FB55DDD5D7AFB84A1E9E3459D5A9221D03C0BFEDD8262BB77D64FA27C8CBCE915BE65CA2EABEE84908F014148A';
wwv_flow_imp.g_varchar2_table(97) := '6758EF9F3A00038D0000DB0AB7B64AE0E4C984E3F3793C72DDEC393D5AE19DC847C78FC981EA13AAEE6A7AD9487972D94DAA4E15E91800AE7BEE5939D3D264FA2798563946665554A8BAAFCEFBDBE5ED1D3B2498C4EB00E32980F13400B02302006C29B6';
wwv_flow_imp.g_varchar2_table(98) := 'E2FF44B544131CD0D2DFBFFC2FAA6F699677766C577577D6AE7848F23D5E55A782740B00079B9B65F9F32BE34EFD0D975C9AB003644F351A2160FB0EE90CC70F010EA74B7C95A3D819005B2200C0963A8C457FFEF6B86373BBDC72DDECD93DDAE79FACA8';
wwv_flow_imp.g_varchar2_table(99) := '44E5858D1BE3FECA4BC5E381D32D00FC72FF3EF9DF1BDE577F93AE32BD3EB973C165AAEE4FC9760C643D00EC8A0000DB49F6D1BFF1CBBF24374FD5FD6D63D521397AEA94AABB5A3461A23C72D52255A782740B005F7AFD0FB2AFCEFC6F34A1A242E6558E';
wwv_flow_imp.g_varchar2_table(100) := '51757F3BD57441DEDB65DE7EF8225F79B9B8B2FAF72915D0570400D88EFFE8D184FBFD678F1F2F534B07769575CD85F3B26EF72E557765AC2A5FFFC083E2733AD535BB4BA70070BAA343AE7FEAF1B8537EEDCC59529A97AFEA81B0BBB646761F3DA2EAEE';
wwv_flow_imp.g_varchar2_table(101) := '38BD3EC9185DA96AC00E0800B095D0F9F3123C7326EE984A8B8AE4DA29538DFCAAAE0D84703422CF7DF0BE44A25175ADAB7F5B76935C5F3652D576974E01E0C9C387E427EBD6984EB9C7E3917B2E5B288E01FEF7C4F0F6DE3D72BAF19CAABBE32D291577';
wwv_flow_imp.g_varchar2_table(102) := '5EAEAA01AB1100601BD168543A8E1E8BDBEAD778EF7FDBFCF992D9C73DDDC95A7B60BFD49E39ADEAAEAE1A3F5EFED7D58B556D77E91400EE7CE52539D2601E1647978E90CBC7F7AEFB5F4FB50503F2EA962D128EB31EC0E812983966E05E47003D450080';
wwv_flow_imp.g_varchar2_table(103) := '6D849A9A24585F1F773C83F1E8FFB38E9C3D2B1FEEDBABEAAE5C4EA7ACBDFF41C94991FEEFE912000EB734CBDDCFC55FFD7FF58C99529E3F54D5036DF7C95AD97DC4BC1DB1C13B6284B853B08114D2130100B6D171EC586CFB9F99ECAC2CB9FDD279AA1E';
wwv_flow_imp.g_varchar2_table(104) := '0C9D91B0BCB87163DC5F76DF597CAD2C1F334ED576962E01E0A7BB77CAE35B369B4EB5B13DF49ECB2E57F560084523F2EAD6ADD2DE61DE40CAE9CB908CCA51AA06AC4400802D84DBDB25505313772C0BA74C93314583DF59EDC3235572E464AD1A4757D3';
wwv_flow_imp.g_varchar2_table(105) := 'CBCAE4C96537ABDACED2210018AF8AAE7DF699D8497D66268D1A25978E1AADEAC172F0749D6C3D7830EEC76554568AD3E75335601502006C21587F5A424D174CC7322433536E9F3B7F109673FDA933AD2DF2D6F66DAAEECEEBF7DD2F65FDDC8C6820A443';
wwv_flow_imp.g_varchar2_table(106) := '00D8D4D0207FF1CAEFD577EACE6DF317488E2F43D583C5E809F0BB4D9BE21E1AE42E2810EFB061AA06AC4200802DF8ABAA6247FE9A993F69B28C1F5EACEAC1F6CAB6ADD212E740A287E75F265F9F3E43D576950E01E0BB1F6E90551F9BAFCB28C8CB971B';
wwv_flow_imp.g_varchar2_table(107) := '67CE52F560DB567D5CF61F3F6EFAB12C06845D100060B9448D7F9C0E87DCB5F072F1BADCEADA60FBB8EE94EC387CC8F463870EC996D5CBBF285E9BF70448F500D01808C8754F3F21A14844CD7D570B264F9171C386AB7AB0B5063AE4E5CD9BE27E6C4645';
wwv_flow_imp.g_varchar2_table(108) := '853833FBEFEC0AA0370800B09CB1EFDFD8FF6FA6BCB844AE9E3849D55630CE9A3716031A2D82CDFC7F37DC28378E2C57B51DA57A0048D4FAD7E574C9DD0B178ADBE952D7ACB07ACF2E6988F3EFB4A7A8483C8585AA06AC400080E53A8E1D974830603A8E';
wwv_flow_imp.g_varchar2_table(109) := '2BA64D93CA82C15FFCD7D59AFDFBE4649C7DE7A97042602A0780702422D73FFFAC9C6D6D5173DED5D8116572D9B8F1AAB6CAE133A765F381FDA61FEFCA1A22BEF2D4692085F4440080A58CF7FEC6FBFF78EEB9FC0A4B1FFF5F74B2E982AC49D0F7FDD97B';
wwv_flow_imp.g_varchar2_table(110) := 'EE954903783E415FA5720078EBD449F9BB55AFA9EFD29D8138F9AF375A021DF24A9CD7000E87533227581F54A03702002C95E8FD7F7E4EAEDC3C7B8EAAAD159597B66E9136BFF93EEFDB66CC94EFCF5BA06ABB49E500F095B7DE94EDD5274CA7B4202F4F';
wwv_flow_imp.g_varchar2_table(111) := '6E9C395BD556FBDDE64DE20F74980E2363D42871660CFE4E05E02202002CD5D9D8289D0D0DA66398505E2EF3468F55B5D5F6D7D5C9B6C3F1F779AF5DF190E47BBCAAB693540D00552D2D72D773CFC49D4AABFA449879FFD04139515FA7EAAEBCA5A5E2CE';
wwv_flow_imp.g_varchar2_table(112) := 'E56C00588700004B19AD7F8D16C066E64E9C24138B4B546DB5643A03FEC5C2CBE52FA64C53B59DA46A00F8EEC60DB22A4E4B669FD72B5F98BF405C0EFB9CCC98E894406311A0B11810B00A010096EAA8AE96489C47EA8B67CE9211037C9C6B4F6D3A5225';
wwv_flow_imp.g_varchar2_table(113) := '55713A03E66566CA5BF7DE273E97B52BD1BB938A01A0CEEF979B9E794A2251F3AD7F532BC7C8EC8A0A55DBC1B1C6B3B261AF796871E5E48A6F44A9AA81C1460080A5FC478F4AB4D3BC6B9A551DDDE269F4B7CBAAAD5B54DD9D6F5F73AD7C71ACFDCE0748';
wwv_flow_imp.g_varchar2_table(114) := 'C500F0C3ED1FC9B3093A31DEBEE032C9F6DAABBDEED9B6567973DB476A8C5D3933B324A3C2DEDB4691DE0800B094BFEA8844C321D331DCBDF00AF1B9AD6B0064E6CD3DBBE46C9C7DDEC5B979B2EAAE7B62A705DA49AA0580F3C1805CFFCCD3128CD35AB7';
wwv_flow_imp.g_varchar2_table(115) := '7CF870B97AD21455DB45A29D004EAF4F324657AA1A186C040058CA7FB84AA271DEA72FBFF22AF1D8E8BDEE4527CE37CAFB7B76ABBA3B3FB87E99DC546EAFC7D2A916007EB6778FFC6AD34635A7DD593A7B8E14E7D86F319D3F1C92DF6DF8408DB32B87DB';
wwv_flow_imp.g_varchar2_table(116) := '239963C7A81A186C040058AA3DC1C9695FBE6A91FA677B89CA6BDBB7CB85784D698A86CBEF6EBF43D576904A01A02D1492EB573E1D6BAD6BA6287FA8DC3063A6AAED2422517966FD3AD321399C2EC91C6FBFD744D0070100964ADD0090DC53801FDF74B3';
wwv_flow_imp.g_varchar2_table(117) := '2C292D53B5D5522900FCEAC03EF9D907E66D7F0D7669FC63E6A9F56BD53F77276BE244F5CFC0602300C052A91C002489A700E38615CBF3B7DE163BD0C80E522500B48642B2ECB967A425CE0E9192C2225932D59EDB2D2F2200C0CE0800B0546A0780E49E';
wwv_flow_imp.g_varchar2_table(118) := '02FC70D98D7243993D567BA74A00F8AF8FF7CA2F3EDCA0E6B03BCB2EBD540AB3AC6FFB1B0F010076460080A5523D0024F314605461A1BC74FB9DB6780A900A01A0A9B35396AD7C5ADAE31C10555A5028D74E9BAE6ABB2200C0CE0800B054EA0780E49E02';
wwv_flow_imp.g_varchar2_table(119) := 'FCCBF5CBE4661BEC08488500F0C8EE5DF2D816F3ED738654F8F56F2000C0CE0800B0543A0400C3EBDBB7C9F9384F0146E4E7CB1FBE70B7E57D01EC1E008C5FFFD73FFDA474C4D9F75F5A344CAE9D3255D5764600809D110060A9740900754D17E4DD0447';
wwv_flow_imp.g_varchar2_table(120) := '057F67F1B5B27C8CB5DBBEEC1E007EF0D1567961E77635677FCA21B7CC9F2F79BED438458F00003B2300C052E912000CEF7EBC57EACE9D359D4FE38C80D7EEF9A2E4783CEADA60B37300A86A6996BB9F7F4EA2717AFE8F2D1B2997D9B0C5B2190200EC8C';
wwv_flow_imp.g_varchar2_table(121) := '00004BA55300680A74C86B9B374B54A2A673FAC53997C8B7E75CAAEAC166E70070FF1BAFC99E93274DA7C4E574C917162C109FDBBA00D5530400D8190100964AA70060D874E4B05425B889BD78CF72199D9DA3AE0D26BB0680B74ED5CADFAD7A3DEE544C';
wwv_flow_imp.g_varchar2_table(122) := '1F3356668EB4C776CA64110060670400582ADD0280BFB33376004C28CEF906978EAA945F2FBD5ED583C98E01201809CBCD2FBC20675A9A4CA722C3EB93DBE7CD13B7D37E472CC74300809D110060A9740B00865DB5D5B2E7E8D1B8F3FAC8CDB7CAA292C1';
wwv_flow_imp.g_varchar2_table(123) := '3F0BDE8E01E017FB3E96FFDA687E688E61C1A4C9326E78B1AA5305010076460080A5D231007446C2F2EAD6ADE28F73888D715CF0CB77DE2599AEC13DEAD86E01A0B6BD5DEE78EE19E90C9B3F31199A9D2337CDB944D5A98400003B2300C052E918000CB5';
wwv_flow_imp.g_varchar2_table(124) := '171A65EDEEF8CD81AC581068A700108D4665C5EA55B2BBB656CD49776EBC74AE14640D51752A2100C0CE0800B054BA0600C3BA0307A4E64C7DDCF97DFAAEE532353F5FD503CD4E01E0B9A355F2AFEFBDABC6D69DF165E5327FEC5855A71A0200EC8C0000';
wwv_flow_imp.g_varchar2_table(125) := '4BA57300E80887E495CD9BA5334E57BBCAC22279E1B63BC4E374AA6B03C92E01A0A1A3436E7D6EA5F83B836A6C5DF93C5EB96DDE3CF10EF26B92FE4400809D110060A9740E008643674ECB9603FBE3CEF1C3F32F93AF4F9FA1EA81649700F0B577DF910F';
wwv_flow_imp.g_varchar2_table(126) := '8F1D51E3EACEC22953654CD13055A7220200EC8C00004BA57B00304E0B7C63F72E3977E142DC795E79CFBD3239374FD503C50E01E095EA13F23FDE7A538DA93BC38616C8F583148A0612010076460080A5D23F0048521D02C70E1B2ECFDE72DB80BF0AB0';
wwv_flow_imp.g_varchar2_table(127) := '3A009CEEE8903B9E7F36EE51BF8E4FFBFDE7A648BFFF780800B03302002CA543003878BA5EB61E3C187B1A10CFFD73E7C95FCF9CADEA816065003056FD3FB8FA0DD9555BA3C6D33D87CC9D3851261697A82BA98A00003B2300C052E91E00361F3D2A876B';
wwv_flow_imp.g_varchar2_table(128) := 'AB939EE347EFB8532E292C52757FB332003C7EE8A0FC74FD5A359644C68FAC90F963C6A83A15110060670400582A5D0380D10AF8FD8307E46443438FE677784E9EBC74E75D32C43D300D82AC0A00475A5A64F90BCFC56D91DC9DB261C3E4CA899352AE05';
wwv_flow_imp.g_varchar2_table(129) := 'F0450400D8190100964AC700D011EA9477F7EE95F3CDE6BDEDE3B979DA74F997050B55DD9FAC08009D91882C7FF565397AB66761E8A2A1B97972EDB469929142A7005E4400809D110060A9740B004D1D7E7977F76E69EFF0F7695E7F7CD3CDB2A4B44CD5';
wwv_flow_imp.g_varchar2_table(130) := 'FDC58A00F0A39DDBE5998FB6AA31F4465646A65C3B6386E46564AA6BA98000003B2300C052E91400EA9A9B64FDDEBD711BFF242BD3EB93955FB84B2AB3B3D5B5FE30D801604D7D9D7CF3B557D5E7F785C7ED9145D3A74B714EAEBA66770400D819010096';
wwv_flow_imp.g_varchar2_table(131) := '4A970050D5705A36EFDF9F609DFF1F395C2E89C63900C730AAB0509EBDF5F67E3D30683003C089B636B9F7772F883FCE963F43327371914344E64F9E22E3860D57D7EC8C00003B2300C052A91E008CBDFDDBAB4FC8FEE3C7939E47D79021E22D2D954075';
wwv_flow_imp.g_varchar2_table(132) := '8D4412DC1CAF9930517E7AD52255F7D56005007F38147BEF5F7DEE9CFAECEE38BD3EF155944BB0BE5EC2ADADEA7A22532A2B6576C5A858CF003B2300C0CE0800B0542A0780703422EF1F3C28B5674E273D87EEA143C53BFC935FAF9160500227AA259A60';
wwv_flow_imp.g_varchar2_table(133) := '65FCDF2E5A2CF78D1BAFEABE18AC00F08D756B64DDE143EA73BBE370BAC437AA429C5E6FAC0E9E3923A1F3E73FFD6F131B39BC58AE9C38515C8EC13947A1370800B03302002C95AA0120100EC97B7BF7CAB9A6F82D7EFFC821DE926271E77DBEDD6FA8A9';
wwv_flow_imp.g_varchar2_table(134) := '5982F575AAEE8EDBE992DF7EE14E999E3F545DEBADC108004F1E3E243F59B7467DA6196F49A9B8F33EFF3E3FD4D424C17A235025F732A5302F5F164F9B26BE7E7C4DD29F0800B03302002C958A01A025D021EFECDE256DFEE456FA1BBF74BD234A638FFE';
wwv_flow_imp.g_varchar2_table(135) := 'BB1338794AC2AD2DAAEE4EC1906C79E6F62F484966DF56C10F7400D872B641BEF6EA2B124EF054C395932BBE11A5AAFEAC705B9B044FD5257C3272D190CC4C593263A6E4D8B07530010076460080A5522D009C6E6996757BF748B033B995FE0EB7477C23';
wwv_flow_imp.g_varchar2_table(136) := 'CBC4E9F3A96B5D452311E938765CA209760F188B021FBFF956C9F77CF2C8BC370632001C6F6D952FFDFEC5B87DFE0D0E8F47322A2BC511E708E448202081DA9309E7E422AFC723D7CC9829C386F4EFAE89BE2200C0CE0800B0542A058063E7CECAC68F3F';
wwv_flow_imp.g_varchar2_table(137) := '8E7BA8CF67397D19E22B1F195BE59E48C4EF978E6AA3477EFCFFEDA92346C86FAEBF517C49FC6F7667A002C085CEA0DCFBD24B52DF1CFF9588C3E1FCE4BD7F9C407491B1332050532B914087BA168FCBE992059327CBE8016CA5DC530400D8190100964A';
wwv_flow_imp.g_varchar2_table(138) := '850060DCF077D7D4C89E6347939E2B5776766CA57FBC5FB95D7536364A6712AD83AF1E3F417E7AD5D5E2ECC5E2B7810800C14858BEF2E61BB2F7D44975CD8CB100D25808992CE3E948B0AEAE473B04A68F1E2333CACB6DB1438000003B2300C052760F00';
wwv_flow_imp.g_varchar2_table(139) := '9168443E387448AA4FD7273D4F9F5DE9DF53C9AC0730DC3E63A67C6FDE0255276B2002C0DF7DF0BEBC75609FAACDC47BEF9F484F7708541497C8151326F42A24F5270200EC8C00004BD93900048D95FEFB3E96B33DB8F1788B8BC59D9FAFEA9E327EF11A';
wwv_flow_imp.g_varchar2_table(140) := '5B0313F50730AC98375FBE396396AA93D1DF01E0C73BB7CB5349B4F98DBD0E1955210E47EFF7ED872E5C90E0E9E4B75C160D1D2A8BA74C15AF853B040800B03302002C65D70060ACF47F77CF6E696D6F4F6A7E8C77DBDEB211A62BFD7B22D2D929811327';
wwv_flow_imp.g_varchar2_table(141) := '92EA8E77F7AC39F28D59B3243BC98372FA2B00347776CAFFDAB5435EDCB9435D33E370B925A3729438FAE18443E355406C874034A2AEC5939D9515DB2190ED4DBCE6602010006067040058CA8E01A0A1AD55D6ECDED5AF2BFD7B2ADCDE2E811A63516062';
wwv_flow_imp.g_varchar2_table(142) := 'D9BE0C593A71922CADAC9431B9B95212E7C09CBE04803ABF5FAA9A9BE49D13C7E59D0307A42D89A714065F4585B8FAB87DF1B37ABA43C0E7F1C8E21933A5D0821D020400D819010096B25B003871FE9C6CFC785FC27DEC17F564A57F4F19EFBC8D77DFA9';
wwv_flow_imp.g_varchar2_table(143) := 'ACAFAF44CC4443A15808E8C90E818553A7C8A8A185EADA602000C0CE0800B0949D02C0EEDA1AD97DF448D2F311EBE93F62448F56FAF794B1023ED4DCACEA5462743DF496940CD890633B044E9D8A350E4AD6CCB1E3647AD948550F340200EC8C00004BD9';
wwv_flow_imp.g_varchar2_table(144) := '210018DBFC36561D9663A74E253D177D59E9DF53467F80883FB9B50876E1CA1A127B3232188C8581C602C1648D1E3142168E1B3F28DB040900B03302002C6575003056FAAFDDB74FCE9C6F4C721EBAEFE93F90A2D1686CE15B32DB03EDC0D8EEE72D2DE9';
wwv_flow_imp.g_varchar2_table(145) := 'D38AFF9EFAE47589D143217E23A58B860F2D906BA64C11CF00EF102000C0CE0800B0949501A0351888ADF46F49F21172A29EFE032DD8D020A1C664838A353C0585E219664D27BED80E81BAFAA4CF10C81B922D8BA74F972103B8438000003B2300C05256';
wwv_flow_imp.g_varchar2_table(146) := '0580736DADF2DEEE5D12B070A57F6F182D8383A7CF24BDF86DB0188B218D2723CE8C8CC1FAC86EC57608D4D44A341C52D7E2C9F0FAE49AE9D3076C8700010076460080A5AC080035E71BE5FDBD7B24124DEE71F140AEF4EF2DE39DB7F1D83B120CAA6B56';
wwv_flow_imp.g_varchar2_table(147) := '707A7DE22E183AA8AF4412E9E90E01A7C321574D9F2123FBE1B8E5AE0800B03302002C35D801606FDD49D979F870D2DFB9373DFD0793F14420D4D414FBE51B6B1C148E24FD08BCA78C5720E272C68290118ADC79B9E2ECC7FDFDFDA9373B04E68C9F2053';
wwv_flow_imp.g_varchar2_table(148) := '4A47A8BA3F100060670400586AB00280F16B7FF3D12A397232F18135170DE64AFFC19268BEB3264E54FF9C0E82F5A725D494FC0E81B16565B260ECB87EDB214000809D110060A94437A42F5FB548FD736F758643B2C6E62BFD074BA2F94EB70060E8E90E';
wwv_flow_imp.g_varchar2_table(149) := '81D2C222B97AF264711B4F3CFA8800003B2300C052896E487D0D0046BBDAF7F6EC91A6B6E48E93B57AA5FF404B34DFE918000C3DDD21909F9D23D74E9F21999EE4CE58304300809D110060A94437A4BE0480C6F636796FF76EE948B267BD71688DB1D8AF';
wwv_flow_imp.g_varchar2_table(150) := '3F7BFADB4DA2F94ED70060E8E90E814C6387C08C195290D5FB6D9F0400D8190100964A7443EA6D0038D6785636EDDBDFB39EFE23CBFAE5C43A3B4B34DFE91C000C3DDD21E076B965C1E4495259D0BBDE060400D8190100964A7443EA6900084523F2D1D1';
wwv_flow_imp.g_varchar2_table(151) := '63527532B993F40C83D1D3DF2E12CD77BA0700436F76088C2B2B974BC78C16B7A367BB410800B03302002C95E886946C00680974C8913367A4AAB6563A3A93DF1BEFCECB8F35B0D145A2F9D621005CD4D31D02191EAF8C1B3952C616174B4E92DD030900';
wwv_flow_imp.g_varchar2_table(152) := 'B03302002C95E886D45D00088442D211EA94B66050EA2F5C90BA73E7E47C4BCF4FCC330EF331B6FAE924D17CEB14000C9D8DE7A5B3A1E7472E17E6E44A7161A194E4E7CB10AF5732DC1EF175F3FA8800003B2300C052896E480321DD57FAC79368BE750B';
wwv_flow_imp.g_varchar2_table(153) := '0086D80E815375128D463E9D85C1A3E37CC33E0800B054A21B527FD361A57F3C89E65BD71B52A4A323B63830D91D02FD45D7F9863D100060A94437A4FEE4CCCC12DF88D2B45FE91F4FA2F9D6F98614DB2170AA4E22FE76351F034DE7F986F50800B054A2';
wwv_flow_imp.g_varchar2_table(154) := '1B52FF7088A7A8503C8585EA8AAE12CD37372491CE73E7A4F3ECB9A43B07F605F30D2B11006029FF91A3120D750ED8189C5EAF784B4A6C7B68CD608B37DF0EB74732C78E51B5CE62C72ED7D70FE8698BCC37AC460080A58CFF93354EB3EB6FC6B9F4EE82';
wwv_flow_imp.g_varchar2_table(155) := '0271E7E4A86B30B6BE99CFB73B2F2F1696F047A19616093536C6D608F437E61B562300C052C611B61DC78EF7CBE22BE3985AE3F85E575E9EB86C7A4CADD5CCE6DBF8359A51392A3687F85361BF5FC2172EC49A07C58E5DEE23E61B76400080E58CC557B1';
wwv_flow_imp.g_varchar2_table(156) := 'C7AD1D1D49FD9F6BEC5C7AA7531C4EA78871367D66C627377E6EFA49F9EC7C1B8CC5914633246EFEC9898581D65689F83B44C2E15867418944923A68C89863E61B7641000000404304000000344400000040430400000034440000004043040000003444';
wwv_flow_imp.g_varchar2_table(157) := '00000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400';
wwv_flow_imp.g_varchar2_table(158) := '00004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000';
wwv_flow_imp.g_varchar2_table(159) := '00404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000';
wwv_flow_imp.g_varchar2_table(160) := '40430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040';
wwv_flow_imp.g_varchar2_table(161) := '43040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043';
wwv_flow_imp.g_varchar2_table(162) := '04000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304';
wwv_flow_imp.g_varchar2_table(163) := '00000034440000004043040000003444000000404304000000344400000040430400000034440000004043040000003444000000404304000000344400000040430400000034F47F00A65A6A87E0AD9E7700000010646542473138393746303543424431';
wwv_flow_imp.g_varchar2_table(164) := '3135304143292001AF0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(7413048301361319)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/widget_js
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '617065782E6A51756572792866756E6374696F6E28297B0D0A2020202076617220726F6F74203D20646F63756D656E742E676574456C656D656E744279496428276566576964676574526F6F7427293B0D0A202020206966202821726F6F7429207B2072';
wwv_flow_imp.g_varchar2_table(2) := '657475726E3B207D0D0A20202020696620282476282770466C6F775374657049642729203D3D202734392729207B20726F6F742E7374796C652E646973706C61793D276E6F6E65273B2072657475726E3B207D0D0A2020202076617220627562626C6520';
wwv_flow_imp.g_varchar2_table(3) := '3D20646F63756D656E742E676574456C656D656E744279496428276566576964676574427562626C6527293B0D0A202020207661722070616E656C203D20646F63756D656E742E676574456C656D656E74427949642827656657696467657450616E656C';
wwv_flow_imp.g_varchar2_table(4) := '27293B0D0A2020202076617220636C6F736542746E203D20646F63756D656E742E676574456C656D656E744279496428276566576964676574436C6F736527293B0D0A20202020766172206C6F67203D20646F63756D656E742E676574456C656D656E74';
wwv_flow_imp.g_varchar2_table(5) := '42794964282765665769646765744C6F6727293B0D0A2020202076617220696E707574203D20646F63756D656E742E676574456C656D656E744279496428276566576964676574496E70757427293B0D0A202020207661722073656E6442746E203D2064';
wwv_flow_imp.g_varchar2_table(6) := '6F63756D656E742E676574456C656D656E74427949642827656657696467657453656E6427293B0D0A2020202066756E6374696F6E206164644D736728726F6C652C74657874297B0D0A2020202076617220623D646F63756D656E742E63726561746545';
wwv_flow_imp.g_varchar2_table(7) := '6C656D656E74282764697627293B0D0A20202020622E636C6173734E616D653D2765662D6D73672065662D6D73672D272B726F6C653B0D0A20202020622E74657874436F6E74656E743D746578743B0D0A202020206C6F672E617070656E644368696C64';
wwv_flow_imp.g_varchar2_table(8) := '2862293B0D0A202020206C6F672E7363726F6C6C546F703D6C6F672E7363726F6C6C4865696768743B0D0A2020202072657475726E20623B0D0A202020207D0D0A2020202066756E6374696F6E20736574427573792862757379297B0D0A20202020696E';
wwv_flow_imp.g_varchar2_table(9) := '7075742E64697361626C65643D627573793B0D0A2020202073656E6442746E2E64697361626C65643D627573793B0D0A202020207D0D0A2020202066756E6374696F6E2073656E6428297B0D0A20202020766172206D73673D696E7075742E76616C7565';
wwv_flow_imp.g_varchar2_table(10) := '2E7472696D28293B0D0A20202020696628216D7367297B72657475726E3B7D0D0A20202020696E7075742E76616C75653D27273B0D0A20202020696E7075742E7374796C652E6865696768743D276175746F273B0D0A202020206164644D736728277573';
wwv_flow_imp.g_varchar2_table(11) := '6572272C6D7367293B0D0A20202020736574427573792874727565293B0D0A2020202076617220747970696E673D6164644D73672827617373697374616E74272C272E2E2E27293B0D0A20202020747970696E672E636C6173734C6973742E6164642827';
wwv_flow_imp.g_varchar2_table(12) := '65662D747970696E6727293B0D0A20202020617065782E7365727665722E70726F636573732827434841545F53454E44272C7B7830313A6D73677D2C7B64617461547970653A276A736F6E277D290D0A202020202E646F6E652866756E6374696F6E2864';
wwv_flow_imp.g_varchar2_table(13) := '617461297B0D0A20202020747970696E672E72656D6F766528293B0D0A202020206164644D73672827617373697374616E74272C646174612E7265706C797C7C27536F7272792C20736F6D657468696E672077656E742077726F6E672E27293B0D0A2020';
wwv_flow_imp.g_varchar2_table(14) := '2020736574427573792866616C7365293B0D0A20202020696E7075742E666F63757328293B0D0A202020207D290D0A202020202E6661696C2866756E6374696F6E28297B0D0A20202020747970696E672E72656D6F766528293B0D0A202020206164644D';
wwv_flow_imp.g_varchar2_table(15) := '73672827617373697374616E74272C27536F7272792C204920636F756C64206E6F742072656163682074686520617373697374616E74207269676874206E6F772E27293B0D0A20202020736574427573792866616C7365293B0D0A202020207D293B0D0A';
wwv_flow_imp.g_varchar2_table(16) := '202020207D0D0A20202020627562626C652E6164644576656E744C697374656E65722827636C69636B272C66756E6374696F6E28297B0D0A202020207661722069734F70656E3D70616E656C2E636C6173734C6973742E746F67676C65282765662D7769';
wwv_flow_imp.g_varchar2_table(17) := '646765742D6F70656E27293B0D0A2020202069662869734F70656E297B0D0A20202020627562626C652E636C6173734C6973742E616464282765662D7769646765742D627562626C652D68696464656E27293B0D0A202020206966286C6F672E6368696C';
wwv_flow_imp.g_varchar2_table(18) := '6472656E2E6C656E6774683D3D3D30297B0D0A202020206164644D73672827617373697374616E74272C2248692C2049276D20796F757220456E7465727072697365466C6F7720417373697374616E742E2041736B206D652061626F757420796F757220';
wwv_flow_imp.g_varchar2_table(19) := '6F7267616E697A6174696F6E732C2070726F6A656374732C207461736B732C20656D706C6F796565732C206F7220776F726B6C6F61642C20616E6420492077696C6C206C6F6F6B20697420757020666F7220796F752E22293B0D0A202020207D0D0A2020';
wwv_flow_imp.g_varchar2_table(20) := '202073657454696D656F75742866756E6374696F6E28297B696E7075742E666F63757328293B7D2C323030293B0D0A202020207D656C73657B0D0A20202020627562626C652E636C6173734C6973742E72656D6F7665282765662D7769646765742D6275';
wwv_flow_imp.g_varchar2_table(21) := '62626C652D68696464656E27293B0D0A202020207D0D0A202020207D293B0D0A20202020636C6F736542746E2E6164644576656E744C697374656E65722827636C69636B272C66756E6374696F6E28297B0D0A2020202070616E656C2E636C6173734C69';
wwv_flow_imp.g_varchar2_table(22) := '73742E72656D6F7665282765662D7769646765742D6F70656E27293B0D0A20202020627562626C652E636C6173734C6973742E72656D6F7665282765662D7769646765742D627562626C652D68696464656E27293B0D0A202020207D293B0D0A20202020';
wwv_flow_imp.g_varchar2_table(23) := '73656E6442746E2E6164644576656E744C697374656E65722827636C69636B272C73656E64293B0D0A20202020696E7075742E6164644576656E744C697374656E657228276B6579646F776E272C66756E6374696F6E2865297B0D0A2020202069662865';
wwv_flow_imp.g_varchar2_table(24) := '2E6B65793D3D3D27456E74657227262621652E73686966744B6579297B652E70726576656E7444656661756C7428293B73656E6428293B7D0D0A202020207D293B0D0A20202020696E7075742E6164644576656E744C697374656E65722827696E707574';
wwv_flow_imp.g_varchar2_table(25) := '272C66756E6374696F6E28297B0D0A20202020746869732E7374796C652E6865696768743D276175746F273B0D0A20202020746869732E7374796C652E6865696768743D4D6174682E6D696E28746869732E7363726F6C6C4865696768742C313430292B';
wwv_flow_imp.g_varchar2_table(26) := '277078273B0D0A202020207D293B0D0A7D293B';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(9606955686680409)
,p_file_name=>'widget.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260814151116Z')
,p_updated_on=>wwv_flow_imp.dz('20260814151116Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/files/widget_min_js
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '617065782E6A51756572792866756E6374696F6E28297B76617220653D646F63756D656E742E676574456C656D656E744279496428226566576964676574526F6F7422293B696628652969662822343922213D2476282270466C6F775374657049642229';
wwv_flow_imp.g_varchar2_table(2) := '297B76617220743D646F63756D656E742E676574456C656D656E744279496428226566576964676574427562626C6522292C6E3D646F63756D656E742E676574456C656D656E74427949642822656657696467657450616E656C22292C693D646F63756D';
wwv_flow_imp.g_varchar2_table(3) := '656E742E676574456C656D656E744279496428226566576964676574436C6F736522292C733D646F63756D656E742E676574456C656D656E7442794964282265665769646765744C6F6722292C6F3D646F63756D656E742E676574456C656D656E744279';
wwv_flow_imp.g_varchar2_table(4) := '496428226566576964676574496E70757422292C643D646F63756D656E742E676574456C656D656E74427949642822656657696467657453656E6422293B742E6164644576656E744C697374656E65722822636C69636B222C66756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(5) := '6E2E636C6173734C6973742E746F67676C65282265662D7769646765742D6F70656E22293F28742E636C6173734C6973742E616464282265662D7769646765742D627562626C652D68696464656E22292C303D3D3D732E6368696C6472656E2E6C656E67';
wwv_flow_imp.g_varchar2_table(6) := '74682626612822617373697374616E74222C2248692C2049276D20796F757220456E7465727072697365466C6F7720417373697374616E742E2041736B206D652061626F757420796F7572206F7267616E697A6174696F6E732C2070726F6A656374732C';
wwv_flow_imp.g_varchar2_table(7) := '207461736B732C20656D706C6F796565732C206F7220776F726B6C6F61642C20616E6420492077696C6C206C6F6F6B20697420757020666F7220796F752E22292C73657454696D656F75742866756E6374696F6E28297B6F2E666F63757328297D2C3230';
wwv_flow_imp.g_varchar2_table(8) := '3029293A742E636C6173734C6973742E72656D6F7665282265662D7769646765742D627562626C652D68696464656E22297D292C692E6164644576656E744C697374656E65722822636C69636B222C66756E6374696F6E28297B6E2E636C6173734C6973';
wwv_flow_imp.g_varchar2_table(9) := '742E72656D6F7665282265662D7769646765742D6F70656E22292C742E636C6173734C6973742E72656D6F7665282265662D7769646765742D627562626C652D68696464656E22297D292C642E6164644576656E744C697374656E65722822636C69636B';
wwv_flow_imp.g_varchar2_table(10) := '222C72292C6F2E6164644576656E744C697374656E657228226B6579646F776E222C66756E6374696F6E2865297B22456E74657222213D3D652E6B65797C7C652E73686966744B65797C7C28652E70726576656E7444656661756C7428292C722829297D';
wwv_flow_imp.g_varchar2_table(11) := '292C6F2E6164644576656E744C697374656E65722822696E707574222C66756E6374696F6E28297B746869732E7374796C652E6865696768743D226175746F222C746869732E7374796C652E6865696768743D4D6174682E6D696E28746869732E736372';
wwv_flow_imp.g_varchar2_table(12) := '6F6C6C4865696768742C313430292B227078227D297D656C736520652E7374796C652E646973706C61793D226E6F6E65223B66756E6374696F6E206128652C74297B766172206E3D646F63756D656E742E637265617465456C656D656E74282264697622';
wwv_flow_imp.g_varchar2_table(13) := '293B72657475726E206E2E636C6173734E616D653D2265662D6D73672065662D6D73672D222B652C6E2E74657874436F6E74656E743D742C732E617070656E644368696C64286E292C732E7363726F6C6C546F703D732E7363726F6C6C4865696768742C';
wwv_flow_imp.g_varchar2_table(14) := '6E7D66756E6374696F6E206C2865297B6F2E64697361626C65643D652C642E64697361626C65643D657D66756E6374696F6E207228297B76617220653D6F2E76616C75652E7472696D28293B69662865297B6F2E76616C75653D22222C6F2E7374796C65';
wwv_flow_imp.g_varchar2_table(15) := '2E6865696768743D226175746F222C61282275736572222C65292C6C282130293B76617220743D612822617373697374616E74222C222E2E2E22293B742E636C6173734C6973742E616464282265662D747970696E6722292C617065782E736572766572';
wwv_flow_imp.g_varchar2_table(16) := '2E70726F636573732822434841545F53454E44222C7B7830313A657D2C7B64617461547970653A226A736F6E227D292E646F6E652866756E6374696F6E2865297B742E72656D6F766528292C612822617373697374616E74222C652E7265706C797C7C22';
wwv_flow_imp.g_varchar2_table(17) := '536F7272792C20736F6D657468696E672077656E742077726F6E672E22292C6C282131292C6F2E666F63757328297D292E6661696C2866756E6374696F6E28297B742E72656D6F766528292C612822617373697374616E74222C22536F7272792C204920';
wwv_flow_imp.g_varchar2_table(18) := '636F756C64206E6F742072656163682074686520617373697374616E74207269676874206E6F772E22292C6C282131297D297D7D7D293B';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(9607107970680410)
,p_file_name=>'widget.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260814145413Z')
,p_updated_on=>wwv_flow_imp.dz('20260814151116Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(7414328599361320)
,p_name=>'Administration Rights'
,p_static_id=>'administration-rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', 'return true;')).to_clob
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>'SH256:K94FzTYWdjDQ6WIg6w48Or20nhyD_tWnqCuRh9rK4CU'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes/chat_reset
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(9608654862763110)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'CHAT_RESET'
,p_static_id=>'chat-reset'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF apex_collection.collection_exists(''AI_CHAT_HISTORY'') THEN',
'apex_collection.delete_collection(''AI_CHAT_HISTORY'');',
'END IF;',
'apex_json.open_object;',
'apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'SH256:Ezlp_1DOnwKze_jMSLZsh_AH3HsTQvCu7f8cFUwdRzo'
,p_created_on=>wwv_flow_imp.dz('20260814150800Z')
,p_updated_on=>wwv_flow_imp.dz('20260814150800Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/logic/application_processes/chat_send
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(9608493033749020)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'CHAT_SEND'
,p_static_id=>'chat-send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'l_messages apex_ai.t_chat_messages := apex_ai.c_chat_messages;',
'l_msg apex_ai.t_chat_message;',
'l_response clob;',
'l_user_msg clob := apex_application.g_x01;',
'l_cnt pls_integer := 0;',
'l_prompt clob;',
'BEGIN',
'FOR r IN (',
'SELECT c001, clob001',
'FROM apex_collections',
'WHERE collection_name = ''AI_CHAT_HISTORY''',
'AND c001 IN (''user'',''assistant'')',
'AND clob001 IS NOT NULL',
'ORDER BY seq_id',
')',
'LOOP',
'l_cnt := l_cnt + 1;',
'l_msg.chat_role := r.c001;',
'l_msg.message := r.clob001;',
'l_messages(l_cnt) := l_msg;',
'END LOOP;',
'l_prompt := ''Live EnterpriseFlow data snapshot (authoritative, use this to answer, do not guess numbers):'' || CHR(10)',
'|| ai_build_data_snapshot || CHR(10) || CHR(10)',
'|| ''User question: '' || l_user_msg;',
'l_response := apex_ai.chat(',
'p_agent_static_id => ''enterpriseflow-assistant'',',
'p_prompt => l_prompt,',
'p_messages => l_messages',
');',
'l_messages(l_cnt + 1).message := l_user_msg;',
'IF apex_collection.collection_exists(''AI_CHAT_HISTORY'') THEN',
'apex_collection.delete_collection(''AI_CHAT_HISTORY'');',
'END IF;',
'apex_collection.create_collection(''AI_CHAT_HISTORY'');',
'FOR i IN 1 .. l_messages.count LOOP',
'apex_collection.add_member(',
'p_collection_name => ''AI_CHAT_HISTORY'',',
'p_c001 => l_messages(i).chat_role,',
'p_clob001 => l_messages(i).message',
');',
'END LOOP;',
'apex_json.open_object;',
'apex_json.write(''reply'', l_response);',
'apex_json.close_object;',
'EXCEPTION',
'WHEN OTHERS THEN',
'apex_json.open_object;',
'apex_json.write(''reply'', ''Sorry, I ran into an error answering that. Please try again.'');',
'apex_json.write(''error'', SQLERRM);',
'apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'SH256:dDZQLHpqXK66Uv-geCkHeqjjKEUtsVRxe8QfPi2D2cI'
,p_created_on=>wwv_flow_imp.dz('20260814150539Z')
,p_updated_on=>wwv_flow_imp.dz('20260814150539Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/boolean
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(7422736196361412)
,p_lov_name=>'BOOLEAN'
,p_static_id=>'boolean'
,p_lov_query=>'.'||wwv_flow_imp.id(7422736196361412)||'.'
,p_location=>'STATIC'
,p_version_scn=>'SH256:CnCBOq-zabcz-aPWKwU8C5KDeZy6YuyjvpJoTrTywfI'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(7423434729361419)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'FALSE'
,p_static_id=>'false'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(7423039928361417)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'TRUE'
,p_static_id=>'true'
);
end;
/
prompt --application/shared_components/user_interface/lovs/client_client_code
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9029774840399493)
,p_lov_name=>'CLIENT.CLIENT_CODE'
,p_static_id=>'client-client-code'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'CLIENT'
,p_return_column_name=>'CLIENT_ID'
,p_display_column_name=>'CLIENT_CODE'
,p_default_sort_column_name=>'CLIENT_CODE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:D5DjBmc8HLD35pr7fQIBj1cTNo9owWOlMoZqdN3JnkY'
,p_created_on=>wwv_flow_imp.dz('20260809101011Z')
,p_updated_on=>wwv_flow_imp.dz('20260809101011Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/department_department_name
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(8441685834116472)
,p_lov_name=>'DEPARTMENT.DEPARTMENT_NAME'
,p_static_id=>'department-department-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'DEPARTMENT'
,p_return_column_name=>'DEPARTMENT_ID'
,p_display_column_name=>'DEPARTMENT_NAME'
,p_default_sort_column_name=>'DEPARTMENT_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:jIX4GBdyTxJpZfTWOrVX6DprML_IAZ04yofA5PJ0XVs'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/employee_employee_code
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(8621802554272194)
,p_lov_name=>'EMPLOYEE.EMPLOYEE_CODE'
,p_static_id=>'employee-employee-code'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EMPLOYEE'
,p_return_column_name=>'EMPLOYEE_ID'
,p_display_column_name=>'EMPLOYEE_CODE'
,p_default_sort_column_name=>'EMPLOYEE_CODE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:07JQWM-BHqKqPeHgBYN1kgTjoZPhsno_DOO66NfHn1w'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/organization_organization_name
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(8422046652108159)
,p_lov_name=>'ORGANIZATION.ORGANIZATION_NAME'
,p_static_id=>'organization-organization-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'ORGANIZATION'
,p_return_column_name=>'ORGANIZATION_ID'
,p_display_column_name=>'ORGANIZATION_NAME'
,p_default_sort_column_name=>'ORGANIZATION_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:jqmCeGPcJweZrEZK3C8r9jp07qYIp_12MuUe2Na7z0g'
,p_created_on=>wwv_flow_imp.dz('20260718130230Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/priority_priority_code
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9054174301448934)
,p_lov_name=>'PRIORITY.PRIORITY_CODE'
,p_static_id=>'priority-priority-code'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'PRIORITY'
,p_return_column_name=>'PRIORITY_ID'
,p_display_column_name=>'PRIORITY_CODE'
,p_default_sort_column_name=>'PRIORITY_CODE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:Yru4fvpn_nDhXdBqim4I-zPnY0G880d1KNr6BdRJIz8'
,p_created_on=>wwv_flow_imp.dz('20260809101826Z')
,p_updated_on=>wwv_flow_imp.dz('20260809101826Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/project_project_code
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9053959294448932)
,p_lov_name=>'PROJECT.PROJECT_CODE'
,p_static_id=>'project-project-code'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'PROJECT'
,p_return_column_name=>'PROJECT_ID'
,p_display_column_name=>'PROJECT_CODE'
,p_default_sort_column_name=>'PROJECT_CODE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:BfP2unT6qkeRKMkBdCMwT_n5aa4XNjB5PszGQbzgqXI'
,p_created_on=>wwv_flow_imp.dz('20260809101826Z')
,p_updated_on=>wwv_flow_imp.dz('20260809101826Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/role_role_name
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(8442376648116481)
,p_lov_name=>'ROLE.ROLE_NAME'
,p_static_id=>'role-role-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'ROLE'
,p_return_column_name=>'ROLE_ID'
,p_display_column_name=>'ROLE_NAME'
,p_default_sort_column_name=>'ROLE_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:zXAQl7mX2nDHBnzNN7KjP3THw7M0K2MWqUxr1z8ITeI'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/status_entity_type
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9030022377399497)
,p_lov_name=>'STATUS.ENTITY_TYPE'
,p_static_id=>'status-entity-type'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'STATUS'
,p_return_column_name=>'STATUS_ID'
,p_display_column_name=>'ENTITY_TYPE'
,p_default_sort_column_name=>'ENTITY_TYPE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:yT_uzIh969qbRhYA8f4ME4QCsnV-5WG42eU_m3dm6NQ'
,p_created_on=>wwv_flow_imp.dz('20260809101011Z')
,p_updated_on=>wwv_flow_imp.dz('20260809101011Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(7414687140361325)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(7409485127361195)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102510Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9417126137091519)
,p_short_name=>'AI Assistant'
,p_static_id=>'ai-assistant'
,p_link=>'f?p=&APP_ID.:49:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>49
,p_created_on=>wwv_flow_imp.dz('20260809145212Z')
,p_updated_on=>wwv_flow_imp.dz('20260809145212Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9857037004566850)
,p_short_name=>'Audit Log'
,p_static_id=>'audit-log'
,p_link=>'f?p=&APP_ID.:51:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>51
,p_created_on=>wwv_flow_imp.dz('20260815102510Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102510Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8664720041282211)
,p_short_name=>'Clients'
,p_static_id=>'clients'
,p_link=>'f?p=&APP_ID.:19:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>19
,p_created_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9401668170089976)
,p_short_name=>'Dashboard'
,p_static_id=>'dashboard'
,p_link=>'f?p=&APP_ID.:48:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>48
,p_created_on=>wwv_flow_imp.dz('20260809120516Z')
,p_updated_on=>wwv_flow_imp.dz('20260809120516Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8439104497108302)
,p_short_name=>'Departments'
,p_static_id=>'departments'
,p_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9
,p_created_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8465314390116611)
,p_short_name=>'Employees'
,p_static_id=>'employees'
,p_link=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>13
,p_created_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7409680918361197)
,p_short_name=>'Home'
,p_static_id=>'home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9027295471378504)
,p_short_name=>'Locations'
,p_static_id=>'locations'
,p_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>4
,p_created_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8419654663090314)
,p_short_name=>'Organizations'
,p_static_id=>'organizations'
,p_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>5
,p_created_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9310564153986008)
,p_short_name=>'Priorities'
,p_static_id=>'priorities'
,p_link=>'f?p=&APP_ID.:46:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>46
,p_created_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9241657066954396)
,p_short_name=>'Project'
,p_static_id=>'project'
,p_link=>'f?p=&APP_ID.:40:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>40
,p_created_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8619403938267048)
,p_short_name=>'Roles'
,p_static_id=>'roles'
,p_link=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>15
,p_created_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9291732212979692)
,p_short_name=>'Statuses'
,p_static_id=>'statuses'
,p_link=>'f?p=&APP_ID.:44:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>44
,p_created_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9271726983971740)
,p_short_name=>'Tasks'
,p_static_id=>'tasks'
,p_link=>'f?p=&APP_ID.:42:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>42
,p_created_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8643440382272323)
,p_short_name=>'User Accounts'
,p_static_id=>'user-accounts'
,p_link=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>17
,p_created_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(7410396059361207)
,p_theme_id=>42
,p_static_id=>'universal-theme'
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'26.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>2243014446517417
,p_default_page_template=>4073832297226169690
,p_default_dialog_template=>2101883943284197310
,p_error_template=>2102634289808461002
,p_printer_friendly_template=>4073832297226169690
,p_login_template=>2102634289808461002
,p_default_button_template=>4073839297780169708
,p_default_region_template=>4073835273271169698
,p_default_chart_template=>4073835273271169698
,p_default_form_template=>4073835273271169698
,p_default_reportr_template=>4073835273271169698
,p_default_wizard_template=>4073835273271169698
,p_default_menur_template=>2532939663579242476
,p_default_listr_template=>4073835273271169698
,p_default_irr_template=>2102002977963900996
,p_default_report_template=>2540130677583398057
,p_default_label_template=>1610598304472262251
,p_default_menu_template=>4073839682315169711
,p_default_list_template=>4073837480889169704
,p_default_top_nav_list_temp=>2528231041045349458
,p_default_side_nav_list_temp=>2469215554099805162
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>2127905476394690047
,p_default_dialogr_template=>4502917002193490937
,p_default_option_label=>1610598304472262251
,p_default_required_label=>1610598484065263269
,p_default_navbar_list_template=>2849019392706229583
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/26.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
,p_reference_id=>wwv_imp_util.get_subscription_id(4073840274158169736,2000,'universal-theme',8842.261)
,p_version_scn=>'SH256:uQ4JZ2SNi6_ApHjT-kqrEfO43wbND5yijbsMF-bW90c'
,p_version_scn_master=>'SH256:WOPVC8vP1TPWUxczh2dJ4mCZcNGSTzA1cn8DjR2oQjY'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260814145947Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(7408752011361185)
,p_build_option_name=>'Commented Out'
,p_static_id=>'commented-out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>'SH256:1lQI3DW9n-0ZEGoDXUirkaB0JWCIATVWpJZCTCkODmI'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(7409092493361191)
,p_name=>'Oracle APEX Accounts'
,p_static_id=>'oracle-apex-accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'SH256:MwlwV9vQNyvTGV3nRFfTrp5n7mJ1Ugme2lUrlsOYuxw'
,p_created_on=>wwv_flow_imp.dz('20260717204347Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204347Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_reload_on_submit=>null
,p_warn_on_unsaved_changes=>null
,p_autocomplete_on_off=>'OFF'
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260814151651Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9115222754531107)
,p_plug_name=>'Global AI Chat Widget'
,p_static_id=>'global-ai-chat-widget'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="efWidgetRoot" class="ef-widget-root">',
'      <button type="button" id="efWidgetBubble" class="ef-widget-bubble" aria-label="Open AI Assistant">',
'          <svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 3C7.03 3 3 6.58 3 11c0 2.39 1.19 4.53 3.08 5.99-.1 1.13-.5 2.4-1.2 3.51 1.6-.16 3.14-.77 4.36-1.6.87.23 1.8.35 2.76.35 4.97 0 9-3.58'
||' 9-8s-4.03-8-9-8z" stroke="white" stroke-width="1.6" stroke-linejoin="round"/><circle cx="8.5" cy="11" r="1" fill="white"/><circle cx="12" cy="11" r="1" fill="white"/><circle cx="15.5" cy="11" r="1" fill="white"/></svg>',
'            </button>',
'              <div id="efWidgetPanel" class="ef-widget-panel ef-chat">',
'                  <div class="ef-chat-header">',
'                        <div class="ef-chat-header-icon"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 3C7.03 3 3 6.58 3 11c0 2.39 1.19 4.53 3.08 5.99-.1 1.13-.5 2.4-1.2 3.51 1.6-.16 3.14-'
||'.77 4.36-1.6.87.23 1.8.35 2.76.35 4.97 0 9-3.58 9-8s-4.03-8-9-8z" stroke="white" stroke-width="1.6" stroke-linejoin="round"/></svg></div>',
'                              <div class="ef-chat-header-text">',
'                                      <div class="ef-chat-title">EnterpriseFlow Assistant</div>',
'                                              <div class="ef-chat-sub">AI &middot; live workspace data</div>',
'                                                    </div>',
'                                                          <button type="button" id="efWidgetClose" class="ef-widget-close" aria-label="Close">&times;</button>',
'                                                              </div>',
'                                                                  <div class="ef-chat-log" id="efWidgetLog"></div>',
'                                                                      <div class="ef-chat-inputbar">',
'                                                                            <textarea id="efWidgetInput" class="ef-chat-textarea" placeholder="Message EnterpriseFlow Assistant..." rows="1"></textarea>',
'                                                                                  <button type="button" id="efWidgetSend" class="ef-chat-send" aria-label="Send">',
'                                                                                          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 12L20 4L13 20L11 13L4 12Z" fill="white"/></svg>',
'                                                                                                </button>',
'                                                                                                    </div>',
'                                                                                                      </div>',
'                                                                                                      </div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260814144425Z')
,p_updated_on=>wwv_flow_imp.dz('20260814151651Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'EnterpriseFLow'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260809123403Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7422146329361397)
,p_plug_name=>'EnterpriseFLow'
,p_static_id=>'enterpriseflow'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(9114837576531103)
,p_branch_name=>'Redirect to Dashboard'
,p_branch_action=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_created_on=>wwv_flow_imp.dz('20260809123403Z')
,p_updated_on=>wwv_flow_imp.dz('20260809123403Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'Locations'
,p_alias=>'LOCATIONS'
,p_step_title=>'Locations'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9027363418378505)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9019191386378482)
,p_name=>'Locations'
,p_static_id=>'locations'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'LOCATION'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9023734794378498)
,p_query_column_id=>11
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>11
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9021386873378495)
,p_query_column_id=>5
,p_column_alias=>'ADDRESS_LINE1'
,p_column_display_sequence=>5
,p_column_heading=>'Address Line1'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9021711240378496)
,p_query_column_id=>6
,p_column_alias=>'ADDRESS_LINE2'
,p_column_display_sequence=>6
,p_column_heading=>'Address Line2'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9022199425378496)
,p_query_column_id=>7
,p_column_alias=>'CITY'
,p_column_display_sequence=>7
,p_column_heading=>'City'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9023395738378498)
,p_query_column_id=>10
,p_column_alias=>'COUNTRY'
,p_column_display_sequence=>10
,p_column_heading=>'Country'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9024038232378499)
,p_query_column_id=>12
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>12
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9024450973378499)
,p_query_column_id=>13
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>13
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9020537386378494)
,p_query_column_id=>3
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'Location Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9019728435378489)
,p_query_column_id=>1
,p_column_alias=>'LOCATION_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:RP:P7_LOCATION_ID:\#LOCATION_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9020974814378495)
,p_query_column_id=>4
,p_column_alias=>'LOCATION_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Location Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9020174171378494)
,p_query_column_id=>2
,p_column_alias=>'ORGANIZATION_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Organization'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8422046652108159)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9022922722378497)
,p_query_column_id=>9
,p_column_alias=>'POSTAL_CODE'
,p_column_display_sequence=>9
,p_column_heading=>'Postal Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9022577071378497)
,p_query_column_id=>8
,p_column_alias=>'STATE_PROVINCE'
,p_column_display_sequence=>8
,p_column_heading=>'State Province'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100641Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9024898670378499)
,p_query_column_id=>14
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>14
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9025281845378500)
,p_query_column_id=>15
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>15
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9025632306378500)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9019191386378482)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:7::'
,p_created_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9026000278378501)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9019191386378482)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9026410184378502)
,p_event_id=>wwv_flow_imp.id(9026000278378501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9019191386378482)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100642Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100642Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Organizations'
,p_alias=>'ORGANIZATIONS'
,p_step_title=>'Organizations'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8419710229090315)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8413480165090288)
,p_name=>'Organizations'
,p_static_id=>'organizations'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'ORGANIZATION'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8416053819090305)
,p_query_column_id=>6
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>6
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8416413379090306)
,p_query_column_id=>7
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>7
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8416886690090307)
,p_query_column_id=>8
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>8
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8415237706090303)
,p_query_column_id=>4
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>4
,p_column_heading=>'Email'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8414809242090302)
,p_query_column_id=>3
,p_column_alias=>'ORGANIZATION_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'Organization Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8414075232090298)
,p_query_column_id=>1
,p_column_alias=>'ORGANIZATION_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:RP:P6_ORGANIZATION_ID:\#ORGANIZATION_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8414487413090301)
,p_query_column_id=>2
,p_column_alias=>'ORGANIZATION_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Organization Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8415636134090304)
,p_query_column_id=>5
,p_column_alias=>'PHONE'
,p_column_display_sequence=>5
,p_column_heading=>'Phone'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8417269194090308)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>9
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8417662959090309)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>10
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8418011531090310)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8413480165090288)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:6::'
,p_created_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8418452387090311)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8413480165090288)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8418822468090312)
,p_event_id=>wwv_flow_imp.id(8418452387090311)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8413480165090288)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125932Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'Organization'
,p_alias=>'ORGANIZATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Organization'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8408907176090151)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8400758978090129)
,p_plug_name=>'Organization'
,p_static_id=>'organization'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'ORGANIZATION'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8409371744090151)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8408907176090151)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(8409850572090153)
,p_button_id=>wwv_flow_imp.id(8409371744090151)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8411123058090155)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(8408907176090151)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P6_ORGANIZATION_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8410353694090155)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8408907176090151)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P6_ORGANIZATION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8410723764090155)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8408907176090151)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P6_ORGANIZATION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8403189641090145)
,p_name=>'P6_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184920Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8403581336090145)
,p_name=>'P6_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_default=>'TO_CHAR(SYSTIMESTAMP)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184920Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8404302884090148)
,p_name=>'P6_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_default=>':APP_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8402395655090145)
,p_name=>'P6_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184920Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8401910845090144)
,p_name=>'P6_ORGANIZATION_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_prompt=>'Organization Code'
,p_source=>'ORGANIZATION_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184920Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8401104282090139)
,p_name=>'P6_ORGANIZATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_source=>'ORGANIZATION_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184919Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8401528660090144)
,p_name=>'P6_ORGANIZATION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_prompt=>'Organization Name'
,p_source=>'ORGANIZATION_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184920Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8402700496090145)
,p_name=>'P6_PHONE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_prompt=>'Phone'
,p_source=>'PHONE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184920Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8404766369090148)
,p_name=>'P6_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8405592522090149)
,p_name=>'P6_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_item_source_plug_id=>wwv_flow_imp.id(8400758978090129)
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260814184921Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8403990021090147)
,p_validation_name=>'P6_CREATED_AT must be timestamp'
,p_static_id=>'p6-created-at-must-be-timestamp'
,p_validation_sequence=>60
,p_validation=>'P6_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8403581336090145)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8405187119090149)
,p_validation_name=>'P6_UPDATED_AT must be timestamp'
,p_static_id=>'p6-updated-at-must-be-timestamp'
,p_validation_sequence=>80
,p_validation=>'P6_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8404766369090148)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8412337633090157)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8412337633090157
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8411534283090156)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8400758978090129)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Organization'
,p_static_id=>'initialize-form-organization'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>8411534283090156
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8411981385090157)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8400758978090129)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Organization'
,p_static_id=>'process-form-organization'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8411981385090157
,p_created_on=>wwv_flow_imp.dz('20260718125930Z')
,p_updated_on=>wwv_flow_imp.dz('20260718125930Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7
,p_name=>'Location'
,p_alias=>'LOCATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Location'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9014624189378283)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9002991907378259)
,p_plug_name=>'Location'
,p_static_id=>'location'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'LOCATION'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9015038401378283)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9014624189378283)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(9015555922378285)
,p_button_id=>wwv_flow_imp.id(9015038401378283)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9016883707378288)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9014624189378283)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P7_LOCATION_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9016021773378287)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9014624189378283)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P7_LOCATION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9016493565378288)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9014624189378283)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_condition=>'P7_LOCATION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9007389610378278)
,p_name=>'P7_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100659Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9004989073378277)
,p_name=>'P7_ADDRESS_LINE1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Address Line1'
,p_source=>'ADDRESS_LINE1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100658Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9005330012378277)
,p_name=>'P7_ADDRESS_LINE2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Address Line2'
,p_source=>'ADDRESS_LINE2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100659Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9005781692378277)
,p_name=>'P7_CITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'City'
,p_source=>'CITY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100659Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9006983569378278)
,p_name=>'P7_COUNTRY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Country'
,p_source=>'COUNTRY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100659Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9007784431378278)
,p_name=>'P7_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100659Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9008595606378280)
,p_name=>'P7_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9004113342378277)
,p_name=>'P7_LOCATION_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Location Code'
,p_source=>'LOCATION_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100658Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9003394121378268)
,p_name=>'P7_LOCATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_source=>'LOCATION_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100658Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9004506965378277)
,p_name=>'P7_LOCATION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Location Name'
,p_source=>'LOCATION_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100658Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9003777197378274)
,p_name=>'P7_ORGANIZATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Organization Id'
,p_source=>'ORGANIZATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ORGANIZATION.ORGANIZATION_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100658Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9006574507378278)
,p_name=>'P7_POSTAL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Postal Code'
,p_source=>'POSTAL_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100659Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9006135050378278)
,p_name=>'P7_STATE_PROVINCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'State Province'
,p_source=>'STATE_PROVINCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100659Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9008915055378280)
,p_name=>'P7_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9009711833378281)
,p_name=>'P7_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_item_source_plug_id=>wwv_flow_imp.id(9002991907378259)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100700Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9008122613378279)
,p_validation_name=>'P7_CREATED_AT must be timestamp'
,p_static_id=>'p7-created-at-must-be-timestamp'
,p_validation_sequence=>110
,p_validation=>'P7_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9007784431378278)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9009352857378281)
,p_validation_name=>'P7_UPDATED_AT must be timestamp'
,p_static_id=>'p7-updated-at-must-be-timestamp'
,p_validation_sequence=>130
,p_validation=>'P7_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9008915055378280)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9018060937378290)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>9018060937378290
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9017295057378288)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9002991907378259)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Location'
,p_static_id=>'initialize-form-location'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>9017295057378288
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9017665892378290)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9002991907378259)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Location'
,p_static_id=>'process-form-location'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9017665892378290
,p_created_on=>wwv_flow_imp.dz('20260809100639Z')
,p_updated_on=>wwv_flow_imp.dz('20260809100639Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_imp_page.create_page(
 p_id=>9
,p_name=>'Departments'
,p_alias=>'DEPARTMENTS'
,p_step_title=>'Departments'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8439216123108303)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8433372575108283)
,p_name=>'Departments'
,p_static_id=>'departments'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'DEPARTMENT'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8435562789108295)
,p_query_column_id=>5
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>5
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8435915734108296)
,p_query_column_id=>6
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>6
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8436327411108297)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>7
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8435190445108294)
,p_query_column_id=>4
,p_column_alias=>'DEPARTMENT_CODE'
,p_column_display_sequence=>4
,p_column_heading=>'Department Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8433979175108289)
,p_query_column_id=>1
,p_column_alias=>'DEPARTMENT_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:RP:P10_DEPARTMENT_ID:\#DEPARTMENT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8434722097108293)
,p_query_column_id=>3
,p_column_alias=>'DEPARTMENT_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Department Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8434387282108292)
,p_query_column_id=>2
,p_column_alias=>'ORGANIZATION_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Organization'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8422046652108159)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8436703191108298)
,p_query_column_id=>8
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>8
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8437123217108298)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8437580231108300)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8433372575108283)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:10::'
,p_created_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8437923884108300)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8433372575108283)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8438307880108301)
,p_event_id=>wwv_flow_imp.id(8437923884108300)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8433372575108283)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130232Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130232Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'Department'
,p_alias=>'DEPARTMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Department'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260718130230Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100236Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8428813945108181)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8421184253108150)
,p_plug_name=>'Department'
,p_static_id=>'department'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DEPARTMENT'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260718130230Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130230Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8429277653108183)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8428813945108181)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100143Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(8429755904108184)
,p_button_id=>wwv_flow_imp.id(8429277653108183)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8431071330108187)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8428813945108181)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P10_DEPARTMENT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100236Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8430210486108186)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8428813945108181)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P10_DEPARTMENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100236Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8430638675108186)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8428813945108181)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_condition=>'P10_DEPARTMENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100236Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8423396347108178)
,p_name=>'P10_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100142Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8423753064108178)
,p_name=>'P10_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_default=>'TO_CHAR(SYSTIMESTAMP)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100142Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8424541424108179)
,p_name=>'P10_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_default=>':APP_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100142Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8422937476108178)
,p_name=>'P10_DEPARTMENT_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_prompt=>'Department Code'
,p_source=>'DEPARTMENT_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100142Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8421557336108155)
,p_name=>'P10_DEPARTMENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_source=>'DEPARTMENT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130230Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100142Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8422507137108177)
,p_name=>'P10_DEPARTMENT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_prompt=>'Department Name'
,p_source=>'DEPARTMENT_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100142Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8421944252108158)
,p_name=>'P10_ORGANIZATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_prompt=>'Organization Id'
,p_source=>'ORGANIZATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ORGANIZATION.ORGANIZATION_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100142Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8424961865108179)
,p_name=>'P10_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100143Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8425759372108180)
,p_name=>'P10_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_item_source_plug_id=>wwv_flow_imp.id(8421184253108150)
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100143Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8424167832108179)
,p_validation_name=>'P10_CREATED_AT must be timestamp'
,p_static_id=>'p10-created-at-must-be-timestamp'
,p_validation_sequence=>50
,p_validation=>'P10_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8423753064108178)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8425362406108179)
,p_validation_name=>'P10_UPDATED_AT must be timestamp'
,p_static_id=>'p10-updated-at-must-be-timestamp'
,p_validation_sequence=>70
,p_validation=>'P10_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8424961865108179)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8432218336108188)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8432218336108188
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8431486883108187)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8421184253108150)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Department'
,p_static_id=>'initialize-form-department'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>8431486883108187
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8431858632108188)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8421184253108150)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Department'
,p_static_id=>'process-form-department'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8431858632108188
,p_created_on=>wwv_flow_imp.dz('20260718130231Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130231Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_imp_page.create_page(
 p_id=>13
,p_name=>'Employees'
,p_alias=>'EMPLOYEES'
,p_step_title=>'Employees'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8465408240116611)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8457180730116586)
,p_name=>'Employees'
,p_static_id=>'employees'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'EMPLOYEE'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8461782466116603)
,p_query_column_id=>11
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>11
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8462187068116604)
,p_query_column_id=>12
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>12
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8462530796116605)
,p_query_column_id=>13
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>13
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8458580586116596)
,p_query_column_id=>3
,p_column_alias=>'DEPARTMENT_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Department'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8441685834116472)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8460559162116601)
,p_query_column_id=>8
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>8
,p_column_heading=>'Email'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8459360353116598)
,p_query_column_id=>5
,p_column_alias=>'EMPLOYEE_CODE'
,p_column_display_sequence=>5
,p_column_heading=>'Employee Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8457721602116592)
,p_query_column_id=>1
,p_column_alias=>'EMPLOYEE_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:RP:P14_EMPLOYEE_ID:\#EMPLOYEE_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8459795413116599)
,p_query_column_id=>6
,p_column_alias=>'FIRST_NAME'
,p_column_display_sequence=>6
,p_column_heading=>'First Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8461384355116602)
,p_query_column_id=>10
,p_column_alias=>'HIRE_DATE'
,p_column_display_sequence=>10
,p_column_heading=>'Hire Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8460162682116600)
,p_query_column_id=>7
,p_column_alias=>'LAST_NAME'
,p_column_display_sequence=>7
,p_column_heading=>'Last Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8458104476116595)
,p_query_column_id=>2
,p_column_alias=>'ORGANIZATION_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Organization'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8422046652108159)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8460935418116602)
,p_query_column_id=>9
,p_column_alias=>'PHONE'
,p_column_display_sequence=>9
,p_column_heading=>'Phone'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8458920470116597)
,p_query_column_id=>4
,p_column_alias=>'ROLE_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Role'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8442376648116481)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8462919954116606)
,p_query_column_id=>14
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>14
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8463364227116607)
,p_query_column_id=>15
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>15
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8463747182116608)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8457180730116586)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:14::'
,p_created_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8464119432116608)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8457180730116586)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8464558001116609)
,p_event_id=>wwv_flow_imp.id(8464119432116608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8457180730116586)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130355Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130355Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_imp_page.create_page(
 p_id=>14
,p_name=>'Employee'
,p_alias=>'EMPLOYEE'
,p_page_mode=>'MODAL'
,p_step_title=>'Employee'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260718130353Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100445Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8452688617116487)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8440362724116460)
,p_plug_name=>'Employee'
,p_static_id=>'employee'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMPLOYEE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260718130353Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130353Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8453075761116487)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8452688617116487)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100445Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(8453546964116489)
,p_button_id=>wwv_flow_imp.id(8453075761116487)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8454803170116490)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8452688617116487)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P14_EMPLOYEE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100445Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8454008352116490)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8452688617116487)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P14_EMPLOYEE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100445Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8454469446116490)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8452688617116487)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P14_EMPLOYEE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100445Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8445372302116483)
,p_name=>'P14_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100444Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8445744356116483)
,p_name=>'P14_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_default=>'TO_CHAR(SYSTIMESTAMP)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100444Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8446536751116484)
,p_name=>'P14_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_default=>':APP_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100444Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8441505463116472)
,p_name=>'P14_DEPARTMENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Department Id'
,p_source=>'DEPARTMENT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DEPARTMENT.DEPARTMENT_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100443Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8444153540116482)
,p_name=>'P14_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100443Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8442966589116482)
,p_name=>'P14_EMPLOYEE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Employee Code'
,p_source=>'EMPLOYEE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100443Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8440755345116466)
,p_name=>'P14_EMPLOYEE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_source=>'EMPLOYEE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130353Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100442Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8443333606116482)
,p_name=>'P14_FIRST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'First Name'
,p_source=>'FIRST_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100443Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8444934500116483)
,p_name=>'P14_HIRE_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Hire Date'
,p_source=>'HIRE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100444Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8443713453116482)
,p_name=>'P14_LAST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Last Name'
,p_source=>'LAST_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100443Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8441165536116469)
,p_name=>'P14_ORGANIZATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Organization Id'
,p_source=>'ORGANIZATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ORGANIZATION.ORGANIZATION_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100443Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8444557722116483)
,p_name=>'P14_PHONE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Phone'
,p_source=>'PHONE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100444Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8442299936116481)
,p_name=>'P14_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_prompt=>'Role Id'
,p_source=>'ROLE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLE.ROLE_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100443Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8446944808116484)
,p_name=>'P14_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_default=>'TO_CHAR(SYSTIMESTAMP)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100444Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8447764772116485)
,p_name=>'P14_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_source_plug_id=>wwv_flow_imp.id(8440362724116460)
,p_item_default=>':APP_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100444Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8446189297116484)
,p_validation_name=>'P14_CREATED_AT must be timestamp'
,p_static_id=>'p14-created-at-must-be-timestamp'
,p_validation_sequence=>110
,p_validation=>'P14_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8445744356116483)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8447362171116485)
,p_validation_name=>'P14_UPDATED_AT must be timestamp'
,p_static_id=>'p14-updated-at-must-be-timestamp'
,p_validation_sequence=>130
,p_validation=>'P14_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8446944808116484)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8456038759116492)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8456038759116492
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8455286906116491)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8440362724116460)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Employee'
,p_static_id=>'initialize-form-employee'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>8455286906116491
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8455652740116492)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8440362724116460)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Employee'
,p_static_id=>'process-form-employee'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8455652740116492
,p_created_on=>wwv_flow_imp.dz('20260718130354Z')
,p_updated_on=>wwv_flow_imp.dz('20260718130354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_imp_page.create_page(
 p_id=>15
,p_name=>'Roles'
,p_alias=>'ROLES'
,p_step_title=>'Roles'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8619548820267048)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8613263671267028)
,p_name=>'Roles'
,p_static_id=>'roles'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'ROLE'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8615805454267041)
,p_query_column_id=>6
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>6
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8616267738267042)
,p_query_column_id=>7
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>7
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8616636371267043)
,p_query_column_id=>8
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>8
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8614225423267037)
,p_query_column_id=>2
,p_column_alias=>'DEPARTMENT_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Department'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8441685834116472)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8615426852267040)
,p_query_column_id=>5
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>5
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8615094073267039)
,p_query_column_id=>4
,p_column_alias=>'ROLE_CODE'
,p_column_display_sequence=>4
,p_column_heading=>'Role Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8613824797267034)
,p_query_column_id=>1
,p_column_alias=>'ROLE_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:RP:P16_ROLE_ID:\#ROLE_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8614647320267038)
,p_query_column_id=>3
,p_column_alias=>'ROLE_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Role Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8617070524267044)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>9
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8617433137267044)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>10
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8617843124267045)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8613263671267028)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:16::'
,p_created_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8618223992267046)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8613263671267028)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8618624428267046)
,p_event_id=>wwv_flow_imp.id(8618223992267046)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8613263671267028)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132859Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132859Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_imp_page.create_page(
 p_id=>16
,p_name=>'Role'
,p_alias=>'ROLE'
,p_page_mode=>'MODAL'
,p_step_title=>'Role'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100421Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8608724715266932)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8600550331266919)
,p_plug_name=>'Role'
,p_static_id=>'role'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'ROLE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8609122495266932)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8608724715266932)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100409Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(8609618900266933)
,p_button_id=>wwv_flow_imp.id(8609122495266932)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8610918726266935)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8608724715266932)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P16_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100421Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8610132923266935)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8608724715266932)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P16_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100421Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8610514849266935)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8608724715266932)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P16_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100421Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8602998605266929)
,p_name=>'P16_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100408Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8603346471266929)
,p_name=>'P16_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100408Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8604195941266930)
,p_name=>'P16_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100408Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8601317259266927)
,p_name=>'P16_DEPARTMENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Department Id'
,p_source=>'DEPARTMENT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DEPARTMENT.DEPARTMENT_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100408Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8602593811266929)
,p_name=>'P16_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100408Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8602197438266929)
,p_name=>'P16_ROLE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Role Code'
,p_source=>'ROLE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100408Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8600987132266923)
,p_name=>'P16_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_source=>'ROLE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100407Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8601764605266929)
,p_name=>'P16_ROLE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Role Name'
,p_source=>'ROLE_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100408Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8604587690266930)
,p_name=>'P16_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100409Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8605336418266931)
,p_name=>'P16_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_item_source_plug_id=>wwv_flow_imp.id(8600550331266919)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100409Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8603782474266930)
,p_validation_name=>'P16_CREATED_AT must be timestamp'
,p_static_id=>'p16-created-at-must-be-timestamp'
,p_validation_sequence=>60
,p_validation=>'P16_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8603346471266929)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8604968811266931)
,p_validation_name=>'P16_UPDATED_AT must be timestamp'
,p_static_id=>'p16-updated-at-must-be-timestamp'
,p_validation_sequence=>80
,p_validation=>'P16_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8604587690266930)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8612194182266936)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8612194182266936
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8611320082266935)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8600550331266919)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Role'
,p_static_id=>'initialize-form-role'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>8611320082266935
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8611750175266936)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8600550331266919)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Role'
,p_static_id=>'process-form-role'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8611750175266936
,p_created_on=>wwv_flow_imp.dz('20260718132858Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132858Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_imp_page.create_page(
 p_id=>17
,p_name=>'User Accounts'
,p_alias=>'USER-ACCOUNTS'
,p_step_title=>'User Accounts'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8643507139272323)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8636098261272301)
,p_name=>'User Accounts'
,p_static_id=>'user-accounts'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'USER_ACCOUNT'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8639852256272315)
,p_query_column_id=>9
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>9
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8640241862272316)
,p_query_column_id=>10
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>10
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8640612076272317)
,p_query_column_id=>11
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>11
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8638219929272311)
,p_query_column_id=>5
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>5
,p_column_heading=>'Email'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8637449529272309)
,p_query_column_id=>3
,p_column_alias=>'EMPLOYEE_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Employee'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8621802554272194)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8639445491272314)
,p_query_column_id=>8
,p_column_alias=>'LAST_LOGIN_AT'
,p_column_display_sequence=>8
,p_column_heading=>'Last Login At'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8637003754272308)
,p_query_column_id=>2
,p_column_alias=>'ORGANIZATION_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Organization'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8422046652108159)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8638677012272312)
,p_query_column_id=>6
,p_column_alias=>'PASSWORD_HASH'
,p_column_display_sequence=>6
,p_column_heading=>'Password Hash'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8641062112272318)
,p_query_column_id=>12
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>12
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8641438128272319)
,p_query_column_id=>13
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>13
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8637899984272310)
,p_query_column_id=>4
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>4
,p_column_heading=>'Username'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8636651875272307)
,p_query_column_id=>1
,p_column_alias=>'USER_ACCOUNT_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:18:&APP_SESSION.::&DEBUG.:RP:P18_USER_ACCOUNT_ID:\#USER_ACCOUNT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8639050086272313)
,p_query_column_id=>7
,p_column_alias=>'USER_TYPE'
,p_column_display_sequence=>7
,p_column_heading=>'User Type'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8641866809272320)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8636098261272301)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&APP_SESSION.::&DEBUG.:18::'
,p_created_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8642280216272320)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8636098261272301)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8642662537272321)
,p_event_id=>wwv_flow_imp.id(8642280216272320)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8636098261272301)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132952Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132952Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00018
begin
wwv_flow_imp_page.create_page(
 p_id=>18
,p_name=>'User Account'
,p_alias=>'USER-ACCOUNT'
,p_page_mode=>'MODAL'
,p_step_title=>'User Account'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100548Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8631538102272206)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8620594436272185)
,p_plug_name=>'User Account'
,p_static_id=>'user-account'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'USER_ACCOUNT'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8631998886272207)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8631538102272206)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100548Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(8632468447272208)
,p_button_id=>wwv_flow_imp.id(8631998886272207)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8633719069272209)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8631538102272206)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P18_USER_ACCOUNT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100548Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8632949971272209)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8631538102272206)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P18_USER_ACCOUNT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100548Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8633319860272209)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8631538102272206)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P18_USER_ACCOUNT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100548Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8624883612272204)
,p_name=>'P18_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100547Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8625272337272204)
,p_name=>'P18_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100547Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8626067145272204)
,p_name=>'P18_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100547Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8622888886272202)
,p_name=>'P18_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100546Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8621748040272193)
,p_name=>'P18_EMPLOYEE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Employee Id'
,p_source=>'EMPLOYEE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EMPLOYEE.EMPLOYEE_CODE'
,p_lov_display_null=>'YES'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100546Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8624081962272202)
,p_name=>'P18_LAST_LOGIN_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Last Login At'
,p_source=>'LAST_LOGIN_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100547Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8621343204272193)
,p_name=>'P18_ORGANIZATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Organization Id'
,p_source=>'ORGANIZATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ORGANIZATION.ORGANIZATION_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100546Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8623282287272202)
,p_name=>'P18_PASSWORD_HASH'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Password Hash'
,p_source=>'PASSWORD_HASH'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100547Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8626427864272204)
,p_name=>'P18_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100548Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8627250563272205)
,p_name=>'P18_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100548Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8622423864272201)
,p_name=>'P18_USERNAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'Username'
,p_source=>'USERNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100546Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8620956679272191)
,p_name=>'P18_USER_ACCOUNT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_source=>'USER_ACCOUNT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100546Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8623666036272202)
,p_name=>'P18_USER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_item_source_plug_id=>wwv_flow_imp.id(8620594436272185)
,p_prompt=>'User Type'
,p_source=>'USER_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100547Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8625694248272204)
,p_validation_name=>'P18_CREATED_AT must be timestamp'
,p_static_id=>'p18-created-at-must-be-timestamp'
,p_validation_sequence=>90
,p_validation=>'P18_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8625272337272204)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8624495311272202)
,p_validation_name=>'P18_LAST_LOGIN_AT must be timestamp'
,p_static_id=>'p18-last-login-at-must-be-timestamp'
,p_validation_sequence=>70
,p_validation=>'P18_LAST_LOGIN_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8624081962272202)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8626883991272205)
,p_validation_name=>'P18_UPDATED_AT must be timestamp'
,p_static_id=>'p18-updated-at-must-be-timestamp'
,p_validation_sequence=>110
,p_validation=>'P18_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8626427864272204)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8634997446272211)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8634997446272211
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8634185855272210)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8620594436272185)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Account'
,p_static_id=>'initialize-form-user-account'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>8634185855272210
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8634575265272211)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8620594436272185)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Account'
,p_static_id=>'process-form-user-account'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8634575265272211
,p_created_on=>wwv_flow_imp.dz('20260718132951Z')
,p_updated_on=>wwv_flow_imp.dz('20260718132951Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00019
begin
wwv_flow_imp_page.create_page(
 p_id=>19
,p_name=>'Clients'
,p_alias=>'CLIENTS'
,p_step_title=>'Clients'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8664828227282211)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8658110915282193)
,p_name=>'Clients'
,p_static_id=>'clients'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'CLIENT'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8661174063282204)
,p_query_column_id=>7
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>7
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8659549150282201)
,p_query_column_id=>3
,p_column_alias=>'CLIENT_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'Client Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8658739534282198)
,p_query_column_id=>1
,p_column_alias=>'CLIENT_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:20:&APP_SESSION.::&DEBUG.:RP:P20_CLIENT_ID:\#CLIENT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8659997666282201)
,p_query_column_id=>4
,p_column_alias=>'CLIENT_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Client Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8661503777282205)
,p_query_column_id=>8
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>8
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8661932544282206)
,p_query_column_id=>9
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8660383536282202)
,p_query_column_id=>5
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>5
,p_column_heading=>'Email'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8659191634282200)
,p_query_column_id=>2
,p_column_alias=>'ORGANIZATION_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Organization'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8422046652108159)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8660734002282203)
,p_query_column_id=>6
,p_column_alias=>'PHONE'
,p_column_display_sequence=>6
,p_column_heading=>'Phone'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8662372937282207)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>10
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8662700776282208)
,p_query_column_id=>11
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>11
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8663110700282209)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8658110915282193)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&APP_SESSION.::&DEBUG.:20::'
,p_created_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8663557191282209)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8658110915282193)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8663985983282210)
,p_event_id=>wwv_flow_imp.id(8663557191282209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8658110915282193)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133131Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133131Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_imp_page.create_page(
 p_id=>20
,p_name=>'Client'
,p_alias=>'CLIENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Client'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100631Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8653664897282114)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8644725178282105)
,p_plug_name=>'Client'
,p_static_id=>'client'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'CLIENT'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8654013864282114)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8653664897282114)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100631Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(8654508568282114)
,p_button_id=>wwv_flow_imp.id(8654013864282114)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8655830232282116)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8653664897282114)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P20_CLIENT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100631Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8655017151282116)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8653664897282114)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P20_CLIENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100631Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8655493265282116)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8653664897282114)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P20_CLIENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100631Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8647585376282111)
,p_name=>'P20_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100630Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8645951402282110)
,p_name=>'P20_CLIENT_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Client Code'
,p_source=>'CLIENT_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100630Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8645139527282109)
,p_name=>'P20_CLIENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_source=>'CLIENT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100629Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8646329782282110)
,p_name=>'P20_CLIENT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Client Name'
,p_source=>'CLIENT_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100630Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8647908477282111)
,p_name=>'P20_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100630Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8648757784282111)
,p_name=>'P20_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100630Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8646731150282110)
,p_name=>'P20_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100630Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8645510278282110)
,p_name=>'P20_ORGANIZATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Organization Id'
,p_source=>'ORGANIZATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ORGANIZATION.ORGANIZATION_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100629Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8647175024282111)
,p_name=>'P20_PHONE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Phone'
,p_source=>'PHONE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100630Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8649146596282112)
,p_name=>'P20_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100631Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8649915938282112)
,p_name=>'P20_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_item_source_plug_id=>wwv_flow_imp.id(8644725178282105)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100631Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8648334163282111)
,p_validation_name=>'P20_CREATED_AT must be timestamp'
,p_static_id=>'p20-created-at-must-be-timestamp'
,p_validation_sequence=>70
,p_validation=>'P20_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8647908477282111)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8649562888282112)
,p_validation_name=>'P20_UPDATED_AT must be timestamp'
,p_static_id=>'p20-updated-at-must-be-timestamp'
,p_validation_sequence=>90
,p_validation=>'P20_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(8649146596282112)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8657053845282117)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8657053845282117
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8656215787282116)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8644725178282105)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Client'
,p_static_id=>'initialize-form-client'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>8656215787282116
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8656619882282117)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8644725178282105)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Client'
,p_static_id=>'process-form-client'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8656619882282117
,p_created_on=>wwv_flow_imp.dz('20260718133130Z')
,p_updated_on=>wwv_flow_imp.dz('20260718133130Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00040
begin
wwv_flow_imp_page.create_page(
 p_id=>40
,p_name=>'Projects'
,p_alias=>'PROJECT'
,p_step_title=>'Projects'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260809115054Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9241782437954396)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9233824351954374)
,p_name=>'Projects'
,p_static_id=>'project'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'PROJECT'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114354Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9238018565954389)
,p_query_column_id=>10
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>10
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9235207530954383)
,p_query_column_id=>3
,p_column_alias=>'CLIENT_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Client'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(9029774840399493)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9238447043954390)
,p_query_column_id=>11
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>11
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9238805221954391)
,p_query_column_id=>12
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>12
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9236874421954386)
,p_query_column_id=>7
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>7
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9237690767954388)
,p_query_column_id=>9
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>9
,p_column_heading=>'End Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9234850877954382)
,p_query_column_id=>2
,p_column_alias=>'ORGANIZATION_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Organization'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8422046652108159)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9236088824954385)
,p_query_column_id=>5
,p_column_alias=>'PROJECT_CODE'
,p_column_display_sequence=>5
,p_column_heading=>'Project Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9234435259954379)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:41:&APP_SESSION.::&DEBUG.:RP:P41_PROJECT_ID:\#PROJECT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9236468756954386)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_NAME'
,p_column_display_sequence=>6
,p_column_heading=>'Project Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9237262315954387)
,p_query_column_id=>8
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'Start Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9235654170954384)
,p_query_column_id=>4
,p_column_alias=>'STATUS_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(9030022377399497)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9239293507954392)
,p_query_column_id=>13
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>13
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9239669368954393)
,p_query_column_id=>14
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>14
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9240030670954394)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9233824351954374)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&APP_SESSION.::&DEBUG.:41::'
,p_created_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9240457450954394)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9233824351954374)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9240808688954394)
,p_event_id=>wwv_flow_imp.id(9240457450954394)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9233824351954374)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114240Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114240Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00041
begin
wwv_flow_imp_page.create_page(
 p_id=>41
,p_name=>'Projects'
,p_alias=>'PROJECTS'
,p_page_mode=>'MODAL'
,p_step_title=>'Projects'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260809114238Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100733Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9229382251954210)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9218428455954202)
,p_plug_name=>'Projects'
,p_static_id=>'projects'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'PROJECT'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9229746152954210)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9229382251954210)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(9230242160954211)
,p_button_id=>wwv_flow_imp.id(9229746152954210)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9231545946954212)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9229382251954210)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P41_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100733Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9230743621954212)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9229382251954210)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P41_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9231140557954212)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9229382251954210)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P41_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9222383527954208)
,p_name=>'P41_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9219536733954207)
,p_name=>'P41_CLIENT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Client Id'
,p_source=>'CLIENT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CLIENT.CLIENT_CODE'
,p_lov_display_null=>'YES'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100731Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9222717820954208)
,p_name=>'P41_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9223588741954208)
,p_name=>'P41_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9221196885954207)
,p_name=>'P41_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1000
,p_cHeight=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100731Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9221925841954207)
,p_name=>'P41_END_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'End Date'
,p_source=>'END_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9219107502954206)
,p_name=>'P41_ORGANIZATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Organization Id'
,p_source=>'ORGANIZATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ORGANIZATION.ORGANIZATION_NAME'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100731Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9220306273954207)
,p_name=>'P41_PROJECT_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Project Code'
,p_source=>'PROJECT_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100731Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9218704645954204)
,p_name=>'P41_PROJECT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_source=>'PROJECT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100730Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9220723017954207)
,p_name=>'P41_PROJECT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Project Name'
,p_source=>'PROJECT_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100731Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9221561589954207)
,p_name=>'P41_START_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Start Date'
,p_source=>'START_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100731Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9219974939954207)
,p_name=>'P41_STATUS_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Status Id'
,p_source=>'STATUS_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUS.ENTITY_TYPE'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100731Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9223960201954208)
,p_name=>'P41_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9224747045954208)
,p_name=>'P41_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_item_source_plug_id=>wwv_flow_imp.id(9218428455954202)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100732Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9223188401954208)
,p_validation_name=>'P41_CREATED_AT must be timestamp'
,p_static_id=>'p41-created-at-must-be-timestamp'
,p_validation_sequence=>100
,p_validation=>'P41_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9222717820954208)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9224303488954208)
,p_validation_name=>'P41_UPDATED_AT must be timestamp'
,p_static_id=>'p41-updated-at-must-be-timestamp'
,p_validation_sequence=>120
,p_validation=>'P41_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9223960201954208)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9232775180954213)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>9232775180954213
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9231993648954212)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9218428455954202)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Projects'
,p_static_id=>'initialize-form-projects'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>9231993648954212
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9232362987954213)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9218428455954202)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Projects'
,p_static_id=>'process-form-projects'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9232362987954213
,p_created_on=>wwv_flow_imp.dz('20260809114239Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114239Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00042
begin
wwv_flow_imp_page.create_page(
 p_id=>42
,p_name=>'Tasks'
,p_alias=>'TASKS'
,p_step_title=>'Tasks'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9271893947971740)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9263924040971718)
,p_name=>'Tasks'
,p_static_id=>'tasks'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'TASK'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9268139692971732)
,p_query_column_id=>10
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>10
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9265339987971726)
,p_query_column_id=>3
,p_column_alias=>'ASSIGNED_TO_EMPLOYEE_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Assigned To Employee'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8621802554272194)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9268547113971733)
,p_query_column_id=>11
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>11
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9268959728971734)
,p_query_column_id=>12
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>12
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9267375027971731)
,p_query_column_id=>8
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>8
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9267761857971731)
,p_query_column_id=>9
,p_column_alias=>'DUE_DATE'
,p_column_display_sequence=>9
,p_column_heading=>'Due Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9266172043971728)
,p_query_column_id=>5
,p_column_alias=>'PRIORITY_ID'
,p_column_display_sequence=>5
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(9054174301448934)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9264934442971725)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(9053959294448932)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9265700942971727)
,p_query_column_id=>4
,p_column_alias=>'STATUS_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(9030022377399497)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9266530023971729)
,p_query_column_id=>6
,p_column_alias=>'TASK_CODE'
,p_column_display_sequence=>6
,p_column_heading=>'Task Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9264504105971723)
,p_query_column_id=>1
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:43:&APP_SESSION.::&DEBUG.:RP:P43_TASK_ID:\#TASK_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9266912536971729)
,p_query_column_id=>7
,p_column_alias=>'TASK_NAME'
,p_column_display_sequence=>7
,p_column_heading=>'Task Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9269309651971735)
,p_query_column_id=>13
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>13
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9269701836971736)
,p_query_column_id=>14
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>14
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9270177623971737)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9263924040971718)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&APP_SESSION.::&DEBUG.:43::'
,p_created_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9270541525971737)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9263924040971718)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9270939181971738)
,p_event_id=>wwv_flow_imp.id(9270541525971737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9263924040971718)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114534Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114534Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00043
begin
wwv_flow_imp_page.create_page(
 p_id=>43
,p_name=>'Task'
,p_alias=>'TASK'
,p_page_mode=>'MODAL'
,p_step_title=>'Task'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9259485516971546)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9248485331971539)
,p_plug_name=>'Task'
,p_static_id=>'task'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TASK'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9259847026971547)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9259485516971546)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(9260324091971547)
,p_button_id=>wwv_flow_imp.id(9259847026971547)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9261634705971549)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9259485516971546)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P43_TASK_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9260896997971548)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9259485516971546)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P43_TASK_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9261238909971549)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9259485516971546)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P43_TASK_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9252427506971543)
,p_name=>'P43_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100828Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9249658247971542)
,p_name=>'P43_ASSIGNED_TO_EMPLOYEE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Assigned To Employee Id'
,p_source=>'ASSIGNED_TO_EMPLOYEE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EMPLOYEE.EMPLOYEE_CODE'
,p_lov_display_null=>'YES'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100827Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9252874792971544)
,p_name=>'P43_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100828Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9253695746971544)
,p_name=>'P43_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9251616717971543)
,p_name=>'P43_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>1000
,p_cHeight=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100828Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9252045898971543)
,p_name=>'P43_DUE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Due Date'
,p_source=>'DUE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100828Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9250426026971543)
,p_name=>'P43_PRIORITY_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Priority Id'
,p_source=>'PRIORITY_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRIORITY.PRIORITY_CODE'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100827Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9249238420971542)
,p_name=>'P43_PROJECT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Project Id'
,p_source=>'PROJECT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT.PROJECT_CODE'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100827Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9250003397971542)
,p_name=>'P43_STATUS_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Status Id'
,p_source=>'STATUS_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUS.ENTITY_TYPE'
,p_lov_display_null=>'YES'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100827Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9250860810971543)
,p_name=>'P43_TASK_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Task Code'
,p_source=>'TASK_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100828Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9248847753971540)
,p_name=>'P43_TASK_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_source=>'TASK_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100827Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9251272047971543)
,p_name=>'P43_TASK_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Task Name'
,p_source=>'TASK_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100828Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9254058497971544)
,p_name=>'P43_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9254863939971545)
,p_name=>'P43_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_item_source_plug_id=>wwv_flow_imp.id(9248485331971539)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100829Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9253227210971544)
,p_validation_name=>'P43_CREATED_AT must be timestamp'
,p_static_id=>'p43-created-at-must-be-timestamp'
,p_validation_sequence=>100
,p_validation=>'P43_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9252874792971544)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9254487956971545)
,p_validation_name=>'P43_UPDATED_AT must be timestamp'
,p_static_id=>'p43-updated-at-must-be-timestamp'
,p_validation_sequence=>120
,p_validation=>'P43_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9254058497971544)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9262841670971549)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>9262841670971549
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9262006241971549)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9248485331971539)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Task'
,p_static_id=>'initialize-form-task'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>9262006241971549
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9262464218971549)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9248485331971539)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Task'
,p_static_id=>'process-form-task'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9262464218971549
,p_created_on=>wwv_flow_imp.dz('20260809114532Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114532Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00044
begin
wwv_flow_imp_page.create_page(
 p_id=>44
,p_name=>'Statuses'
,p_alias=>'STATUSES'
,p_step_title=>'Statuses'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9291881154979692)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9285565299979679)
,p_name=>'Statuses'
,p_static_id=>'statuses'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'STATUS'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9288171820979686)
,p_query_column_id=>6
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>6
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9288557016979687)
,p_query_column_id=>7
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>7
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9288976623979688)
,p_query_column_id=>8
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>8
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9286519854979683)
,p_query_column_id=>2
,p_column_alias=>'ENTITY_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Entity Type'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9287768741979685)
,p_query_column_id=>5
,p_column_alias=>'SORT_ORDER'
,p_column_display_sequence=>5
,p_column_heading=>'Sort Order'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9286915549979683)
,p_query_column_id=>3
,p_column_alias=>'STATUS_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'Status Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9286151151979682)
,p_query_column_id=>1
,p_column_alias=>'STATUS_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:45:&APP_SESSION.::&DEBUG.:RP:P45_STATUS_ID:\#STATUS_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9287353539979684)
,p_query_column_id=>4
,p_column_alias=>'STATUS_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Status Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9289395575979689)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>9
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9289756800979690)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>10
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9290167461979691)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9285565299979679)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:45:&APP_SESSION.::&DEBUG.:45::'
,p_created_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9290570579979691)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9285565299979679)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9290983999979691)
,p_event_id=>wwv_flow_imp.id(9290570579979691)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9285565299979679)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114653Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114653Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00045
begin
wwv_flow_imp_page.create_page(
 p_id=>45
,p_name=>'Status'
,p_alias=>'STATUS'
,p_page_mode=>'MODAL'
,p_step_title=>'Status'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100908Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9281032031979527)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9272827875979524)
,p_plug_name=>'Status'
,p_static_id=>'status'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'STATUS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9281443798979528)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9281032031979527)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100908Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(9281977168979528)
,p_button_id=>wwv_flow_imp.id(9281443798979528)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9283250608979529)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9281032031979527)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P45_STATUS_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100908Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9282492289979528)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9281032031979527)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P45_STATUS_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100908Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9282848590979528)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9281032031979527)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P45_STATUS_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100908Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9275254731979525)
,p_name=>'P45_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100907Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9275616710979526)
,p_name=>'P45_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100907Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276480243979526)
,p_name=>'P45_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100907Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9273638891979525)
,p_name=>'P45_ENTITY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Entity Type'
,p_source=>'ENTITY_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100906Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9274856850979525)
,p_name=>'P45_SORT_ORDER'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Sort Order'
,p_source=>'SORT_ORDER'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100907Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9274013842979525)
,p_name=>'P45_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Status Code'
,p_source=>'STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100907Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9273282351979524)
,p_name=>'P45_STATUS_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_source=>'STATUS_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100906Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9274402956979525)
,p_name=>'P45_STATUS_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Status Name'
,p_source=>'STATUS_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100907Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276869681979526)
,p_name=>'P45_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100907Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9277653690979526)
,p_name=>'P45_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_item_source_plug_id=>wwv_flow_imp.id(9272827875979524)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100908Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9276041547979526)
,p_validation_name=>'P45_CREATED_AT must be timestamp'
,p_static_id=>'p45-created-at-must-be-timestamp'
,p_validation_sequence=>60
,p_validation=>'P45_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9275616710979526)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9277235261979526)
,p_validation_name=>'P45_UPDATED_AT must be timestamp'
,p_static_id=>'p45-updated-at-must-be-timestamp'
,p_validation_sequence=>80
,p_validation=>'P45_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9276869681979526)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9284498085979529)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>9284498085979529
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9283603566979529)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9272827875979524)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Status'
,p_static_id=>'initialize-form-status'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>9283603566979529
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9284049584979529)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9272827875979524)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Status'
,p_static_id=>'process-form-status'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9284049584979529
,p_created_on=>wwv_flow_imp.dz('20260809114652Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114652Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00046
begin
wwv_flow_imp_page.create_page(
 p_id=>46
,p_name=>'Priorities'
,p_alias=>'PRIORITIES'
,p_step_title=>'Priorities'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9310658793986008)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9304804984985995)
,p_name=>'Priorities'
,p_static_id=>'priorities'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'PRIORITY'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260809114756Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9306933081986002)
,p_query_column_id=>5
,p_column_alias=>'ACTIVE_FLAG'
,p_column_display_sequence=>5
,p_column_heading=>'Active Flag'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9307330521986003)
,p_query_column_id=>6
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>6
,p_column_heading=>'Created At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9307783550986004)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>7
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9305761504985999)
,p_query_column_id=>2
,p_column_alias=>'PRIORITY_CODE'
,p_column_display_sequence=>2
,p_column_heading=>'Priority Code'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9305457456985998)
,p_query_column_id=>1
,p_column_alias=>'PRIORITY_ID'
,p_column_display_sequence=>0
,p_column_link=>'f?p=&APP_ID.:47:&APP_SESSION.::&DEBUG.:RP:P47_PRIORITY_ID:\#PRIORITY_ID#\'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9306111338986000)
,p_query_column_id=>3
,p_column_alias=>'PRIORITY_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Priority Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9306525400986001)
,p_query_column_id=>4
,p_column_alias=>'SORT_ORDER'
,p_column_display_sequence=>4
,p_column_heading=>'Sort Order'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9308103509986005)
,p_query_column_id=>8
,p_column_alias=>'UPDATED_AT'
,p_column_display_sequence=>8
,p_column_heading=>'Updated At'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9308562313986006)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>9
,p_column_heading=>'Updated By'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9308909555986007)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9304804984985995)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&APP_SESSION.::&DEBUG.:47::'
,p_created_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9309325207986007)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9304804984985995)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9309755800986007)
,p_event_id=>wwv_flow_imp.id(9309325207986007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9304804984985995)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114757Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114757Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00047
begin
wwv_flow_imp_page.create_page(
 p_id=>47
,p_name=>'Priority'
,p_alias=>'PRIORITY'
,p_page_mode=>'MODAL'
,p_step_title=>'Priority'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9300343354985836)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9292867292985833)
,p_plug_name=>'Priority'
,p_static_id=>'priority'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'PRIORITY'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9300792173985836)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9300343354985836)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(9301213676985837)
,p_button_id=>wwv_flow_imp.id(9300792173985836)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9302595846985837)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9300343354985836)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P47_PRIORITY_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9301742817985837)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9300343354985836)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P47_PRIORITY_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9302191471985837)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9300343354985836)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P47_PRIORITY_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9294841872985834)
,p_name=>'P47_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Active Flag'
,p_source=>'ACTIVE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100931Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9295219674985834)
,p_name=>'P47_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100931Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9296057787985835)
,p_name=>'P47_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9293657829985833)
,p_name=>'P47_PRIORITY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Priority Code'
,p_source=>'PRIORITY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100931Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9293290373985833)
,p_name=>'P47_PRIORITY_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_source=>'PRIORITY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100931Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9294071636985834)
,p_name=>'P47_PRIORITY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Priority Name'
,p_source=>'PRIORITY_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100931Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9294448906985834)
,p_name=>'P47_SORT_ORDER'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Sort Order'
,p_source=>'SORT_ORDER'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100931Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9296426508985835)
,p_name=>'P47_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297290125985835)
,p_name=>'P47_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_item_source_plug_id=>wwv_flow_imp.id(9292867292985833)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260815100932Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9295654512985834)
,p_validation_name=>'P47_CREATED_AT must be timestamp'
,p_static_id=>'p47-created-at-must-be-timestamp'
,p_validation_sequence=>50
,p_validation=>'P47_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9295219674985834)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9296897622985835)
,p_validation_name=>'P47_UPDATED_AT must be timestamp'
,p_static_id=>'p47-updated-at-must-be-timestamp'
,p_validation_sequence=>70
,p_validation=>'P47_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(9296426508985835)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9303751264985838)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>9303751264985838
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9302971760985837)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9292867292985833)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Priority'
,p_static_id=>'initialize-form-priority'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>9302971760985837
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9303331789985838)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9292867292985833)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Priority'
,p_static_id=>'process-form-priority'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9303331789985838
,p_created_on=>wwv_flow_imp.dz('20260809114755Z')
,p_updated_on=>wwv_flow_imp.dz('20260809114755Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00048
begin
wwv_flow_imp_page.create_page(
 p_id=>48
,p_name=>'Dashboard'
,p_alias=>'DASHBOARD'
,p_step_title=>'Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
,p_created_on=>wwv_flow_imp.dz('20260809120516Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260814185157Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9401016779089973)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260809120516Z')
,p_updated_on=>wwv_flow_imp.dz('20260814185150Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9114769350531102)
,p_plug_name=>'Dashboard Content'
,p_static_id=>'dashboard-content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN render_dashboard_html;',
'  END;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_created_on=>wwv_flow_imp.dz('20260809121114Z')
,p_updated_on=>wwv_flow_imp.dz('20260814185157Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00049
begin
wwv_flow_imp_page.create_page(
 p_id=>49
,p_name=>'AI Assistant'
,p_alias=>'AI-ASSISTANT'
,p_step_title=>'AI Assistant'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function efScrollLog(){var l=document.getElementById(''efChatLog'');l.scrollTop=l.scrollHeight;}',
'function efAddMsg(role,text){',
'var log=document.getElementById(''efChatLog'');',
'var b=document.createElement(''div'');',
'b.className=''ef-msg ef-msg-''+role;',
'b.textContent=text;',
'log.appendChild(b);',
'efScrollLog();',
'return b;',
'}',
'function efSetBusy(busy){',
'document.getElementById(''efChatInput'').disabled=busy;',
'document.getElementById(''efChatSend'').disabled=busy;',
'document.getElementById(''efChatNew'').disabled=busy;',
'}',
'function efSend(){',
'var input=document.getElementById(''efChatInput'');',
'var msg=input.value.trim();',
'if(!msg){return;}',
'input.value='''';',
'input.style.height=''auto'';',
'efAddMsg(''user'',msg);',
'efSetBusy(true);',
'var typing=efAddMsg(''assistant'',''...'');',
'typing.classList.add(''ef-typing'');',
'apex.server.process(''CHAT_SEND'',{x01:msg},{dataType:''json''})',
'.done(function(data){',
'typing.remove();',
'efAddMsg(''assistant'',data.reply||''Sorry, something went wrong.'');',
'efSetBusy(false);',
'input.focus();',
'})',
'.fail(function(){',
'typing.remove();',
'efAddMsg(''assistant'',''Sorry, I could not reach the assistant right now.'');',
'efSetBusy(false);',
'});',
'}',
'function efNewChat(){',
'efSetBusy(true);',
'document.getElementById(''efChatLog'').innerHTML='''';',
'apex.server.process(''CHAT_RESET'',{},{dataType:''json''})',
'.done(function(){',
'efAddMsg(''assistant'',"Hi, I''m your EnterpriseFlow Assistant. Ask me about your organizations, projects, tasks, employees, or workload, and I will look it up for you.");',
'efSetBusy(false);',
'})',
'.fail(function(){',
'efAddMsg(''assistant'',"Hi, I''m your EnterpriseFlow Assistant. Ask me about your organizations, projects, tasks, employees, or workload, and I will look it up for you.");',
'efSetBusy(false);',
'});',
'}',
'document.getElementById(''efChatSend'').addEventListener(''click'',efSend);',
'document.getElementById(''efChatNew'').addEventListener(''click'',efNewChat);',
'document.getElementById(''efChatInput'').addEventListener(''keydown'',function(e){',
'if(e.key===''Enter''&&!e.shiftKey){e.preventDefault();efSend();}',
'});',
'document.getElementById(''efChatInput'').addEventListener(''input'',function(){',
'this.style.height=''auto'';',
'this.style.height=Math.min(this.scrollHeight,140)+''px'';',
'});',
'efNewChat();'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_created_on=>wwv_flow_imp.dz('20260809145212Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260814150931Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9114905071531104)
,p_plug_name=>'AI Chat'
,p_static_id=>'ai-chat'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ef-chat">',
'      <div class="ef-chat-header">',
'          <div class="ef-chat-header-icon"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 3C7.03 3 3 6.58 3 11c0 2.39 1.19 4.53 3.08 5.99-.1 1.13-.5 2.4-1.2 3.51 1.6-.16 3.14-.77 4.36-1.6.8'
||'7.23 1.8.35 2.76.35 4.97 0 9-3.58 9-8s-4.03-8-9-8z" stroke="white" stroke-width="1.6" stroke-linejoin="round"/><circle cx="8.5" cy="11" r="1" fill="white"/><circle cx="12" cy="11" r="1" fill="white"/><circle cx="15.5" cy="11" r="1" fill="white"/></sv'
||'g></div>',
'              <div class="ef-chat-header-text">',
'                    <div class="ef-chat-title">EnterpriseFlow Assistant</div>',
'                          <div class="ef-chat-sub">AI &middot; live workspace data</div>',
'                              </div>',
'                                  <button type="button" id="efChatNew" class="ef-chat-new">New chat</button>',
'                                    </div>',
'                                      <div class="ef-chat-log" id="efChatLog"></div>',
'                                        <div class="ef-chat-inputbar">',
'                                            <textarea id="efChatInput" class="ef-chat-textarea" placeholder="Message EnterpriseFlow Assistant..." rows="1"></textarea>',
'                                                <button type="button" id="efChatSend" class="ef-chat-send" aria-label="Send">',
'                                                      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 12L20 4L13 20L11 13L4 12Z" fill="white"/></svg>',
'                                                          </button>',
'                                                            </div>',
'                                                            </div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260809145440Z')
,p_updated_on=>wwv_flow_imp.dz('20260809145440Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9416595498091515)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260809145212Z')
,p_updated_on=>wwv_flow_imp.dz('20260809145212Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_00051
begin
wwv_flow_imp_page.create_page(
 p_id=>51
,p_name=>'Audit Log'
,p_alias=>'AUDIT-LOG'
,p_step_title=>'Audit Log'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20260815102509Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260815102524Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9857250875567034)
,p_plug_name=>'Audit Log'
,p_static_id=>'audit-log'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'AUDIT_LOG'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
,p_created_on=>wwv_flow_imp.dz('20260815102513Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102524Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9857371147567034)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>9857371147567034
,p_created_on=>wwv_flow_imp.dz('20260815102513Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102524Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9859744184567158)
,p_db_column_name=>'ACTION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260815102513Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102513Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858507965567122)
,p_db_column_name=>'AUDIT_LOG_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Audit Log ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_created_on=>wwv_flow_imp.dz('20260815102513Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102513Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9860843811567169)
,p_db_column_name=>'CHANGED_AT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Changed At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260815102514Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102514Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9861279772567173)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260815102514Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102514Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9860454800567165)
,p_db_column_name=>'NEW_VALUES'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'New Values'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20260815102514Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102514Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9860102508567162)
,p_db_column_name=>'OLD_VALUES'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Old Values'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20260815102514Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102514Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9859370528567154)
,p_db_column_name=>'RECORD_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Record ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260815102513Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102513Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858913325567148)
,p_db_column_name=>'TABLE_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Table Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260815102513Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102513Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9861645354568164)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'AUDIT_LOG_ID:TABLE_NAME:RECORD_ID:ACTION:OLD_VALUES:NEW_VALUES:CHANGED_AT:CHANGED_BY'
,p_created_on=>wwv_flow_imp.dz('20260815102524Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102524Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9856462630566835)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(7409485127361195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260815102510Z')
,p_updated_on=>wwv_flow_imp.dz('20260815102510Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'EnterpriseFLow - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2102634289808461002
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7415293306361350)
,p_plug_name=>'EnterpriseFLow'
,p_static_id=>'enterpriseflow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675634334296186762
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7416847152361372)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7415293306361350)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_grid_new_row=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7416137796361363)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7415293306361350)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7416562948361367)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7415293306361350)
,p_prompt=>'Remember username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7415760846361362)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7415293306361350)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260717204348Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204348Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7420858048361383)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7420858048361383
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7420475453361382)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7420475453361382
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7417203973361376)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'LOGIN',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7417203973361376
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(7418150342361380)
,p_page_process_id=>wwv_flow_imp.id(7417203973361376)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(7418699106361380)
,p_page_process_id=>wwv_flow_imp.id(7417203973361376)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(7417655979361379)
,p_page_process_id=>wwv_flow_imp.id(7417203973361376)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7419007089361381)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'SEND_LOGIN_USERNAME_COOKIE',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7419007089361381
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(7420003438361382)
,p_page_process_id=>wwv_flow_imp.id(7419007089361381)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(7419574185361381)
,p_page_process_id=>wwv_flow_imp.id(7419007089361381)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
,p_created_on=>wwv_flow_imp.dz('20260717204349Z')
,p_updated_on=>wwv_flow_imp.dz('20260717204349Z')
,p_created_by=>'FEBIL'
,p_updated_by=>'FEBIL'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(8439804492110221)
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260718130251Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260718130251Z')
,p_created_by=>'FEBIL'
,p_last_updated_by=>'FEBIL'
);
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
