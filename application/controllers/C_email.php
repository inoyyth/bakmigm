<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_email extends CI_Controller {

	public function Email_news()
	{
		include (APPPATH.'libraries/session_user.php');
		$config = [
			'useragent' => 'CodeIgniter',
			'protocol'  => 'smtp',
			'mailpath'  => '/usr/sbin/sendmail',
			'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_user' => 'akuntest437@gmail.com',
			'smtp_pass' => 'akuntest123',
			'smtp_port' => 465,
			'smtp_keepalive' => TRUE,
			'smtp_crypto' => 'SSL',
			'wordwrap'  => TRUE,
			'wrapchars' => 80,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'validate'  => TRUE,
			'crlf'      => "\r\n",
			'newline'   => "\r\n",
		];
		$this->load->library('email', $config);

		$get_content = $this->db->get_where('m_format', array('nama' => 'News'))->result_array();
		if (empty($get_content)) {
			
		}else{
			foreach ($get_content as $key => $value) {
				$no = $value['nomor'];
				$subject = $value['subject'];
				$body = $value['isi'];
			}
		}
		$get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE));
		if (empty($get_tipe)) {
			
		}else{
			foreach ($get_tipe as $key => $value) {
				$singkatan = $value['DTSETE_SINGKATAN'];
			}
		}
		$get_nomor = $this->db->get_where('m_nomor', array('Code' => $no))->result_array();
		if (empty($get_nomor)) {

		}else{
			foreach ($get_nomor as $key => $value) {
				$field_1 = $value['field_1'];
				$field_2 = $value['field_2'];
				$field_3 = $value['field_3'];
				$field_4 = $value['field_4'];
				$field_5 = $value['field_5'];
			}
			if ($field_1 == 'Table') {
				$field_1 = $singkatan;
			}elseif ($field_1 == 'Year') {
				$field_1 = date('Y');
			}elseif ($field_1 == 'Month') {
				$field_1 = date('m');
			}elseif ($field_1 == 'Delimeter') {
				$field_1 = '/';
			}elseif ($field_1 == 'Free Text') {
				$field_1 = 'Free Text';
			}else{
				$field_1 = '';
			}

			if ($field_2 == 'Table') {
				$field_2 = $singkatan;
			}elseif ($field_2 == 'Year') {
				$field_2 = date('Y');
			}elseif ($field_2 == 'Month') {
				$field_2 = date('m');
			}elseif ($field_2 == 'Delimeter') {
				$field_2 = '/';
			}elseif ($field_2 == 'Free Text') {
				$field_2 = 'Free Text';
			}else{
				$field_2 = '';
			}

			if ($field_3 == 'Table') {
				$field_3 = $singkatan;
			}elseif ($field_3 == 'Year') {
				$field_3 = date('Y');
			}elseif ($field_3 == 'Month') {
				$field_3 = date('m');
			}elseif ($field_3 == 'Delimeter') {
				$field_3 = '/';
			}elseif ($field_3 == 'Free Text') {
				$field_3 = 'Free Text';
			}else{
				$field_3 = '';
			}

			if ($field_4 == 'Table') {
				$field_4 = $singkatan;
			}elseif ($field_4 == 'Year') {
				$field_4 = date('Y');
			}elseif ($field_4 == 'Month') {
				$field_4 = date('m');
			}elseif ($field_4 == 'Delimeter') {
				$field_4 = '/';
			}elseif ($field_4 == 'Free Text') {
				$field_4 = 'Free Text';
			}else{
				$field_4 = '';
			}

			if ($field_5 == 'Table') {
				$field_5 = $singkatan;
			}elseif ($field_5 == 'Year') {
				$field_5 = date('Y');
			}elseif ($field_5 == 'Month') {
				$field_5 = date('m');
			}elseif ($field_5 == 'Delimeter') {
				$field_5 = '/';
			}elseif ($field_5 == 'Free Text') {
				$field_5 = 'Free Text';
			}else{
				$field_5 = '';
			}

			$nomor = $field_1.$field_2.$field_3.$field_4.$field_5;
		}
		$get_pencipta = $this->db->get_where('tb_employee', array('NIP' => $DOC_MAKER))->result_array();
		if (empty($get_pencipta)) {
			
		}else{
			foreach ($get_pencipta as $key => $value) {
				$name = $value['FULL_NAME'];
				$email_pencipta = $value['EMAIL']; 
			}
		}
		$get_user = 
		$this->db->select('*')
			->from('tb_document_news')
			->join('tb_employee', 'tb_document_news.NIP = tb_employee.NIP', 'left')
			->join('tb_document', 'tb_document_news.DOC_ID = tb_document.DOC_ID', 'left')
			->where(array('tb_document_news.DOC_ID' => $DOC_ID))
			->get()->result_array();
		if (empty($get_user)) {
			
		}else{
			foreach ($get_user as $key => $value) {
				$email[] = $value['EMAIL']; 
			}
		}

		$url = base_url('document-details-'.$DOC_ID);
		// Hari, Tanggal, Bulan, Tahun, Jam
		$day = date('D');
		$dayList = array(
			'Sun' => 'Minggu',
			'Mon' => 'Senin',
			'Tue' => 'Selasa',
			'Wed' => 'Rabu',
			'Thu' => 'Kamis',
			'Fri' => 'Jumat',
			'Sat' => 'Sabtu'
		);
		$hari = $dayList[$day];
		$tanggal = date('d/M/Y');
		$bulan = date('M');
		$tahun = date('Y');
		$jam = date('H:i')." WIB";
		// Proses Replace & Subject
		$find = array("/{NomorDok}/","/{NamaDok}/","/{Url}/","/{AdminNo}/","/{AdminName}/","/{Hari}/","/{Tanggal}/","/{Jam}/","/{EmpNo}/","/{EmpName}/");
		$replace = array($nomor,$DOC_NAMA,$url,$AdminNo,$AdminName,$hari,$tanggal,$jam,$DOC_MAKER,$name);
		$subject = preg_replace($find, $replace, $subject);
		$body = preg_replace($find, $replace, $body);

		$this->email->from($email_pencipta, $name);
		$this->email->to($email);
		$this->email->subject($subject);
		$this->email->message($body);
		$this->email->send();
	}

	public function Email_notification()
	{
		include (APPPATH.'libraries/session_user.php');
		$config = [
			'useragent' => 'CodeIgniter',
			'protocol'  => 'smtp',
			'mailpath'  => '/usr/sbin/sendmail',
			'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_user' => 'akuntest437@gmail.com',
			'smtp_pass' => 'akuntest123',
			'smtp_port' => 465,
			'smtp_keepalive' => TRUE,
			'smtp_crypto' => 'SSL',
			'wordwrap'  => TRUE,
			'wrapchars' => 80,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'validate'  => TRUE,
			'crlf'      => "\r\n",
			'newline'   => "\r\n",
		];
		$this->load->library('email', $config);

		$get_data = $this->M_contribution->DB_GET_DOC_BY_ID($si_key);
		foreach ($get_data as $g => $data) {
			$DOC_ID = $data->DOC_ID;
			$DOC_NAMA = $data->DOC_NAMA;
			$DOC_TIPE = $data->DOC_TIPE;
			$DOC_MAKER = $data->DOC_MAKER;
			$DOC_APPROVE = $data->DOC_APPROVE;
		}

		$get_content = $this->db->get_where('m_format', array('nama' => 'Notification'))->result_array();
		if (empty($get_content)) {
			
		}else{
			foreach ($get_content as $key => $value) {
				$no = $value['nomor'];
				$subject = $value['subject'];
				$body = $value['isi'];
			}
		}
		$get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE));
		if (empty($get_tipe)) {
			
		}else{
			foreach ($get_tipe as $key => $value) {
				$singkatan = $value['DTSETE_SINGKATAN'];
			}
		}
		$get_nomor = $this->db->get_where('m_nomor', array('Code' => $no))->result_array();
		if (empty($get_nomor)) {

		}else{
			foreach ($get_nomor as $key => $value) {
				$field_1 = $value['field_1'];
				$field_2 = $value['field_2'];
				$field_3 = $value['field_3'];
				$field_4 = $value['field_4'];
				$field_5 = $value['field_5'];
			}
			if ($field_1 == 'Table') {
				$field_1 = $singkatan;
			}elseif ($field_1 == 'Year') {
				$field_1 = date('Y');
			}elseif ($field_1 == 'Month') {
				$field_1 = date('m');
			}elseif ($field_1 == 'Delimeter') {
				$field_1 = '/';
			}elseif ($field_1 == 'Free Text') {
				$field_1 = 'Free Text';
			}else{
				$field_1 = '';
			}

			if ($field_2 == 'Table') {
				$field_2 = $singkatan;
			}elseif ($field_2 == 'Year') {
				$field_2 = date('Y');
			}elseif ($field_2 == 'Month') {
				$field_2 = date('m');
			}elseif ($field_2 == 'Delimeter') {
				$field_2 = '/';
			}elseif ($field_2 == 'Free Text') {
				$field_2 = 'Free Text';
			}else{
				$field_2 = '';
			}

			if ($field_3 == 'Table') {
				$field_3 = $singkatan;
			}elseif ($field_3 == 'Year') {
				$field_3 = date('Y');
			}elseif ($field_3 == 'Month') {
				$field_3 = date('m');
			}elseif ($field_3 == 'Delimeter') {
				$field_3 = '/';
			}elseif ($field_3 == 'Free Text') {
				$field_3 = 'Free Text';
			}else{
				$field_3 = '';
			}

			if ($field_4 == 'Table') {
				$field_4 = $singkatan;
			}elseif ($field_4 == 'Year') {
				$field_4 = date('Y');
			}elseif ($field_4 == 'Month') {
				$field_4 = date('m');
			}elseif ($field_4 == 'Delimeter') {
				$field_4 = '/';
			}elseif ($field_4 == 'Free Text') {
				$field_4 = 'Free Text';
			}else{
				$field_4 = '';
			}

			if ($field_5 == 'Table') {
				$field_5 = $singkatan;
			}elseif ($field_5 == 'Year') {
				$field_5 = date('Y');
			}elseif ($field_5 == 'Month') {
				$field_5 = date('m');
			}elseif ($field_5 == 'Delimeter') {
				$field_5 = '/';
			}elseif ($field_5 == 'Free Text') {
				$field_5 = 'Free Text';
			}else{
				$field_5 = '';
			}

			$nomor = $field_1.$field_2.$field_3.$field_4.$field_5;
		}
		$get_pencipta = $this->db->get_where('tb_employee', array('NIP' => $DOC_MAKER))->result_array();
		if (empty($get_pencipta)) {
			
		}else{
			foreach ($get_pencipta as $key => $value) {
				$name = $value['FULL_NAME'];
				$email_pencipta = $value['EMAIL']; 
			}
		}
		$get_user = 
		$this->db->select('*')
			->from('tb_document_notification')
			->join('tb_employee', 'tb_document_notification.NIP = tb_employee.NIP', 'left')
			->join('tb_document', 'tb_document_notification.DOC_ID = tb_document.DOC_ID', 'left')
			->where(array('tb_document_notification.DOC_ID' => $DOC_ID))
			->get()->result_array();
		if (empty($get_user)) {
			
		}else{
			foreach ($get_user as $key => $value) {
				$email[] = $value['EMAIL']; 
			}
		}

		$url = base_url();
		// Hari, Tanggal, Bulan, Tahun, Jam
		$day = date('D');
		$dayList = array(
			'Sun' => 'Minggu',
			'Mon' => 'Senin',
			'Tue' => 'Selasa',
			'Wed' => 'Rabu',
			'Thu' => 'Kamis',
			'Fri' => 'Jumat',
			'Sat' => 'Sabtu'
		);
		$hari = $dayList[$day];
		$tanggal = date('d/M/Y');
		$bulan = date('M');
		$tahun = date('Y');
		$jam = date('H:i')." WIB";
		// Proses Replace & Subject
		$find = array("/{NomorDok}/","/{NamaDok}/","/{Url}/","/{AdminNo}/","/{AdminName}/","/{Hari}/","/{Tanggal}/","/{Jam}/","/{EmpNo}/","/{EmpName}/");
		$replace = array($nomor,$DOC_NAMA,$url,$AdminNo,$AdminName,$hari,$tanggal,$jam,$DOC_MAKER,$name);
		$subject = preg_replace($find, $replace, $subject);
		$body = preg_replace($find, $replace, $body);

		$this->email->from($email_pencipta, $name);
		$this->email->to($email);
		$this->email->subject($subject);
		$this->email->message($body);
		$this->email->send();
	}

	public function Email_receipt()
	{
		include (APPPATH.'libraries/session_user.php');
		$config = [
			'useragent' => 'CodeIgniter',
			'protocol'  => 'smtp',
			'mailpath'  => '/usr/sbin/sendmail',
			'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_user' => 'akuntest437@gmail.com',
			'smtp_pass' => 'akuntest123',
			'smtp_port' => 465,
			'smtp_keepalive' => TRUE,
			'smtp_crypto' => 'SSL',
			'wordwrap'  => TRUE,
			'wrapchars' => 80,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'validate'  => TRUE,
			'crlf'      => "\r\n",
			'newline'   => "\r\n",
		];
		$this->load->library('email', $config);

		$get_data = $this->M_contribution->DB_GET_DOC_BY_ID($si_key);
		foreach ($get_data as $g => $data) {
			$DOC_ID = $data->DOC_ID;
			$DOC_NAMA = $data->DOC_NAMA;
			$DOC_TIPE = $data->DOC_TIPE;
			$DOC_MAKER = $data->DOC_MAKER;
			$DOC_APPROVE = $data->DOC_APPROVE;
		}

		$get_content = $this->db->get_where('m_format', array('nama' => 'Receipt'))->result_array();
		if (empty($get_content)) {
			
		}else{
			foreach ($get_content as $key => $value) {
				$no = $value['nomor'];
				$subject = $value['subject'];
				$body = $value['isi'];
			}
		}
		$get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE));
		if (empty($get_tipe)) {
			
		}else{
			foreach ($get_tipe as $key => $value) {
				$singkatan = $value['DTSETE_SINGKATAN'];
			}
		}
		$get_nomor = $this->db->get_where('m_nomor', array('Code' => $no))->result_array();
		if (empty($get_nomor)) {

		}else{
			foreach ($get_nomor as $key => $value) {
				$field_1 = $value['field_1'];
				$field_2 = $value['field_2'];
				$field_3 = $value['field_3'];
				$field_4 = $value['field_4'];
				$field_5 = $value['field_5'];
			}
			if ($field_1 == 'Table') {
				$field_1 = $singkatan;
			}elseif ($field_1 == 'Year') {
				$field_1 = date('Y');
			}elseif ($field_1 == 'Month') {
				$field_1 = date('m');
			}elseif ($field_1 == 'Delimeter') {
				$field_1 = '/';
			}elseif ($field_1 == 'Free Text') {
				$field_1 = 'Free Text';
			}else{
				$field_1 = '';
			}

			if ($field_2 == 'Table') {
				$field_2 = $singkatan;
			}elseif ($field_2 == 'Year') {
				$field_2 = date('Y');
			}elseif ($field_2 == 'Month') {
				$field_2 = date('m');
			}elseif ($field_2 == 'Delimeter') {
				$field_2 = '/';
			}elseif ($field_2 == 'Free Text') {
				$field_2 = 'Free Text';
			}else{
				$field_2 = '';
			}

			if ($field_3 == 'Table') {
				$field_3 = $singkatan;
			}elseif ($field_3 == 'Year') {
				$field_3 = date('Y');
			}elseif ($field_3 == 'Month') {
				$field_3 = date('m');
			}elseif ($field_3 == 'Delimeter') {
				$field_3 = '/';
			}elseif ($field_3 == 'Free Text') {
				$field_3 = 'Free Text';
			}else{
				$field_3 = '';
			}

			if ($field_4 == 'Table') {
				$field_4 = $singkatan;
			}elseif ($field_4 == 'Year') {
				$field_4 = date('Y');
			}elseif ($field_4 == 'Month') {
				$field_4 = date('m');
			}elseif ($field_4 == 'Delimeter') {
				$field_4 = '/';
			}elseif ($field_4 == 'Free Text') {
				$field_4 = 'Free Text';
			}else{
				$field_4 = '';
			}

			if ($field_5 == 'Table') {
				$field_5 = $singkatan;
			}elseif ($field_5 == 'Year') {
				$field_5 = date('Y');
			}elseif ($field_5 == 'Month') {
				$field_5 = date('m');
			}elseif ($field_5 == 'Delimeter') {
				$field_5 = '/';
			}elseif ($field_5 == 'Free Text') {
				$field_5 = 'Free Text';
			}else{
				$field_5 = '';
			}

			$nomor = $field_1.$field_2.$field_3.$field_4.$field_5;
		}
		$get_pencipta = $this->db->get_where('tb_employee', array('NIP' => $DOC_MAKER))->result_array();
		if (empty($get_pencipta)) {
			
		}else{
			foreach ($get_pencipta as $key => $value) {
				$name = $value['FULL_NAME'];
				$email_pencipta = $value['EMAIL'];
				$depcode = $value['DEPCODE'];
			}
		}
		$get_atasan = $this->db
			->select('*')
			->from('tb_employee')
			->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left')
			->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID OR tb_employee.DEPCODE = tb_divisi.DI_ID', 'left')
			->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID OR tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left')
			->where('tb_employee.DEPCODE', $depcode)
			->get()->result_array();
		foreach ($get_atasan as $key => $value) {
			$DN = $value['DN_ID'];
			$DV = $value['DI_ID'];
			$DT = $value['DT_ID'];
		}
		if (!empty($DN)) {
			$get_atasan = $this->db->get_where('tb_employee', array('DEPCODE' => $DV))->result_array();
		}else{
			$get_atasan = $this->db->get_where('tb_employee', array('DEPCODE' => $DT))->result_array();
		}
		if (empty($get_atasan)) {
			
		}else{
			foreach ($get_atasan as $key => $value) {
				$AdminNo = $value['NIP'];
				$AdminName = $value['FULL_NAME'];
			}
		}
		$get_user = 
		$this->db->select('*')
			->from('tb_document_notification')
			->join('tb_employee', 'tb_document_notification.NIP = tb_employee.NIP', 'left')
			->join('tb_document', 'tb_document_notification.DOC_ID = tb_document.DOC_ID', 'left')
			->where(array('tb_document_notification.DOC_ID' => $DOC_ID))
			->get()->result_array();
		if (empty($get_user)) {
			
		}else{
			foreach ($get_user as $key => $value) {
				$email[] = $value['EMAIL']; 
			}
		}

		$url = base_url();
		// Hari, Tanggal, Bulan, Tahun, Jam
		$day = date('D');
		$dayList = array(
			'Sun' => 'Minggu',
			'Mon' => 'Senin',
			'Tue' => 'Selasa',
			'Wed' => 'Rabu',
			'Thu' => 'Kamis',
			'Fri' => 'Jumat',
			'Sat' => 'Sabtu'
		);
		$hari = $dayList[$day];
		$tanggal = date('d/M/Y');
		$bulan = date('M');
		$tahun = date('Y');
		$jam = date('H:i')." WIB";
		// Proses Replace & Subject
		$find = array("/{NomorDok}/","/{NamaDok}/","/{Url}/","/{AdminNo}/","/{AdminName}/","/{Hari}/","/{Tanggal}/","/{Jam}/","/{EmpNo}/","/{EmpName}/");
		$replace = array($nomor,$DOC_NAMA,$url,$AdminNo,$AdminName,$hari,$tanggal,$jam,$DOC_MAKER,$name);
		$subject = preg_replace($find, $replace, $subject);
		$body = preg_replace($find, $replace, $body);

		$this->email->from($email_pencipta, $name);
		$this->email->to($email_pencipta);
		$this->email->subject($subject);
		$this->email->message($body);
		$this->email->send();
	}

	public function Email_obselete($si_key)
	{
		include (APPPATH.'libraries/session_user.php');
		$config = [
			'useragent' => 'CodeIgniter',
			'protocol'  => 'smtp',
			'mailpath'  => '/usr/sbin/sendmail',
			'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_user' => 'akuntest437@gmail.com',
			'smtp_pass' => 'akuntest123',
			'smtp_port' => 465,
			'smtp_keepalive' => TRUE,
			'smtp_crypto' => 'SSL',
			'wordwrap'  => TRUE,
			'wrapchars' => 80,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'validate'  => TRUE,
			'crlf'      => "\r\n",
			'newline'   => "\r\n",
		];
		$this->load->library('email', $config);

		$get_content = $this->db->get_where('m_format', array('nama' => 'Obselete'))->result_array();
		if (empty($get_content)) {
			
		}else{
			foreach ($get_content as $key => $value) {
				$no = $value['nomor'];
				$subject = $value['subject'];
				$body = $value['isi'];
			}
		}
		$get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE));
		if (empty($get_tipe)) {
			
		}else{
			foreach ($get_tipe as $key => $value) {
				$singkatan = $value['DTSETE_SINGKATAN'];
			}
		}
		$runing_no = $this->M_contribution->GET_RUNING_NOMOR($no);
		$get_nomor = $this->db->get_where('m_nomor', array('Code' => $no))->result_array();
		if (empty($get_nomor)) {

		}else{
			foreach ($get_nomor as $key => $value) {
				$field_1 = $value['field_1'];
				$field_2 = $value['field_2'];
				$field_3 = $value['field_3'];
				$field_4 = $value['field_4'];
				$field_5 = $value['field_5'];
			}
			if ($field_1 == 'Table') {
				$field_1 = $singkatan;
			}elseif ($field_1 == 'Year') {
				$field_1 = date('Y');
			}elseif ($field_1 == 'Month') {
				$field_1 = date('m');
			}elseif ($field_1 == 'Delimeter') {
				$field_1 = '/';
			}elseif ($field_1 == 'Free Text') {
				$field_1 = $runing_no;
			}else{
				$field_1 = '';
			}

			if ($field_2 == 'Table') {
				$field_2 = $singkatan;
			}elseif ($field_2 == 'Year') {
				$field_2 = date('Y');
			}elseif ($field_2 == 'Month') {
				$field_2 = date('m');
			}elseif ($field_2 == 'Delimeter') {
				$field_2 = '/';
			}elseif ($field_2 == 'Free Text') {
				$field_2 = $runing_no;
			}else{
				$field_2 = '';
			}

			if ($field_3 == 'Table') {
				$field_3 = $singkatan;
			}elseif ($field_3 == 'Year') {
				$field_3 = date('Y');
			}elseif ($field_3 == 'Month') {
				$field_3 = date('m');
			}elseif ($field_3 == 'Delimeter') {
				$field_3 = '/';
			}elseif ($field_3 == 'Free Text') {
				$field_3 = $runing_no;
			}else{
				$field_3 = '';
			}

			if ($field_4 == 'Table') {
				$field_4 = $singkatan;
			}elseif ($field_4 == 'Year') {
				$field_4 = date('Y');
			}elseif ($field_4 == 'Month') {
				$field_4 = date('m');
			}elseif ($field_4 == 'Delimeter') {
				$field_4 = '/';
			}elseif ($field_4 == 'Free Text') {
				$field_4 = $runing_no;
			}else{
				$field_4 = '';
			}

			if ($field_5 == 'Table') {
				$field_5 = $singkatan;
			}elseif ($field_5 == 'Year') {
				$field_5 = date('Y');
			}elseif ($field_5 == 'Month') {
				$field_5 = date('m');
			}elseif ($field_5 == 'Delimeter') {
				$field_5 = '/';
			}elseif ($field_5 == 'Free Text') {
				$field_5 = $runing_no;
			}else{
				$field_5 = '';
			}

			$nomor = $field_1.$field_2.$field_3.$field_4.$field_5;
		}
		$get_pencipta = $this->db->get_where('tb_employee', array('NIP' => $DOC_MAKER))->result_array();
		if (empty($get_pencipta)) {
			
		}else{
			foreach ($get_pencipta as $key => $value) {
				$name = $value['FULL_NAME'];
				$email_pencipta = $value['EMAIL']; 
			}
		}
		$get_user = 
		$this->db->select('*')
			->from('tb_document_notification')
			->join('tb_employee', 'tb_document_notification.NIP = tb_employee.NIP', 'left')
			->join('tb_document', 'tb_document_notification.DOC_ID = tb_document.DOC_ID', 'left')
			->where(array('tb_document_notification.DOC_ID' => $DOC_ID))
			->get()->result_array();
		if (empty($get_user)) {
			
		}else{
			foreach ($get_user as $key => $value) {
				$email[] = $value['EMAIL']; 
			}
		}

		$url = base_url('document-details-'.$DOC_ID);
		// Hari, Tanggal, Bulan, Tahun, Jam
		$day = date('D');
		$dayList = array(
			'Sun' => 'Minggu',
			'Mon' => 'Senin',
			'Tue' => 'Selasa',
			'Wed' => 'Rabu',
			'Thu' => 'Kamis',
			'Fri' => 'Jumat',
			'Sat' => 'Sabtu'
		);
		$hari = $dayList[$day];
		$tanggal = date('d/M/Y');
		$bulan = date('M');
		$tahun = date('Y');
		$jam = date('H:i')." WIB";
		// Proses Replace & Subject
		$find = array("/{NomorDok}/","/{NamaDok}/","/{Url}/","/{AdminNo}/","/{AdminName}/","/{Hari}/","/{Tanggal}/","/{Jam}/","/{EmpNo}/","/{EmpName}/");
		$replace = array($nomor,$DOC_NAMA,$url,$AdminNo,$AdminName,$hari,$tanggal,$jam,$DOC_MAKER,$name);
		$subject = preg_replace($find, $replace, $subject);
		$body = preg_replace($find, $replace, $body);

		$this->email->from($email_pencipta, $name);
		$this->email->to($email);
		$this->email->subject($subject);
		$this->email->message($body);
		$this->email->send();
	}

	public function Email_archived($si_key)
	{
		include (APPPATH.'libraries/session_user.php');
		$config = [
			'useragent' => 'CodeIgniter',
			'protocol'  => 'smtp',
			'mailpath'  => '/usr/sbin/sendmail',
			'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_user' => 'akuntest437@gmail.com',
			'smtp_pass' => 'akuntest123',
			'smtp_port' => 465,
			'smtp_keepalive' => TRUE,
			'smtp_crypto' => 'SSL',
			'wordwrap'  => TRUE,
			'wrapchars' => 80,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'validate'  => TRUE,
			'crlf'      => "\r\n",
			'newline'   => "\r\n",
		];
		$this->load->library('email', $config);

		$get_data = $this->M_contribution->DB_GET_DOC_BY_ID($si_key);
		foreach ($get_data as $g => $data) {
			$DOC_ID = $data->DOC_ID;
			$DOC_NAMA = $data->DOC_NAMA;
			$DOC_TIPE = $data->DOC_TIPE;
			$DOC_MAKER = $data->DOC_MAKER;
			$DOC_APPROVE = $data->DOC_APPROVE;
		}

		$get_content = $this->db->get_where('m_format', array('nama' => 'Archived'))->result_array();
		if (empty($get_content)) {
			
		}else{
			foreach ($get_content as $key => $value) {
				$no = $value['nomor'];
				$subject = $value['subject'];
				$body = $value['isi'];
			}
		}
		$get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE));
		if (empty($get_tipe)) {
			
		}else{
			foreach ($get_tipe as $key => $value) {
				$singkatan = $value['DTSETE_SINGKATAN'];
			}
		}
		$runing_no = $this->M_contribution->GET_RUNING_NOMOR($no);
		$get_nomor = $this->db->get_where('m_nomor', array('Code' => $no))->result_array();
		if (empty($get_nomor)) {

		}else{
			foreach ($get_nomor as $key => $value) {
				$field_1 = $value['field_1'];
				$field_2 = $value['field_2'];
				$field_3 = $value['field_3'];
				$field_4 = $value['field_4'];
				$field_5 = $value['field_5'];
			}
			if ($field_1 == 'Table') {
				$field_1 = $singkatan;
			}elseif ($field_1 == 'Year') {
				$field_1 = date('Y');
			}elseif ($field_1 == 'Month') {
				$field_1 = date('m');
			}elseif ($field_1 == 'Delimeter') {
				$field_1 = '/';
			}elseif ($field_1 == 'Free Text') {
				$field_1 = $runing_no;
			}else{
				$field_1 = '';
			}

			if ($field_2 == 'Table') {
				$field_2 = $singkatan;
			}elseif ($field_2 == 'Year') {
				$field_2 = date('Y');
			}elseif ($field_2 == 'Month') {
				$field_2 = date('m');
			}elseif ($field_2 == 'Delimeter') {
				$field_2 = '/';
			}elseif ($field_2 == 'Free Text') {
				$field_2 = $runing_no;
			}else{
				$field_2 = '';
			}

			if ($field_3 == 'Table') {
				$field_3 = $singkatan;
			}elseif ($field_3 == 'Year') {
				$field_3 = date('Y');
			}elseif ($field_3 == 'Month') {
				$field_3 = date('m');
			}elseif ($field_3 == 'Delimeter') {
				$field_3 = '/';
			}elseif ($field_3 == 'Free Text') {
				$field_3 = $runing_no;
			}else{
				$field_3 = '';
			}

			if ($field_4 == 'Table') {
				$field_4 = $singkatan;
			}elseif ($field_4 == 'Year') {
				$field_4 = date('Y');
			}elseif ($field_4 == 'Month') {
				$field_4 = date('m');
			}elseif ($field_4 == 'Delimeter') {
				$field_4 = '/';
			}elseif ($field_4 == 'Free Text') {
				$field_4 = $runing_no;
			}else{
				$field_4 = '';
			}

			if ($field_5 == 'Table') {
				$field_5 = $singkatan;
			}elseif ($field_5 == 'Year') {
				$field_5 = date('Y');
			}elseif ($field_5 == 'Month') {
				$field_5 = date('m');
			}elseif ($field_5 == 'Delimeter') {
				$field_5 = '/';
			}elseif ($field_5 == 'Free Text') {
				$field_5 = $runing_no;
			}else{
				$field_5 = '';
			}

			$nomor = $field_1.$field_2.$field_3.$field_4.$field_5;
		}
		$get_pencipta = $this->db->get_where('tb_employee', array('NIP' => $DOC_MAKER))->result_array();
		if (empty($get_pencipta)) {
			
		}else{
			foreach ($get_pencipta as $key => $value) {
				$name = $value['FULL_NAME'];
				$email_pencipta = $value['EMAIL'];
				$depcode = $value['DEPCODE'];
			}
		}
		$get_atasan = $this->db
			->select('*')
			->from('tb_employee')
			->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left')
			->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID OR tb_employee.DEPCODE = tb_divisi.DI_ID', 'left')
			->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID OR tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left')
			->where('tb_employee.DEPCODE', $depcode)
			->get()->result_array();
		foreach ($get_atasan as $key => $value) {
			$DN = $value['DN_ID'];
			$DV = $value['DI_ID'];
			$DT = $value['DT_ID'];
		}
		if (!empty($DN)) {
			$get_atasan = $this->db->get_where('tb_employee', array('DEPCODE' => $DV))->result_array();
		}else{
			$get_atasan = $this->db->get_where('tb_employee', array('DEPCODE' => $DT))->result_array();
		}
		if (empty($get_atasan)) {
			
		}else{
			foreach ($get_atasan as $key => $value) {
				$AdminNo = $value['NIP'];
				$AdminName = $value['FULL_NAME'];
			}
		}
		$get_user = 
		$this->db->select('*')
			->from('tb_document_notification')
			->join('tb_employee', 'tb_document_notification.NIP = tb_employee.NIP', 'left')
			->join('tb_document', 'tb_document_notification.DOC_ID = tb_document.DOC_ID', 'left')
			->where(array('tb_document_notification.DOC_ID' => $DOC_ID))
			->get()->result_array();
		if (empty($get_user)) {
			
		}else{
			foreach ($get_user as $key => $value) {
				$email[] = $value['EMAIL']; 
			}
		}

		$url = base_url();
		// Hari, Tanggal, Bulan, Tahun, Jam
		$day = date('D');
		$dayList = array(
			'Sun' => 'Minggu',
			'Mon' => 'Senin',
			'Tue' => 'Selasa',
			'Wed' => 'Rabu',
			'Thu' => 'Kamis',
			'Fri' => 'Jumat',
			'Sat' => 'Sabtu'
		);
		$hari = $dayList[$day];
		$tanggal = date('d/M/Y');
		$bulan = date('M');
		$tahun = date('Y');
		$jam = date('H:i')." WIB";
		// Proses Replace & Subject
		$find = array("/{NomorDok}/","/{NamaDok}/","/{Url}/","/{AdminNo}/","/{AdminName}/","/{Hari}/","/{Tanggal}/","/{Jam}/","/{EmpNo}/","/{EmpName}/");
		$replace = array($nomor,$DOC_NAMA,$url,$AdminNo,$AdminName,$hari,$tanggal,$jam,$DOC_MAKER,$name);
		$subject = preg_replace($find, $replace, $subject);
		$body = preg_replace($find, $replace, $body);

		$this->email->from($email_pencipta, $name);
		$this->email->to($email);
		$this->email->subject($subject);
		$this->email->message($body);
		$this->email->send();
	}

	public function coba()
	{
		$data = array(
			"dataku" => array(
				"nama" => "Petani Kode",
				"url" => "http://petanikode.com"
			)
		);

		$this->load->library('pdf');

		$this->pdf->setPaper('A4', 'landscape');
		$this->pdf->filename = "laporan-petanikode.pdf";
		$this->pdf->load_view('report/pdf/log', $data);
	}

}

/* End of file C_email.php */
/* Location: ./application/controllers/C_email.php */