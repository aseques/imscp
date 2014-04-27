<?php
/**
 * i-MSCP - internet Multi Server Control Panel
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @category    iMSCP
 * @package     iMSCP_Core
 * @subpackage  Admin
 * @copyright   2010-2014 by i-MSCP team
 * @author      iMSCP Team
 * @author      Laurent Declercq <l.declercq@nuxwin.com>
 * @link        http://www.i-mscp.net i-MSCP Home Site
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GPL v2
 */

/***********************************************************************************************************************
 * Functions
 */

/**
 * Generate List of Domains assigned to IPs
 *
 * @param iMSCP_pTemplate $tpl
 * @return void
 */
function listIPDomains($tpl)
{
	$stmt = execute_query('SELECT ip_id, ip_number FROM server_ips');

	while ($ip = $stmt->fetchRow(PDO::FETCH_ASSOC)) {
		$stmt2 = exec_query(
			'
				SELECT
					t1.domain_name, t3.admin_name
				FROM
					domain AS t1
				INNER JOIN
					admin AS t2 ON(t2.admin_id = t1.domain_admin_id)
				INNER JOIN
					admin as t3 ON(t3.admin_id = t2.created_by)
				WHERE
					t1.domain_ip_id = ?
			',
			$ip['ip_id']
		);

		$domainsCount = $stmt2->rowCount();

		while ($data = $stmt2->fetchRow(PDO::FETCH_ASSOC)) {
			$tpl->assign(
				array(
					'DOMAIN_NAME' => idn_to_utf8(tohtml($data['domain_name'])),
					'RESELLER_NAME' => tohtml($data['admin_name'])
				)
			);

			$tpl->parse('DOMAIN_ROW', '.domain_row');
		}

		$stmt3 = exec_query(
			'
				SELECT
					t1.alias_name, t4.admin_name
				FROM
					domain_aliasses AS t1
				INNER JOIN
					domain AS t2 USING(domain_id)
				INNER JOIN
					admin AS t3 ON(admin_id = domain_admin_id)
				INNER JOIN
					admin AS t4 ON(t4.admin_id = t3.created_by)
				WHERE
					alias_ip_id = ?
			',
			$ip['ip_id']
		);

		$aliasesCount = $stmt3->rowCount();

		if ($aliasesCount) {
			while ($data = $stmt3->fetchRow(PDO::FETCH_ASSOC)) {
				$tpl->assign(
					array(
						'DOMAIN_NAME' => tohtml(idn_to_utf8($data['alias_name'])),
						'RESELLER_NAME' => tohtml($data['admin_name'])
					)
				);

				$tpl->parse('DOMAIN_ROW', '.domain_row');
			}
		}

		$tpl->assign(
			array(
				'IP' => tohtml($ip['ip_number']),
				'RECORD_COUNT' => tr('Total Domains') . ': ' . ($domainsCount + $aliasesCount)
			)
		);

		$tpl->parse('IP_ROW', '.ip_row');
	}
}

/***********************************************************************************************************************
 * Main
 */

// Include core library
require 'imscp-lib.php';

iMSCP_Events_Aggregator::getInstance()->dispatch(iMSCP_Events::onAdminScriptStart);

check_login('admin');

if (!systemHasCustomers()) {
	showBadRequestErrorPage();
}

$tpl = new iMSCP_pTemplate();

$tpl->define_dynamic(
	array(
		'layout' => 'shared/layouts/ui.phtml',
		'page' => 'admin/ip_usage.phtml',
		'ip_usage_statistics' => 'page',
		'ip_row' => 'ip_usage_statistics',
		'domain_row' => 'ip_row'
	)
);

$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('Admin / Statistics / IP Usage'),
		'ISP_LOGO' => layout_getUserLogo(),
		'TR_SERVER_STATISTICS' => tr('Server statistics'),
		'TR_IP_ADMIN_USAGE_STATISTICS' => tr('Admin/IP usage statistics'),
		'TR_DOMAIN_NAME' => tr('Domain Name'),
		'TR_RESELLER_NAME' => tr('Reseller Name')
	)
);

generateNavigation($tpl);
listIPDomains($tpl);
generatePageMessage($tpl);

$tpl->parse('LAYOUT_CONTENT', 'page');

iMSCP_Events_Aggregator::getInstance()->dispatch(iMSCP_Events::onAdminScriptEnd, array('templateEngine' => $tpl));

$tpl->prnt();

unsetMessages();
