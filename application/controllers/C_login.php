<?php
//-----------------------------------------------------------------------------------------------//
defined('BASEPATH') OR exit('No direct script access allowed');
//-----------------------------------------------------------------------------------------------//
class C_login extends CI_Controller {
		public function __construct() {
			parent::__construct();
			$this->load->model(['M_menu' => 'menu']);
		}

    public function direct_login(){
		if($_SERVER['REQUEST_METHOD']!="GET" && $this->input->get('NIP')){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_index').'";
				</script>
			';
			exit();
		}
	
		$si_userid = $this->input->get('NIP');

		$data_login = $this->M_login->DB_GET_LOGIN_DEPARTEMEN($si_userid);
		if(empty($data_login)){
			echo '
				<script>
					alert("USERID & PASSWORD NOT FOUND");
					window.location.href = "'.base_url().'";
				</script>
			';
			exit();
		}
		//$data_login[0] BECAUSE ONLY RETURN 1 ARRAY
		$session_data['session_bgm_edocument_status'] = "LOGIN";
		$session_data['session_bgm_edocument_id'] = $data_login[0]->NIP_USER;
		$session_data['session_bgm_edocument_name'] = $data_login[0]->FULL_NAME;
		$session_data['session_bgm_edocument_email'] = $data_login[0]->EMAIL;
		
		$session_data['session_bgm_edocument_departement_id'] = $data_login[0]->DN_ID;
		$session_data['session_bgm_edocument_departement_code'] = $data_login[0]->DN_CODE;
		$session_data['session_bgm_edocument_departement_name'] = $data_login[0]->DN_NAME;
		$session_data['session_bgm_edocument_org_parent'] = $data_login[0]->ORG_PARENT;
		$session_data['session_dep_code_employee'] = $data_login[0]->DEPCODE;
		$session_data['menu'] = $this->__getSideMenu();
		$session_data['user_menu'] = $this->__getUserMenu($data_login[0]->NIP_USER);
		if (empty($data_login[0]->DN_ID)) {
			$data_login = $this->M_login->DB_GET_LOGIN_DIVISI($si_userid);
			$session_data['session_bgm_edocument_divisi_id'] = $data_login[0]->DI_ID;
			$session_data['session_bgm_edocument_divisi_code'] = $data_login[0]->DI_CODE;
			$session_data['session_bgm_edocument_divisi_name'] = $data_login[0]->DI_NAME;
		}else{
			$session_data['session_bgm_edocument_divisi_id'] = $data_login[0]->DI_ID;
			$session_data['session_bgm_edocument_divisi_code'] = $data_login[0]->DI_CODE;
			$session_data['session_bgm_edocument_divisi_name'] = $data_login[0]->DI_NAME;
		}

		if (empty($data_login[0]->DI_ID)) {
			$data_login = $this->M_login->DB_GET_LOGIN_DIREKTORAT($si_userid);
			$session_data['session_bgm_edocument_direktorat_id'] = $data_login[0]->DT_ID;
			$session_data['session_bgm_edocument_direktorat_name'] = $data_login[0]->DT_NAME;
		}else{
			$session_data['session_bgm_edocument_direktorat_id'] = $data_login[0]->DT_ID;
			$session_data['session_bgm_edocument_direktorat_name'] = $data_login[0]->DT_NAME;
		}
		$session_data['session_bgm_edocument_job_level_id'] = $data_login[0]->JBLL_ID;
		$session_data['session_bgm_edocument_job_level_name'] = $data_login[0]->JBLL_NAME;
		$session_data['session_bgm_edocument_job_level_index'] = $data_login[0]->JBLL_INDEX;
		if (empty($data_login[0]->ROLES)) {
			$session_data['session_bgm_edocument_roles'] = "PENGGUNA";
		}else{
			$session_data['session_bgm_edocument_roles'] = $data_login[0]->ROLES;
		}
		$session_data['session_bgm_edocument_roles2'] = $data_login[0]->ROLES_2;
		$session_data['session_bgm_edocument_roles3'] = $data_login[0]->ROLES_3;
		$session_data['session_bgm_edocument_roles4'] = $data_login[0]->ROLES_4;
		$session_data['session_bgm_edocument_roles5'] = $data_login[0]->ROLES_5;
		//SET VARIABLE SESSION
		$this->session->set_userdata($session_data);
		if ($_SESSION['link']) {
			redirect($_SESSION['link'],'refresh');
		}else{
			redirect(base_url('welcome'));
		}
	}

	private function __getUserMenu($user_id) {
		//get current user role's
		$get_user_role = $this->db->select('ROLES,ROLES_2,ROLES_3,ROLES_4,ROLES_5')
										 ->from('tb_employee_detail')
										 ->where(['NIP' => $user_id])
										 ->get()->row_array();
		if ($get_user_role) {
			$role = array_filter(array_values($get_user_role));
		} else {
			$role = array('PENGGUNA');
		}

		// get role menu by user role's
		$get_menu_by_role = $this->db->select('ROLE_MENUS')
												->from('tb_roles')
												->where_in('RS_ID', $role)
												->get()->result_array();
		$data_menus=[];
		foreach($get_menu_by_role as $k => $v) {
			$data_menus[] = unserialize($v['ROLE_MENUS']);
		}

		//merge menu
		// var_dump($data_menus);die;
		$data_merge_menu = [];
		foreach($data_menus as $k => $v) {
				$data_merge_menu = array_merge($data_merge_menu, $v);	
		}

		//remove menu with value 0
		$enable_menu = [];
		foreach($data_merge_menu as $k => $v) {
			if ($v['menu']['value'] == "1") {
				$enable_menu[] = $v['menu']['key'];
			}
		}
		return $enable_menu;							
	}

	private function __getSideMenu() {
		$menus = $this->menu->getSideMenu();
		$structured_menu = $this->__structuredMenu($menus);

		return $structured_menu;
	}

	private function __structuredMenu(array $data, $parent = 0)
    {
    	$items = array();
		// var_dump($data);die;
		foreach ($data as $item) 
		{
			if ($item['parent'] == $parent) 
			{
				$items[$item['id']] = $item;
				$items[$item['id']]['children'] = $this->__structuredMenu($data, $item['id']);
			}	
		}

		return $items;
		}
}