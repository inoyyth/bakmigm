<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_setting_structure_organization extends CI_Controller {
	public function __construct()
	{
        parent::__construct();
		
		if($this->session->userdata('session_bgm_edocument_status') != "LOGIN"){
			redirect(base_url("C_index"));
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
		$this->load->view('V_setting_structure_organization');
	}

	// Direktorat

	public function view_direktorat()
	{
		$this->load->view('V_direktorat');
	}

	public function insert_direktorat()
	{
		date_default_timezone_set('asia/jakarta');
		$id = $this->input->post('id');
		// $code = $this->input->post('code');
		$nama = $this->input->post('nama');
		$level = $this->input->post('level');
		// $parent = $this->input->post('parent');
		$desc = $this->input->post('desc');
		$date_now = date('Y-m-d H:i:s');
		$user = $this->session->userdata('session_bgm_edocument_id');
		// insert tb_direktorat
		$data = array(
			'DT_ID' => $id,
			'DT_NAME' => $nama
		);
		$insert = $this->M_admin_setting->INSERT_DIREKTORAT($data);
		// Insert tb_sod
		$data_detail = array(
			'DT_ID' => $id,
			'UR_ID' => $user,
			'SODT_LVL' => $level,
			'SODT_DESC' => $desc,
			'SODT_TIME' => $date_now
		);
		$insert = $this->M_admin_setting->INSERT_SO_DIREKTORAT($data_detail);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('directorate-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('directorate-structure'),'refresh');
		}
	}

	public function update_direktorat()
	{
		date_default_timezone_set('asia/jakarta');
		$id_sod = $this->input->post('id_sod');
		$id = $this->input->post('id');
		// $code = $this->input->post('code');
		$nama = $this->input->post('nama');
		// $parent = $this->input->post('parent');
		$desc = $this->input->post('desc');
		$date_now = date('Y-m-d H:i:s');
		$user = $this->session->userdata('session_bgm_edocument_id');
		// update tb_divisi
		$data = array(
			'DT_NAME' => $nama
		);
		$update = $this->M_admin_setting->UPDATE_DIREKTORAT($data,$id);
		// update tb_sod
		$data_detail = array(
			'SODT_DESC' => $desc,
			'SODT_TIME' => $date_now
		);
		$update = $this->M_admin_setting->UPDATE_SO_DIREKTORAT($data_detail,$id_sod);
		if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('directorate-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubhan data Gagal, Mohon cek kembali!');
			redirect(base_url('directorate-structure'),'refresh');
		}
	}

	public function delete_direktorat($id)
	{
		$delete = $this->M_admin_setting->DELETE_DIREKTORAT($id);
		if($delete){
			$this->session->set_flashdata('pesan','Data berhasil dihapus');
			redirect(base_url('directorate-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Data gagal dihapus, Mohon cek kembali!');
			redirect(base_url('directorate-structure'),'refresh');
		}
	}

	// END Direktorat

	// DIVISI

	public function view_divisi()
	{
		$this->load->view('V_divisi');
	}

	public function insert_divisi()
	{
		date_default_timezone_set('asia/jakarta');
		$id = $this->input->post('id');
		$code = $this->input->post('code');
		$nama = $this->input->post('nama');
		$level = $this->input->post('level');
		$parent = $this->input->post('parent');
		$desc = $this->input->post('desc');
		$date_now = date('Y-m-d H:i:s');
		$user = $this->session->userdata('session_bgm_edocument_id');
		// insert tb_divisi
		$data = array(
			'DI_ID' => $id,
			'DI_CODE' => $code,
			'DI_NAME' => $nama,
			'DT_ID' => $parent,
		);
		$insert = $this->M_admin_setting->INSERT_DIVISI($data);
		// Insert tb_sod
		$data_detail = array(
			'DI_ID' => $id,
			'UR_ID' => $user,
			'SODI_LVL' => $level,
			'SODI_DESC' => $desc,
			'SODI_TIME' => $date_now
		);
		$insert = $this->M_admin_setting->INSERT_SO_DIVISI($data_detail);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('division-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('division-structure'),'refresh');
		}
	}

	public function update_divisi()
	{
		date_default_timezone_set('asia/jakarta');
		$id_sod = $this->input->post('id_sod');
		$id = $this->input->post('id');
		$code = $this->input->post('code');
		$nama = $this->input->post('nama');
		$parent = $this->input->post('parent');
		$desc = $this->input->post('desc');
		$date_now = date('Y-m-d H:i:s');
		$user = $this->session->userdata('session_bgm_edocument_id');
		// update tb_divisi
		$data = array(
			'DI_CODE' => $code,
			'DI_NAME' => $nama,
			'DT_ID' => $parent,
		);
		$update = $this->M_admin_setting->UPDATE_DIVISI($data,$id);
		// update tb_sod
		$data_detail = array(
			'SODI_DESC' => $desc,
			'SODI_TIME' => $date_now
		);
		$update = $this->M_admin_setting->UPDATE_SO_DIVISI($data_detail,$id_sod);
		if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('division-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubhan data Gagal, Mohon cek kembali!');
			redirect(base_url('division-structure'),'refresh');
		}
	}

	public function delete_divisi($id)
	{
		$delete = $this->M_admin_setting->DELETE_DIVISI($id);
		if($delete){
			$this->session->set_flashdata('pesan','Data berhasil dihapus');
			redirect(base_url('division-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Data gagal dihapus, Mohon cek kembali!');
			redirect(base_url('division-structure'),'refresh');
		}
	}

	// END DIVISI

	// DEPARTEMEN

	public function view_departemen()
	{
		$this->load->view('V_departemen');
	}

	public function insert_departemen()
	{
		date_default_timezone_set('asia/jakarta');
		$id = $this->input->post('id');
		$code = $this->input->post('code');
		$nama = $this->input->post('nama');
		$level = $this->input->post('level');
		$parent = $this->input->post('parent');
		$desc = $this->input->post('desc');
		$date_now = date('Y-m-d H:i:s');
		$user = $this->session->userdata('session_bgm_edocument_id');
		// insert tb_departemen
		$data = array(
			'DN_ID' => $id,
			'DN_CODE' => $code,
			'DN_NAME' => $nama,
			'DI_ID' => $parent,
		);
		$insert = $this->M_admin_setting->INSERT_DEPARTEMEN($data);
		// Insert tb_sod
		$data_detail = array(
			'DN_ID' => $id,
			'UR_ID' => $user,
			'SOD_LVL' => $level,
			'SOD_DESC' => $desc,
			'SOD_TIME' => $date_now
		);
		$insert = $this->M_admin_setting->INSERT_SO_DEPARTEMEN($data_detail);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('dapartemen-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('dapartemen-structure'),'refresh');
		}
	}

	public function update_departemen()
	{
		date_default_timezone_set('asia/jakarta');
		$id_sod = $this->input->post('id_sod');
		$id = $this->input->post('id');
		$code = $this->input->post('code');
		$nama = $this->input->post('nama');
		$parent = $this->input->post('parent');
		$desc = $this->input->post('desc');
		$date_now = date('Y-m-d H:i:s');
		$user = $this->session->userdata('session_bgm_edocument_id');
		// update tb_departemen
		$data = array(
			'DN_CODE' => $code,
			'DN_NAME' => $nama,
			'DI_ID' => $parent,
		);
		$update = $this->M_admin_setting->UPDATE_DEPARTEMEN($data,$id);
		// update tb_sod
		$data_detail = array(
			'SOD_DESC' => $desc,
			'SOD_TIME' => $date_now
		);
		$update = $this->M_admin_setting->UPDATE_SO_DEPARTEMEN($data_detail,$id_sod);
		if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('dapartemen-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubhan data Gagal, Mohon cek kembali!');
			redirect(base_url('dapartemen-structure'),'refresh');
		}
	}

	public function delete_departemen($id)
	{
		$delete = $this->M_admin_setting->DELETE_DEPARTEMEN($id);
		if($delete){
			$this->session->set_flashdata('pesan','Data berhasil dihapus');
			redirect(base_url('dapartemen-structure'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Data gagal dihapus, Mohon cek kembali!');
			redirect(base_url('dapartemen-structure'),'refresh');
		}
	}

	// END DEPARTEMEN

	// Action
	// END Action
	public function insert(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_structure_organization').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$si_code = $this->input->post('si_code');
		$si_nama = $this->input->post('si_nama');
		$si_level = $this->input->post('si_level');
		$si_parent = $this->input->post('si_parent');
		$si_desc = $this->input->post('si_desc');
		$si_userid = $this->input->post('si_userid');
		
		$date_now = date('Y-m-d H:i:s');
		//-----------------------------------------------------------------------------------------------//
		$data_insert = array(
			'SEON_ID' => $si_code,
			'SEON_NAME' => $si_nama,
			'SEON_LEVEL' => $si_level,
			'SEON_PARENT' => $si_parent,
			'SEON_DESC' => $si_desc,
			'SEON_DATE' => $date_now,
			'UR_ID' => $si_userid
		);
		//-----------------------------------------------------------------------------------------------//
		$is_ok = $this->M_library_database->DB_INSERT_DATA_STRUCTURE_ORGANIZATION($data_insert);
		//-----------------------------------------------------------------------------------------------//
		if($is_ok){
			//INSERT TO LOG ???
			//-----------------------------------------------------------------------------------------------//
			echo '
				<script>
					alert("Penambahan Data Berhasil");
					window.location.href = "'.base_url('C_setting_structure_organization').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Penambahan Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_setting_structure_organization').'";
				</script>
			';
			exit();
		}
	}
	public function tool_table(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_structure_organization').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$si_tool_table_key = $this->input->post('si_tool_table_key');
		$si_tool_table_key = $si_tool_table_key[0];
		//-----------------------------------------------------------------------------------------------//
		if(isset($_POST['btn_delete'])){
			$is_ok = $this->M_library_database->DB_DELETE_DATA_STRUCTURE_ORGANIZATION($si_tool_table_key);
			//-----------------------------------------------------------------------------------------------//
			if($is_ok){
				//INSERT TO LOG ???
				//-----------------------------------------------------------------------------------------------//
				echo '
					<script>
						alert("Hapus Data Berhasil");
						window.location.href = "'.base_url('C_setting_structure_organization').'";
					</script>
				';
				exit();
			}else{
				echo '
					<script>
						alert("Hapus Data Gagal, Mohon Cek Kembali");
						window.location.href = "'.base_url('C_setting_structure_organization').'";
					</script>
				';
				exit();
			}
		}else{
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_structure_organization').'";
				</script>
			';
			exit();
		}
	}
}
