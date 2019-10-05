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
		$data['document_activity'] = $this->db->select("*")->from('tb_document_activity_notification')->get()->result();
		$data['rule'] = $this->db->select('*')->from('tb_business_rule_new')->where('id', 1)->get()->row();
		$data['view'] = 'V_setting_business_rule';
		$this->load->view('template', $data);
	}

	public function store() {
		$data = [
			'rule_name' => $this->input->post('rule_name'),
			'rule_column' => $this->input->post('rule_column'),
			'time_before' => implode('|',$this->input->post('time_before')),
			'time_after' => implode('|',$this->input->post('time_after')),
			'days' => '',
			'efektif_date' => date("Y-m-d", strtotime($this->input->post('efektif_date')) )
		];

		$inset = $this->db->update('tb_business_rule_new', $data, ['id'=>1]);
		
		return redirect('C_setting_business_rule');
	}

	function getRoleActivity() {
		$id=$this->input->get('id');
		$data = $this->db->select('*')
				->from('tb_document_activity_notification')
				->where('id', $id)
				->get()
				->row();
		echo json_encode($data, true);
	}

	function store_activity() {
		$id=$this->input->post('id');
		$waiting_activity = $this->input->post('waiting_activity') ? $this->input->post('waiting_activity') : 0;
		$renewal_activity = $this->input->post('renewal_activity') ? $this->input->post('renewal_activity') : 0;
		$publish_activity = $this->input->post('publish_activity') ? $this->input->post('publish_activity') : 0;
		$expired_activity = $this->input->post('expired_activity') ? $this->input->post('expired_activity') : 0;
		$archive_activity = $this->input->post('archive_activity') ? $this->input->post('archive_activity') : 0;

		$data = [
			'waiting_activity' => $waiting_activity,
			'renewal_activity' => $renewal_activity,
			'publish_activity' => $publish_activity,
			'expired_activity' => $expired_activity,
			'archive_activity' => $archive_activity
		];

		$this->db->update('tb_document_activity_notification', $data, ['id' => $id]);
		return redirect('C_setting_business_rule');
	}
}
