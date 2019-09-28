<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class C_setting_business_rule extends CI_Controller {
	public function __construct(){
        parent::__construct();
		
		if($this->session->userdata('session_bgm_edocument_status') != "LOGIN"){
			redirect(base_url("C_index"));
		}
	
	}
	
	public function index(){
		$data['rule'] = $this->db->select('*')->from('tb_business_rule_new')->where('id', 1)->get()->row();
		$data['view'] = 'V_setting_business_rule';
		$this->load->view('template', $data);
	}

	public function store() {
		$data = [
			'rule_name' => $this->input->post('rule_name'),
			'rule_column' => $this->input->post('rule_column'),
			'time_before' => $this->input->post('time_before'),
			'time_after' => $this->input->post('time_after'),
			'days' => implode('|',$this->input->post('days')),
			'efektif_date' => date("Y-m-d", strtotime($this->input->post('efektif_date')) )
		];

		$inset = $this->db->update('tb_business_rule_new', $data, ['id'=>1]);
		
		return redirect('C_setting_business_rule');
	}
}
