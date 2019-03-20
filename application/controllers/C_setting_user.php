<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_setting_user extends CI_Controller {
	public function __construct()
	{
        parent::__construct();	
		if($this->session->userdata('session_bgm_edocument_status') != "LOGIN"){
			redirect(base_url());
		}
		$SESSION_ID = $this->session->userdata("session_bgm_edocument_id");
        $SESSION_NAME = $this->session->userdata("session_bgm_edocument_name");
        $SESSION_EMAIL = $this->session->userdata("session_bgm_edocument_email");

        $SESSION_DIREKTORAT_ID = $this->session->userdata("session_bgm_edocument_direktorat_id");
        $SESSION_DIREKTORAT_NAME = $this->session->userdata("session_bgm_edocument_direktorat_name");

        $SESSION_DIVISI_ID = $this->session->userdata("session_bgm_edocument_divisi_id");
        $SESSION_DIVISI_CODE = $this->session->userdata("session_bgm_edocument_divisi_code");
        $SESSION_DIVISI_NAME = $this->session->userdata("session_bgm_edocument_divisi_name");

        $SESSION_DEPARTEMENT_ID = $this->session->userdata("session_bgm_edocument_departement_id");
        $SESSION_DEPARTEMENT_CODE = $this->session->userdata("session_bgm_edocument_departement_code");
        $SESSION_DEPARTEMENT_NAME = $this->session->userdata("session_bgm_edocument_departement_name");

        $SESSION_ROLES = $this->session->userdata("session_bgm_edocument_roles");
        $SESSION_ROLES_2 = $this->session->userdata("session_bgm_edocument_roles_2");
        $SESSION_ROLES_3 = $this->session->userdata("session_bgm_edocument_roles_3");
        $SESSION_ROLES_4 = $this->session->userdata("session_bgm_edocument_roles_4");
        $SESSION_ROLES_5 = $this->session->userdata("session_bgm_edocument_roles_5");

        $SESSION_JOB_LEVEL_ID = $this->session->userdata("session_bgm_edocument_job_level_id");
        $SESSION_JOB_LEVEL_NAME = $this->session->userdata("session_bgm_edocument_job_level_name");
        $SESSION_JOB_LEVEL_INDEX = $this->session->userdata("session_bgm_edocument_job_level_index");
    }
	public function index()
	{
		$this->load->view('V_setting_user');
	}
	public function insert()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_user').'";
				</script>
			';
			exit();
		}
		date_default_timezone_set('Asia/jakarta');
		// data update
		$email = $this->input->post('email');
		$role = $this->input->post('role');
		$departemen = $this->input->post('departemen');
		$jb_level = $this->input->post('jb_level');
		// new data
		$user = $this->input->post('user');
		$date_now = date('Y-m-d H:i:s');
		$group = $this->input->post('group');
		$by = $this->session->userdata('session_bgm_edocument_id');

		$data = array(
			'UR_ID' => $user,
			'URD_GROUP' => $group,
			'URD_BY' => $by,
			'URD_TIME' => $date_now 
		);
		$insert = $this->db->insert('tb_user_detail', $data);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('C_setting_user'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_user'),'refresh');
		}
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function get_user(){
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_admin_setting->GET_USER_BY_ID($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}
	public function tool_table(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_user').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$si_tool_table_key = $this->input->post('si_tool_table_key');
		$si_tool_table_key = $si_tool_table_key[0];
		//-----------------------------------------------------------------------------------------------//
		if(isset($_POST['btn_delete'])){
			$is_ok = $this->M_library_database->DB_DELETE_DATA_USER($si_tool_table_key);
			//-----------------------------------------------------------------------------------------------//
			if($is_ok){
				//INSERT TO LOG ???
				//-----------------------------------------------------------------------------------------------//
				echo '
					<script>
						alert("Hapus Data Berhasil");
						window.location.href = "'.base_url('C_setting_user').'";
					</script>
				';
				exit();
			}else{
				echo '
					<script>
						alert("Hapus Data Gagal, Mohon Cek Kembali");
						window.location.href = "'.base_url('C_setting_user').'";
					</script>
				';
				exit();
			}
		}else{
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_user').'";
				</script>
			';
			exit();
		}
	}

	function table_hris()
	{
		$this->load->view('V_table_hris');
	}

	function table_edoc()
	{
		$this->load->view('V_table_edoc');
	}

	public function get_data_employee()
	{
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_setting_user->GET_DATA_EMPLOYEE_BY_ID($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}

	public function get_detail_employee() {
		$id = $this->input->post('nip');
		$data['employee_detail'] = $this->M_setting_user->GET_DATA_EMPLOYEE_BY_ID($id);
		echo json_encode($data);
	}

	public function insert_user_detail()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_user').'";
				</script>
			';
			exit();
		}
		date_default_timezone_set('Asia/jakarta');
		// data update
		$nip = $this->input->post('nip');
		$user_group = $this->input->post('user_group');
		$role = $this->input->post('role');
		// Role Array ke 0
		if (!empty($role[0])) {
			$role_1 = $role[0];
		}else{
			$role_1 = "";
		}
		// Role Array ke 1
		if (!empty($role[1])) {
			$role_2 = $role[1];
		}else{
			$role_2 = "";
		}
		// Role Array ke 2
		if (!empty($role[2])) {
			$role_3 = $role[2];
		}else{
			$role_3 = "";
		}
		// Role Array ke 3
		if (!empty($role[3])) {
			$role_4 = $role[3];
		}else{
			$role_4 = "";
		}
		// Role Array ke 4
		if (!empty($role[4])) {
			$role_5 = $role[4];
		}else{
			$role_5 = "";
		}
		$data = array(
			'NIP' => $nip,
			'USER_GROUP' => $user_group,
			'ROLES' => $role_1,
			'ROLES_2' => $role_2,
			'ROLES_3' => $role_3,
			'ROLES_4' => $role_4,
			'ROLES_5' => $role_5,
		);
		// Cek data by nip
		$cek_usr = $this->db->get_where('tb_employee_detail', array('NIP' => $nip))->result();
		if (empty($cek_usr)) {
			$insert = $this->db->insert('tb_employee_detail', $data);
		}else{
			$delete = $this->db->where('NIP', $nip)->delete('tb_employee_detail');
			$insert = $this->db->insert('tb_employee_detail', $data);
		}
		if($insert){
			$this->session->set_flashdata('pesan','Berhasil');
			redirect(base_url('C_setting_user/table_hris'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_user/table_hris'),'refresh');
		}
	}

	public function destroy_user_detail($nip) {
		$delete = $this->M_setting_user->DELETE_EMPLOYEE_DETAIL($nip);
		if($delete){
			$this->session->set_flashdata('pesan','Delete data Berhasil');
			redirect(base_url('C_setting_user/table_hris'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Delete data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_user/table_hris'),'refresh');
		}
	}

	public function update_user()
	{
		date_default_timezone_set('Asia/jakarta');
		// data update
		$nip = $this->input->post('nip');
		$user_group = $this->input->post('user_group');
		$role = $this->input->post('role');

		$data = array(
			'NIP' => $nip,
			'USER_GROUP' => $user_group,
			'ROLES' => $role 
		);
		$update = $this->M_setting_user->UPDATE_DATA_EMPLOYEE_DETAIL($data,$nip);
		if($update){
			$this->session->set_flashdata('pesan','Update data Berhasil');
			redirect(base_url('C_setting_user/table_hris'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Update data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_user/table_hris'),'refresh');
		}
	}

	function insert_user()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_user').'";
				</script>
			';
			exit();
		}
		date_default_timezone_set('Asia/jakarta');
		// data update
		$nip = $this->input->post('nip');
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$email = $this->input->post('email');
		$departemen = $this->input->post('departemen');
		$role = $this->input->post('role');
		$job_level = $this->input->post('job_level');
		$user_group = $this->input->post('user_group');

		$data = array(
			'NIP' => $nip,
			'UR_ID' => $username,
			'UR_PASSWORD' => $password,
			'UR_EMAIL' => $email,
			'DN_ID' => $departemen,
			'RS_ID' => $role,
			'JBLL_ID' => $job_level,
			'UR_GROUP' => $user_group
		);
		$insert = $this->db->insert('tb_user', $data);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('C_setting_user/table_edoc'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_user/table_edoc'),'refresh');
		}
	}

	function update_tabel_user()
	{
		date_default_timezone_set('Asia/jakarta');
		// data update
		$nip = $this->input->post('nip');
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$email = $this->input->post('email');
		$departemen = $this->input->post('departemen');
		$role = $this->input->post('role');
		$job_level = $this->input->post('job_level');
		$user_group = $this->input->post('user_group');

		$data = array(
			'NIP' => $nip,
			'UR_ID' => $username,
			'UR_PASSWORD' => $password,
			'UR_EMAIL' => $email,
			'DN_ID' => $departemen,
			'RS_ID' => $role,
			'JBLL_ID' => $job_level,
			'UR_GROUP' => $user_group
		);
		$update = $this->M_setting_user->UPDATE_DATA_USER($data,$nip);
		if($update){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('C_setting_user/table_edoc'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_user/table_edoc'),'refresh');
		}
	}

	function delete_user($nip)
	{
		$delete = $this->M_setting_user->DELETE_USER($nip);
		if($delete){
			$this->session->set_flashdata('pesan','Data berhasil dihapus');
			redirect(base_url('C_setting_user/table_edoc'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Data gagal dihapus, Mohon cek kembali!');
			redirect(base_url('C_setting_user/table_edoc'),'refresh');
		}
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
}
//-----------------------------------------------------------------------------------------------//
