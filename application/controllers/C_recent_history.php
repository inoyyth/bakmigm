<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_recent_history extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Model_detail');
		if ($this->session->userdata('session_bgm_edocument_status') != "LOGIN") {
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
		$SESSION_DEPARTEMENT_ID = $this->session->userdata("session_bgm_edocument_departement_id");
		$SESSION_JOB_LEVEL_ID = $this->session->userdata("session_bgm_edocument_job_level_id");
		$data['detail'] = $this->Model_detail->GET_DETAIL_SERCH($SESSION_DEPARTEMENT_ID,$SESSION_JOB_LEVEL_ID);
		$this->load->view('V_menu', $data);
	}

}
