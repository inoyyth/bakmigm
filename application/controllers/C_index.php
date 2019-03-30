<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_index extends CI_Controller {
	public function __construct()
	{
        parent::__construct();

		if($this->session->userdata('session_bgm_edocument_status') == "LOGIN"){
			redirect(base_url('welcome'));
		}
		$this->load->model(['M_menu' => 'menu']);
	}
	public function index()
	{
		$this->load->view('V_index');
	}
	public function index_verifikasi()
	{
		$this->load->view('V_verifikasi');
	}
	public function login_check(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_index').'";
				</script>
			';
			exit();
		}
		$si_userid = $this->input->post('si_userid');
		$si_password = $this->input->post('si_password');
		$data_login = $this->M_login->DB_GET_LOGIN_TB_USER($si_userid,$si_password);

		if (!empty($data_login)) {
			$session_data['menu'] = $this->menu->getSideMenu();
			// $session_data['user_menu'] = $this->__getUserMenu($data_login[0]->NIP_USER);
			//$data_login[0] BECAUSE ONLY RETURN 1 ARRAY
			$session_data['session_bgm_edocument_status'] = "LOGIN";
			$session_data['session_bgm_edocument_id'] = $data_login[0]->NIP_USER;
			$session_data['session_bgm_edocument_name'] = $data_login[0]->UR_ID;
			$session_data['session_bgm_edocument_email'] = $data_login[0]->UR_EMAIL;

			$session_data['session_bgm_edocument_departement_id'] = $data_login[0]->DN_ID;
			$session_data['session_bgm_edocument_departement_code'] = $data_login[0]->DN_CODE;
			$session_data['session_bgm_edocument_departement_name'] = $data_login[0]->DN_NAME;
			$session_data['session_bgm_edocument_org_parent'] = $data_login[0]->ORG_PARENT;
			
			
			$session_data['session_bgm_edocument_divisi_id'] = $data_login[0]->DI_ID;
			$session_data['session_bgm_edocument_divisi_code'] = $data_login[0]->DI_CODE;
			$session_data['session_bgm_edocument_divisi_name'] = $data_login[0]->DI_NAME;
			
			$session_data['session_bgm_edocument_direktorat_id'] = $data_login[0]->DT_ID;
			$session_data['session_bgm_edocument_direktorat_name'] = $data_login[0]->DT_NAME;
			
			$session_data['session_bgm_edocument_job_level_id'] = $data_login[0]->JBLL_ID;
			$session_data['session_bgm_edocument_job_level_name'] = $data_login[0]->JBLL_NAME;
			$session_data['session_bgm_edocument_job_level_index'] = $data_login[0]->JBLL_INDEX;
			
			$session_data['session_bgm_edocument_roles'] = $data_login[0]->RS_ID;
			$session_data['session_bgm_edocument_roles2'] = "";
			$session_data['session_bgm_edocument_roles3'] = "";
			$session_data['session_bgm_edocument_roles4'] = "";
			$session_data['session_bgm_edocument_roles5'] = "";
		}else{
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
			$session_data['menu'] = $this->menu->getSideMenu();
			$session_data['user_menu'] = $this->__getUserMenu($data_login[0]->NIP_USER);
			
			$session_data['session_bgm_edocument_departement_id'] = $data_login[0]->DN_ID;
			$session_data['session_bgm_edocument_departement_code'] = $data_login[0]->DN_CODE;
			$session_data['session_bgm_edocument_departement_name'] = $data_login[0]->DN_NAME;
			$session_data['session_bgm_edocument_org_parent'] = $data_login[0]->ORG_PARENT;

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
		}
		//SET VARIABLE SESSION
		$this->session->set_userdata($session_data);
		if ($_SESSION['link']) {
			redirect($_SESSION['link'],'refresh');
		}else{
			redirect(base_url('welcome'));
		}
	}
	public function verifikasi(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_index').'";
				</script>
			';
			exit();
		}
		$username = $this->input->post('username');
		$token = $this->input->post('si_userid');
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

		// Cek Token
		$cek_token = $this->M_library_database->CEK_TOKEN($token);
		if (empty($cek_token)) {
			echo '
				<script>
					alert("TOKEN NOT FOUND!");
					window.location.href = "'.base_url().'";
				</script>
			';
			exit();
		}
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
}