<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_menu extends CI_Model {
	function getRoles() {
        $query = $this->db->select('*')
                 ->from('tb_roles')
                 ->order_by('RS_ID')
                 ->get()->result_array();

        return $query;
    }

    function getRolesMenus($ROLE_ID) {
        $query = $this->db->select('*')
                 ->from('tb_roles')
                 ->where('RS_ID', $ROLE_ID)
                 ->get()->row_array();

        return $query;
    }

    function getMenus($parent=0) {
        if ($parent > 0) {
            $query = $this->db->select('*')
                 ->from('tb_menus')
                 ->where('id', $parent)
                 ->get()->result_array();
        } else {
            $query = $this->db->select('*')
                    ->from('tb_menus')
                    ->get()->result_array();
        }

        return $query;
    }

    function updateRoles($rs_id,$data) {
        $query = $this->db->update('tb_roles', array('ROLE_MENUS' => serialize($data)), array('RS_ID' => $rs_id));

        return $query;
    }

    function getMenu($dt) {
        $query = $this->db->select('id,name')
                 ->from('tb_menus')
                 ->where_in('id', $dt)
                 ->get()->result_array();
        
        return $query;
    }

    function getSideMenu() {
        $query = $this->db->select('*')
                 ->from('tb_menus')
                 ->where('type', 1)
                 ->get()->result_array();
        
        return $query;
    }
}

/* End of file M_menu.php */
/* Location: ./application/models/M_menu.php */