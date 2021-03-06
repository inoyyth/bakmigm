<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Role_menus extends CI_Controller {
	public function __construct(){
        parent::__construct();
        $this->load->model(['M_menu'=>'menus']);
		if($this->session->userdata('session_bgm_edocument_status') != "LOGIN"){
			redirect(base_url());
        }
    }

    function index() {
        $data['roles'] = $this->menus->getRoles();
        $data['view'] = 'menu/index';
        $this->load->view('template',$data);
    }

    function edit($role) {
        $data['role'] = $this->menus->getRolesMenus(str_replace('_', ' ', $role));
        $data['menus'] = $this->__getMenu();
        $data['view'] = 'menu/edit';
        $this->load->view('template',$data);
    }

    private function __getMenu(){
        $menus = $this->menus->getMenus();
        $data_menu = [];
        foreach($menus as $k=>$v) {
            if($v['slug'] != "#") {
                $parent = $this->menus->getMenus($v['parent']);
                $data_menu[] = array(
                    'parent' => $v['parent'] > 0 ? $parent[0]['name'] : '',
                    'menu' => $v
                );
            }
        }
        
        return $data_menu;
    }

    function store() {
        $parent = $this->__getParent();
        $rs_id = $this->input->post('RS_ID');
        $key = $this->input->post('key');
        $value = $this->input->post('value');
        $data = array();
        foreach($key as $k=>$v) {
            $data[]=array(
                'menu' => ['key' => $v, 'value' => $value[$k]]
            );
        }

        $update_role = $this->menus->updateRoles($rs_id,array_merge($data,$parent));
        if ($update_role) {
            redirect("role-menus");
        }
    }

    private function __getParent() {
        $key = $this->input->post('key');
        $value = $this->input->post('value');

        $active_menu = [];
        foreach ($key as $k=>$v) {
            if ($value[$k] == 1) {
                $active_menu[] = $v;
            }
        }
        
        $parents = $this->menus->getSelectedParent($active_menu);
        $parent = [];
        if (count($parents) > 0) {
            foreach($parents as $k=>$v) {
                $parent[] = array(
                    'menu' => ['key' => $v['parent'], 'value' => 1]
                );
            }
        }

        return $parent;
    }
}