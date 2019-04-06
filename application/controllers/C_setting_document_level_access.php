<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_setting_document_level_access extends CI_Controller {
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
		$data['view'] = 'V_setting_document_level_access';
		$this->load->view('template', $data);
	}

	public function get_data_tipe()
	{
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_admin_setting->GET_TIPE_ALL_BY_ID($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}

	public function update()
	{
		$id = $this->input->post('nama');
		$rahasia = $this->input->post('rahasia');
		$lihat = $this->input->post('lihat');
		$download = $this->input->post('download');
		$la = $this->input->post('la');
		$duallistbox_pengguna_dokumen = $this->input->post('duallistbox_pengguna_dokumen');
		if (!empty($duallistbox_pengguna_dokumen)) {
			$duallistbox_pengguna_dokumen_length = count($duallistbox_pengguna_dokumen);
			if ($la == 'All') {
				$la = 'All';
			}else{
				$la = 'Selected';
			}
		}else{
			$la = 'All';
		}
		$duallistbox_pendistribusi_dokumen = $this->input->post('duallistbox_pendistribusi_dokumen');
		if (!empty($duallistbox_pendistribusi_dokumen)) {
			$duallistbox_pendistribusi_dokumen_length = count($duallistbox_pendistribusi_dokumen);
			$dist = 'Available';
		}else{
			$dist = 'None';
		}
		$download_dt = $download;
		if ($download == 'CRW') {
			$download = 'CRW|STAF|SCH|JNSPV|SNSPV|JNMGR|SNMGR|GMMGR|DIR';
		}elseif ($download == 'STAF') {
			$download = 'STAF|SCH|JNSPV|SNSPV|JNMGR|SNMGR|GMMGR|DIR';
		}elseif ($download == 'SCH') {
			$download = 'SCH|JNSPV|SNSPV|JNMGR|SNMGR|GMMGR|DIR';
		}elseif ($download == 'JNSPV') {
			$download = 'JNSPV|SNSPV|JNMGR|SNMGR|GMMGR|DIR';
		}elseif ($download == 'SNSPV') {
			$download = 'SNSPV|JNMGR|SNMGR|GMMGR|DIR';
		}elseif ($download == 'JNMGR') {
			$download = 'JNMGR|SNMGR|GMMGR|DIR';
		}elseif ($download == 'SNMGR') {
			$download = 'SNMGR|GMMGR|DIR';
		}elseif ($download == 'GMMGR') {
			$download = 'GMMGR|DIR';
		}elseif ($download == 'DIR') {
			$download = 'DIR';
		}else{
			$download = '';
		}

		$table = 'tb_document_structure_tipe';
		$kolom = 'DTSETE_ID';
		$data = array(
			'CL_ID' => $rahasia,
			'JBLL_ID' => $lihat,
			'DTSETE_DOWNLOAD' => $download_dt,
			'JBLL_DOWNLOAD' => $download,
			'DTSETE_ACCESS' => $la,
			'DTSETE_DISTRIBUTION' => $dist
		);
		$update = $this->M_admin_setting->update($table,$kolom,$id,$data);

		// Akses Dokumen
		$table_access = 'tb_document_structure_tipe_access';
		$kolom_access = 'TD_DN';
		if (empty($duallistbox_pengguna_dokumen)) {
			$update = $this->M_admin_setting->delete($table_access,$kolom,$id);
		}else{
			if ($la == "Selected") {
				for ($h=0; $h < $duallistbox_pengguna_dokumen_length; $h++) {
					$update = $this->M_admin_setting->delete($table_access,$kolom,$id);
				}
				for ($i=0; $i < $duallistbox_pengguna_dokumen_length; $i++) {
					$kode_acces = md5(rand(date('ymdHis'), TRUE)); 
					$data_access = array(
						'TD_ID' => $kode_acces,
						'DTSETE_ID' => $id,
						'TD_DN' => $duallistbox_pengguna_dokumen[$i]
					);
					$update = $this->db->insert($table_access, $data_access);
				}
			}else{
				$update = $this->M_admin_setting->delete($table_access,$kolom,$id);
			}
		}

		// Distribusi
		$table_distribusi = 'tb_document_structure_tipe_distribution';
		$kolom_distribusi = 'TDD_DN';
		if (empty($duallistbox_pendistribusi_dokumen)) {
			$update = $this->M_admin_setting->delete($table_distribusi,$kolom,$id);
		}else{
			for ($j=0; $j < $duallistbox_pendistribusi_dokumen_length; $j++) {
				$update = $this->M_admin_setting->delete($table_distribusi,$kolom,$id);
			}
			for ($k=0; $k < $duallistbox_pendistribusi_dokumen_length; $k++) { 
				$kode_distribusi = md5(rand(date('ymdHis'), TRUE));
				$data_distribusi = array(
					'TDD_ID' => $kode_distribusi,
					'DTSETE_ID' => $id,
					'TDD_DN' => $duallistbox_pendistribusi_dokumen[$k]
				);
				$update = $this->db->insert($table_distribusi, $data_distribusi);
			}
		}
		if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_setting_document_level_access'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_document_level_access'),'refresh');
		}
	}
}