<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use Sendinblue\Mailin;
class C_notification extends CI_Controller {
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
		$SESSION_ORG_PARENT = $this->session->userdata("session_bgm_edocument_org_parent");
    }

	public function index()
	{
		$nip  = $_SESSION['session_bgm_edocument_id'];
		$data['start_date'] = $this->input->post('start_date') ? $this->input->post('start_date') : '';
		$data['end_date'] = $this->input->post('end_date') ? $this->input->post('end_date') : '';
		$data['status_document'] = $this->input->post('status_document') ? $this->input->post('status_document') : '';
		$data['notification'] = $this->getNotification($nip, false, $data);
		$data['news'] = $this->__getNews($nip, false);
		$data['document_status'] = $this->db->select('*')->from('tb_document_status')->get()->result();
		$data['is_search'] =  $this->input->post('is_search') ? $this->input->post('is_search') : '';
		$data['view'] = 'V_notification';
		$this->load->view('template', $data);
	}

	public function getNotification($nip, $is_ajax = false, $params=[]){
		$news = $this->M_notification->GET_NEWS_NEW($this->session->userdata("session_bgm_edocument_id"));
		$user_dept = $_SESSION['session_bgm_edocument_departement_id'];
		$org = $_SESSION['session_bgm_edocument_org_parent'];
	
		$isDirection = stripos($org, 'DIR');
		if ($isDirection !== FALSE) {
			$user_dept = $this->M_notification->getDepartnameByDivision($user_dept);
		}
		$query_is_pendistribusi = $this->db
				 ->select('tb_document_notification.*')
				 ->from('tb_document_notification')
				 ->join('tb_document', 'tb_document_notification.DOC_ID=tb_document.DOC_ID', 'inner')
				 ->where("(
					 tb_document_notification.PENDISTRIBUSI IN (".$user_dept.") 
					 OR tb_document_notification.PEMILIK IN (".$user_dept.") 
					 OR tb_document_notification.DEP_MAKER IN (".$user_dept.") 
					 OR tb_document.DOC_STATUS=".$this->session->userdata("session_bgm_edocument_departement_id").")");

		if ($params['status_document'] !== '') {
			if ($params['status_document'] === 'DIPUBLIKASI') {
				$query_is_pendistribusi = $query_is_pendistribusi->where('tb_document.DOC_STATUS', 'DIPUBLIKASI');
			}

			if ($params['status_document'] === 'DITOLAK') {
				$query_is_pendistribusi = $query_is_pendistribusi->where('tb_document.DOC_MAKER', $this->session->userdata("session_bgm_edocument_id"));
				$query_is_pendistribusi = $query_is_pendistribusi->like('tb_document.DOC_STATUS', 'DITOLAK');
			}

			if ($params['status_document'] === 'KADALUARSA') {
				$query_is_pendistribusi = $query_is_pendistribusi->where('tb_document.DOC_STATUS', 'KADALUARSA');
			}

			if ($params['status_document'] === 'MENUNGGU') {
				// $query_is_pendistribusi = $query_is_pendistribusi->like('tb_document.DOC_STATUS_ACTIVITY', 'menunggu persetujuan');
				$query_is_pendistribusi = $query_is_pendistribusi->where('tb_document.DOC_STATUS', $this->session->userdata("session_bgm_edocument_departement_id"));
			}
		}
		$query_is_pendistribusi = 
				$query_is_pendistribusi->order_by('tb_document.DOC_DATE','ASC')
				->get()->result_array();
		
		$data = [];
		if (count($query_is_pendistribusi) > 0) {
			$unique_array = [];
			foreach($query_is_pendistribusi as $element) {
				$hash = $element['DOC_ID'];
				$unique_array[$hash] = $element;
			}

			$new_data = array();
			foreach ($unique_array as $k=>$v) {
				$cek_doc_history = $this->db->select('*')->from('tb_notification_history')->where(array('USER_ID' => $nip, 'DOC_ID' => $v['DOC_ID']))->get()->result_array();

				if (count($cek_doc_history) == 0) {
					$qr = $this->db->select('
								tb_document.DOC_ID,
								tb_document.DOC_DATE,
								tb_document.DOC_NAMA,
								tb_document.DOC_STATUS_ACTIVITY,
								tb_document.DOC_STATUS,
								tb_document.DOC_TGL_EXPIRED,
								tb_document.DOC_MAKER,
								tb_document.DOC_APPROVE,
								tb_document.DOC_PENDISTRIBUSI,
								tb_document.DOC_PEMILIK_PROSES,
								tb_document.DOC_VERSI,
								tb_document.DOC_NOMOR,
								tb_document.DOC_DISTRIBUSI,
								tb_document_notification.NOTIF_ID,
								tb_document.DOC_ABSTRAK,
								tb_document.DOC_TGL_EFEKTIF,
								tb_employee.NIP,
								tb_confidential.CL_NAME,
								tb_document_structure_tipe.DTSETE_TIPE
							')->from('tb_document')
							->join('tb_document_notification', 'tb_document_notification.DOC_ID = tb_document.DOC_ID')
							->join('tb_document_detail', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left')
							->join('tb_document_structure_kategori', 'tb_document.DOC_KATEGORI = tb_document_structure_kategori.DTSEKI_ID', 'left')
							->join('tb_document_structure_jenis', 'tb_document.DOC_JENIS = tb_document_structure_jenis.DTSEJS_ID', 'left')
							->join('tb_document_structure_tipe', 'tb_document.DOC_TIPE = tb_document_structure_tipe.DTSETE_ID', 'left')
							->join('tb_document_form', 'tb_document.DOC_WUJUD = tb_document_form.DTFM_ID', 'left')
							->join('tb_distribution_method', 'tb_document.DOC_DISTRIBUSI = tb_distribution_method.DNMD_ID', 'left')
							->join('tb_confidential', 'tb_document.DOC_KERAHASIAAN = tb_confidential.CL_ID', 'left')
							->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
							->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left outer')
							->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID OR tb_employee.DEPCODE = tb_divisi.DI_ID', 'left outer')
							->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID OR tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left')
							->where(array('tb_document.DOC_ID'=>$v['DOC_ID']))
							->order_by('tb_document.DOC_DATE', 'ASC')
							->get()->row();
					$new_data[] = $qr;
				}
			}
			if ($is_ajax) {
				if (!in_array(27,$this->session->userdata("user_menu"))) { 
					$new_data = [];
				}
				if (!in_array(5,$this->session->userdata("user_menu"))) { 
					$news = [];
				}
				echo json_encode(array("notification" => count($new_data), "news" => count($news)));
				return true;
			}
			return $new_data;
		}
		// var_dump($data);die;
		return [];
	}

	private function __getNews($nip) {

	}
	public function document($docid,$doc)
	{
		include (APPPATH.'libraries/session_user.php');
		include (APPPATH.'libraries/FPDF/Fpdf.php');
		include (APPPATH.'libraries/FPDI/fpdi.php');
		date_default_timezone_set('Asia/Jakarta');
		$get = $this->M_library_database->DB_GET_DATA_DOCUMENT_DETAIL_BY_ID_EVO($docid);
		foreach($get as $data_row_doc){
			$DOCD_UTAMA = $data_row_doc->DOCD_UTAMA;
			$EXT_UTAMA	= $data_row_doc->DOCD_UTAMA_EXT;
			$STATUS_UTAMA = $data_row_doc->DOCD_UTAMA_STATUS;

			$DOCD_PELENGKAP_1 = $data_row_doc->DOCD_PELENGKAP_1;
			$EXT_1 = $data_row_doc->DOCD_PELENGKAP_1_EXT;
			$STATUS_1 = $data_row_doc->DOCD_PELENGKAP_1_STATUS;

			$DOCD_PELENGKAP_2 = $data_row_doc->DOCD_PELENGKAP_2;
			$EXT_2 = $data_row_doc->DOCD_PELENGKAP_2_EXT;
			$STATUS_2 = $data_row_doc->DOCD_PELENGKAP_2_STATUS;

			$DOCD_PERSETUJUAN = $data_row_doc->DOCD_PERSETUJUAN;

			$DOC_STATUS = $data_row_doc->DOC_STATUS;
		}

		if ($DOC_STATUS == "DIPUBLIKASI" || $DOC_STATUS == "KADALUARSA" || $DOC_STATUS == "DIARSIPKAN") {
			$data = array(
				'LogDoc' => $docid,
				'LogAct' => 'Lihat',
				'LogUserName' => $this->session->userdata("session_bgm_edocument_id"),
			);
			$this->db->insert('m_log', $data);
		}
		$url['id'] = $docid;
		if ($doc == $DOCD_UTAMA) {
			if ($DOC_STATUS == "DIPUBLIKASI" || $DOC_STATUS == "KADALUARSA" || $DOC_STATUS == "DIARSIPKAN") {
				$this->db->delete('tb_document_news', array('DOC_ID' => $docid, 'UR_ID' => $SESSION_ID));
			}
			//ADD WATERMAK
			if ($STATUS_UTAMA==1) {
				// unlink('./assets/pdf/COPY-'.$DOCD_UTAMA.'-'.$this->session->userdata("session_bgm_edocument_id").'.pdf');
				$GLOBALS['watermark_text'] = '';
				$GLOBALS['watermark_second_text'] = $this->__getWatermarkText();
				$GLOBALS['dokumen_utama'] = './assets/pdf/'.$DOCD_UTAMA.'.pdf';
				$GLOBALS['dokumen_utama_copy'] = './assets/pdf/COPY-'.$DOCD_UTAMA.'-'.$this->session->userdata("session_bgm_edocument_id").'.pdf';
				copy($GLOBALS['dokumen_utama'], $GLOBALS['dokumen_utama_copy']);
				chmod($GLOBALS['dokumen_utama_copy'], 0777);
				include (APPPATH.'libraries/watermark/watermark_utama.php');
				$pdf = new Watermark_utama();
				$pdf->AddPage();
				$pdf->SetFont('Arial', '', 12);
				if($pdf->numPages>1) {
					for($i=2;$i<=$pdf->numPages;$i++) {
						$pdf->_tplIdx = $pdf->importPage($i);
						$pdf->AddPage();
					}
				}
				$pdf->Output($GLOBALS['dokumen_utama_copy'],'F');
				$getUtama = $GLOBALS['dokumen_utama_copy'];
			}else{
				$getUtama = './assets/pdf/'.$DOCD_UTAMA.'.pdf';
			}
			
			$url['ket'] = 'Dokumen Utama';
			$url['url'] = base_url($getUtama);
			$url['ext'] = $EXT_UTAMA;
		}elseif ($doc == $DOCD_PELENGKAP_1) {
			$url['ket'] = 'Dokumen Pelengkap 1';
			if ($EXT_1=='pdf' || $EXT_1=='doc' || $EXT_1=='docx' || $EXT_1=='xls' || $EXT_1=='xlsx' || $EXT_1=='ppt' || $EXT_1=='pptx' || $EXT_1=='vsd' || $EXT_1=='vsdx') {
				$url['url'] = base_url('assets/pdf/'.$DOCD_PELENGKAP_1.'.pdf');
				$url['ext'] = $EXT_1;
			}else{
				$url['url'] = base_url('assets/original/'.$DOCD_PELENGKAP_1.'.'.$EXT_1);
				$url['ext'] = $EXT_1;
			}
		}else{
			$url['ket'] = 'Dokumen Pelengkap 2';
			if ($EXT_2=='pdf' || $EXT_2=='doc' || $EXT_2=='docx' || $EXT_2=='xls' || $EXT_2=='xlsx' || $EXT_2=='ppt' || $EXT_2=='pptx' || $EXT_2=='vsd' || $EXT_2=='vsdx') {
				$url['url'] = base_url('assets/pdf/'.$DOCD_PELENGKAP_2.'.pdf');
				$url['ext'] = $EXT_2;
			}else{
				$url['url'] = base_url('assets/original/'.$DOCD_PELENGKAP_2.'.'.$EXT_2);
				$url['ext'] = $EXT_2;
			}
		}
		$this->load->view('V_document', $url);
	}

	public function Email_receipt($si_key)
	{
		$AdminNo = '';
		$AdminName = '';
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
		$get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE))->result_array();
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
			->join('tb_employee', 'tb_document_notification.UR_ID = tb_employee.NIP', 'left')
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
		$AdminNo = "";
		$AdminName = "";
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

	public function Email_news($si_key)
	{
		$AdminName = "";
		$AdminNo = "";
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
			$DOC_TIPE = $data->DOC_TIPE;
			$DOC_NAMA = $data->DOC_NAMA;
			$DOC_MAKER = $data->DOC_MAKER;
			$DOC_LEVEL = $data->DOC_LEVEL;
			$DOC_PENGGUNA = $data->DOC_PENGGUNA;
			$DOC_AKSES_LEVEL = $data->DOC_AKSES_LEVEL;
		}

		$get_content = $this->db->get_where('m_format', array('nama' => 'News'))->result_array();
		if (empty($get_content)) {
			
		}else{
			foreach ($get_content as $key => $value) {
				$no = $value['nomor'];
				$subject = $value['subject'];
				$body = $value['isi'];
			}
		}
		$get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE))->result_array();
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
			->from('tb_document_news')
			->join('tb_employee', 'tb_document_news.UR_ID = tb_employee.NIP', 'left')
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

	public function news($si_key)
	{
		function remove_empty($array) {
			return array_filter($array, '_remove_empty_internal');
		}

		function _remove_empty_internal($value) {
			return !empty($value) || $value === 0;
		}
		$get_data = $this->M_contribution->DB_GET_DOC_BY_ID($si_key);
		foreach ($get_data as $g => $data) {
			$DOC_ID = $data->DOC_ID;
			$DOC_TIPE = $data->DOC_TIPE;
			$DOC_MAKER = $data->DOC_MAKER;
			$DOC_LEVEL = $data->DOC_LEVEL;
			$DOC_PENGGUNA = $data->DOC_PENGGUNA;
			$DOC_AKSES_LEVEL = $data->DOC_AKSES_LEVEL;
		}
		// Delete News By DOC_ID
		$this->db->delete('tb_document_news', array('DOC_ID' => $DOC_ID));
		// Insert News By Job Level
		$data_job_level = array();
		if(strpos($DOC_AKSES_LEVEL,'|')!==false){
			$data_array = explode('|',$DOC_AKSES_LEVEL);
			$count = count($data_array);
			for($x=0;$x<$count;$x++){
				$get = $this->db->get_where('tb_employee', array('JOBLVL' => $data_array[$x]))->result();
				foreach ($get as $key => $value) {
					$data_job_level[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $value->NIP,
						'DEPCODE' => $value->DEPCODE
					);
				}
			}
		}else{
			$data_job_level[] = $this->db->get_where('tb_employee', array('JOBLVL' => $DOC_AKSES_LEVEL))->result();
		}
		$this->db->insert_batch('tb_document_news', $data_job_level);
		// Delete News By != Departemen
		if(strpos($DOC_PENGGUNA,'|')!==false){
			$data_array = explode('|',$DOC_PENGGUNA);
			$this->db->where_not_in('DEPCODE', $data_array);
			$this->db->delete('tb_document_news');
		}else{
			$this->db->delete('tb_document_news', array('DEPCODE', $DOC_PENGGUNA));
		}
		// Insert News Divisi
		if(strpos($DOC_PENGGUNA,'|')!==false){
			$data_array = explode('|',$DOC_PENGGUNA);
			$get_divisi = $this->db->select('DI_ID')
				->where_in('DN_ID', $data_array)
				->get('tb_departemen')
				->result();
			$divisi = array_values(array_unique($get_divisi, SORT_REGULAR));
			$data = array();
			foreach ($divisi as $key => $v) {
				$data[] = $v->DI_ID;
			}
			$jml_dv = count($data);
			$dt_usr_dv = array();
			for ($x=0; $x < $jml_dv; $x++) { 
				$get = $this->db->select('*')
					->where('DEPCODE', $data[$x])
					->get('tb_employee')
					->result();

				foreach ($get as $key => $value) {
					$dt_usr_dv[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $value->NIP,
						'DEPCODE' => $value->DEPCODE
					);
				}
			}
			$this->db->insert_batch('tb_document_news', $dt_usr_dv);
		}else{
			$get_divisi = $this->db->select('DI_ID')
				->where_in('DN_ID', $DOC_PENGGUNA)
				->get('tb_departemen')
				->result();
			foreach ($divisi as $key => $v) {
				$data = $v->DI_ID;
			}
			$get = $this->db->select('*')
				->where('DEPCODE', $data)
				->get('tb_employee')
				->result();
			$dt_usr_dv = array();
			foreach ($get as $key => $value) {
				$dt_usr_dv[] = array(
					'DOC_ID' => $DOC_ID,
					'UR_ID' => $value->NIP,
					'DEPCODE' => $value->DEPCODE
				);
			}
			$this->db->insert_batch('tb_document_news', $dt_usr_dv);
		}
		// Get Direktorat

		// Kirim Email
		$this->Email_news($si_key);
	}

	public function approve()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
		}
		include (APPPATH.'libraries/session_user.php');
		//-----------------------------------------------------------------------------------------------//
		date_default_timezone_set('Asia/Jakarta');
		$si_key 		= $this->input->post('si_key');
		$si_key 		= $si_key[0];
		
		$si_approver 	= $this->input->post('si_approver');
		
		$si_userid		= $this->session->userdata("session_bgm_edocument_id");
		$date_now		= date('Y-m-d H:i:s');
		//-----------------------------------------------------------------------------------------------//
		$get_data = $this->M_contribution->DB_GET_DOC_BY_ID($si_key);
		if(empty($get_data)||$get_data==""){
			echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		foreach ($get_data as $g => $data) {
			$DOC_ID = $data->DOC_ID;
			$DOC_MAKER = $data->DOC_MAKER;
			$DOC_LEVEL = $data->DOC_LEVEL;
			$DOC_PENGGUNA = $data->DOC_PENGGUNA;
			$DOC_AKSES_LEVEL = $data->DOC_AKSES_LEVEL;
		}

		// Get user approve
		$get_user = $this->M_contribution->GET_USER_BY_ID_DEPARTEMEN($DOC_MAKER);
		if (!empty($get_user)) {
			foreach ($get_user as $a) {
				$DI_ID = $a->DI_ID;
				$DI_CODE = $a->DI_CODE;
				$DI_NAME = $a->DI_NAME;
			}
			$PENDISTRIBUSI_FINAL = "Menunggu Persetujuan dari ".$DI_CODE." (".$DI_NAME.")";
			$PENDISTRIBUSI_FINAL_CODE = $DI_ID;
		}else{
			$get_user = $this->M_contribution->GET_USER_BY_ID_DIVISI($DOC_MAKER);
			if (!empty($get_user)) {
				foreach ($get_user as $b) {
					$DT_ID = $b->DT_ID;
					$DT_NAME = $b->DT_NAME;
				}
				$PENDISTRIBUSI_FINAL = "Menunggu Persetujuan dari ".$DT_ID." (".$DT_NAME.")";
				$PENDISTRIBUSI_FINAL_CODE = $DT_ID;
			}
		}
		if ($DOC_LEVEL == "DEPARTEMEN") {
			if ($SESSION_DEPARTEMENT_ID=='7550') {
				$data_update = array(
					'DOC_ID' => $DOC_ID,
					'DOC_APPROVE' => $si_userid,
					'DOC_STATUS' => $PENDISTRIBUSI_FINAL_CODE,
					'DOC_STATUS_ACTIVITY' => $PENDISTRIBUSI_FINAL
				);
			}else{
				$data_update = array(
					'DOC_ID' => $DOC_ID,
					'DOC_APPROVE' => $si_userid,
					'DOC_STATUS' => "DIPUBLIKASI",
					'DOC_STATUS_ACTIVITY' => "DIPUBLIKASI"
				);
				$this->news($si_key);
				$this->set_publish_story($DOC_ID);
				$this->Email_notification($DOC_ID);
			}
		}elseif ($DOC_LEVEL == "DIVISI") {
			if ($SESSION_DEPARTEMENT_ID=='7550') {
				$data_update = array(
					'DOC_ID' => $DOC_ID,
					'DOC_APPROVE' => $si_userid,
					'DOC_STATUS' => $PENDISTRIBUSI_FINAL_CODE,
					'DOC_STATUS_ACTIVITY' => $PENDISTRIBUSI_FINAL
				);
			}else{
				$data_update = array(
					'DOC_ID' => $DOC_ID,
					'DOC_APPROVE' => $si_userid,
					'DOC_STATUS' => "DIPUBLIKASI",
					'DOC_STATUS_ACTIVITY' => "DIPUBLIKASI"
				);
				$this->news($si_key);
				$this->set_publish_story($DOC_ID);
				$this->Email_notification($DOC_ID);
			}
		}elseif($DOC_LEVEL == "DIREKTORAT"){
			$data_update = array(
				'DOC_ID' => $DOC_ID,
				'DOC_APPROVE' => $si_userid,
				'DOC_STATUS' => "DIPUBLIKASI",
				'DOC_STATUS_ACTIVITY' => "DIPUBLIKASI"
			);
			$this->news($si_key);
			$this->set_publish_story($DOC_ID);
			$this->Email_notification($DOC_ID);
		}
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data_update);
		$this->db->delete('tb_notification_history', array('DOC_ID' => $DOC_ID));
		if($is_ok){
			echo '
				<script>
					alert("Pemutakhiran Data Berhasil");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
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
						->select('waiting_activity')
						->from('tb_document_activity_notification')
						->where('role', 'PENGGUNA')
						->get()
						->row();
		if ($role_pengguna->waiting_activity === "1") {
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
			$this->__sendEmail($document, $maker, $pengguna_emails, 'pengguna');
		}

		//Pendistribusi
		$role_pendistribusi = $this->db
							->select('waiting_activity')
							->from('tb_document_activity_notification')
							->where('role', 'PENDISTRIBUSI')
							->get()
							->row();

		if ($role_pendistribusi->waiting_activity === "1") {
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
			$this->__sendEmail($document, $maker, $pendistribusi_emails, 'pendistribusi');
		}

		//Atasan Pencipta
		$role_atasan = $this->db
					->select('waiting_activity')
					->from('tb_document_activity_notification')
					->where('role', 'ATASAN PENCIPTA')
					->get()
					->row();

		if ($role_atasan->waiting_activity === "1") {
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
			$this->__sendEmail($document, $maker, $atasan_emails, 'atasan');
		}

		//Pencipta
		$role_pencipta = $this->db
						->select('waiting_activity')
						->from('tb_document_activity_notification')
						->where('role', 'PENCIPTA')
						->get()
						->row();

		if ($role_pencipta->waiting_activity === "1") {
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
			$this->__sendEmail($document, $maker, $pencipta_emails, 'pencipta');
		}
	}

	private function __sendEmail($document, $maker, $users, $role) {
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

	function set_publish_story($doc_id) {
		$data = [
			'doc_id' => $doc_id,
			'activity' => 'DIPUBLIKASI',
			'date' => date('Y-m-d H:i:s')
		];
		$insert = $this->db->insert('tb_document_activity_story', $data);
		return true;
	}

	public function reject()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		include (APPPATH.'libraries/session_user.php');
		//-----------------------------------------------------------------------------------------------//
		$si_key 		= $this->input->post('si_key');
		$si_note		= $this->input->post('si_note');
		
		$si_approver 	= $this->input->post('si_approver');
		
		$si_userid		= $this->session->userdata("session_bgm_edocument_name");
		date_default_timezone_set('Asia/Jakarta');
		$date_now		= date('Y-m-d H:i:s');
		//-----------------------------------------------------------------------------------------------//
		if($si_note==""){
			echo '
				<script>
					alert("Mohon Isi Catatan Tolak Sirkulasi");
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$get_data = $this->M_library_database->DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($si_key);
		if(empty($get_data)||$get_data==""){
			echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		foreach($get_data as $data_row){
			$DOC_ID					= $data_row->DOC_ID;
			$DOC_DATE               = $data_row->DOC_DATE;
			$DOC_KATEGORI           = $data_row->DOC_KATEGORI;
			$DOC_JENIS              = $data_row->DOC_JENIS;
			$DOC_TIPE               = $data_row->DOC_TIPE;
			$DOC_GROUP_PROSES       = $data_row->DOC_GROUP_PROSES;
			$DOC_PROSES             = $data_row->DOC_PROSES;
			$DOC_NOMOR              = $data_row->DOC_NOMOR;
			$DOC_NAMA               = $data_row->DOC_NAMA;
			$DOC_WUJUD              = $data_row->DOC_WUJUD;
			$DOC_DISTRIBUSI         = $data_row->DOC_DISTRIBUSI;
			$DOC_KERAHASIAAN        = $data_row->DOC_KERAHASIAAN;
			$DOC_AKSES_LEVEL        = $data_row->DOC_AKSES_LEVEL;
			$DOC_PENGGUNA           = $data_row->DOC_PENGGUNA;
			$DOC_PEMILIK_PROSES     = $data_row->DOC_PEMILIK_PROSES;
			$DOC_PENYIMPAN          = $data_row->DOC_PENYIMPAN;
			$DOC_PENDISTRIBUSI      = $data_row->DOC_PENDISTRIBUSI;
			$DOC_VERSI              = $data_row->DOC_VERSI;
			$DOC_TGL_EFEKTIF        = $data_row->DOC_TGL_EFEKTIF;
			$DOC_PERIODE_PREVIEW	= $data_row->DOC_PERIODE_PREVIEW;
			$DOC_KATA_KUNCI         = $data_row->DOC_KATA_KUNCI;
			$DOC_ABSTRAK            = $data_row->DOC_ABSTRAK;
			$DOC_TERKAIT            = $data_row->DOC_TERKAIT;
			$DOC_MAKER              = $data_row->DOC_MAKER;
			$DOC_APPROVE            = $data_row->DOC_APPROVE;
			$DOC_STATUS             = $data_row->DOC_STATUS;
			$DOC_STATUS_ACTIVITY    = $data_row->DOC_STATUS_ACTIVITY;
			$DOC_NOTE               = $data_row->DOC_NOTE;
			$DTSEKI_ID				= $data_row->DTSEKI_ID;
			$DTSEKI_KATEGORI        = $data_row->DTSEKI_KATEGORI;
			$DTSEJS_ID				= $data_row->DTSEJS_ID;
			$DTSEJS_JENIS           = $data_row->DTSEJS_JENIS;
			$DTSETE_ID				= $data_row->DTSETE_ID;
			$DTSETE_TIPE            = $data_row->DTSETE_TIPE;
			$DTSETE_SINGKATAN       = $data_row->DTSETE_SINGKATAN;
			$DTFM_ID				= $data_row->DTFM_ID;
			$DTFM_NAME              = $data_row->DTFM_NAME;
			$DNMD_ID				= $data_row->DNMD_ID;
			$DNMD_NAME              = $data_row->DNMD_NAME;
			$CL_ID					= $data_row->CL_ID;
			$CL_NAME                = $data_row->CL_NAME;
			$DOCD_UTAMA				= $data_row->DOCD_UTAMA;
			$DOCD_UTAMA_TYPE		= $data_row->DOCD_UTAMA_TYPE;
			$DOCD_PELENGKAP_1		= $data_row->DOCD_PELENGKAP_1;
			$DOCD_PELENGKAP_1_TYPE	= $data_row->DOCD_PELENGKAP_1_TYPE;
			$DOCD_PELENGKAP_2		= $data_row->DOCD_PELENGKAP_2;
			$DOCD_PELENGKAP_2_TYPE	= $data_row->DOCD_PELENGKAP_2_TYPE;
			$DOCD_PERSETUJUAN		= $data_row->DOCD_PERSETUJUAN;
			$DOCD_PERSETUJUAN_TYPE	= $data_row->DOCD_PERSETUJUAN_TYPE;
		}
		// Status Activity
		if (empty($SESSION_DEPARTEMENT_ID) && !empty($SESSION_DIVISI_ID)) {
			$Status = "DITOLAK ".$SESSION_DIVISI_ID;
			$Activity = "Ditolak ".$SESSION_DIVISI_CODE." ( ".$SESSION_DIVISI_NAME." )";
		}elseif (empty($SESSION_DIVISI_ID) && !empty($SESSION_DIREKTORAT_ID)) {
			$Status = "DITOLAK ".$SESSION_DIREKTORAT_ID;
			$Activity = "Ditolak ".$SESSION_DIREKTORAT_ID." ( ".$SESSION_DIREKTORAT_NAME." )";
		}else{
			$Status = "DITOLAK ".$SESSION_DEPARTEMENT_ID;
			$Activity = "Ditolak ".$SESSION_DEPARTEMENT_CODE." ( ".$SESSION_DEPARTEMENT_NAME." )";
		}
		$data_update = array(
			'DOC_ID' => $DOC_ID,
			'DOC_APPROVE' => $si_userid,
			'DOC_STATUS' => $Status,
			'DOC_STATUS_ACTIVITY' => $Activity,
			'DOC_NOTE' => "-"
		);
		//-----------------------------------------------------------------------------------------------//
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data_update);
		//-----------------------------------------------------------------------------------------------//
		$data_insert_status = array(
			'DTDLSS_ID' => $this->M_library_module->GENERATOR_REFF(),
			'DOC_ID' => $DOC_ID,
			'DTDLSS_DATE' => $date_now,
			'DTDLSS_MAKER' => $si_userid,
			'DTDLSS_STATUS' => "Ditolak ".$si_approver,
			'DTDLSS_NOTE' => $si_note
		);
		//-----------------------------------------------------------------------------------------------//
		$is_ok = $this->M_library_database->DB_INSERT_DATA_DOCUMENT_DETAIL_STATUS_EVO($data_insert_status);

		//-----------------------------------------------------------------------------------------------//
		if($is_ok){
			$this->db->delete('tb_notification_history', array('DOC_ID' => $DOC_ID));
			//INSERT TO LOG ???
			//-----------------------------------------------------------------------------------------------//
			echo '
				<script>
					alert("Pemutakhiran Data Berhasil");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
	}

	public function obsolete()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		$si_key 		= $this->input->post('si_key');
		$get_data = $this->M_library_database->DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($si_key);
		if(empty($get_data)||$get_data==""){
			echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		foreach($get_data as $data_row){
			$DOC_ID					= $data_row->DOC_ID;
			$DOC_DATE               = $data_row->DOC_DATE;
			$DOC_KATEGORI           = $data_row->DOC_KATEGORI;
			$DOC_JENIS              = $data_row->DOC_JENIS;
			$DOC_TIPE               = $data_row->DOC_TIPE;
			$DOC_GROUP_PROSES       = $data_row->DOC_GROUP_PROSES;
			$DOC_PROSES             = $data_row->DOC_PROSES;
			$DOC_NOMOR              = $data_row->DOC_NOMOR;
			$DOC_NAMA               = $data_row->DOC_NAMA;
			$DOC_WUJUD              = $data_row->DOC_WUJUD;
			$DOC_DISTRIBUSI         = $data_row->DOC_DISTRIBUSI;
			$DOC_KERAHASIAAN        = $data_row->DOC_KERAHASIAAN;
			$DOC_AKSES_LEVEL        = $data_row->DOC_AKSES_LEVEL;
			$DOC_PENGGUNA           = $data_row->DOC_PENGGUNA;
			$DOC_PEMILIK_PROSES     = $data_row->DOC_PEMILIK_PROSES;
			$DOC_PENYIMPAN          = $data_row->DOC_PENYIMPAN;
			$DOC_PENDISTRIBUSI      = $data_row->DOC_PENDISTRIBUSI;
			$DOC_VERSI              = $data_row->DOC_VERSI;
			$DOC_TGL_EFEKTIF        = $data_row->DOC_TGL_EFEKTIF;
			$DOC_PERIODE_PREVIEW	= $data_row->DOC_PERIODE_PREVIEW;
			$DOC_KATA_KUNCI         = $data_row->DOC_KATA_KUNCI;
			$DOC_ABSTRAK            = $data_row->DOC_ABSTRAK;
			$DOC_TERKAIT            = $data_row->DOC_TERKAIT;
			$DOC_MAKER              = $data_row->DOC_MAKER;
			$DOC_APPROVE            = $data_row->DOC_APPROVE;
			$DOC_STATUS             = $data_row->DOC_STATUS;
			$DOC_NOTE               = $data_row->DOC_NOTE;
			$DTSEKI_ID				= $data_row->DTSEKI_ID;
			$DTSEKI_KATEGORI        = $data_row->DTSEKI_KATEGORI;
			$DTSEJS_ID				= $data_row->DTSEJS_ID;
			$DTSEJS_JENIS           = $data_row->DTSEJS_JENIS;
			$DTSETE_ID				= $data_row->DTSETE_ID;
			$DTSETE_TIPE            = $data_row->DTSETE_TIPE;
			$DTSETE_SINGKATAN       = $data_row->DTSETE_SINGKATAN;
			$DTFM_ID				= $data_row->DTFM_ID;
			$DTFM_NAME              = $data_row->DTFM_NAME;
			$DNMD_ID				= $data_row->DNMD_ID;
			$DNMD_NAME              = $data_row->DNMD_NAME;
			$CL_ID					= $data_row->CL_ID;
			$CL_NAME                = $data_row->CL_NAME;
			$DOCD_UTAMA				= $data_row->DOCD_UTAMA;
			$DOCD_UTAMA_TYPE		= $data_row->DOCD_UTAMA_TYPE;
			$DOCD_PELENGKAP_1		= $data_row->DOCD_PELENGKAP_1;
			$DOCD_PELENGKAP_1_TYPE	= $data_row->DOCD_PELENGKAP_1_TYPE;
			$DOCD_PELENGKAP_2		= $data_row->DOCD_PELENGKAP_2;
			$DOCD_PELENGKAP_2_TYPE	= $data_row->DOCD_PELENGKAP_2_TYPE;
			$DOCD_PERSETUJUAN		= $data_row->DOCD_PERSETUJUAN;
			$DOCD_PERSETUJUAN_TYPE	= $data_row->DOCD_PERSETUJUAN_TYPE;
		}
		date_default_timezone_set('Asia/Jakarta');
		$date_now = date('Y-m-d');
		$data_update = array(
			'DOC_ID' => $DOC_ID,
			'DOC_TGL_EXPIRED' => $date_now,
			'DOC_STATUS' => "KADALUARSA",
			'DOC_STATUS_ACTIVITY' => "KADALUARSA"
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data_update);
		if($is_ok){
			redirect(base_url('C_notification'),'refresh');
		}else{
			echo '
				<script>
					alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
	}

	public function archived()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		$si_key 		= $this->input->post('si_key');
		$get_data = $this->M_library_database->DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($si_key);
		if(empty($get_data)||$get_data==""){
			echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		foreach($get_data as $data_row){
			$DOC_ID					= $data_row->DOC_ID;
			$DOC_DATE               = $data_row->DOC_DATE;
			$DOC_KATEGORI           = $data_row->DOC_KATEGORI;
			$DOC_JENIS              = $data_row->DOC_JENIS;
			$DOC_TIPE               = $data_row->DOC_TIPE;
			$DOC_GROUP_PROSES       = $data_row->DOC_GROUP_PROSES;
			$DOC_PROSES             = $data_row->DOC_PROSES;
			$DOC_NOMOR              = $data_row->DOC_NOMOR;
			$DOC_NAMA               = $data_row->DOC_NAMA;
			$DOC_WUJUD              = $data_row->DOC_WUJUD;
			$DOC_DISTRIBUSI         = $data_row->DOC_DISTRIBUSI;
			$DOC_KERAHASIAAN        = $data_row->DOC_KERAHASIAAN;
			$DOC_AKSES_LEVEL        = $data_row->DOC_AKSES_LEVEL;
			$DOC_PENGGUNA           = $data_row->DOC_PENGGUNA;
			$DOC_PEMILIK_PROSES     = $data_row->DOC_PEMILIK_PROSES;
			$DOC_PENYIMPAN          = $data_row->DOC_PENYIMPAN;
			$DOC_PENDISTRIBUSI      = $data_row->DOC_PENDISTRIBUSI;
			$DOC_VERSI              = $data_row->DOC_VERSI;
			$DOC_TGL_EFEKTIF        = $data_row->DOC_TGL_EFEKTIF;
			$DOC_PERIODE_PREVIEW	= $data_row->DOC_PERIODE_PREVIEW;
			$DOC_KATA_KUNCI         = $data_row->DOC_KATA_KUNCI;
			$DOC_ABSTRAK            = $data_row->DOC_ABSTRAK;
			$DOC_TERKAIT            = $data_row->DOC_TERKAIT;
			$DOC_MAKER              = $data_row->DOC_MAKER;
			$DOC_APPROVE            = $data_row->DOC_APPROVE;
			$DOC_STATUS             = $data_row->DOC_STATUS;
			$DOC_NOTE               = $data_row->DOC_NOTE;
			$DTSEKI_ID				= $data_row->DTSEKI_ID;
			$DTSEKI_KATEGORI        = $data_row->DTSEKI_KATEGORI;
			$DTSEJS_ID				= $data_row->DTSEJS_ID;
			$DTSEJS_JENIS           = $data_row->DTSEJS_JENIS;
			$DTSETE_ID				= $data_row->DTSETE_ID;
			$DTSETE_TIPE            = $data_row->DTSETE_TIPE;
			$DTSETE_SINGKATAN       = $data_row->DTSETE_SINGKATAN;
			$DTFM_ID				= $data_row->DTFM_ID;
			$DTFM_NAME              = $data_row->DTFM_NAME;
			$DNMD_ID				= $data_row->DNMD_ID;
			$DNMD_NAME              = $data_row->DNMD_NAME;
			$CL_ID					= $data_row->CL_ID;
			$CL_NAME                = $data_row->CL_NAME;
			$DOCD_UTAMA				= $data_row->DOCD_UTAMA;
			$DOCD_UTAMA_TYPE		= $data_row->DOCD_UTAMA_TYPE;
			$DOCD_PELENGKAP_1		= $data_row->DOCD_PELENGKAP_1;
			$DOCD_PELENGKAP_1_TYPE	= $data_row->DOCD_PELENGKAP_1_TYPE;
			$DOCD_PELENGKAP_2		= $data_row->DOCD_PELENGKAP_2;
			$DOCD_PELENGKAP_2_TYPE	= $data_row->DOCD_PELENGKAP_2_TYPE;
			$DOCD_PERSETUJUAN		= $data_row->DOCD_PERSETUJUAN;
			$DOCD_PERSETUJUAN_TYPE	= $data_row->DOCD_PERSETUJUAN_TYPE;
		}
		$data_update = array(
			'DOC_ID' => $DOC_ID,
			'DOC_STATUS' => "DIARSIPKAN",
			'DOC_STATUS_ACTIVITY' => "Diarsipkan Oleh System"
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data_update);
		$log = array(
			'LogDoc' => $DOC_ID,
			'LogAct' => 'Archived',
			'LogUserName' => 'System'
		);
		$this->db->insert('m_log', $log);
		if($is_ok){
			redirect(base_url('C_notification'),'refresh');
		}else{
			redirect(base_url('C_notification'),'refresh');
		}
	}

	public function sign(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		date_default_timezone_set('Asia/Jakarta');
		$si_key 	= $this->input->post('si_key');
		
		$si_userid	= $this->session->userdata("session_bgm_edocument_id");
		$date_now	= date('Y-m-d H:i:s');
		//-----------------------------------------------------------------------------------------------//
		$get_data = $this->M_library_database->DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($si_key);
		if(empty($get_data)||$get_data==""){
			echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		foreach($get_data as $data_row){
			$DOC_ID					= $data_row->DOC_ID;
			$DOC_DATE               = $data_row->DOC_DATE;
			$DOC_KATEGORI           = $data_row->DOC_KATEGORI;
			$DOC_JENIS              = $data_row->DOC_JENIS;
			$DOC_TIPE               = $data_row->DOC_TIPE;
			$DOC_GROUP_PROSES       = $data_row->DOC_GROUP_PROSES;
			$DOC_PROSES             = $data_row->DOC_PROSES;
			$DOC_NOMOR              = $data_row->DOC_NOMOR;
			$DOC_NAMA               = $data_row->DOC_NAMA;
			$DOC_WUJUD              = $data_row->DOC_WUJUD;
			$DOC_DISTRIBUSI         = $data_row->DOC_DISTRIBUSI;
			$DOC_KERAHASIAAN        = $data_row->DOC_KERAHASIAAN;
			$DOC_AKSES_LEVEL        = $data_row->DOC_AKSES_LEVEL;
			$DOC_PENGGUNA           = $data_row->DOC_PENGGUNA;
			$DOC_PEMILIK_PROSES     = $data_row->DOC_PEMILIK_PROSES;
			$DOC_PENYIMPAN          = $data_row->DOC_PENYIMPAN;
			$DOC_PENDISTRIBUSI      = $data_row->DOC_PENDISTRIBUSI;
			$DOC_VERSI              = $data_row->DOC_VERSI;
			$DOC_TGL_EFEKTIF        = $data_row->DOC_TGL_EFEKTIF;
			$DOC_PERIODE_PREVIEW	= $data_row->DOC_PERIODE_PREVIEW;
			$DOC_KATA_KUNCI         = $data_row->DOC_KATA_KUNCI;
			$DOC_ABSTRAK            = $data_row->DOC_ABSTRAK;
			$DOC_TERKAIT            = $data_row->DOC_TERKAIT;
			$DOC_MAKER              = $data_row->DOC_MAKER;
			$DOC_APPROVE            = $data_row->DOC_APPROVE;
			$DOC_STATUS             = $data_row->DOC_STATUS;
			$DOC_NOTE               = $data_row->DOC_NOTE;
			$DTSEKI_ID				= $data_row->DTSEKI_ID;
			$DTSEKI_KATEGORI        = $data_row->DTSEKI_KATEGORI;
			$DTSEJS_ID				= $data_row->DTSEJS_ID;
			$DTSEJS_JENIS           = $data_row->DTSEJS_JENIS;
			$DTSETE_ID				= $data_row->DTSETE_ID;
			$DTSETE_TIPE            = $data_row->DTSETE_TIPE;
			$DTSETE_SINGKATAN       = $data_row->DTSETE_SINGKATAN;
			$DTFM_ID				= $data_row->DTFM_ID;
			$DTFM_NAME              = $data_row->DTFM_NAME;
			$DNMD_ID				= $data_row->DNMD_ID;
			$DNMD_NAME              = $data_row->DNMD_NAME;
			$CL_ID					= $data_row->CL_ID;
			$CL_NAME                = $data_row->CL_NAME;
			$DOCD_UTAMA				= $data_row->DOCD_UTAMA;
			$DOCD_UTAMA_TYPE		= $data_row->DOCD_UTAMA_TYPE;
			$DOCD_PELENGKAP_1		= $data_row->DOCD_PELENGKAP_1;
			$DOCD_PELENGKAP_1_TYPE	= $data_row->DOCD_PELENGKAP_1_TYPE;
			$DOCD_PELENGKAP_2		= $data_row->DOCD_PELENGKAP_2;
			$DOCD_PELENGKAP_2_TYPE	= $data_row->DOCD_PELENGKAP_2_TYPE;
			$DOCD_PERSETUJUAN		= $data_row->DOCD_PERSETUJUAN;
			$DOCD_PERSETUJUAN_TYPE	= $data_row->DOCD_PERSETUJUAN_TYPE;
		}
		//-----------------------------------------------------------------------------------------------//
		$data_update = array(
			'DOC_ID' => $DOC_ID,
			'DOC_APPROVE' => $si_userid,
			'DOC_STATUS' => "PUBLISH",
			'DOC_NOTE' => "-"
		);
		//-----------------------------------------------------------------------------------------------//
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data_update);
		//-----------------------------------------------------------------------------------------------//
		if($is_ok){
			//INSERT TO LOG ???
			//-----------------------------------------------------------------------------------------------//
			echo '
				<script>
					alert("Pemutakhiran Data Berhasil");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
	}

	public function update()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		date_default_timezone_set('Asia/Jakarta');
		$si_key 	= $this->input->post('si_key');
		
		$si_userid	= $this->session->userdata("session_bgm_edocument_id");
		$date_now	= date('Y-m-d H:i:s');
		//-----------------------------------------------------------------------------------------------//
		$get_data = $this->M_library_database->DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($si_key);
		if(empty($get_data)||$get_data==""){
			echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		foreach($get_data as $data_row){
			$DOC_ID					= $data_row->DOC_ID;
			$DOC_DATE               = $data_row->DOC_DATE;
			$DOC_KATEGORI           = $data_row->DOC_KATEGORI;
			$DOC_JENIS              = $data_row->DOC_JENIS;
			$DOC_TIPE               = $data_row->DOC_TIPE;
			$DOC_GROUP_PROSES       = $data_row->DOC_GROUP_PROSES;
			$DOC_PROSES             = $data_row->DOC_PROSES;
			$DOC_NOMOR              = $data_row->DOC_NOMOR;
			$DOC_NAMA               = $data_row->DOC_NAMA;
			$DOC_WUJUD              = $data_row->DOC_WUJUD;
			$DOC_DISTRIBUSI         = $data_row->DOC_DISTRIBUSI;
			$DOC_KERAHASIAAN        = $data_row->DOC_KERAHASIAAN;
			$DOC_AKSES_LEVEL        = $data_row->DOC_AKSES_LEVEL;
			$DOC_PENGGUNA           = $data_row->DOC_PENGGUNA;
			$DOC_PEMILIK_PROSES     = $data_row->DOC_PEMILIK_PROSES;
			$DOC_PENYIMPAN          = $data_row->DOC_PENYIMPAN;
			$DOC_PENDISTRIBUSI      = $data_row->DOC_PENDISTRIBUSI;
			$DOC_VERSI              = $data_row->DOC_VERSI;
			$DOC_TGL_EFEKTIF        = $data_row->DOC_TGL_EFEKTIF;
			$DOC_PERIODE_PREVIEW	= $data_row->DOC_PERIODE_PREVIEW;
			$DOC_KATA_KUNCI         = $data_row->DOC_KATA_KUNCI;
			$DOC_ABSTRAK            = $data_row->DOC_ABSTRAK;
			$DOC_TERKAIT            = $data_row->DOC_TERKAIT;
			$DOC_MAKER              = $data_row->DOC_MAKER;
			$DOC_APPROVE            = $data_row->DOC_APPROVE;
			$DOC_STATUS             = $data_row->DOC_STATUS;
			$DOC_NOTE               = $data_row->DOC_NOTE;
			$DTSEKI_ID				= $data_row->DTSEKI_ID;
			$DTSEKI_KATEGORI        = $data_row->DTSEKI_KATEGORI;
			$DTSEJS_ID				= $data_row->DTSEJS_ID;
			$DTSEJS_JENIS           = $data_row->DTSEJS_JENIS;
			$DTSETE_ID				= $data_row->DTSETE_ID;
			$DTSETE_TIPE            = $data_row->DTSETE_TIPE;
			$DTSETE_SINGKATAN       = $data_row->DTSETE_SINGKATAN;
			$DTFM_ID				= $data_row->DTFM_ID;
			$DTFM_NAME              = $data_row->DTFM_NAME;
			$DNMD_ID				= $data_row->DNMD_ID;
			$DNMD_NAME              = $data_row->DNMD_NAME;
			$CL_ID					= $data_row->CL_ID;
			$CL_NAME                = $data_row->CL_NAME;
			$DOCD_UTAMA				= $data_row->DOCD_UTAMA;
			$DOCD_UTAMA_TYPE		= $data_row->DOCD_UTAMA_TYPE;
			$DOCD_PELENGKAP_1		= $data_row->DOCD_PELENGKAP_1;
			$DOCD_PELENGKAP_1_TYPE	= $data_row->DOCD_PELENGKAP_1_TYPE;
			$DOCD_PELENGKAP_2		= $data_row->DOCD_PELENGKAP_2;
			$DOCD_PELENGKAP_2_TYPE	= $data_row->DOCD_PELENGKAP_2_TYPE;
			$DOCD_PERSETUJUAN		= $data_row->DOCD_PERSETUJUAN;
			$DOCD_PERSETUJUAN_TYPE	= $data_row->DOCD_PERSETUJUAN_TYPE;
		}
		//-----------------------------------------------------------------------------------------------//
		$data_update = array(
			'DOC_ID' => $DOC_ID,
			'DOC_APPROVE' => "-",
			'DOC_STATUS' => "WAITING",
			'DOC_NOTE' => "-"
		);
		//-----------------------------------------------------------------------------------------------//
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data_update);
		//-----------------------------------------------------------------------------------------------//
		if($is_ok){
			//INSERT TO LOG ???
			//-----------------------------------------------------------------------------------------------//
			echo '
				<script>
					alert("Pemutakhiran Data Berhasil");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
	}

	public function view()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$this->load->view('V_news_view');
	}
	//-----------------------------------------------------------------------------------------------//
	public function detail()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$this->load->view('V_notification_detail');
	}
	//-----------------------------------------------------------------------------------------------//
	public function revisi()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$data['view'] = 'V_notification_revisi';
		$this->load->view('template', $data);
	}
	// Versioning
	public function versioning()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		$data['view'] = 'V_versioning';
		$this->load->view('template', $data);
	}
	public function versioning_meta()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		$this->load->view('V_versioning_meta');
	}
	public function versioning_isi()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		$this->load->view('V_versioning_isi');
	}

	public function versioning_isi_proses()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		date_default_timezone_set('Asia/Jakarta');
		$SESSION_DEPARTEMENT_ID = $this->session->userdata("session_bgm_edocument_departement_id");
		$SESSION_DIVISI_ID = $this->session->userdata("session_bgm_edocument_divisi_id");
		include(APPPATH.'libraries/pdf2txt/PdfToText.phpclass');
		include (APPPATH.'libraries/FPDF/Fpdf.php');
		include (APPPATH.'libraries/FPDI/fpdi.php');
		//STEP 1
		$catatan_versi 							= $this->input->post('catatan_versi');
		$si_template_new_group_proses			= $this->input->post('si_template_new_group_proses');
		$si_template_new_proses					= $this->input->post('si_template_new_proses');
		//STEP 2
		$si_header_no							= $this->input->post('si_header_no');
		$si_header_name							= $this->input->post('si_header_name');
		$si_header_master						= $this->input->post('si_header_master');
		$si_header_distribution					= $this->input->post('si_header_distribution');
		$si_header_confidential					= $this->input->post('si_header_confidential');
		//STEP 3
		$duallistbox_akses_level = $this->input->post('duallistbox_akses_level');
		$duallistbox_akses_level_length = count($duallistbox_akses_level);
		$duallistbox_akses_level_array = "";
		for($x = 0; $x < $duallistbox_akses_level_length; $x++) {
			$duallistbox_akses_level_array .= $duallistbox_akses_level[$x]."|";
		}
		$duallistbox_akses_level_list = substr($duallistbox_akses_level_array,0,-1);
		$duallistbox_pengguna_dokumen = $this->input->post('duallistbox_pengguna_dokumen');
		$duallistbox_pengguna_dokumen_length = count($duallistbox_pengguna_dokumen);
		$duallistbox_pengguna_dokumen_array = "";
		for($x = 0; $x < $duallistbox_pengguna_dokumen_length; $x++) {
			$duallistbox_pengguna_dokumen_array .= $duallistbox_pengguna_dokumen[$x]."|";
		}
		$duallistbox_pengguna_dokumen_list = substr($duallistbox_pengguna_dokumen_array,0,-1);
		
		$si_owner_pemilik_proses				= $this->input->post('si_owner_pemilik_proses');
		$si_owner_dept_penyimpan				= $this->input->post('si_owner_dept_penyimpan');
		$si_owner_dept_pendistribusi			= $this->input->post('si_owner_dept_pendistribusi');
		//STEP 4
		$si_history_version						= $this->input->post('si_history_version');
		$si_history_date1						= $this->input->post('si_history_date');
		$si_history_date 						= date('Y-m-d', strtotime($si_history_date1));
		$si_history_period						= $this->input->post('si_history_period');
		$si_history_date_final1					= $this->input->post('si_history_date_final');
		// $si_history_date_final 					= date('Y-m-d', strtotime($si_history_date_final1));
		$si_history_keyword						= $this->input->post('si_history_keyword');
		$si_history_abstract					= $this->input->post('si_history_abstract');
		//STEP 5
		$duallistbox_dokumen_terkait = $this->input->post('duallistbox_dokumen_terkait');
		if (!empty($duallistbox_dokumen_terkait)) {	
			$duallistbox_dokumen_terkait_length = count($duallistbox_dokumen_terkait);
			$duallistbox_dokumen_terkait_array 	= "";
			for($x = 0; $x < $duallistbox_dokumen_terkait_length; $x++) {
				$duallistbox_dokumen_terkait_array .= $duallistbox_dokumen_terkait[$x]."|";
			}
			$duallistbox_dokumen_terkait_list 	= substr($duallistbox_dokumen_terkait_array,0,-1);
		}else{
			$duallistbox_dokumen_terkait_list = "";
		}
		$si_history_date_final 					= DateTime::createFromFormat('d/M/Y', $si_history_date_final1)->format('Y-m-d');
		$watermark_text = $this->input->post('watermark');
		$GLOBALS['watermark_text'] = $watermark_text;
		//SYSTEM
		$si_code								= $this->input->post('si_code');
		$si_userid								= $this->input->post('si_userid');
		$date_now								= date('Y-m-d H:i:s');
		$si_approve 							= $this->input->post('si_approve');
		//Check on
		$dokumen_utama_on 						= $this->input->post('dokumen_utama_on');
		if (isset($dokumen_utama_on)) {
			$convert_dokumen_utama 				= 1;
		}else{
			$convert_dokumen_utama 				= 0;
		}
		$dokumen_pelengkap_1_on 				= $this->input->post('dokumen_pelengkap_1_on');
		if (isset($dokumen_pelengkap_1_on)) {
			$convert_dokumen_pelengkap_1 		= 1;
		}else{
			$convert_dokumen_pelengkap_1 		= 0;
		}
		$dokumen_pelengkap_2_on 				= $this->input->post('dokumen_pelengkap_2_on');
		if (isset($dokumen_pelengkap_2_on)) {
			$convert_dokumen_pelengkap_2 		= 1;
		}else{
			$convert_dokumen_pelengkap_2 		= 0;
		}
		$data_update_detail = array(
			'DOCD_UTAMA_STATUS' => $convert_dokumen_utama,
			'DOCD_PELENGKAP_1_STATUS' => $convert_dokumen_pelengkap_1,
			'DOCD_PELENGKAP_1_STATUS' => $convert_dokumen_pelengkap_2
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);



		// if ($si_owner_dept_pendistribusi==$SESSION_DEPARTEMENT_ID) {
		// 	$getPendistribusi = $this->M_library_database->GET_DEPT_DIVISI($si_owner_dept_pendistribusi);
		// 	foreach ($getPendistribusi as $data) {
		// 		$dv 		= $data->DI_ID;
		// 		$dv_code	= $data->DI_CODE;
		// 		$dv_name	= $data->DI_NAME;
		// 	}
		// 	$PENDISTRIBUSI_FINAL_CODE 	= $dv_code;
		// 	$PENDISTRIBUSI_FINAL_NAME 	= $dv_name;
		// 	// $STATUS_FINAL				= "MENUNGGU ATASAN PENCIPTA";
		// 	$STATUS_FINAL = $si_owner_dept_pendistribusi;
		// }elseif ($si_owner_dept_pendistribusi==$SESSION_DIVISI_ID) {
		// 	$getPendistribusi = $this->M_library_database->getDIVISI($si_owner_dept_pendistribusi);
		// 	foreach ($getPendistribusi as $data) {
		// 		$dv 		= $data->DI_ID;
		// 		$dv_code	= $data->DI_CODE;
		// 		$dv_name	= $data->DI_NAME;
		// 	}
		// 	$PENDISTRIBUSI_FINAL_CODE 	= $dv_code;
		// 	$PENDISTRIBUSI_FINAL_NAME 	= $dv_name;
		// 	// $STATUS_FINAL				= "MENUNGGU ATASAN PENCIPTA";
		// 	$STATUS_FINAL = $si_owner_dept_pendistribusi;
		// }else{
		// 	$getPendistribusi = $this->M_library_database->getDEPARTEMEN($si_owner_dept_pendistribusi);
		// 	foreach ($getPendistribusi as $data) {
		// 		$dpt 		= $data->DN_ID;
		// 		$dpt_code 	= $data->DN_CODE;
		// 		$dpt_name 	= $data->DN_NAME;
		// 	}
		// 	$PENDISTRIBUSI_FINAL_CODE 	= $dpt_code;
		// 	$PENDISTRIBUSI_FINAL_NAME 	= $dpt_name;
		// 	// $STATUS_FINAL				= "MENUNGGU PENDISTRIBUSI";
		// 	$STATUS_FINAL = $si_owner_dept_pendistribusi;
		// }
		if ($si_owner_dept_pendistribusi=='7550') {
			$getPendistribusi = $this->db->get_where('tb_departemen', array('DN_ID'=>$si_owner_dept_pendistribusi));
			foreach ($getPendistribusi->result() as $data) {
				$dt_divisi 		= $data->DN_ID;
				$dt_code_divisi 	= $data->DN_CODE;
				$dt_name_divisi 	= $data->DN_NAME;
			}
		} else {
			$getPendistribusi = $this->M_contribution->GET_PENDISTRIBUSI_DIVISI_FROM_DEPARTEMEN($si_owner_dept_pendistribusi);
			$getPendistribusi_2 = $this->M_contribution->GET_PENDISTRIBUSI_DIVISI_FROM_DIVISI($si_owner_dept_pendistribusi);
			if (!empty($getPendistribusi)) {
				$dt_divisi = $getPendistribusi[0]->DI_ID;
				$dt_name_divisi = $getPendistribusi[0]->DI_NAME;
				$dt_code_divisi = $getPendistribusi[0]->DI_CODE;
			}else{
				$dt_divisi = $getPendistribusi_2[0]->DI_ID;
				$dt_name_divisi = $getPendistribusi_2[0]->DI_NAME;
				$dt_code_divisi = $getPendistribusi_2[0]->DI_CODE;
			}
		}
		$PENDISTRIBUSI_FINAL_CODE 	= $dt_code_divisi;
		$PENDISTRIBUSI_FINAL_NAME 	= $dt_name_divisi;
		$STATUS_FINAL = $dt_divisi;

		//Upload Doc
		$config1['upload_path'] 				= './assets/original';
		$config1['upload_url'] 					= './assets/original';
		$config1['remove_spaces'] 				= TRUE;
		$config1['allowed_types'] 				= '*';
		$this->load->library('upload', $config1);
		//Dokumen Utama
		$dokumen_utama = $_FILES['dokumen_utama'];
		if ($_FILES['dokumen_utama']['size'] != 0) {
			$dokumen_utama_ext = $_FILES['dokumen_utama']['type'];
			$dokumen_utama_size = ($_FILES['dokumen_utama']['size'])/(1000*1000);
			$dokumen_utama_temp = $dokumen_utama['tmp_name'];
			$dokumen_utama_name = $_FILES['dokumen_utama']['name'];
			// Extention
			$dokumen_utama_extention = substr($dokumen_utama_name, strrpos($dokumen_utama_name, '.')+1);
			if ($this->upload->do_upload('dokumen_utama')) {
				$file1 = $this->upload->data('file_name');
				$file1Name = $this->upload->data('raw_name');
				if ($dokumen_utama_extention == 'doc' || $dokumen_utama_extention == 'docx' || $dokumen_utama_extention == 'xls' || $dokumen_utama_extention == 'xlsx' || $dokumen_utama_extention == 'ppt' || $dokumen_utama_extention == 'pptx' || $dokumen_utama_extention == 'vsd' || $dokumen_utama_extention == 'vsdx' || $dokumen_utama_extention == 'pdf') {
					// Converter
					shell_exec('export HOME=/tmp && libreoffice --headless --convert-to pdf --outdir assets/pdf assets/original/'.$file1);
					if ($dokumen_utama_extention=='pdf') {
						copy('./assets/original/'.$file1, './assets/pdf/'.$file1);
						$convert_dokumen_utama = 1;
					}
					$dokumen_search_acr = "";
					$txt1 = new PdfToText(base_url('assets/pdf/'.$file1Name.'.pdf'));
					$dokumen_search_acr = $txt1->Text;
					// Watermark Pdf
					$GLOBALS['dokumen_utama'] = './assets/pdf/'.$file1Name.'.pdf';
					chmod($GLOBALS['dokumen_utama'], 0777);
					include (APPPATH.'libraries/watermark_utama.php');
					$pdf = new Watermark_utama();
					$pdf->AddPage();
					$pdf->SetFont('Arial', '', 12);
					if($pdf->numPages>1) {
						for($i=2;$i<=$pdf->numPages;$i++) {
							$pdf->_tplIdx = $pdf->importPage($i);
							$pdf->AddPage();
						}
					}
					$pdf->Output($GLOBALS['dokumen_utama'],'F');
				}else{
					$dokumen_search_acr = $si_history_abstract;
				}
				
				$dokumen_utama_name = $file1Name;
	
			}else{
				$errors = $this->upload->display_errors();
				die($errors);
			}
			$data_update_detail = array(
				'DOCD_UTAMA' => $dokumen_utama_name,
				'DOCD_UTAMA_TYPE' => $dokumen_utama_ext,
				'DOCD_UTAMA_STATUS' => $convert_dokumen_utama,
				'DOCD_UTAMA_EXT' => $dokumen_utama_extention,
				'DOCD_SEARCH' => $dokumen_search_acr
			);
			$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);
			if(!$is_ok){
				echo '
					<script>
						alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
						window.location.href = "'.base_url('C_notification').'";
					</script>
				';
				exit();
			}
		}
		//Dokumen Pelengkap 1
		$dokumen_pelengkap_1 = $_FILES['dokumen_pelengkap_1'];
		if ($_FILES['dokumen_pelengkap_1']['size'] != 0) {
			$dokumen_pelengkap_1_ext = $_FILES['dokumen_pelengkap_1']['type'];
			$dokumen_pelengkap_1_size = ($_FILES['dokumen_pelengkap_1']['size'])/(1000*1000);
			$dokumen_pelengkap_1_temp = $dokumen_pelengkap_1['tmp_name'];
			$dokumen_pelengkap_1_name = $_FILES['dokumen_pelengkap_1']['name'];
			// Extention
			$dokumen_pelengkap_1_extention = substr($dokumen_pelengkap_1_name, strrpos($dokumen_pelengkap_1_name, '.')+1);
			if($this->upload->do_upload('dokumen_pelengkap_1')) {
				$file2 = $this->upload->data('file_name');
				$file2Name = $this->upload->data('raw_name');
				if ($dokumen_pelengkap_1_extention == 'doc' || $dokumen_pelengkap_1_extention == 'docx' || $dokumen_pelengkap_1_extention == 'xls' || $dokumen_pelengkap_1_extention == 'xlsx' || $dokumen_pelengkap_1_extention == 'ppt' || $dokumen_pelengkap_1_extention == 'pptx' || $dokumen_pelengkap_1_extention == 'vsd' || $dokumen_pelengkap_1_extention == 'vsdx' || $dokumen_pelengkap_1_extention == 'pdf') {
					shell_exec('export HOME=/tmp && libreoffice --headless -convert-to pdf --outdir assets/pdf assets/original/'.$file2);
					if ($dokumen_pelengkap_1_extention=='pdf') {
						copy('./assets/original/'.$file2, './assets/pdf/'.$file2);
						$convert_dokumen_pelengkap_1 = 1;
					}
					// Watermark Pdf
					$GLOBALS['dokumen_pelengkap_1'] = './assets/pdf/'.$file2Name.'.pdf';
					chmod($GLOBALS['dokumen_pelengkap_1'], 0777);
					include (APPPATH.'libraries/watermark_p1.php');
					$pdf = new Watermark_p1();
					$pdf->AddPage();
					$pdf->SetFont('Arial', '', 12);
					if($pdf->numPages>1) {
						for($i=2;$i<=$pdf->numPages;$i++) {
							$pdf->_tplIdx = $pdf->importPage($i);
							$pdf->AddPage();
						}
					}
					$pdf->Output($GLOBALS['dokumen_pelengkap_1'],'F');
				}
				$dokumen_pelengkap_1_name = $file2Name;

			}else{
				$errors = $this->upload->display_errors();
				die($errors);
			}
			$data_update_detail = array(
				'DOCD_PELENGKAP_1' => $dokumen_pelengkap_1_name,
				'DOCD_PELENGKAP_1_TYPE' => $dokumen_pelengkap_1_ext,
				'DOCD_PELENGKAP_1_STATUS' => $convert_dokumen_pelengkap_1,
				'DOCD_PELENGKAP_1_EXT' => $dokumen_pelengkap_1_extention
			);
			$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);
			if(!$is_ok){
				echo '
					<script>
						alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
						window.location.href = "'.base_url('C_notification').'";
					</script>
				';
				exit();
			}
		}
		//Dokumen Pelengkap 2
		$dokumen_pelengkap_2 = $_FILES['dokumen_pelengkap_2'];
		if ($_FILES['dokumen_pelengkap_2']['size'] != 0) {
			$dokumen_pelengkap_2_ext = $_FILES['dokumen_pelengkap_2']['type'];
			$dokumen_pelengkap_2_size = ($_FILES['dokumen_pelengkap_2']['size'])/(1000*1000);//IN MEGABYTE(MB)
			$dokumen_pelengkap_2_temp = $dokumen_pelengkap_2['tmp_name'];
			$dokumen_pelengkap_2_name = $_FILES['dokumen_pelengkap_2']['name'];
			// Extention
			$dokumen_pelengkap_2_extention = substr($dokumen_pelengkap_2_name, strrpos($dokumen_pelengkap_2_name, '.')+1);
			if ($this->upload->do_upload('dokumen_pelengkap_2')){
				$file3 = $this->upload->data('file_name');
				$file3Name = $this->upload->data('raw_name');
				if ($dokumen_pelengkap_2_extention == 'doc' || $dokumen_pelengkap_2_extention == 'docx' || $dokumen_pelengkap_2_extention == 'xls' || $dokumen_pelengkap_2_extention == 'xlsx' || $dokumen_pelengkap_2_extention == 'ppt' || $dokumen_pelengkap_2_extention == 'pptx' || $dokumen_pelengkap_2_extention == 'vsd' || $dokumen_pelengkap_2_extention == 'vsdx' || $dokumen_pelengkap_2_extention == 'pdf') {
					shell_exec('export HOME=/tmp && libreoffice --headless -convert-to pdf --outdir assets/pdf assets/original/'.$file3);
					if ($dokumen_pelengkap_2_extention=='pdf') {
						copy('./assets/original/'.$file3, './assets/pdf/'.$file3);
						$convert_dokumen_pelengkap_2 = 1;
					}
					// Watermark Pdf
					$GLOBALS['dokumen_pelengkap_2'] = './assets/pdf/'.$file3Name.'.pdf';
					chmod($GLOBALS['dokumen_pelengkap_2'], 0777);
					include (APPPATH.'libraries/watermark_p2.php');
					$pdf = new Watermark_p2();
					$pdf->AddPage();
					$pdf->SetFont('Arial', '', 12);
					if($pdf->numPages>1) {
						for($i=2;$i<=$pdf->numPages;$i++) {
							$pdf->_tplIdx = $pdf->importPage($i);
							$pdf->AddPage();
						}
					}
					$pdf->Output($GLOBALS['dokumen_pelengkap_2'],'F');
				}
				
				$dokumen_pelengkap_2_name = $file3Name;
				if (isset($dokumen_pelengkap_2_on)) {
					$convert_dokumen_pelengkap_2 = 1;
				}else{
					$convert_dokumen_pelengkap_2 = 0;
				}
			}else{
				$errors = $this->upload->display_errors();
				die($errors);
			}
			$data_update_detail = array(
				'DOCD_PELENGKAP_2' => $dokumen_pelengkap_2_name,
				'DOCD_PELENGKAP_2_TYPE' => $dokumen_pelengkap_2_ext,
				'DOCD_PELENGKAP_2_STATUS' => $convert_dokumen_pelengkap_2,
				'DOCD_PELENGKAP_2_EXT' => $dokumen_pelengkap_2_extention
			);
			$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);
			if(!$is_ok){
				echo '
					<script>
						alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
						window.location.href = "'.base_url('C_notification').'";
					</script>
				';
				exit();
			}
		}
		//Dokumen Persetujuan
		$dokumen_persetujuan = $_FILES['dokumen_persetujuan'];
		if ($_FILES['dokumen_persetujuan']['size'] != 0) {
			$dokumen_persetujuan_ext = $_FILES['dokumen_persetujuan']['type'];
			$dokumen_persetujuan_temp = $dokumen_persetujuan['tmp_name'];
			$dokumen_persetujuan_name = $_FILES['dokumen_persetujuan']['name'];
			if($this->upload->do_upload('dokumen_persetujuan')){
				$file4 = $this->upload->data('file_name');
				$GLOBALS['dokumen_persetujuan'] = './assets/original/'.$file4;
				chmod($GLOBALS['dokumen_persetujuan'], 0777);
				include (APPPATH.'libraries/watermark_persetujuan.php');
				$pdf = new Watermark_persetujuan();
				$pdf->AddPage();
				$pdf->SetFont('Arial', '', 12);
				if($pdf->numPages>1) {
					for($i=2;$i<=$pdf->numPages;$i++) {
						$pdf->_tplIdx = $pdf->importPage($i);
						$pdf->AddPage();
					}
				}
				$pdf->Output($GLOBALS['dokumen_persetujuan'],'F');
				$dokumen_persetujuan_name = $file4;
			}
			if ($this->upload->do_upload('dokumen_persetujuan')){}
			$data_update_detail = array(
				'DOCD_PERSETUJUAN' => $dokumen_persetujuan_name,
				'DOCD_PERSETUJUAN_TYPE' => $dokumen_persetujuan_ext
			);
			$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);
			if(!$is_ok){
				echo '
					<script>
						alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
						window.location.href = "'.base_url('C_notification').'";
					</script>
				';
				exit();
			}
		}
		//Dokumen Meta Data
		$data_update = array(
			'DOC_DATE' => $date_now,
			'DOC_GROUP_PROSES' => $si_template_new_group_proses,
			'DOC_PROSES' => $si_template_new_proses,
			'DOC_NOMOR' => $si_header_no,
			'DOC_NAMA' => $si_header_name,
			'DOC_WUJUD' => $si_header_master,
			'DOC_DISTRIBUSI' => $si_header_distribution,
			'DOC_KERAHASIAAN' => $si_header_confidential,
			'DOC_AKSES_LEVEL' => $duallistbox_akses_level_list,
			'DOC_PENGGUNA' => $duallistbox_pengguna_dokumen_list,
			'DOC_PEMILIK_PROSES' => $si_owner_pemilik_proses,
			'DOC_PENYIMPAN' => $si_owner_dept_penyimpan,
			'DOC_PENDISTRIBUSI' => $si_owner_dept_pendistribusi,
			'DOC_VERSI' => $si_history_version,
			'DOC_TGL_EFEKTIF' => $si_history_date,
			'DOC_PERIODE_PREVIEW' => $si_history_period,
			'DOC_TGL_EXPIRED' => $si_history_date_final,
			'DOC_KATA_KUNCI' => $si_history_keyword,
			'DOC_ABSTRAK' => $si_history_abstract,
			'DOC_TERKAIT' => $duallistbox_dokumen_terkait_list,
			'DOC_MAKER' => $si_userid,
			'DOC_STATUS' => $STATUS_FINAL,
			'DOC_STATUS_ACTIVITY' => "Menunggu Persetujuan dari ".$PENDISTRIBUSI_FINAL_CODE." (".$PENDISTRIBUSI_FINAL_NAME.")",
			'DOC_NOTE' => "-",
			'DOC_APPROVE' => "-"
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_REFISI_EVO($si_code,$data_update);
		// Insert Detail
		$data_versi = array(
			'DOCV_ID' => $this->M_library_module->GENERATOR_REFF(),
			'DOC_ID' => $si_code,
			'DOCV_DATE' => $date_now,
			'DOCV_DETAIL' => "PERUBAHAN META DATA DOKUMEN",
			'DOCV_CATATAN' => $catatan_versi,
		);
		$is_ok = $this->M_library_database->DB_INPUT_DATA_VERSIONING($data_versi);
		if($is_ok){
			$dt_notification = array(
				'DOC_ID' => $si_code,
				'PENGGUNA' => $duallistbox_pengguna_dokumen_list,
				'PEMILIK' => $si_owner_pemilik_proses,
				'PENDISTRIBUSI' => $si_owner_dept_pendistribusi
			);
			$insert = $this->db->delete('tb_document_notification', array('DOC_ID' => $si_code));
			$insert = $this->db->insert('tb_document_notification', $dt_notification);
			$insert = $this->db->delete('tb_notification_history', array('DOC_ID' => $si_code));

			$this->session->set_flashdata('pesan','Berhasil!');
			redirect(base_url('notification'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Gagal!');
			redirect(base_url('notification'),'refresh');
		}
	}
	public function versioning_meta_proses()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		date_default_timezone_set('Asia/Jakarta');
		$SESSION_DEPARTEMENT_ID = $this->session->userdata("session_bgm_edocument_departement_id");
		$SESSION_DIVISI_ID = $this->session->userdata("session_bgm_edocument_divisi_id");
		$date_now								= date('Y-m-d H:i:s');
		$duallistbox_pengguna_dokumen = $this->input->post('duallistbox_pengguna_dokumen');
		$duallistbox_pengguna_dokumen_length = count($duallistbox_pengguna_dokumen);
		$duallistbox_pengguna_dokumen_array = "";
		for($x = 0; $x < $duallistbox_pengguna_dokumen_length; $x++) {
			$duallistbox_pengguna_dokumen_array .= $duallistbox_pengguna_dokumen[$x]."|";
		}
		$duallistbox_pengguna_dokumen_list = substr($duallistbox_pengguna_dokumen_array,0,-1);
		$si_history_version						= $this->input->post('si_history_version');
		$si_history_date1						= $this->input->post('si_history_date');
		$si_history_date 						= date('Y-m-d', strtotime($si_history_date1));
		$si_history_period						= $this->input->post('si_history_period');
		$si_history_date_final1					= $this->input->post('si_history_date_final');
		$si_history_date_final 					= DateTime::createFromFormat('d/M/Y', $si_history_date_final1)->format('Y-m-d');
		$si_history_keyword						= $this->input->post('si_history_keyword');
		$si_history_abstract					= $this->input->post('si_history_abstract');
		$duallistbox_dokumen_terkait 			= $this->input->post('duallistbox_dokumen_terkait');
		$si_owner_pemilik_proses				= $this->input->post('si_owner_pemilik_proses');
		
		if (!empty($duallistbox_dokumen_terkait)) {
			$duallistbox_dokumen_terkait_length = count($duallistbox_dokumen_terkait);
			$duallistbox_dokumen_terkait_array = "";
			for($x = 0; $x < $duallistbox_dokumen_terkait_length; $x++) {
				$duallistbox_dokumen_terkait_array .= $duallistbox_dokumen_terkait[$x]."|";
			}
			$duallistbox_dokumen_terkait_list = substr($duallistbox_dokumen_terkait_array,0,-1);
		}else{
			$duallistbox_dokumen_terkait_list = "";
		}	
		$si_code								= $this->input->post('si_code');
		$si_userid								= $this->input->post('si_userid');
		$si_approve 							= $this->input->post('si_approve');
		
		$versi 									= $this->input->post('si_history_version');
		$catatan_versi 							= $this->input->post('catatan_versi');
		$si_owner_dept_pendistribusi 			= $this->input->post('si_owner_dept_pendistribusi');

		if ($si_owner_dept_pendistribusi=='7550') {
			$getPendistribusi = $this->db->get_where('tb_departemen', array('DN_ID'=>$si_owner_dept_pendistribusi));
			foreach ($getPendistribusi->result() as $data) {
				$dt_divisi 		= $data->DN_ID;
				$dt_code_divisi 	= $data->DN_CODE;
				$dt_name_divisi 	= $data->DN_NAME;
			}
		} else {
			$getPendistribusi = $this->M_contribution->GET_PENDISTRIBUSI_DIVISI_FROM_DEPARTEMEN($si_owner_dept_pendistribusi);
			$getPendistribusi_2 = $this->M_contribution->GET_PENDISTRIBUSI_DIVISI_FROM_DIVISI($si_owner_dept_pendistribusi);
			if (!empty($getPendistribusi)) {
				$dt_divisi = $getPendistribusi[0]->DI_ID;
				$dt_name_divisi = $getPendistribusi[0]->DI_NAME;
				$dt_code_divisi = $getPendistribusi[0]->DI_CODE;
			}else{
				$dt_divisi = $getPendistribusi_2[0]->DI_ID;
				$dt_name_divisi = $getPendistribusi_2[0]->DI_NAME;
				$dt_code_divisi = $getPendistribusi_2[0]->DI_CODE;
			}
		}

		$PENDISTRIBUSI_FINAL_CODE 	= $dt_code_divisi;
		$PENDISTRIBUSI_FINAL_NAME 	= $dt_name_divisi;
		$STATUS_FINAL = $dt_divisi;

		$data_update = array(
			'DOC_PENGGUNA' => $duallistbox_pengguna_dokumen_list,
			'DOC_VERSI' => $versi,
			'DOC_TGL_EFEKTIF' => $si_history_date,
			'DOC_PERIODE_PREVIEW' => $si_history_period,
			'DOC_TGL_EXPIRED' => $si_history_date_final,
			'DOC_KATA_KUNCI' => $si_history_keyword,
			'DOC_ABSTRAK' => $si_history_abstract,
			'DOC_TERKAIT' => $duallistbox_dokumen_terkait_list,
			'DOC_MAKER' => $si_userid,
			'DOC_STATUS' => $STATUS_FINAL,
			'DOC_STATUS_ACTIVITY' => "Menunggu Persetujuan dari ".$PENDISTRIBUSI_FINAL_CODE." (".$PENDISTRIBUSI_FINAL_NAME.")",
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_REFISI_EVO($si_code,$data_update);

		// Insert Detail
		$data_versi = array(
			'DOCV_ID' => $this->M_library_module->GENERATOR_REFF(),
			'DOC_ID' => $si_code,
			'DOCV_DATE' => $date_now,
			'DOCV_DETAIL' => "PERUBAHAN META DATA DOKUMEN",
			'DOCV_CATATAN' => $catatan_versi,
		);
		$is_ok = $this->M_library_database->DB_INPUT_DATA_VERSIONING($data_versi);
		if($is_ok){
			$dt_notification = array(
				'DOC_ID' => $si_code,
				'PENGGUNA' => $duallistbox_pengguna_dokumen_list,
				'PEMILIK' => $si_owner_pemilik_proses,
				'PENDISTRIBUSI' => $si_owner_dept_pendistribusi
			);
			$insert = $this->db->delete('tb_document_notification', array('DOC_ID' => $si_code));
			$insert = $this->db->insert('tb_document_notification', $dt_notification);
			$insert = $this->db->delete('tb_notification_history', array('DOC_ID' => $si_code));

			$this->session->set_flashdata('pesan','Berhasil!');
			redirect(base_url('notification'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Gagal!');
			redirect(base_url('notification'),'refresh');
		}

	}
	public function revisi_process()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		date_default_timezone_set('Asia/Jakarta');
		$SESSION_DEPARTEMENT_ID = $this->session->userdata("session_bgm_edocument_departement_id");
		$SESSION_DIVISI_ID = $this->session->userdata("session_bgm_edocument_divisi_id");
		include(APPPATH.'libraries/pdf2txt/PdfToText.phpclass');
		include (APPPATH.'libraries/FPDF/Fpdf.php');
		include (APPPATH.'libraries/FPDI/fpdi.php');
		//STEP 1
		$catatan_versi 							= $this->input->post('catatan_versi');
		$si_template_new_kategori				= $this->input->post('si_template_new_kategori');
		$si_template_new_jenis					= $this->input->post('si_template_new_jenis');
		$si_template_new_tipe					= $this->input->post('si_template_new_tipe');
		$si_template_new_group_proses			= $this->input->post('si_template_new_group_proses');
		$si_template_new_proses					= $this->input->post('si_template_new_proses');
		//STEP 2
		$si_header_no							= $this->input->post('si_header_no');
		$si_header_name							= $this->input->post('si_header_name');
		$si_header_master						= $this->input->post('si_header_master');
		$si_header_distribution					= $this->input->post('si_header_distribution');
		$si_header_confidential					= $this->input->post('si_header_confidential');
		//STEP 3
		$duallistbox_akses_level = $this->input->post('duallistbox_akses_level');
		$duallistbox_akses_level_length = count($duallistbox_akses_level);
		$duallistbox_akses_level_array = "";
		for($x = 0; $x < $duallistbox_akses_level_length; $x++) {
			$duallistbox_akses_level_array .= $duallistbox_akses_level[$x]."|";
		}
		$duallistbox_akses_level_list = substr($duallistbox_akses_level_array,0,-1);
		$duallistbox_pengguna_dokumen = $this->input->post('duallistbox_pengguna_dokumen');
		$duallistbox_pengguna_dokumen_length = count($duallistbox_pengguna_dokumen);
		$duallistbox_pengguna_dokumen_array = "";
		for($x = 0; $x < $duallistbox_pengguna_dokumen_length; $x++) {
			$duallistbox_pengguna_dokumen_array .= $duallistbox_pengguna_dokumen[$x]."|";
		}
		$duallistbox_pengguna_dokumen_list = substr($duallistbox_pengguna_dokumen_array,0,-1);
		
		$si_owner_pemilik_proses				= $this->input->post('si_owner_pemilik_proses');
		$si_owner_dept_penyimpan				= $this->input->post('si_owner_dept_penyimpan');
		$si_owner_dept_pendistribusi			= $this->input->post('si_owner_dept_pendistribusi');
		//STEP 4
		$si_history_version						= $this->input->post('si_history_version');
		$si_history_date1						= $this->input->post('si_history_date');
		$si_history_date 						= date('Y-m-d', strtotime($si_history_date1));
		$si_history_period						= $this->input->post('si_history_period');
		$si_history_date_final1					= $this->input->post('si_history_date_final');
		// $si_history_date_final 					= date('Y-m-d', strtotime($si_history_date_final1));
		$si_history_date_final 					= DateTime::createFromFormat('d/M/Y', $si_history_date_final1)->format('Y-m-d');
		$si_history_keyword						= $this->input->post('si_history_keyword');
		$si_history_abstract					= $this->input->post('si_history_abstract');
		//STEP 5
		$duallistbox_dokumen_terkait = $this->input->post('duallistbox_dokumen_terkait');
		if (!empty($duallistbox_dokumen_terkait)) {	
			$duallistbox_dokumen_terkait_length = count($duallistbox_dokumen_terkait);
			$duallistbox_dokumen_terkait_array 	= "";
			for($x = 0; $x < $duallistbox_dokumen_terkait_length; $x++) {
				$duallistbox_dokumen_terkait_array .= $duallistbox_dokumen_terkait[$x]."|";
			}
			$duallistbox_dokumen_terkait_list 	= substr($duallistbox_dokumen_terkait_array,0,-1);
		}else{
			$duallistbox_dokumen_terkait_list = "";
		}
		$watermark_text = $this->input->post('watermark');
		$GLOBALS['watermark_text'] = $watermark_text;
		$GLOBALS['watermark_second_text'] = '';//$this->__getWatermarkText();
		//SYSTEM
		$si_code								= $this->input->post('si_code');
		$si_userid								= $this->input->post('si_userid');
		$date_now								= date('Y-m-d H:i:s');
		$si_approve 							= $this->input->post('si_approve');
		
		//Check on
		$dokumen_utama_on 						= $this->input->post('dokumen_utama_on');
		if (isset($dokumen_utama_on)) {
			$convert_dokumen_utama 				= 1;
		}else{
			$convert_dokumen_utama 				= 0;
		}
		$dokumen_pelengkap_1_on 				= $this->input->post('dokumen_pelengkap_1_on');
		if (isset($dokumen_pelengkap_1_on)) {
			$convert_dokumen_pelengkap_1 		= 1;
		}else{
			$convert_dokumen_pelengkap_1 		= 0;
		}
		$dokumen_pelengkap_2_on 				= $this->input->post('dokumen_pelengkap_2_on');
		if (isset($dokumen_pelengkap_2_on)) {
			$convert_dokumen_pelengkap_2 		= 1;
		}else{
			$convert_dokumen_pelengkap_2 		= 0;
		}
		$data_update_detail = array(
			'DOCD_UTAMA_STATUS' => $convert_dokumen_utama,
			'DOCD_PELENGKAP_1_STATUS' => $convert_dokumen_pelengkap_1,
			'DOCD_PELENGKAP_2_STATUS' => $convert_dokumen_pelengkap_2
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);
		if ($si_owner_dept_pendistribusi=='7550') {
			$getPendistribusi = $this->db->get_where('tb_departemen', array('DN_ID'=>$si_owner_dept_pendistribusi));
			foreach ($getPendistribusi->result() as $data) {
				$dt 		= $data->DN_ID;
				$dt_code 	= $data->DN_CODE;
				$dt_name 	= $data->DN_NAME;
			}
		} else {
			$getPendistribusi = $this->M_contribution->GET_PENDISTRIBUSI_DIVISI_FROM_DEPARTEMEN($si_owner_dept_pendistribusi);
			$getPendistribusi_2 = $this->M_contribution->GET_PENDISTRIBUSI_DIVISI_FROM_DIVISI($si_owner_dept_pendistribusi);

			if (!empty($getPendistribusi)) {
				$dt = $getPendistribusi[0]->DI_ID;
				$dt_name = $getPendistribusi[0]->DI_NAME;
				$dt_code = $getPendistribusi[0]->DI_CODE;
			}else{
				$dt = $getPendistribusi_2[0]->DI_ID;
				$dt_name = $getPendistribusi_2[0]->DI_NAME;
				$dt_code = $getPendistribusi_2[0]->DI_CODE;
			}
		}

		$PENDISTRIBUSI_FINAL_CODE 	= $dt_code;
		$PENDISTRIBUSI_FINAL_NAME 	= $dt_name;
		$STATUS_FINAL = "Menunggu Persetujuan dari ".$PENDISTRIBUSI_FINAL_CODE." (".$PENDISTRIBUSI_FINAL_NAME.")";
		$Activity = $dt;
		
		try {
			if ($_FILES['dokumen_utama']['name']) {
				$document_utama_file_name = 'dokumen-utama-'.time().'-'.$_FILES['dokumen_utama']['name'];
				$config1['upload_path'] = './assets/original';
				$config1['upload_url'] = './assets/original';
				$config1['remove_spaces'] = TRUE;
				$config1['allowed_types']='*';
				$config1['file_name'] = $document_utama_file_name;
				$this->load->library('upload', $config1);
				// Extention
				$dokumen_utama_extention = substr($document_utama_file_name, strrpos($document_utama_file_name, '.')+1);
				if ($this->upload->do_upload('dokumen_utama')) {
					$file1 = $this->upload->data('file_name');
					$file1Name = $this->upload->data('raw_name');
					if ($dokumen_utama_extention == 'doc' || $dokumen_utama_extention == 'docx' || $dokumen_utama_extention == 'xls' || $dokumen_utama_extention == 'xlsx' || $dokumen_utama_extention == 'ppt' || $dokumen_utama_extention == 'pptx' || $dokumen_utama_extention == 'vsd' || $dokumen_utama_extention == 'vsdx' || $dokumen_utama_extention == 'pdf') {
						// Converter
						shell_exec('export HOME=/tmp && libreoffice --headless --convert-to pdf --outdir assets/pdf assets/original/'.$file1);
						if ($dokumen_utama_extention=='pdf') {
							copy('./assets/original/'.$file1, './assets/pdf/'.$file1);
							$convert_dokumen_utama = 1;
						}
						$dokumen_search_acr = "";
						$txt1 = new PdfToText(base_url('assets/pdf/'.$file1Name.'.pdf'));
						$dokumen_search_acr = $txt1->Text;
						// Watermark Pdf
						$GLOBALS['dokumen_utama'] = './assets/pdf/'.$file1Name.'.pdf';
						chmod($GLOBALS['dokumen_utama'], 0777);
						include (APPPATH.'libraries/watermark_utama.php');
						$pdf = new Watermark_utama();
						$pdf->AddPage();
						$pdf->SetFont('Arial', '', 12);
						if($pdf->numPages>1) {
							for($i=2;$i<=$pdf->numPages;$i++) {
								$pdf->_tplIdx = $pdf->importPage($i);
								$pdf->AddPage();
							}
						}
						$pdf->Output($GLOBALS['dokumen_utama'],'F');
					}else{
						$dokumen_search_acr = $si_history_abstract;
					}
					$dokumen_utama_name = $file1Name;
				}else{
					$errors = $this->upload->display_errors();
					die($errors);
				}
				$data_update_dokumen_utama = array(
					'DOCD_UTAMA' => $dokumen_utama_name,
					'DOCD_UTAMA_TYPE' => $this->upload->data('file_type'),
					'DOCD_UTAMA_STATUS' => $convert_dokumen_utama,
					'DOCD_UTAMA_EXT' => $dokumen_utama_extention,
					'DOCD_SEARCH' => $dokumen_search_acr
				);
				$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_dokumen_utama);
				if(!$is_ok){
					echo '
						<script>
							alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
							window.location.href = "'.base_url('C_notification').'";
						</script>
					';
					exit();
				}
			}
		} catch (Exception $e) {
			$data=[];
			$data['document'] = $_FILES['dokumen_utama']['name'];
			$data['view'] = 'errors/html/contribution_error';
			$this->load->view('template', $data);
		}
		//Dokumen Pelengkap 1
		unset($this->upload);
		try {
			if ($_FILES['dokumen_pelengkap_1']['name']) {
				unset($this->upload);
				$document_pelengkap1_file_name = 'dokumen-pelengkap1-'.time().'-'.$_FILES['dokumen_pelengkap_1']['name'];
				$config2['upload_path'] = './assets/original';
				$config2['upload_url'] = './assets/original';
				$config2['remove_spaces'] = TRUE;
				$config2['allowed_types']='*';
				$config2['file_name'] = $document_pelengkap1_file_name;
				$this->load->library('upload', $config2);

				// Extention
				$dokumen_pelengkap_1_extention = substr($document_pelengkap1_file_name, strrpos($document_pelengkap1_file_name, '.')+1);
				if($this->upload->do_upload('dokumen_pelengkap_1')) {
					$file2 = $this->upload->data('file_name');
					$file2Name = $this->upload->data('raw_name');
					if ($dokumen_pelengkap_1_extention == 'doc' || $dokumen_pelengkap_1_extention == 'docx' || $dokumen_pelengkap_1_extention == 'xls' || $dokumen_pelengkap_1_extention == 'xlsx' || $dokumen_pelengkap_1_extention == 'ppt' || $dokumen_pelengkap_1_extention == 'pptx' || $dokumen_pelengkap_1_extention == 'vsd' || $dokumen_pelengkap_1_extention == 'vsdx' || $dokumen_pelengkap_1_extention == 'pdf') {
						shell_exec('export HOME=/tmp && libreoffice --headless -convert-to pdf --outdir assets/pdf assets/original/'.$file2);
						if ($dokumen_pelengkap_1_extention=='pdf') {
							copy('./assets/original/'.$file2, './assets/pdf/'.$file2);
							$convert_dokumen_pelengkap_1 = 1;
						}
						// Watermark Pdf
						$GLOBALS['dokumen_pelengkap_1'] = './assets/pdf/'.$file2Name.'.pdf';
						chmod($GLOBALS['dokumen_pelengkap_1'], 0777);
						include (APPPATH.'libraries/watermark_p1.php');
						$pdf = new Watermark_p1();
						$pdf->AddPage();
						$pdf->SetFont('Arial', '', 12);
						if($pdf->numPages>1) {
							for($i=2;$i<=$pdf->numPages;$i++) {
								$pdf->_tplIdx = $pdf->importPage($i);
								$pdf->AddPage();
							}
						}
						$pdf->Output($GLOBALS['dokumen_pelengkap_1'],'F');
					}
					$dokumen_pelengkap_1_name = $file2Name;
				}else{
					$errors = $this->upload->display_errors();
					die($errors);
				}
				$data_update_dokumen_pelengkap_1 = array(
					'DOCD_PELENGKAP_1' => $dokumen_pelengkap_1_name,
					'DOCD_PELENGKAP_1_TYPE' => $this->upload->data('file_type'),
					'DOCD_PELENGKAP_1_STATUS' => $convert_dokumen_pelengkap_1,
					'DOCD_PELENGKAP_1_EXT' => $dokumen_pelengkap_1_extention
				);
				$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_dokumen_pelengkap_1);
				if(!$is_ok){
					echo '
						<script>
							alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
							window.location.href = "'.base_url('C_notification').'";
						</script>
					';
					exit();
				}
			}
		} catch (Exception $e) {
			$data=[];
			$data['document'] = $_FILES['dokumen_pelengkap_1']['name'];
			$data['view'] = 'errors/html/contribution_error';
			$this->load->view('template', $data);
		}
		//Dokumen Pelengkap 2
		unset($this->upload);
		try {
			if ($_FILES['dokumen_pelengkap_2']['name']) {
				unset($this->upload);
				$document_pelengkap2_file_name = 'dokumen-pelengkap2-'.time().'-'.$_FILES['dokumen_pelengkap_2']['name'];
				$config3['upload_path'] = './assets/original';
				$config3['upload_url'] = './assets/original';
				$config3['remove_spaces'] = TRUE;
				$config3['allowed_types']='*';
				$config3['file_name'] = $document_pelengkap2_file_name;
				$this->load->library('upload', $config3);

				// Extention
				$dokumen_pelengkap_2_extention = substr($document_pelengkap2_file_name, strrpos($document_pelengkap2_file_name, '.')+1);
				if ($this->upload->do_upload('dokumen_pelengkap_2')){
					$file3 = $this->upload->data('file_name');
					$file3Name = $this->upload->data('raw_name');
					if ($dokumen_pelengkap_2_extention == 'doc' || $dokumen_pelengkap_2_extention == 'docx' || $dokumen_pelengkap_2_extention == 'xls' || $dokumen_pelengkap_2_extention == 'xlsx' || $dokumen_pelengkap_2_extention == 'ppt' || $dokumen_pelengkap_2_extention == 'pptx' || $dokumen_pelengkap_2_extention == 'vsd' || $dokumen_pelengkap_2_extention == 'vsdx' || $dokumen_pelengkap_2_extention == 'pdf') {
						shell_exec('export HOME=/tmp && libreoffice --headless -convert-to pdf --outdir assets/pdf assets/original/'.$file3);
						if ($dokumen_pelengkap_2_extention=='pdf') {
							copy('./assets/original/'.$file3, './assets/pdf/'.$file3);
							$convert_dokumen_pelengkap_2 = 1;
						}
						// Watermark Pdf
						$GLOBALS['dokumen_pelengkap_2'] = './assets/pdf/'.$file3Name.'.pdf';
						chmod($GLOBALS['dokumen_pelengkap_2'], 0777);
						include (APPPATH.'libraries/watermark_p2.php');
						$pdf = new Watermark_p2();
						$pdf->AddPage();
						$pdf->SetFont('Arial', '', 12);
						if($pdf->numPages>1) {
							for($i=2;$i<=$pdf->numPages;$i++) {
								$pdf->_tplIdx = $pdf->importPage($i);
								$pdf->AddPage();
							}
						}
						$pdf->Output($GLOBALS['dokumen_pelengkap_2'],'F');
					}
					
					$dokumen_pelengkap_2_name = $file3Name;
				}else{
					$errors = $this->upload->display_errors();
					die($errors);
				}
				$data_update_detail = array(
					'DOCD_PELENGKAP_2' => $dokumen_pelengkap_2_name,
					'DOCD_PELENGKAP_2_TYPE' => $this->upload->data('file_type'),
					'DOCD_PELENGKAP_2_STATUS' => $convert_dokumen_pelengkap_2,
					'DOCD_PELENGKAP_2_EXT' => $dokumen_pelengkap_2_extention
				);
				$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);
				if(!$is_ok){
					echo '
						<script>
							alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
							window.location.href = "'.base_url('C_notification').'";
						</script>
					';
					exit();
				}
			}
		} catch (Exception $e) {
			$data=[];
			$data['document'] = $_FILES['dokumen_pelengkap_2']['name'];
			$data['view'] = 'errors/html/contribution_error';
			$this->load->view('template', $data);
		}
		//Dokumen Persetujuan
		unset($this->upload);
		try {
			if ($_FILES['dokumen_persetujuan']['name']) {
				unset($this->upload);
				$document_persetujuan_file_name = 'dokumen-persetujuan-'.time().'-'.$_FILES['dokumen_persetujuan']['name'];
				$config4['upload_path'] = './assets/original';
				$config4['upload_url'] = './assets/original';
				$config4['remove_spaces'] = TRUE;
				$config4['allowed_types']='*';
				$config4['file_name'] = $document_persetujuan_file_name;
				$this->load->library('upload', $config4);

				if($this->upload->do_upload('dokumen_persetujuan')){
					$file4 = $this->upload->data('file_name');
					$GLOBALS['dokumen_persetujuan'] = './assets/original/'.$file4;
					chmod($GLOBALS['dokumen_persetujuan'], 0777);
					include (APPPATH.'libraries/watermark_persetujuan.php');
					$pdf = new Watermark_persetujuan();
					$pdf->AddPage();
					$pdf->SetFont('Arial', '', 12);
					if($pdf->numPages>1) {
						for($i=2;$i<=$pdf->numPages;$i++) {
							$pdf->_tplIdx = $pdf->importPage($i);
							$pdf->AddPage();
						}
					}
					$pdf->Output($GLOBALS['dokumen_persetujuan'],'F');
					$dokumen_persetujuan_name = $file4;
				}
				if ($this->upload->do_upload('dokumen_persetujuan')){}
				$data_update_detail = array(
					'DOCD_PERSETUJUAN' => $dokumen_persetujuan_name,
					'DOCD_PERSETUJUAN_TYPE' => $this->upload->data('file_type')
				);
				$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($si_code,$data_update_detail);
				if(!$is_ok){
					echo '
						<script>
							alert("Pemutakhiran Data Gagal, Mohon Cek Kembali");
							window.location.href = "'.base_url('C_notification').'";
						</script>
					';
					exit();
				}
			}
		} catch (Exception $e) {
			$data=[];
			$data['document'] = $_FILES['dokumen_persetujuan']['name'];
			$data['view'] = 'errors/html/contribution_error';
			$this->load->view('template', $data);
		}
		//Dokumen Meta Data
		$data_update = array(
			'DOC_DATE' => $date_now,		
			'DOC_KATEGORI' => $si_template_new_kategori,
			'DOC_JENIS' => $si_template_new_jenis,
			'DOC_TIPE' => $si_template_new_tipe,
			'DOC_GROUP_PROSES' => $si_template_new_group_proses,
			'DOC_PROSES' => $si_template_new_proses,
			'DOC_NOMOR' => $si_header_no,
			'DOC_NAMA' => $si_header_name,
			'DOC_WUJUD' => $si_header_master,
			'DOC_DISTRIBUSI' => $si_header_distribution,
			'DOC_KERAHASIAAN' => $si_header_confidential,
			'DOC_AKSES_LEVEL' => $duallistbox_akses_level_list,
			'DOC_PENGGUNA' => $duallistbox_pengguna_dokumen_list,
			'DOC_PEMILIK_PROSES' => $si_owner_pemilik_proses,
			'DOC_PENYIMPAN' => $si_owner_dept_penyimpan,
			'DOC_PENDISTRIBUSI' => $si_owner_dept_pendistribusi,
			'DOC_VERSI' => $si_history_version,
			'DOC_TGL_EFEKTIF' => $si_history_date,
			'DOC_PERIODE_PREVIEW' => $si_history_period,
			'DOC_TGL_EXPIRED' => $si_history_date_final,
			'DOC_KATA_KUNCI' => $si_history_keyword,
			'DOC_ABSTRAK' => $si_history_abstract,
			'DOC_TERKAIT' => $duallistbox_dokumen_terkait_list,
			'DOC_MAKER' => $si_userid,
			'DOC_STATUS' => $Activity,
			'DOC_STATUS_ACTIVITY' => $STATUS_FINAL,
			'DOC_NOTE' => "-",
			'DOC_APPROVE' => "-"
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT_REFISI_EVO($si_code,$data_update);
		$this->db->delete('tb_notification_history', array('DOC_ID' => $si_code));
		if($is_ok){
			$this->db->update('tb_document_notification', 
			array(
				'PENGGUNA' => $duallistbox_pengguna_dokumen_list,
				'PENDISTRIBUSI' => $si_owner_dept_pendistribusi,
				'PEMILIK' => $si_owner_pemilik_proses
			),
			array('DOC_ID' => $si_code) 
			);
			$this->Email_notification($si_code);
			redirect(base_url('notification'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Gagal!');
			redirect(base_url('notification'),'refresh');
		}
	}

	public function download_pdf($file)
	{
		date_default_timezone_set('Asia/Jakarta');
		include (APPPATH.'libraries/session_user.php');
		include (APPPATH.'libraries/FPDF/Fpdf.php');
		include (APPPATH.'libraries/FPDI/fpdi.php');
		$SESSION_ID = $this->session->userdata('session_bgm_edocument_id');
		$GLOBALS['nip'] = $SESSION_ID;
		$GLOBALS['nama'] = date('d/M/Y H:i')." WIB";
		$GLOBALS['document'] = './assets/pdf/'.$file;
		chmod($GLOBALS['document'], 0777);
		include (APPPATH.'libraries/watermark_footer.php');
		$pdf = new Watermark_footer();
		$pdf->AddPage();
		$pdf->SetFont('Arial', '', 12);
		if($pdf->numPages>1) {
			for($i=2;$i<=$pdf->numPages;$i++) {
				$pdf->_tplIdx = $pdf->importPage($i);
				$pdf->AddPage();
			}
		}
		$pdf->Output($file,'D');
		// $this->load->helper('download');
		// $name = $file;
		// $data = file_get_contents('./assets/pdf/'.$file); 
		// force_download($name, $data); 
		// redirect('index','refresh');
	}
	public function download_ori($file)
	{
		include (APPPATH.'libraries/session_user.php');
		$this->load->helper('download');
		$name = $file;
		$data = file_get_contents('./assets/original/'.$file); 
		force_download($name, $data); 
		redirect('index','refresh');
	}
	//-----------------------------------------------------------------------------------------------//
	public function get_data_document_structure_kategori_jenis_tipe(){
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_library_database->DB_GET_DATA_DOCUMENT_TEMPLATE_AUTO_BUILD_EVO($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}
	//-----------------------------------------------------------------------------------------------//
	public function get_data_document_structure_jenis(){
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_library_database->DB_GET_DATA_DOCUMENT_STRUCTURE_JENIS_EVO($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}
	//-----------------------------------------------------------------------------------------------//
	public function get_data_document_structure_tipe(){
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_library_database->DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_EVO($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}
	//-----------------------------------------------------------------------------------------------//
	public function get_data_document_structure_tipe_confidental(){
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_library_database->DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_CONFIDENTAL_EVO($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}
	public function get_data_document_template_or_document_structure_tipe(){
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_library_database->DB_GET_DATA_DOCUMENT_TEMPLATE_OR_DOCUMENT_STRUCTURE_TIPE($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}
	//-----------------------------------------------------------------------------------------------//
	public function get_data_job_level_evo(){
		$data = $this->M_library_database->DB_GET_JOB_LEVEL_EVO();
		$result = json_encode($data);
		echo $result;exit();
	}
	//-----------------------------------------------------------------------------------------------//
	public function get_data_job_level_evo_ext(){
		$post_data = $this->input->post();
		$id_key = $post_data['id_key'];
		$data = $this->M_library_database->DB_GET_JOB_LEVEL_EVO_EXT($id_key);
		$result = json_encode($data);
		echo $result;exit();
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function comment_process(){
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		date_default_timezone_set('Asia/Jakarta');
		$si_docid	= $this->input->post('si_docid');
		$si_maker	= $this->input->post('si_maker');
		$si_review	= $this->input->post('si_review');
		
		$si_reff	= $this->M_library_module->GENERATOR_REFF();
		$si_userid	= $this->session->userdata("session_bgm_edocument_id");
		$date_now	= date('Y-m-d H:i:s');
		//-----------------------------------------------------------------------------------------------//
		$data_insert = array(
			'DTCT_ID' => $si_reff,
			'DOC_ID' => $si_docid,
			'DTCT_DATE' => $date_now,
			'DTCT_AUTHOR' => $si_maker,
			'DTCT_USER' => $si_userid,
			'DTCT_NOTE' => $si_review
		);
		//-----------------------------------------------------------------------------------------------//
		$is_ok = $this->M_library_database->DB_INSERT_DATA_DOCUMENT_COMMENT_EVO($data_insert);
		//-----------------------------------------------------------------------------------------------//
		if($is_ok){
			//INSERT TO LOG ???
			//-----------------------------------------------------------------------------------------------//
			echo '
				<script>
					alert("Penambahan Data Berhasil");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Penambahan Data Gagal, Mohon Cek Kembali");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
		}
	}
	public function reply_comment()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_notification').'";
				</script>
			';
			exit();
		}

		date_default_timezone_set('Asia/Jakarta');
		$date_now 	= date('Y-m-d H:i:s');
		$si_reff	= $this->M_library_module->GENERATOR_REFF();
		$dtct_id 	= $this->input->post('dtct_id');
		$komentar 	= $this->input->post('komentar');
		$data = array(
			'DTCR_ID' => $si_reff,
			'DTCT_ID' => $dtct_id,
			'DTCR_TIME' => $date_now,
			'DTCR_NOTE' => $komentar
		);
		$is_ok = $this->db->insert('tb_document_comment_reply', $data);
		if($is_ok){
			echo '
				<script>
					alert("Berhasil Dibalas");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
		}else{
			echo '
				<script>
					alert("Gagal membalas, Coba lagi");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
		}
	}

	public function delete_notification()
	{
		$user_id = $_SESSION['session_bgm_edocument_id'];
		$doc_id = $this->input->post('doc_id');
		$delete = $this->db->insert('tb_notification_history',
			array(
				'DOC_ID' => $doc_id,
				'USER_ID' => $user_id,
				'DELETE_DATE' => date('Y-m-d H:i:s')
			)
		);

		if ($delete) {
			echo json_encode(['status'=>'success']);
		}
	}

	public function delete_news()
	{
		$user_id = $_SESSION['session_bgm_edocument_id'];
		$doc_id = $this->input->post('news_doc_id');
		$delete = $this->db->insert('tb_news_history',
			array(
				'DOC_ID' => $doc_id,
				'USER_ID' => $user_id,
				'DELETE_DATE' => date('Y-m-d H:i:s')
			)
		);

		if ($delete) {
			redirect('C_notification');
		}
	}

	public function news_dashboard() {
		$data['view'] = 'news';
		$this->load->view('template', $data);
	}

	public function destroy_document($document_id) {
		try {
			$delete_tb_notification_history = $this->db->delete('tb_notification_history', ['DOC_ID' => $document_id]);
			$delete_tb_document_notification = $this->db->delete('tb_document_notification', ['DOC_ID' => $document_id]);
			$delete_tb_document_news = $this->db->delete('tb_document_news', ['DOC_ID' => $document_id]);
			$delete_tb_document_detail_status = $this->db->delete('tb_document_detail_status', ['DOC_ID' => $document_id]);
			$delete_tb_document_detail = $this->db->delete('tb_document_detail', ['DOC_ID' => $document_id]);
			$delete_tb_document_comment = $this->db->delete('tb_document_comment', ['DOC_ID' => $document_id]);
			$delete_tb_document_bookmark = $this->db->delete('tb_document_bookmark', ['DOC_ID' => $document_id]);
			$delete_tb_document = $this->db->delete('tb_document', ['DOC_ID' => $document_id]);
		} catch (Exception $e) {
			var_dump($e->getMessage());
		}

		redirect('C_notification');
	}

	public function setNewUser() {
		$nip = $this->input->post('nip');
		$doc_id = $this->input->post('doc_id');
		$query = $this->db->update('tb_document', ['DOC_MAKER' => $nip], array('DOC_ID' => $doc_id));

		echo json_encode(['status'=>'success']);
	}

	private function __getWatermarkText() {
		$get_format = $this->db->select("*")
									->from('m_watermark')
									->get()->row_array();
		$field_1 = $this->__conversionWatermarkField($get_format['field_1']);
		$field_2 = $this->__conversionWatermarkField($get_format['field_2']);
		$field_3 = $this->__conversionWatermarkField($get_format['field_3']);
		$field_4 = $this->__conversionWatermarkField($get_format['field_4']);

		return $field_1 . ' - ' . $field_2 . ' - ' . $field_3 . ' - ' . $field_4;
	}

	private function __conversionWatermarkField($value) {
		switch($value) {
			case 'NIP':
				$text = $this->session->userdata("session_bgm_edocument_id");
				break;
			case 'Nama':
				$text = $this->session->userdata("session_bgm_edocument_name");
				break;
			case 'Tanggal/Bulan/Tahun':
				$text = date('d/M/Y');
				break;
			default:
				$text = $value;
		}

		return $text;
	}
}
//-----------------------------------------------------------------------------------------------//
