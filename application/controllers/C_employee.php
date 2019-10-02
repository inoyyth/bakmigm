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
                    ->or_where('DOC_STATUS', 'KADALUARSA')
                    ->get()
                    ->result();
      } else {
        $documents = $this->db->select("*")
                    ->from('tb_document')
                    ->where('DOC_TGL_EXPIRED >= NOW() - INTERVAL '.$rule->time_before.' DAY', NULL, FALSE) 
                    ->where('DOC_TGL_EXPIRED <= NOW() + INTERVAL '.$rule->time_after.' DAY', NULL, FALSE)
                    ->where('DOC_STATUS', 'DIPUBLIKASI')
                    ->or_where('DOC_STATUS', 'KADALUARSA')
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

        $get_all_user_by_department = $this->db->select('a.NIP,a.FULL_NAME,a.EMAIL')
																			->from('tb_employee a')
																			->join('tb_employee_detail b', 'a.NIP=b.NIP')
																			->where('a.DEPCODE', $get_maker_department->DEPCODE)
																			->where('b.ROLES', 'PENCIPTA')
																			->or_where('b.ROLES_2', 'PENCIPTA')
																			->or_where('b.ROLES_3', 'PENCIPTA')
																			->or_where('b.ROLES_4', 'PENCIPTA')
																			->or_where('b.ROLES_5', 'PENCIPTA')
                                      ->get()
																			->result();

        $this->__sendEmail($get_maker_department,$get_all_user_by_department, $rule, $document);
      }
    }
  }

  function setDocumentAsObsolete() {
    $documents = $this->db
                ->select('DOC_ID')
                ->from('tb_document')
                ->where('DOC_TGL_EXPIRED <', date('Y-m-d'))
                ->where('DOC_STATUS', 'DIPUBLIKASI')
                ->get()
                ->result();

    foreach($documents as $document) {
      $this->db->update('tb_document',
        [
          'DOC_STATUS' => "KADALUARSA",
          'DOC_STATUS_ACTIVITY' => "KADALUARSA"
        ],
        ['DOC_ID' => $document->DOC_ID]
      );
      $this->db->delete('tb_notification_history', ['id' => $document->DOC_ID]);
      $this->Email_notification($document->DOC_ID);
    }
  }

  public function Email_notification($doc_id) {
		$document = $this->db->
								select('DOC_NOMOR,DOC_NAMA,DOC_AKSES_LEVEL,DOC_PENGGUNA,DOC_MAKER,DOC_STATUS_ACTIVITY,DOC_DATE,DOC_PENDISTRIBUSI')
								->from('tb_document')
								->where('DOC_ID', $doc_id)
								->get()
								->row();
		$level = explode("|", $document->DOC_AKSES_LEVEL);
		$maker = $this->db
						 ->select('NIP,USER_NAME,FULL_NAME,EMAIL,DEPCODE,JOBLVL')
						 ->from('tb_employee')
						 ->where('NIP', $document->DOC_MAKER)
						 ->get()
						 ->row();
		//PENGGUNA
		$role_pengguna = $this->db
										 ->select('expired_activity')
										 ->from('tb_document_activity_notification')
										 ->where('role', 'PENGGUNA')
										 ->get()
										 ->row();
		if ($role_pengguna->expired_activity === "1") {
			$user_pengguna = explode("|", $document->DOC_PENGGUNA);
			$user_pengguna = $this->db
											 ->select('FULL_NAME,EMAIL')
											 ->from('tb_employee')
											 ->where_in('DEPCODE', $user_pengguna)
											 ->get()
											 ->result();
			$pengguna_emails = [];
			foreach ($user_pengguna as  $pengguna) {
				if ($pengguna->EMAIL !== "") {
					$pengguna_emails[$pengguna->EMAIL] = $pengguna->FULL_NAME;
				}
			}
			$this->__sendEmailObsolete($document, $maker, $pengguna_emails, 'pengguna');
		}

		//Pendistribusi
		$role_pendistribusi = $this->db
										 ->select('expired_activity')
										 ->from('tb_document_activity_notification')
										 ->where('role', 'PENDISTRIBUSI')
										 ->get()
										 ->row();

		if ($role_pendistribusi->expired_activity === "1") {
			$user_pendistribusi = $this->db
											 ->select('FULL_NAME,EMAIL')
											 ->from('tb_employee')
											 ->where('DEPCODE', $document->DOC_PENDISTRIBUSI)
											 ->get()
											 ->result();
			$pendistribusi_emails = [];
			foreach ($user_pendistribusi as  $pendistribusi) {
				if ($pendistribusi->EMAIL !== "") {
					$pendistribusi_emails[$pendistribusi->EMAIL] = $pendistribusi->FULL_NAME;
				}
			}
			$this->__sendEmailObsolete($document, $maker, $pendistribusi_emails, 'pendistribusi');
		}

		//Atasan Pencipta
		$role_atasan = $this->db
										 ->select('expired_activity')
										 ->from('tb_document_activity_notification')
										 ->where('role', 'ATASAN PENCIPTA')
										 ->get()
										 ->row();

		if ($role_atasan->expired_activity === "1") {
			$maker_level_index = $this->db->select('*')->from('tb_job_level')->where('JBLL_ID', $maker->JOBLVL)->get()->row();
			$up_level_maker = $this->db->select('JBLL_ID')->from('tb_job_level')->where('JBLL_INDEX <', $maker_level_index->JBLL_INDEX)->get()->result_array();
			$user_atasan = $this->db
											 ->select('FULL_NAME,EMAIL')
											 ->from('tb_employee')
											 ->where_in('JOBLVL', array_column($up_level_maker, 'JBLL_ID'))
											 ->where('DEPCODE', $maker->DEPCODE)
											 ->get()
											 ->result();

			$atasan_emails = [];
			foreach ($user_atasan as  $atasan) {
				if ($atasan->EMAIL !== "") {
					$atasan_emails[$atasan->EMAIL] = $atasan->FULL_NAME;
				}
			}
			$this->__sendEmailObsolete($document, $maker, $atasan_emails, 'atasan');
		}

		//Pencipta
		$role_pencipta = $this->db
										 ->select('expired_activity')
										 ->from('tb_document_activity_notification')
										 ->where('role', 'PENCIPTA')
										 ->get()
										 ->row();

		if ($role_pencipta->expired_activity === "1") {
			$user_pencipta = $this->db
											 ->select('FULL_NAME,EMAIL')
											 ->from('tb_employee')
											 ->where('NIP', $document->DOC_MAKER)
											 ->get()
											 ->result();

			$pencipta_emails = [];
			foreach ($user_pencipta as  $pencipta) {
				if ($pencipta->EMAIL !== "") {
					$pencipta_emails[$pencipta->EMAIL] = $pencipta->FULL_NAME;
				}
			}
			$this->__sendEmailObsolete($document, $maker, $pencipta_emails, 'pencipta');
		}
	}

	private function __sendEmailObsolete($document, $maker, $users, $role) {
		// echo '<pre>' . var_export(array_chunk($users, 50, true), true) . '</pre>';die;
		$chunk_user = array_chunk($users, 50, true);
		foreach ($chunk_user as $user) {
			$mailin = new Mailin($this->config->item('email_edoc')['url'], $this->config->item('email_edoc')['api_key'], $this->config->item('email_edoc')['timeout']);
			$data_email = array( 
				"to" => $user,
				"cc" => $this->config->item('email_edoc')['cc'],
				"bcc" => $this->config->item('email_edoc')['bcc'],
				"from" => $this->config->item('email_edoc')['from'], //$this->config->item('email_edoc')['from'],
				"replyto" => $this->config->item('email_edoc')['replyto'],
				"subject" => "Document Activity Notification (".$role.")",
				"text" => $this->load->view('emails/document-activity-text', ['document' => $document, 'maker' => $maker], TRUE),
				"html" => $this->load->view('emails/document-activity-html', ['document' => $document, 'maker' => $maker], TRUE),
			);
			// var_dump($mailin->send_email($data_email));die;
			$send = $mailin->send_email($data_email);
			if ($send['code'] === "success") {
				return true;
			} else {
				die($send);
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
