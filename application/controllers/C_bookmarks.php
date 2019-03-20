<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_bookmarks extends CI_Controller {
	public function __construct(){
        parent::__construct();
        $this->load->model('Model_detail');
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
		include (APPPATH.'libraries/session_user.php');
		$data['bookmark'] = $this->Model_detail->DB_GET_SEARCH_DATA_DOCUMENT_ARRAY_BOOKMARK($SESSION_ID);
		// print_r($data);die();
		$this->load->view('V_bookmarks',$data);
	}
	public function cari_bookmark()
	{
		include (APPPATH.'libraries/session_user.php');
		$q = $this->input->post('keyword');
		$keyword = explode (", ",$q);
		$jml_key = count($keyword);
		$data['detail'] = array();
		if (empty($SESSION_DEPARTEMENT_ID) && !empty($SESSION_DIVISI_ID)) {

			for ($q=0; $q < $jml_key; $q++) {
				$data['detail'][] = $this->Model_detail->searchBookmark($keyword[$q],"PUBLIKASI","KADALUARSA","DIARSIPKAN",$SESSION_ID);
			}

		}elseif (empty($SESSION_DIVISI_ID) && !empty($SESSION_DIREKRORAT_ID)) {

			for ($q=0; $q < $jml_key; $q++) {
				$data['detail'][] = $this->Model_detail->searchBookmark($keyword[$q],"PUBLIKASI","KADALUARSA","DIARSIPKAN",$SESSION_ID);
			}

		}else{
			if ($SESSION_ROLES == "PENGGUNA") {
				
				for ($q=0; $q < $jml_key; $q++) {
					$data['detail'][] = $this->Model_detail->searchBookmark($keyword[$q],"PUBLIKASI","PUBLIKASI","PUBLIKASI",$SESSION_ID);
				}

			}else{

				for ($q=0; $q < $jml_key; $q++) {
					$data['detail'][] = $this->Model_detail->searchBookmark($keyword[$q],"PUBLIKASI","KADALUARSA","DIARSIPKAN",$SESSION_ID);
				}

			}
		}
		$test['detail'] = array_values(array_unique($data['detail'], SORT_REGULAR));

		function remove_empty($array) {
			return array_filter($array, '_remove_empty_internal');
		}

		function _remove_empty_internal($value) {
			return !empty($value) || $value === 0;
		}
		$data['detail'] = array_values(remove_empty($test['detail']));
		$this->load->view('V_bookmarks_search', $data);
	}
	public function bookmark()
	{
		if($_SERVER['REQUEST_METHOD']!="POST"){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_menu').'";
				</script>
			';
			exit();
		}
		include (APPPATH.'libraries/session_user.php');
		date_default_timezone_set('Asia/Jakarta');
		$si_key 		= $this->input->post('si_key');
		$ur_id 			= $this->input->post('ur_id');
		$cek = $this->Model_detail->cek_book($si_key,$ur_id);
		if ($cek) {
			$this->session->set_flashdata('pesan_gagal','Gagal!');
			redirect(base_url('document-details-'.$si_key),'refresh');
		}
		$data = array(
				'DOCB_ID' => $this->M_library_module->GENERATOR_REFF(),
				'DOC_ID' => $si_key,
				'UR_ID' => $SESSION_ID
		);
		$is_ok = $this->M_library_database->DB_INSERT_DATA_BOOKMARK($data);
		$log = array(
			'LogDoc' => $si_key,
			'LogAct' => 'Bookmark',
			'LogUserName' => $SESSION_ID
		);
		$this->db->insert('m_log', $log);
		if($is_ok){
			$this->session->set_flashdata('pesan','Berhasil!');
			redirect(base_url('document-details-'.$si_key),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Gagal!');
			redirect(base_url('document-details-'.$si_key),'refresh');
		}

	}

	function cari_advance_bookmark()
	{
		$si_doc_type = $this->input->post('si_doc_type');
		$ssa_dept_owner = $this->input->post('ssa_dept_owner');
		$ssa_group_proces = $this->input->post('ssa_group_proces');
		$ssa_proces = $this->input->post('ssa_proces');
		$data['bookmark'] = $this->Model_detail->pencarianbookmark($si_doc_type,$ssa_dept_owner,$ssa_group_proces,$ssa_proces);
		$this->load->view('V_bookmarks', $data);
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
		// $get_tipe = $this->db->get_where('tb_document_structure_tipe', array('DTSETE_ID' => $DOC_TIPE));
		$get_tipe = $this->db->select('*')->from('tb_document_structure_tipe')->where(array('DTSETE_ID' => $DOC_TIPE))->get()->result_array();
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
		// $get_user = 
		// $this->db->select('*')
		// 	->from('tb_document_notification')
		// 	->join('tb_employee', 'tb_document_notification.NIP = tb_employee.NIP', 'left')
		// 	->join('tb_document', 'tb_document_notification.DOC_ID = tb_document.DOC_ID', 'left')
		// 	->where(array('tb_document_notification.DOC_ID' => $DOC_ID))
		// 	->get()->result_array();
		$get_user = $this->db->select('*')->from('tb_document')
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
							->where(array('tb_document.DOC_ID'=>$DOC_ID))
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
	public function archived_by()
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
		$si_key 	= $this->input->post('si_key');
		$si_archived= $this->input->post('si_archived');
		$note 		= $this->input->post('note');
		date_default_timezone_set('Asia/Jakarta');
		$date = date('Y-m-d');
		$get_data 	= $this->M_library_database->DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($si_key);
		if(empty($get_data)||$get_data==""){
			echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "'.base_url('notification').'";
				</script>
			';
			exit();
		}
		//-----------------------------------------------------------------------------------------------//
		foreach($get_data as $data_row){
			$DOC_ID					= $data_row->DOC_ID;
			$DOC_MAKER				= $data_row->DOC_MAKER;
			$DOC_LEVEL				= $data_row->DOC_LEVEL;
			$DOC_STATUS             = $data_row->DOC_STATUS;
		}
		$data_update = array(
			'DOC_ID' => $DOC_ID,
			'DOC_TGL_EXPIRED' => $date,
			'DOC_APPROVE' => $SESSION_NAME,
			'DOC_STATUS' => "DIARSIPKAN",
			'DOC_STATUS_ACTIVITY' => "Diarsipkan oleh ".$SESSION_NAME,
			'DOC_NOTE' => $note
		);
		$is_ok = $this->M_library_database->DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data_update);
		$log = array(
			'LogDoc' => $DOC_ID,
			'LogAct' => 'Archived',
			'LogUserName' => $SESSION_ID
		);
		$this->db->insert('m_log', $log);
		if($is_ok){

			// Notif Archived

			$this->db->delete('tb_document_notification', array('DOC_ID' => $DOC_ID));

			$data_user_notif = array();
			if ($DOC_LEVEL == "DEPARTEMEN") {
				$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
				foreach ($get_user_bpi as $data => $v) {
					$data_user_notif[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $v->NIP
					);
				}
				$get_user_notif_pencipta = $this->M_contribution->GET_USER_NOTIF_PENCIPTA($DOC_MAKER);
				foreach ($get_user_notif_pencipta as $p => $e) {
					$data_user_notif[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $e->NIP
					);
					$DV = $e->DI_ID;
				}
				$get_user_notif_atasan = $this->M_contribution->GET_USER_NOTIF_ATASAN($DV);
				foreach ($get_user_notif_atasan as $a => $b) {
					$data_user_notif[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $b->NIP
					);
				}
			}elseif ($DOC_LEVEL == "DIVISI") {
				$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
				foreach ($get_user_bpi as $data => $v) {
					$data_user_notif[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $v->NIP
					);
				}
				$get_user_notif_pencipta = $this->M_notification->NOTIF_ARCHIV_DIVISI($DOC_MAKER);
				foreach ($get_user_notif_pencipta as $a => $b) {
					$data_user_notif[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $b->NIP
					);
					$DIR = $b->DT_ID;
				}
				$get_user_notif_atasan_nya_atasan = $this->M_contribution->GET_USER_NOTIF_ATASANNYA_ATASAN($DIR);
				foreach ($get_user_notif_atasan_nya_atasan as $a => $b) {
					$data_user_notif[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $b->NIP
					);
				}
			}else{
				$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
				foreach ($get_user_bpi as $data => $v) {
					$data_user_notif[] = array(
						'DOC_ID' => $DOC_ID,
						'UR_ID' => $v->NIP
					);
				}
				$data_user_notif[] = array(
					'DOC_ID' => $DOC_ID,
					'UR_ID' => $DOC_MAKER
				);
			}
			$insert = $this->db->insert_batch('tb_document_notification', $data_user_notif);

			$this->Email_archived($DOC_ID);
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
}
