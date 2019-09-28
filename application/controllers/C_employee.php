<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use Sendinblue\Mailin;

class C_employee extends CI_Controller {
  function __construct() {
    parent::__construct();
    $this->load->model('M_employee');
  }
  function sync_employee() {
    $employee = $this->M_employee->getEmployee();
    $this->M_employee->updateEmployee($employee);
  }

  function sync_department() {
    $department = $this->M_employee->getDepartment();
    $this->M_employee->updateDepartment($department);
  }

  function sync_division() {
  $division = $this->M_employee->getDivision();
  $this->M_employee->updateDivision($division);
  }

  function sendReminder() {
    $rule =  $this->db->select('*')->from('tb_business_rule_new')->where('id', 1)->get()->row();
    $days = explode("|", $rule->days);
    if (in_array(date('D'), $days)) {
      if ($rule->rule_column === "DIPUBLIKASI") {
        $publish_story = 
        $documents = $this->db->select("*")
                    ->from('tb_document')
                    ->where('DOC_DATE >= NOW() - INTERVAL '.$rule->time_before.' DAY', NULL, FALSE) 
                    ->where('DOC_DATE <= NOW() + INTERVAL '.$rule->time_after.' DAY', NULL, FALSE)
                    ->where('DOC_STATUS', 'DIPUBLIKASI')
                    ->get()
                    ->result();
      } else {
        $documents = $this->db->select("*")
                    ->from('tb_document')
                    ->where('DOC_TGL_EXPIRED >= NOW() - INTERVAL '.$rule->time_before.' DAY', NULL, FALSE) 
                    ->where('DOC_TGL_EXPIRED <= NOW() + INTERVAL '.$rule->time_after.' DAY', NULL, FALSE)
                    ->where('DOC_STATUS', 'DIPUBLIKASI')
                    ->get()
                    ->result();
      }
      foreach($documents as $document) {
        $get_maker_department = $this->db->select('a.NIP,a.FULL_NAME,a.EMAIL,a.DEPCODE,b.DN_NAME')
                                ->from('tb_employee a')
                                ->join('tb_departemen b', 'a.DEPCODE=b.DN_ID', 'left')
                                ->where('a.NIP', $document->DOC_MAKER)
                                ->get()
                                ->row();

        $get_all_user_by_department = $this->db->select('NIP,FULL_NAME,EMAIL')
                                      ->from('tb_employee')
                                      ->where('DEPCODE', $get_maker_department->DEPCODE)
                                      ->get()
                                      ->result();
        $this->__sendEmail($get_maker_department,$get_all_user_by_department, $rule, $document);
      }
    }
  }

  private function __sendEmail($maker, $users, $rule, $document) {
    $set_user = [];
    foreach ($users as $user) {
      if ($user->EMAIL !== "") {
        $set_user[$user->EMAIL] = $user->FULL_NAME;
      }
    }
    // echo '<pre>' . var_export($set_user, true) . '</pre>';die;
    $mailin = new Mailin($this->config->item('email_edoc')['url'], $this->config->item('email_edoc')['api_key'], $this->config->item('email_edoc')['timeout']);
		$data_email = array( 
			"to" => $set_user,
			"cc" => $this->config->item('email_edoc')['cc'],
			"bcc" => $this->config->item('email_edoc')['bcc'],
			"from" => $this->config->item('email_edoc')['from'], //$this->config->item('email_edoc')['from'],
			"replyto" => $this->config->item('email_edoc')['replyto'],
			"subject" => 'Reminder Expired e-Document',
			"text" => $this->load->view('emails/reminder-text', ['maker' => $maker, 'rule' => $rule, 'document' => $document], TRUE),
			"html" => $this->load->view('emails/reminder-html', ['maker' => $maker, 'rule' => $rule, 'document' => $document], TRUE),
		);
		// var_dump($mailin->send_email($data_email));die;
		if($mailin->send_email($data_email)	){
      echo "testing from test \n";
    }
  }
  
}
