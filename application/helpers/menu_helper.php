
<?php
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
         $dt = []; //var_dump($menus);die;
         $hidden_menu = [10,11];
        
        if(count($menus) > 1) {
            foreach($menus as $k=>$v) {
                if($v['menu']['value']==1) {
                    if(!in_array($v['menu']['key'],$hidden_menu)) {
                        $dt[] = $v['menu']['key'];
                    }
                }
            }
            if(count($dt) > 0) {
                $get_menu = $ci->menu->getMenu($dt);

                return implode(' | ', array_column($get_menu,'name'));
            }
            
            return "";
        }
    }
}

if (!function_exists('menu_unserialize_id')) {
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

if (!function_exists('static_menu_button')) {
    function static_menu_button() {
        $menu = [
            'news' => 5,
            'approval' => 6,
            'comentar' => 9,
            'revise' => 23,
            'sharelink-document' => 24,
            'bookmark-document' => 25
        ];

        return $menu;
    }
}