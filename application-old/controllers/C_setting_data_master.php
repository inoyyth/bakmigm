<?php
//-----------------------------------------------------------------------------------------------//
defined('BASEPATH') OR exit('No direct script access allowed');
//-----------------------------------------------------------------------------------------------//
class C_setting_data_master extends CI_Controller {
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function __construct(){
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
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function index()
	{
		$this->load->view('V_setting_data_master');
	}
	public function group_proses()
	{
		$this->load->view('data_master/V_group_proses');
	}
	public function proses()
	{
		$this->load->view('data_master/V_proses');
	}
	public function wujud_dokumen()
	{
		$this->load->view('data_master/V_wujud_dokumen');
	}
	public function metode_distribusi()
	{
		$this->load->view('data_master/V_metode_distribusi');
	}
	public function kerahasiaan()
	{
		$this->load->view('data_master/V_standar_kerahasiaan');
	}
	public function priode_review()
	{
		$this->load->view('data_master/V_priode_review');
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function insert(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}
		$tipe = $this->input->post('tipe');
		$id = $this->input->post('id');
		$nama = $this->input->post('nama');
		if ($tipe == 'Group Proses (5M)') {
			$data = array(
				'GROUP_ID' => $id,
				'GROUP_NAME' => $nama
			);
			$is_ok = $this->db->insert('m_group', $data);
		}elseif ($tipe == 'Proses') {
			$data = array(
				'PROSES_ID' => $id,
				'PROSES_NAME' => $nama
			);
			$is_ok = $this->db->insert('m_proses', $data);
		}elseif ($tipe == 'Metode Distribusi') {
			$data = array(
				'DNMD_ID' => $id,
				'DNMD_NAME' => $nama
			);
			$is_ok = $this->db->insert('tb_distribution_method', $data);
		}elseif ($tipe == 'Standard Kerahasiaan') {
			$data = array(
				'CL_ID' => $id,
				'CL_NAME' => $nama
			);
			$is_ok = $this->db->insert('tb_confidential', $data);
		}elseif ($tipe == 'Periode Review') {
			$data = array(
				'PEPW_ID' => $nama
			);
			$is_ok = $this->db->insert('tb_periode_preview', $data);
		}else{
			$data = array(
				'DTFM_ID' => $id,
				'DTFM_NAME' => $nama
			);
			$is_ok = $this->db->insert('tb_document_form', $data);
		}
		if($is_ok){
			//INSERT TO LOG ???
			//-----------------------------------------------------------------------------------------------//
			echo '
				<script>
					alert("Penambahan Data Berhasil");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Penambahan Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}
	}
	public function update(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}
		$tipe = $this->input->post('tipe');
		$id = $this->input->post('id');
		$nama = $this->input->post('nama');
		if ($tipe == 'Group Proses (5M)') {
			$data = array(
				'GROUP_NAME' => $nama
			);
			$is_ok = $this->db->update('m_group', $data, array('GROUP_ID' => $id));
		}elseif ($tipe == 'Proses') {
			$data = array(
				'PROSES_NAME' => $nama
			);
			$is_ok = $this->db->update('m_proses', $data, array('PROSES_ID' => $id));
		}elseif ($tipe == 'Metode Distribusi') {
			$data = array(
				'DNMD_NAME' => $nama
			);
			$is_ok = $this->db->update('tb_distribution_method', $data, array('DNMD_ID' => $id));
		}elseif ($tipe == 'Standard Kerahasiaan') {
			$data = array(
				'CL_NAME' => $nama
			);
			$is_ok = $this->db->update('tb_confidential', $data, array('CL_ID' => $id));
		}elseif ($tipe == 'Periode Review') {
			$data = array(
				'PEPW_ID' => $nama
			);
			$is_ok = $this->db->update('tb_periode_preview', $data, array());
		}else{
			$data = array(
				'DTFM_NAME' => $nama
			);
			$is_ok = $this->db->update('tb_document_form', $data, array('DTFM_ID' => $id));
		}
		if($is_ok){
			echo '
				<script>
					alert("Perubahan Data Berhasil");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Perubahan Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}
	}
	public function delete($tipe,$id)
	{
		if ($tipe == 'GP') {
			$is_ok = $this->db->delete('m_group', array('GROUP_ID' => $id));
		}elseif ($tipe == 'Proses') {
			$is_ok = $this->db->delete('m_proses', array('PROSES_ID' => $id));
		}elseif ($tipe == 'MD') {
			$is_ok = $this->db->delete('tb_distribution_method', array('DNMD_ID' => $id));
		}elseif ($tipe == 'SK') {
			$is_ok = $this->db->delete('tb_confidential', array('CL_ID' => $id));
		}elseif ($tipe == 'PR') {
			$is_ok = $this->db->delete('tb_periode_preview', array('PEPW_ID' => $id));
		}else{
			$is_ok = $this->db->delete('tb_document_form', array('DTFM_ID' => $id));
		}
		if($is_ok){
			echo '
				<script>
					alert("Hapus Data Berhasil");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Hapus Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function tool_table(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$si_tool_table_key = $this->input->post('si_tool_table_key');
		$si_tool_table_key = $si_tool_table_key[0];
		//-----------------------------------------------------------------------------------------------//
		if(isset($_POST['btn_delete'])){
			$is_ok = $this->M_library_database->DB_DELETE_DATA_MASTER($si_tool_table_key);
			//-----------------------------------------------------------------------------------------------//
			if($is_ok){
				//INSERT TO LOG ???
				//-----------------------------------------------------------------------------------------------//
				echo '
					<script>
						alert("Hapus Data Berhasil");
						window.location.href = "'.base_url('C_setting_data_master').'";
					</script>
				';
				exit();
			}else{
				echo '
					<script>
						alert("Hapus Data Gagal, Mohon Cek Kembali");
						window.location.href = "'.base_url('C_setting_data_master').'";
					</script>
				';
				exit();
			}
		}else{
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_setting_data_master').'";
				</script>
			';
			exit();
		}
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
}
//-----------------------------------------------------------------------------------------------//
