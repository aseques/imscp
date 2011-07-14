<?php
/**
 * i-MSCP a internet Multi Server Control Panel
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @copyright 	2010 by i-MSCP | http://i-mscp.net
 * @version 	SVN: $Id$
 * @link 		http://i-mscp.net
 * @author 		ispCP Team
 * @author 		i-MSCP Team
 *
 * @license
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is "VHCS - Virtual Hosting Control System".
 *
 * The Initial Developer of the Original Code is moleSoftware GmbH.
 * Portions created by Initial Developer are Copyright (C) 2001-2006
 * by moleSoftware GmbH. All Rights Reserved.
 * Portions created by the ispCP Team are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 * Portions created by the i-MSCP Team are Copyright (C) 2010 by
 * i-MSCP a internet Multi Server Control Panel. All Rights Reserved.
 */

require 'imscp-lib.php';

iMSCP_Events_Manager::getInstance()->dispatch(iMSCP_Events::onClientScriptStart);

check_login(__FILE__);

$cfg = iMSCP_Registry::get('config');

$tpl = new iMSCP_pTemplate();
$tpl->define_dynamic('page', $cfg->CLIENT_TEMPLATE_PATH . '/error_pages.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');

// page functions.

function write_error_page($user_id, $eid) {

	$error = $_POST['error'];
	$file = '/errors/' . $eid . '.html';
	$vfs = new iMSCP_VirtualFileSystem($_SESSION['user_logged']);

	return $vfs->put($file, $error);
}

function update_error_page($user_id) {

	if (isset($_POST['uaction']) && $_POST['uaction'] === 'updt_error') {
		$eid = intval($_POST['eid']);

		if (in_array($eid, array(401, 402, 403, 404, 500, 503))
			&& write_error_page($_SESSION['user_id'], $eid)) {
			set_page_message(tr('Custom error page was updated!'), 'success');
		} else {
			set_page_message(tr('System error - custom error page was not updated!'), 'error');
		}
	}
}



// common page data.

$domain = $_SESSION['user_logged'];
$domain = "http://www." . $domain;

$tpl->assign(
	array(
		'TR_CLIENT_ERROR_PAGE_TITLE' => tr('i-MSCP - Client/Manage Error Custom Pages'),
		'THEME_COLOR_PATH' => "../themes/{$cfg->USER_INITIAL_THEME}",
		'THEME_CHARSET' => tr('encoding'),
		'ISP_LOGO' => get_logo($_SESSION['user_id']),
		'DOMAIN' => $domain
	)
);

// dynamic page data.

update_error_page($_SESSION['user_id']);

// static page messages.

gen_client_mainmenu($tpl, $cfg->CLIENT_TEMPLATE_PATH . '/main_menu_webtools.tpl');
gen_client_menu($tpl, $cfg->CLIENT_TEMPLATE_PATH . '/menu_webtools.tpl');

gen_logged_from($tpl);

check_permissions($tpl);

$tpl->assign(
	array(
		'TR_ERROR_401' => tr('Error 401 (unauthorised)'),
		'TR_ERROR_403' => tr('Error 403 (forbidden)'),
		'TR_ERROR_404' => tr('Error 404 (not found)'),
		'TR_ERROR_500' => tr('Error 500 (internal server error)'),
		'TR_ERROR_503' => tr('Error 503 (service unavailable)'),
		'TR_ERROR_PAGES' => tr('Error pages'),
		'TR_EDIT' => tr('Edit'),
		'TR_VIEW' => tr('View')
	)
);

generatePageMessage($tpl);

$tpl->parse('PAGE', 'page');

iMSCP_Events_Manager::getInstance()->dispatch(
    iMSCP_Events::onClientScriptEnd, new iMSCP_Events_Response($tpl));

$tpl->prnt();

unsetMessages();