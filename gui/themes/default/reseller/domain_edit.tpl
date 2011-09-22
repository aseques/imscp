<?xml version="1.0" encoding="{THEME_CHARSET}" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset={THEME_CHARSET}" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />
		<title>{TR_EDIT_DOMAIN_PAGE_TITLE}</title>
		<meta name="robots" content="nofollow, noindex" />
		<link href="{THEME_COLOR_PATH}/css/imscp.css" rel="stylesheet" type="text/css" />
		<link href="{THEME_COLOR_PATH}/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/imscp.js"></script>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/jquery.js"></script>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/jquery.imscpTooltips.js"></script>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/jquery.ui.core.js"></script>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/jquery.ui.datepicker.js"></script>
		<!--[if IE 6]>
		<script type="text/javascript" src="{THEME_COLOR_PATH}/js/DD_belatedPNG_0.0.8a-min.js"></script>
		<script type="text/javascript">
			DD_belatedPNG.fix('*');
		</script>
		<![endif]-->

		<script language="JavaScript" type="text/JavaScript">
			/*<![CDATA[*/
			$(document).ready(function() {
				$('#dmn_exp_help').iMSCPtooltips({msg:"{TR_DMN_EXP_HELP}"});
				$("#datepicker").datepicker();

				$('#datepicker').change(function() {
					if($(this).val() != '') {
						$('#neverexpire').attr('disabled', 'disabled')
					} else {
						$('#neverexpire').removeAttr('disabled');
					}
				});

				$('#neverexpire').change(function() {
					if($(this).is(':checked')) {
						$('#datepicker').attr('disabled', 'disabled')
					} else {
						$('#datepicker').removeAttr('disabled');
					}
				});

				if($('#phpini_system_no').is(':checked')) {
					$("tr.phpinihide").hide();
				}

				$('#phpini_system_yes').click( function() {
					$("tr.phpinihide").show();
				});

				$('#phpini_system_no').click( function() {
					$("tr.phpinihide").hide();
				});

				if($('#phpini_al_system_no').is(':checked')) {
					$("tr.phpinipermhide").hide();
				}

				$('#phpini_al_system_yes').click( function() {
					$("tr.phpinipermhide").show();
				});

				$('#phpini_al_system_no').click( function() {
					$("tr.phpinipermhide").hide();
				});
			});
			/*]]>*/
		</script>
	</head>
	<body>
		<div class="header">
			{MAIN_MENU}

			<div class="logo">
				<img src="{ISP_LOGO}" alt="i-MSCP logo" />
			</div>
		</div>

		<div class="location">
			<div class="location-area icons-left">
				<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
			</div>
			<ul class="location-menu">
				<!-- <li><a class="help" href="#">Help</a></li> -->
				<!-- BDP: logged_from -->
				<li>
					<a class="backadmin" href="change_user_interface.php?action=go_back">{YOU_ARE_LOGGED_AS}</a>
				</li>
				<!-- EDP: logged_from -->
				<li>
					<a class="logout" href="../index.php?logout">{TR_MENU_LOGOUT}</a>
				</li>
			</ul>
			<ul class="path">
				<li><a href="manage_users.php">{TR_EDIT_DOMAIN}</a></li>
			</ul>
		</div>

		<div class="left_menu">
			{MENU}
		</div>

		<div class="body">
			<h2 class="domains"><span>{TR_EDIT_DOMAIN}</span></h2>

			<!-- BDP: page_message -->
			<div class="{MESSAGE_CLS}">{MESSAGE}</div>
			<!-- EDP: page_message -->

			<form name="reseller_edit_domain_frm" method="post" action="domain_edit.php">
				<fieldset>
					<legend>{TR_DOMAIN_MAIN_PROPERTIES}</legend>
					<table>
						<tr>
							<td style="width:300px;">{TR_DOMAIN_NAME}</td>
							<td>{VL_DOMAIN_NAME}</td>
						</tr>
						<tr>
							<td>{TR_DOMAIN_EXPIRE}</td>
							<td>{VL_DOMAIN_EXPIRE}</td>
						</tr>
						<tr>
							<td>
								<label for="datepicker">{TR_DOMAIN_NEW_EXPIRE}</label>
								<span class="icon i_help" id="dmn_exp_help">Help</span>
							</td>
							<td>
								<div style="float:left;">
									<input type="text" id="datepicker" name="dmn_expire_date" value="{VL_DOMAIN_EXPIRE_DATE}"{VL_DISABLED} />
									<p style="color:#535353;font-size: smaller;">
										(MM/DD/YYYY)</p>
								</div>

								<input style="vertical-align: middle;" type="checkbox" name="neverexpire" id="neverexpire"{VL_NEVEREXPIRE}/>
								{TR_EXPIRE_CHECKBOX}
							</td>
						</tr>
						<tr>
							<td>{TR_DOMAIN_IP}</td>
							<td>{VL_DOMAIN_IP}</td>
						</tr>

					</table>
				</fieldset>

				<fieldset>
					<legend>{TR_DOMAIN_ACCOUNT_LIMITS}</legend>
					<table>
						<tr>
							<td style="width:300px;">
								<label for="dom_sub">{TR_SUBDOMAINS}</label></td>
							<td>
								<input type="text" name="dom_sub" id="dom_sub" value="{VL_DOM_SUB}" />
							</td>
						</tr>
						<tr>
							<td><label for="dom_alias">{TR_ALIAS}</label></td>
							<td>
								<input type="text" name="dom_alias" id="dom_alias" value="{VL_DOM_ALIAS}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="dom_mail_acCount">{TR_MAIL_ACCOUNT}</label>
							</td>
							<td>
								<input type="text" name="dom_mail_acCount" id="dom_mail_acCount" value="{VL_DOM_MAIL_ACCOUNT}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="dom_ftp_acCounts">{TR_FTP_ACCOUNTS}</label>
							</td>
							<td>
								<input type="text" name="dom_ftp_acCounts" id="dom_ftp_acCounts" value="{VL_FTP_ACCOUNTS}" />
							</td>
						</tr>
						<tr>
							<td><label for="dom_sqldb">{TR_SQL_DB}</label></td>
							<td>
								<input type="text" name="dom_sqldb" id="dom_sqldb" value="{VL_SQL_DB}" />
							</td>
						</tr>
						<tr>
							<td><label for="dom_sql_users">{TR_SQL_USERS}</label>
							</td>
							<td>
								<input type="text" name="dom_sql_users" id="dom_sql_users" value="{VL_SQL_USERS}" />
							</td>
						</tr>
						<tr>
							<td><label for="dom_traffic">{TR_TRAFFIC}</label></td>
							<td>
								<input type="text" name="dom_traffic" id="dom_traffic" value="{VL_TRAFFIC}" />
							</td>
						</tr>
						<tr>
							<td><label for="dom_disk">{TR_DISK}</label></td>
							<td>
								<input type="text" name="dom_disk" id="dom_disk" value="{VL_DOM_DISK}" />
							</td>
						</tr>
					</table>
				</fieldset>

				<fieldset>
					<legend>{TR_OPTIONAL_FEATURES}</legend>
					<table>
						<tr>
							<td style="width:300px;">
								<label for="domain_php">{TR_PHP_SUPP}</label></td>
							<td>
								<select id="domain_php" name="domain_php">
									<option value="_yes_" {PHP_YES}>{TR_YES}</option>
									<option value="_no_" {PHP_NO}>{TR_NO}</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="domain_cgi">{TR_CGI_SUPP}</label></td>
							<td>
								<select id="domain_cgi" name="domain_cgi">
									<option value="_yes_" {CGI_YES}>{TR_YES}</option>
									<option value="_no_" {CGI_NO}>{TR_NO}</option>
								</select>
							</td>
						</tr>
						<!-- BDP: t_software_support -->
						<tr>
							<td>
								<label for="domain_software_allowed">{SW_ALLOWED}</label>
							</td>
							<td>
								<select name="domain_software_allowed" id="domain_software_allowed">
									<option value="yes" {SOFTWARE_YES}>{TR_YES}</option>
									<option value="no" {SOFTWARE_NO}>{TR_NO}</option>
								</select>
							</td>
						</tr>
						<!-- EDP: t_software_support -->
						<tr>
							<td><label for="domain_dns">{TR_DNS_SUPP}</label></td>
							<td>
								<select id="domain_dns" name="domain_dns">
									<option value="_yes_" {DNS_YES}>{TR_YES}</option>
									<option value="_no_" {DNS_NO}>{TR_NO}</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="backup">{TR_BACKUP}</label></td>
							<td>
								<select id="backup" name="backup">
									<option value="_dmn_" {BACKUP_DOMAIN}>{TR_BACKUP_DOMAIN}</option>
									<option value="_sql_" {BACKUP_SQL}>{TR_BACKUP_SQL}</option>
									<option value="_full_" {BACKUP_FULL}>{TR_BACKUP_FULL}</option>
									<option value="_no_" {BACKUP_NO}>{TR_BACKUP_NO}</option>
								</select>
							</td>
						</tr>
					</table>
				</fieldset>

				<!-- BDP: t_phpini_system -->
				<fieldset>
					<legend>{TR_PHP_DIRECTIVES_EDITOR}</legend>
					<table>
						<tr>
							<td style="width:300px;">{TR_PHPINI_AL_SYSTEM}</td>
							<td>
								<input type="radio" name="phpini_al_system" id="phpini_al_system_yes" value="yes" {PHPINI_AL_SYSTEM_YES} />
								<label for="phpini_al_system_yes">{TR_YES}</label>
								<input style="vertical-align: middle;" type="radio" name="phpini_al_system" id="phpini_al_system_no" value="no" {PHPINI_AL_SYSTEM_NO} />
								<label for="phpini_al_system_no">{TR_NO}</label>
							</td>
						</tr>
						<!-- BDP: t_phpini_register_globals_perm -->
						<tr class='phpinipermhide'>
							<td>{TR_PHPINI_AL_REGISTER_GLOBALS}</td>
							<td>
								<input type="radio" name="phpini_al_register_globals" id="phpini_al_register_globals_yes" value="yes" {PHPINI_AL_REGISTER_GLOBALS_YES} />
								<label for="phpini_al_register_globals_yes">{TR_YES}</label>
								<input type="radio" name="phpini_al_register_globals" id="phpini_al_register_globals_no" value="no" {PHPINI_AL_REGISTER_GLOBALS_NO} />
								<label for="phpini_al_register_globals_no">{TR_NO}</label>
						</tr>
						<!-- EDP: t_phpini_register_globals_perm -->
						<!-- BDP: t_phpini_allow_url_fopen_perm -->
						<tr class='phpinipermhide'>
							<td>{TR_PHPINI_AL_ALLOW_URL_FOPEN}</td>
							<td>
								<input type="radio" name="phpini_al_allow_url_fopen" id="phpini_al_allow_url_fopen_yes" value="yes" {PHPINI_AL_ALLOW_URL_FOPEN_YES} />
								<label for="phpini_al_allow_url_fopen_yes">{TR_YES}</label>
								<input type="radio" name="phpini_al_allow_url_fopen" id="phpini_al_allow_url_fopen_no" value="no" {PHPINI_AL_ALLOW_URL_FOPEN_NO} />
								<label for="phpini_al_allow_url_fopen_no">{TR_NO}</label>
							</td>
						</tr>
						<!-- EDP: t_phpini_allow_url_fopen_perm -->
						<!-- BDP: t_phpini_display_errors_perm -->
						<tr class='phpinipermhide'>
							<td>{TR_PHPINI_AL_DISPLAY_ERRORS}</td>
							<td>
								<input type="radio" name="phpini_al_display_errors" id="phpini_al_display_errors_yes" value="yes" {PHPINI_AL_DISPLAY_ERRORS_YES} />
								<label for="phpini_al_display_errors_yes">{TR_YES}</label>
								<input type="radio" name="phpini_al_display_errors" id="phpini_al_display_errors_no" value="no" {PHPINI_AL_DISPLAY_ERRORS_NO} />
								<label for="phpini_al_display_errors_no">{TR_NO}</label>
							</td>
						</tr>
						<!-- EDP: t_phpini_display_errors_perm -->
						<!-- BDP: t_phpini_disable_functions_perm -->
						<tr class='phpinipermhide'>
							<td>{TR_PHPINI_AL_DISABLE_FUNCTIONS}</td>
							<td>
								<input type="radio" name="phpini_al_disable_functions" id="phpini_al_disable_functions_yes" value="yes" {PHPINI_AL_DISABLE_FUNCTIONS_YES} />
								<label for="phpini_al_disable_functions_yes">{TR_YES}</label>
								<input type="radio" name="phpini_al_disable_functions" id="phpini_al_disable_functions_no" value="no" {PHPINI_AL_DISABLE_FUNCTIONS_NO} />
								<label for="phpini_al_disable_functions_no">{TR_NO}</label>
								<input type="radio" name="phpini_al_disable_functions" id="phpini_al_disable_functions_exec" value="exec" {PHPINI_AL_DISABLE_FUNCTIONS_EXEC} />
								<label for="phpini_al_disable_functions_exec">{TR_USER_EDITABLE_EXEC}</label>
							</td>
						</tr>
						<!-- EDP: t_phpini_disable_functions_perm -->
						<tr>
							<td>{TR_PHPINI_SYSTEM}</td>
							<td>
								<input type="radio" name="phpini_system" id="phpini_system_yes" value="yes" {PHPINI_SYSTEM_YES} />
								<label for="phpini_system_yes">{TR_YES}</label>
								<input type="radio" name="phpini_system" id="phpini_system_no" value="no" {PHPINI_SYSTEM_NO}  />
								<label for="phpini_system_no">{TR_NO}</label>
							</td>
						</tr>
						<!-- BDP: t_phpini_allow_url_fopen -->
						<tr class='phpinihide'>
							<td>
								<label for="phpini_allow_url_fopen">{TR_PHPINI_ALLOW_URL_FOPEN}</label>
							</td>
							<td>
								<select name="phpini_allow_url_fopen" id="phpini_allow_url_fopen">
									<option value="Off" {PHPINI_ALLOW_URL_FOPEN_OFF}>{TR_DISABLED}</option>
									<option value="On" {PHPINI_ALLOW_URL_FOPEN_ON}>{TR_ENABLED}</option>
								</select>
							</td>
						</tr>
						<!-- EDP: t_phpini_allow_url_fopen -->
						<!-- BDP: t_phpini_register_globals -->
						<tr class='phpinihide'>
							<td>
								<label for="phpini_register_globals">{TR_PHPINI_REGISTER_GLOBALS}</label>
							</td>
							<td>
								<select name="phpini_register_globals" id="phpini_register_globals">
									<option value="Off" {PHPINI_REGISTER_GLOBALS_OFF}>{TR_DISABLED}</option>
									<option value="On" {PHPINI_REGISTER_GLOBALS_ON}>{TR_ENABLED}</option>
								</select>
							</td>
						</tr>
						<!-- EDP: t_phpini_register_globals -->
						<!-- BDP: t_phpini_display_errors -->
						<tr class='phpinihide'>
							<td>
								<label for="phpini_display_errors">{TR_PHPINI_DISPLAY_ERRORS}</label>
							</td>
							<td>
								<select name="phpini_display_errors" id="phpini_display_errors">
									<option value="Off" {PHPINI_DISPLAY_ERRORS_OFF}>{TR_DISABLED}</option>
									<option value="On" {PHPINI_DISPLAY_ERRORS_ON}>{TR_ENABLED}</option>
								</select>
							</td>
						</tr>
						<tr class='phpinihide'>
							<td>
								<label for="phpini_error_reporting">{TR_PHPINI_ERROR_REPORTING}</label>
							</td>
							<td>
								<select name="phpini_error_reporting" id="phpini_error_reporting">
									<option value="E_ALL & ~E_NOTICE" {PHPINI_ERROR_REPORTING_0}>{TR_PHPINI_ERROR_REPORTING_DEFAULT}</option>
									<option value="E_ALL | E_STRICT" {PHPINI_ERROR_REPORTING_1}>{TR_PHPINI_ERROR_REPORTING_DEVELOPEMENT}</option>
									<option value="E_ALL & ~E_DEPRECATED" {PHPINI_ERROR_REPORTING_2}>{TR_PHPINI_ERROR_REPORTING_PRODUCTION}</option>
									<option value="0" {PHPINI_ERROR_REPORTING_3}>{TR_PHPINI_ERROR_REPORTING_NONE}</option>
								</select>
							</td>
						</tr>
						<!-- EDP: t_phpini_display_errors -->
						<tr class='phpinihide'>
							<td>
								<label for="phpini_post_max_size">{TR_PHPINI_POST_MAX_SIZE}</label>
							</td>
							<td>
								<input name="phpini_post_max_size" id="phpini_post_max_size" type="text" value="{PHPINI_POST_MAX_SIZE}" />
							</td>
						</tr>
						<tr class='phpinihide'>
							<td>
								<label for="phpini_upload_max_filesize">{TR_PHPINI_UPLOAD_MAX_FILESIZE}</label>
							</td>
							<td>
								<input name="phpini_upload_max_filesize" id="phpini_upload_max_filesize" type="text" value="{PHPINI_UPLOAD_MAX_FILESIZE}" />
							</td>
						</tr>
						<tr class='phpinihide'>
							<td>
								<label for="phpini_max_execution_time">{TR_PHPINI_MAX_EXECUTION_TIME}</label>
							</td>
							<td>
								<input name="phpini_max_execution_time" id="phpini_max_execution_time" type="text" value="{PHPINI_MAX_EXECUTION_TIME}" />
							</td>
						</tr>
						<tr class='phpinihide'>
							<td>
								<label for="phpini_max_input_time">{TR_PHPINI_MAX_INPUT_TIME}</label>
							</td>
							<td>
								<input name="phpini_max_input_time" id="phpini_max_input_time" type="text" value="{PHPINI_MAX_INPUT_TIME}" />
							</td>
						</tr>
						<tr class='phpinihide'>
							<td>
								<label for="phpini_memory_limit">{TR_PHPINI_MEMORY_LIMIT}</label>
							</td>
							<td>
								<input name="phpini_memory_limit" id="phpini_memory_limit" type="text" value="{PHPINI_MEMORY_LIMIT}" />
							</td>
						</tr>
						<!-- BDP: t_phpini_disable_functions -->
						<tr class='phpinihide'>
							<td>{TR_PHPINI_DISABLE_FUNCTIONS}</td>
							<td>
								<input style="vertical-align: middle" name="phpini_df_show_source" id="phpini_df_show_source" type="checkbox" {PHPINI_DF_SHOW_SOURCE_CHK} value="show_source" />
								<label for="phpini_df_show_source">show_source</label>
								<input style="vertical-align: middle" name="phpini_df_system" id="phpini_df_system" type="checkbox" {PHPINI_DF_SYSTEM_CHK} value="system" />
								<label for="phpini_df_system">system</label>
								<input style="vertical-align: middle" name="phpini_df_shell_exec" id="phpini_df_shell_exec" type="checkbox" {PHPINI_DF_SHELL_EXEC_CHK} value="shell_exec" />
								<label for="phpini_df_shell_exec">shell_exec</label>
								<input style="vertical-align: middle" name="phpini_df_passthru" id="phpini_df_passthru" type="checkbox" {PHPINI_DF_PASSTHRU_CHK} value="passthru" />
								<label for="phpini_df_passthru">passthru</label>
								<input style="vertical-align: middle" name="phpini_df_exec" id="phpini_df_exec" type="checkbox" {PHPINI_DF_EXEC_CHK} value="exec" />
								<label for="phpini_df_exec">exec</label>
								<input style="vertical-align: middle" name="phpini_df_phpinfo" id="phpini_df_phpinfo" type="checkbox" {PHPINI_DF_PHPINFO_CHK} value="phpinfo" />
								<label for="phpini_df_phpinfo">phpinfo</label>
								<input style="vertical-align: middle" name="phpini_df_shell" id="phpini_df_shell" type="checkbox" {PHPINI_DF_SHELL_CHK} value="shell" />
								<label for="phpini_df_shell">shell</label>
								<input style="vertical-align: middle" name="phpini_df_symlink" id="phpini_df_symlink" type="checkbox" {PHPINI_DF_SYMLINK_CHK} value="symlink" />
								<label for="phpini_df_symlink">symlink</label>
							</td>
						</tr>
						<!-- EDP: t_phpini_disable_functions -->
					</table>
				</fieldset>
				<!-- EDP: t_phpini_system -->

				<div class="buttons">
					<input name="Submit" type="submit" value="{TR_UPDATE_DATA}" />
					<input name="Submit" type="submit" onclick="MM_goToURL('parent','users.php');return document.MM_returnValue" value="{TR_CANCEL}" />
					<input type="hidden" name="uaction" value="sub_data" />
				</div>
			</form>
		</div>

		<div class="footer">
			i-MSCP {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
		</div>

	</body>
</html>
