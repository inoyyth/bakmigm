<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_setting_structure_document extends CI_Controller {
	
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
		$this->load->view('V_setting_structure_document');
	}

	public function na()
	{
		$this->load->view('V_setting_structure_document_na');
	}

	public function insert_kategori()
	{
		$kode = $this->input->post('kode');
		$nama = $this->input->post('nama');
		$data = array(
			'DTSEKI_ID' => $kode,
			'DTSEKI_KATEGORI' => $nama
		);
		// print_r($data);die();
		$insert = $this->db->insert('tb_document_structure_kategori', $data);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}
	}

	public function insert_jenis()
	{
		$kode = $this->input->post('kode');
		$parent = $this->input->post('parent');
		$nama = $this->input->post('nama');
		$data = array(
			'DTSEJS_ID' => $kode,
			'DTSEKI_ID' => $parent,
			'DTSEJS_JENIS' => $nama
		);
		// print_r($data);die();
		$insert = $this->db->insert('tb_document_structure_jenis', $data);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}
	}

	public function insert_tipe()
	{
		$kode = $this->input->post('kode');
		$parent = $this->input->post('parent');
		$nama = $this->input->post('nama');
		$singkatan = $this->input->post('singkatan');
		$active = $this->input->post('active');
		$watermark = $this->input->post('watermark');
		if (isset($active)) {
			$active = 1;
		}else{
			$active = 0;
		}
		$get_parent = $this->M_admin_setting->GET_PARENT_JENIS($parent);
		foreach ($get_parent as $get_parent) {
			$parent2 = $get_parent->DTSEKI_ID;
		}
		$data = array(
			'DTSETE_ID' => $kode,
			'DTSEJS_ID' => $parent,
			'DTSEKI_ID' => $parent2,
			'DTSETE_TIPE' => $nama,
			'DTSETE_SINGKATAN' => $singkatan,
			'DTSETE_ACTIVE' => $active,
			'WATERMARK' => $watermark
		);
		// print_r($data);die();
		$insert = $this->db->insert('tb_document_structure_tipe', $data);
		if($insert){
			$this->session->set_flashdata('pesan','Penambahan data Berhasil');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}
	}

	public function edit_kategori()
	{
		$kode = $this->input->post('kode');
		$nama = $this->input->post('nama');
		$data = array(
			'DTSEKI_KATEGORI' => $nama
		);
		$table = 'tb_document_structure_kategori';
		$kolom = 'DTSEKI_ID';
		$update = $this->M_admin_setting->update($table,$kolom,$kode,$data);
		if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}
	}

	public function edit_jenis()
	{
		$kode = $this->input->post('kode');
		$parent = $this->input->post('parent');
		$nama = $this->input->post('nama');
		$data = array(
			'DTSEKI_ID' => $parent,
			'DTSEJS_JENIS' => $nama
		);
		$table = 'tb_document_structure_jenis';
		$kolom = 'DTSEJS_ID';
		$update = $this->M_admin_setting->update($table,$kolom,$kode,$data);
		if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}
	}

	public function edit_tipe()
	{
		$kode = $this->input->post('kode');
		$parent = $this->input->post('parent');
		$nama = $this->input->post('nama');
		$singkatan = $this->input->post('singkatan');
		$active = $this->input->post('active');
		$watermark = $this->input->post('watermark');
		if (isset($active)) {
			$active = 1;
		}else{
			$active = 0;
		}
		$get_parent = $this->M_admin_setting->GET_PARENT_JENIS($parent);
		foreach ($get_parent as $get_parent) {
			$parent2 = $get_parent->DTSEKI_ID;
		}
		$data = array(
			'DTSEJS_ID' => $parent,
			'DTSEKI_ID' => $parent2,
			'DTSETE_TIPE' => $nama,
			'DTSETE_SINGKATAN' => $singkatan,
			'DTSETE_ACTIVE' => $active,
			'WATERMARK' => $watermark
		);
		$table = 'tb_document_structure_tipe';
		$kolom = 'DTSETE_ID';
		$update = $this->M_admin_setting->update($table,$kolom,$kode,$data);
		if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}
	}

	public function disable($id)
	{
		$data = array(
			'DTSETE_ACTIVE' => 0,
		);
		$disable = $this->M_admin_setting->DISABLE_TIPE($id,$data);
		if($disable){
			$this->session->set_flashdata('pesan','Tipe berhasil di Disable');
			redirect(base_url('C_setting_structure_document/na'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Tipe Gagal di Disable, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document/na'),'refresh');
		}
	}

	public function enable($id)
	{
		$data = array(
			'DTSETE_ACTIVE' => 1,
		);
		$enable = $this->M_admin_setting->DISABLE_TIPE($id,$data);
		if($enable){
			$this->session->set_flashdata('pesan','Tipe berhasil di Enable');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Tipe Gagal di Enable, Mohon cek kembali!');
			redirect(base_url('C_setting_structure_document'),'refresh');
		}
	}

	public function edit($id)
	{
		$data['data'] = $id;
		$this->load->view('V_setting_structure_document_edit', $data);
	}
}