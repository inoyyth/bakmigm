
<?php
@ob_start();
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * CodeIgniter Array Helpers
 *
 * @package		CodeIgniter
 * @subpackage	Helpers
 * @category	Helpers
 * @author		EllisLab Dev Team
 * @link		https://codeigniter.com/user_guide/helpers/array_helper.html
 */
// ------------------------------------------------------------------------
if (!function_exists('menu_unserialize')) {
    function menu_unserialize($menu) {
        //get main CodeIgniter object
        $ci =& get_instance();  
        $ci->load->model(['M_menu'=>'menu']);
        $menus = unserialize($menu);
        $dt = [];
        
        if(count($menus) > 1) {
            foreach($menus as $k=>$v) {
                if($v['menu']['value']==1) {
                    $dt[] = $v['menu']['key'];
                }
            }
            if(count($dt) > 0) {
                $get_menu = $ci->menu->getMenu($dt);

                return implode(' | ', array_column($get_menu,'name'));
            }
            
            return "";
        }
    }

    function menu_unserialize_id($menu) {
        //get main CodeIgniter object
        $ci =& get_instance();  
        $ci->load->model(['M_menu'=>'menu']);
        $menus = unserialize($menu);
        $dt = [];
        
        if(count($menus) > 1) {
            foreach($menus as $k=>$v) {
                if($v['menu']['value']==1) {
                    $dt[] = $v['menu']['key'];
                }
            }
            if(count($dt) > 0) {
                $get_menu = $ci->menu->getMenu($dt);

                return array_column($get_menu,'id');
            }

            return [];
        }
    }
}