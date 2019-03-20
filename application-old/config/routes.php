<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] 		= 'C_index';
$route['C_index'] 					= '';
// Menu
$route['menu'] 						= 'C_menu';
$route['search'] 					= 'C_menu/cari';
$route['advanced-search'] 			= 'C_menu/cari_advance';
$route['download-(:any).zip']		= 'C_menu/zip/$1';
$route['document-details-(:any)'] 	= 'C_menu/detail/$1';
$route['document-(:any)']			= 'C_menu/link/$1';
// Notification
$route['notification'] 				= 'C_notification';
$route['pmd-details'] 				= 'C_notification/detail';
$route['document-revision'] 		= 'C_notification/revisi';
$route['metadata-versioning'] 		= 'C_notification/versioning_meta';
$route['content-versioning'] 		= 'C_notification/versioning_isi';
$route['list-comments'] 			= 'C_news/comment';
// Pencarian
$route['document-search'] 			= 'C_recent_history';
// Bookmark
$route['bookmarks'] 				= 'C_bookmarks';
// Kontribusi
$route['contribution'] 				= 'C_contribution';
// Report
$route['report'] 					= 'C_report';
$route['employee'] 					= 'C_employee';
$route['employee/sync_employee'] = 'C_employee/sync_employee';
$route['employee/sync_department'] = 'C_employee/sync_department';
$route['employee/sync_division'] = 'C_employee/sync_division';
$route['employee-level/(:any)']		= 'C_employee/level/$1';
$route['direct-login'] = 'C_login/direct_login';

$route['directorate-structure']		= 'C_setting_structure_organization/view_direktorat';
$route['division-structure']		= 'C_setting_structure_organization/view_divisi';
$route['dapartemen-structure']		= 'C_setting_structure_organization/view_departemen';
$route['welcome'] 					= 'C_general_setting/welcome_speech';


$route['404_override'] 				= '';
$route['translate_uri_dashes'] 		= FALSE;
