<?php
defined('BASEPATH') or exit('No direct script access allowed');
use Sendinblue\Mailin;

class C_menu extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('session_bgm_edocument_status') != "LOGIN") {
            redirect(base_url());
        }
        $this->load->model('M_library_database');
    }
    public function index()
    {
        include APPPATH . 'libraries/session_user.php';
        // Like (STATUS1,2,3,JBL,DN,DV,DT)
        if (empty($SESSION_DEPARTEMENT_ID) && !empty($SESSION_DIVISI_ID)) {

            $data['detail'] = $this->Model_detail->DB_GET_SEARCH_DATA_DOCUMENT_ARRAY("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", "", "", $SESSION_DIVISI_ID, "");

            // print_r($SESSION_DIVISI_ID);die();

        } elseif (empty($SESSION_DIVISI_ID) && !empty($SESSION_DIREKRORAT_ID)) {

            $data['detail'] = $this->Model_detail->DB_GET_SEARCH_DATA_DOCUMENT_ARRAY("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", "", "", "", $SESSION_DIREKRORAT_ID);
        } else {
            if ($SESSION_ROLES == "PENDISTRIBUSI" || $SESSION_ROLES == "ADMIN DOKUMEN" || $SESSION_ROLES_2 == "PENDISTRIBUSI" || $SESSION_ROLES_2 == "ADMIN DOKUMEN" || $SESSION_ROLES_3 == "PENDISTRIBUSI" || $SESSION_ROLES_3 == "ADMIN DOKUMEN" || $SESSION_ROLES_4 == "PENDISTRIBUSI" || $SESSION_ROLES_4 == "ADMIN DOKUMEN" || $SESSION_ROLES_5 == "PENDISTRIBUSI" || $SESSION_ROLES_5 == "ADMIN DOKUMEN") {

                $data['detail'] = $this->Model_detail->DB_GET_SEARCH_DATA_DOCUMENT_ARRAY("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $SESSION_JOB_LEVEL_ID, "", "", "");

            } elseif ($SESSION_ROLES == "PENCIPTA" || $SESSION_ROLES_2 == "PENCIPTA" || $SESSION_ROLES_3 == "PENCIPTA" || $SESSION_ROLES_4 == "PENCIPTA" || $SESSION_ROLES_5 == "PENCIPTA") {

                $data['detail'] = $this->Model_detail->DB_GET_SEARCH_DATA_DOCUMENT_ARRAY("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $SESSION_JOB_LEVEL_ID, $SESSION_DEPARTEMENT_ID, "", "");

            } else {

                $data['detail'] = $this->Model_detail->DB_GET_SEARCH_DATA_DOCUMENT_ARRAY("DIPUBLIKASI", "DIPUBLIKASI", "DIPUBLIKASI", $SESSION_JOB_LEVEL_ID, $SESSION_DEPARTEMENT_ID, "", "");

            }
        }
        $data['list_department'] = $this->M_library_database->getAllDepartemen();
        $data['view'] = 'V_menu';
        $this->load->view('template', $data);
    }

    public function cari()
    {
        include APPPATH . 'libraries/session_user.php';
        $q = $this->input->post('keyword');
        if ($q === "") {
            $keyword = array("");
        } else {
            $keyword = explode(", ", $q);
        }
        $jml_key = count($keyword);
        // LIKE ($keyword,$STATUS1,$STATUS2,$STATUS3,$JBLL_ID,$DN_ID,$DI_CODE,$DT_ID)
        $data['detail'] = array();
        if (empty($SESSION_DEPARTEMENT_ID) && !empty($SESSION_DIVISI_ID)) {

            for ($q = 0; $q < $jml_key; $q++) {
                $data['detail'] = $this->Model_detail->search($keyword[$q], "DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", "", "", $SESSION_DIVISI_ID, "");
            }

        } elseif (empty($SESSION_DIVISI_ID) && !empty($SESSION_DIREKRORAT_ID)) {

            for ($q = 0; $q < $jml_key; $q++) {
                $data['detail'] = $this->Model_detail->search($keyword[$q], "DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", "", "", "", $SESSION_DIREKRORAT_ID);
            }
        } else {
            if ($SESSION_ROLES == "PENDISTRIBUSI" || $SESSION_ROLES == "ADMIN DOKUMEN" || $SESSION_ROLES_2 == "PENDISTRIBUSI" || $SESSION_ROLES_2 == "ADMIN DOKUMEN" || $SESSION_ROLES_3 == "PENDISTRIBUSI" || $SESSION_ROLES_3 == "ADMIN DOKUMEN" || $SESSION_ROLES_4 == "PENDISTRIBUSI" || $SESSION_ROLES_4 == "ADMIN DOKUMEN" || $SESSION_ROLES_5 == "PENDISTRIBUSI" || $SESSION_ROLES_5 == "ADMIN DOKUMEN") {

                for ($q = 0; $q < $jml_key; $q++) {
                    $data['detail'] = $this->Model_detail->search($keyword[$q], "DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $SESSION_JOB_LEVEL_ID, "", "", "");
                }

            } elseif ($SESSION_ROLES == "PENCIPTA" || $SESSION_ROLES_2 == "PENCIPTA" || $SESSION_ROLES_3 == "PENCIPTA" || $SESSION_ROLES_4 == "PENCIPTA" || $SESSION_ROLES_5 == "PENCIPTA") {

                for ($q = 0; $q < $jml_key; $q++) {
                    $data['detail'] = $this->Model_detail->search($keyword[$q], "DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $SESSION_JOB_LEVEL_ID, $SESSION_DEPARTEMENT_ID, "", "");
                }

            } else {

                for ($q = 0; $q < $jml_key; $q++) {
                    $data['detail'] = $this->Model_detail->search($keyword[$q], "DIPUBLIKASI", "DIPUBLIKASI", "DIPUBLIKASI", $SESSION_JOB_LEVEL_ID, $SESSION_DEPARTEMENT_ID, "", "");
                }
            }
        }
        $test['detail'] = array_values(array_unique($data['detail'], SORT_REGULAR));
        function remove_empty($array)
        {
            return array_filter($array, '_remove_empty_internal');
        }

        function _remove_empty_internal($value)
        {
            return !empty($value) || $value === 0;
        }
        $data['list_department'] = $this->M_library_database->getAllDepartemen();
        $data['detail'] = array_values(remove_empty($test['detail']));
        $data['view'] = 'V_search';
        $this->load->view('template', $data);
    }

    public function cari_advance()
    {
        include APPPATH . 'libraries/session_user.php';
        $si_doc_type = $this->input->post('si_doc_type');
        $ssa_dept_owner = $this->input->post('ssa_dept_owner');
        $ssa_group_proces = $this->input->post('ssa_group_proces');
        $ssa_proces = $this->input->post('ssa_proces');
        if (empty($SESSION_DEPARTEMENT_ID) && !empty($SESSION_DIVISI_ID)) {

            $data['detail'] = $this->Model_detail->pencarian("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $si_doc_type, $ssa_dept_owner, $ssa_group_proces, $ssa_proces, "", "", $SESSION_DIVISI_ID, "");

        } elseif (empty($SESSION_DIVISI_ID) && !empty($SESSION_DIREKRORAT_ID)) {

            $data['detail'] = $this->Model_detail->pencarian("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $si_doc_type, $ssa_dept_owner, $ssa_group_proces, $ssa_proces, "", "", "", $SESSION_DIREKRORAT_ID);
        } else {
            if ($SESSION_ROLES == "PENDISTRIBUSI" || $SESSION_ROLES == "ADMIN DOKUMEN" || $SESSION_ROLES_2 == "PENDISTRIBUSI" || $SESSION_ROLES_2 == "ADMIN DOKUMEN" || $SESSION_ROLES_3 == "PENDISTRIBUSI" || $SESSION_ROLES_3 == "ADMIN DOKUMEN" || $SESSION_ROLES_4 == "PENDISTRIBUSI" || $SESSION_ROLES_4 == "ADMIN DOKUMEN" || $SESSION_ROLES_5 == "PENDISTRIBUSI" || $SESSION_ROLES_5 == "ADMIN DOKUMEN") {
                $data['detail'] = $this->Model_detail->pencarian("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $si_doc_type, $ssa_dept_owner, $ssa_group_proces, $ssa_proces, $SESSION_JOB_LEVEL_ID, "", "", "");

            } elseif ($SESSION_ROLES == "PENCIPTA" || $SESSION_ROLES_2 == "PENCIPTA" || $SESSION_ROLES_3 == "PENCIPTA" || $SESSION_ROLES_4 == "PENCIPTA" || $SESSION_ROLES_5 == "PENCIPTA") {

                $data['detail'] = $this->Model_detail->pencarian("DIPUBLIKASI", "KADALUARSA", "DIARSIPKAN", $si_doc_type, $ssa_dept_owner, $ssa_group_proces, $ssa_proces, $SESSION_JOB_LEVEL_ID, $SESSION_DEPARTEMENT_ID, "", "");

            } else {

                $data['detail'] = $this->Model_detail->pencarian("DIPUBLIKASI", "DIPUBLIKASI", "DIPUBLIKASI", $si_doc_type, $ssa_dept_owner, $ssa_group_proces, $ssa_proces, $SESSION_JOB_LEVEL_ID, $SESSION_DEPARTEMENT_ID, "", "");

            }
        }
        $data['list_department'] = $this->M_library_database->getAllDepartemen();
        $data['si_doc_type'] = $si_doc_type;
        $data['ssa_dept_owner'] = $ssa_dept_owner;
        $data['ssa_group_proces'] = $ssa_group_proces;
        $data['ssa_proces'] = $ssa_proces;
        $data['view'] = 'V_menu';
        $this->load->view('template', $data);
    }

    public function detail($id)
    {
        $_SESSION['link'] = base_url('document-details-' . $id);
        if ($this->session->userdata('session_bgm_edocument_status') != "LOGIN") {
            redirect(base_url('verif'));
        }
        include APPPATH . 'libraries/session_user.php';
        $get = $this->Model_detail->getDetailList($id);
        if (empty($get)) {
            echo '
				<script>
					alert("DATA NOT FOUND");
					window.location.href = "' . base_url('menu') . '";
				</script>
			';
            exit();
        }
        $data['detaillist'] = $this->Model_detail->getDetailList($id);
        $data['view'] = 'V_detail_list';
        $this->load->view('template', $data);
    }

    public function randomNumber($length)
    {
        $result = '';
        for ($i = 0; $i < $length; $i++) {
            $result .= mt_rand(0, 9);
        }
        return $result;
    }
    public function sharelink()
    {
        if ($this->session->userdata('session_bgm_edocument_status') != "LOGIN") {
            redirect(base_url());
        }

        include APPPATH . 'libraries/session_user.php';
        date_default_timezone_set('Asia/Jakarta');

        // Data
        $si_key = $this->input->post('si_key');
        $get_doc_id = $this->Model_detail->GET_DOKUMEN_BY_ID($si_key);
        foreach ($get_doc_id as $get_doc_id) {
            $DOC_NOMOR = $get_doc_id->DOC_NOMOR;
            $DOC_NAMA = $get_doc_id->DOC_NAMA;
        }
        $id = $this->input->post('email');
        $pesan = $this->input->post('pesan');
        $pengirim = $this->input->post('pengirim');
        $email_pengirim = $this->Model_detail->GET_EMAIL_PENGGUNA_BY_ID($pengirim);
        foreach ($email_pengirim as $email_pengirim) {
            $pengirim = $email_pengirim->FULL_NAME;
            $email_pengirim = $email_pengirim->EMAIL;
        }
        // Update token & get email
        $email = array();
        $jml = count($id);
        $token = $this->randomNumber(6);
        for ($z = 0; $z < $jml; $z++) {
            $get_email = $this->db->get_where('tb_employee', array('NIP' => $id[$z]))->result();
            foreach ($get_email as $k => $e) {
                $email[$e->EMAIL] = $e->FULL_NAME;
            }
        }
        // Random Kode
        $waktu = date('dmyHis');
        $kode = md5(uniqid($waktu . rand()));
        // Waktu Berlaku
        $get_waktu = $this->db->select('time')->from('m_sharelink')->get()->result();
        $time = $get_waktu[0]->time;
        $sekarang = date('Y-m-d H:i:s');
        $date = date_create($sekarang);
        date_add($date, date_interval_create_from_date_string($time . ' minutes'));
        $hasil = date_format($date, 'Y-m-d H:i:s');

        $url = base_url('document-' . $kode);
        $url_2 = base_url('document-details-' . $si_key);
        $data = array(
            'LINK_ID' => $kode,
            'DOC_ID' => $si_key,
            'TOKEN' => $token,
            'LINK_TIME' => $hasil,
        );

        $mailin = new Mailin($this->config->item('email_edoc')['url'], $this->config->item('email_edoc')['api_key'], $this->config->item('email_edoc')['timeout']);
        $data_email = array(
            "to" => $email,
            "cc" => $this->config->item('email_edoc')['cc'],
            "bcc" => $this->config->item('email_edoc')['bcc'],
            "from" => array($email_pengirim, $pengirim), //$this->config->item('email_edoc')['from'],
            "replyto" => $this->config->item('email_edoc')['replyto'],
            "subject" => 'Bagikan - ' . $DOC_NOMOR . ' - ' . $DOC_NAMA,
            "text" => "This is the text",
            "html" => $pengirim . " telah membagikan tautan dokumen ini : " . $DOC_NOMOR . " - " . $DOC_NAMA . "<br> Dengan pesan : <br>" . $pesan . "<br>Link : <a href=" . $url . ">" . $url . "</a><br>Sulahkan login dengan Token : " . $token,
        );
        // var_dump($mailin->send_email($data));die;
        if ($mailin->send_email($data_email)) {
            $insert = $this->db->insert('tb_document_link', $data);
            if ($insert) {
                $log = array();
                for ($x = 0; $x < $jml; $x++) {
                    $log[] = array(
                        'LogDoc' => $si_key,
                        'LogAct' => 'Sharelink',
                        'LogUserName' => $SESSION_ID,
                        // 'Shareto' => $NIP[$x]
                    );
                }
                $this->db->insert_batch('m_log', $log);
                $this->session->set_flashdata('pesan_email', 'Berhasil!');
                redirect($url_2, 'refresh');
            } else {
                $this->session->set_flashdata('pesan_email_gagal', 'Gagal1!');
                redirect($url_2, 'refresh');
            }
        } else {
            $this->session->set_flashdata('pesan_email_gagal', 'Gagal2!');
            redirect($url_2, 'refresh');
        }
    }

    public function link($kode)
    {
        date_default_timezone_set('Asia/Jakarta');
        $TODAY = date('Y-m-d H:i:s');
        $getKode = $this->Model_detail->GET_KODE_LINK($kode);
        if (!empty($getKode)) {
            foreach ($getKode as $getLink) {
                $LINK_ID = $getLink->LINK_ID;
                $DOC_ID = $getLink->DOC_ID;
                $LINK_TIME = $getLink->LINK_TIME;
            }
            if ($LINK_TIME >= $TODAY) {
                $_SESSION['link'] = base_url('document-' . $kode);
                if ($this->session->userdata('session_bgm_edocument_status') != "LOGIN") {
                    redirect(base_url());
                }
                $data['detaillist'] = $this->Model_detail->GET_DOC_BY_KODE($DOC_ID);
                $data['view'] = 'V_detail_list';
                $this->load->view('template', $data);
            } else {
                $delete = $this->Model_detail->DELETE_LINK_FROM_DB($LINK_ID);
                redirect(base_url(), 'refresh');
            }
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    public function comment()
    {
        if ($_SERVER['REQUEST_METHOD'] != "POST") {
            echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "' . base_url() . '";
				</script>
			';
            exit();
        }
        include APPPATH . 'libraries/session_user.php';
        date_default_timezone_set('Asia/Jakarta');
        $si_docid = $this->input->post('si_docid');
        $si_maker = $this->input->post('si_maker');
        $si_review = $this->input->post('si_review');

        $si_reff = $this->M_library_module->GENERATOR_REFF();
        $si_userid = $this->session->userdata("session_bgm_edocument_id");
        $date_now = date('Y-m-d H:i:s');
        $data_insert = array(
            'DTCT_ID' => $si_reff,
            'DOC_ID' => $si_docid,
            'DTCT_DATE' => $date_now,
            'DTCT_AUTHOR' => $si_maker,
            'DTCT_USER' => $si_userid,
            'DTCT_NOTE' => $si_review,
        );
        $insert = $this->db->insert('tb_document_comment', $data_insert);
        $log = array(
            'LogDoc' => $si_docid,
            'LogAct' => 'Komentar',
            'LogUserName' => $SESSION_ID,
        );
        $this->db->insert('m_log', $log);
        if ($insert) {
            echo '
				<script>
					alert("Penambahan Data Berhasil");
					window.location.href = "' . base_url('document-details-' . $si_docid) . '";
				</script>
			';
            exit();
        } else {
            echo '
				<script>
					alert("Penambahan Data Gagal, Mohon Cek Kembali");
					window.location.href = "' . base_url('document-details-' . $si_docid) . '";
				</script>
			';
            exit();
        }
    }

    public function zip($ID)
    {
        if ($this->session->userdata('session_bgm_edocument_status') != "LOGIN") {
            redirect(base_url());
        }
        if (empty($ID)) {
            redirect(base_url('menu'), 'refresh');
        }
        include APPPATH . 'libraries/session_user.php';
        include APPPATH . 'libraries/FPDF/Fpdf.php';
        include APPPATH . 'libraries/FPDI/fpdi.php';
        date_default_timezone_set('Asia/Jakarta');
        $data = array(
            'LogDoc' => $ID,
            'LogAct' => 'Download',
            'LogUserName' => $SESSION_ID,
        );
        $this->db->insert('m_log', $data);
        $this->load->library('zip');
        $get_data_doc = $this->Model_detail->getDOCD($ID);
        foreach ($get_data_doc as $data_row_doc) {
            $DOC_NOMOR = $data_row_doc->DOC_NOMOR;
            $DOC_NAMA = $data_row_doc->DOC_NAMA;
            $DOCD_UTAMA = $data_row_doc->DOCD_UTAMA;
            $EXT_UTAMA = $data_row_doc->DOCD_UTAMA_EXT;
            $STATUS_UTAMA = $data_row_doc->DOCD_UTAMA_STATUS;

            $DOCD_PELENGKAP_1 = $data_row_doc->DOCD_PELENGKAP_1;
            $EXT_1 = $data_row_doc->DOCD_PELENGKAP_1_EXT;
            $STATUS_1 = $data_row_doc->DOCD_PELENGKAP_1_STATUS;

            $DOCD_PELENGKAP_2 = $data_row_doc->DOCD_PELENGKAP_2;
            $EXT_2 = $data_row_doc->DOCD_PELENGKAP_2_EXT;
            $STATUS_2 = $data_row_doc->DOCD_PELENGKAP_2_STATUS;

            $DOCD_PERSETUJUAN = $data_row_doc->DOCD_PERSETUJUAN;
        }
        // FIle Dokumen Utama
        if ($STATUS_UTAMA == 1) {
            $GLOBALS['watermark_text'] = '';
            $GLOBALS['watermark_second_text'] = $this->__getWatermarkText();
            $GLOBALS['dokumen_utama'] = './assets/pdf/' . $DOCD_UTAMA . '.pdf';
            $GLOBALS['dokumen_utama_copy'] = './assets/pdf/' . $DOCD_UTAMA . '-' . $this->session->userdata("session_bgm_edocument_id") . '.pdf';
            copy($GLOBALS['dokumen_utama'], $GLOBALS['dokumen_utama_copy']);
            chmod($GLOBALS['dokumen_utama_copy'], 0777);
            include APPPATH . 'libraries/watermark/watermark_utama.php';
            $pdf = new Watermark_utama();
            $pdf->AddPage();
            $pdf->SetFont('Arial', '', 12);
            if ($pdf->numPages > 1) {
                for ($i = 2; $i <= $pdf->numPages; $i++) {
                    $pdf->_tplIdx = $pdf->importPage($i);
                    $pdf->AddPage();
                }
            }
            $pdf->Output($GLOBALS['dokumen_utama_copy'], 'F');
            $getUtama = $GLOBALS['dokumen_utama_copy'];
        } else {
            $file_utama = $DOCD_UTAMA . '.' . $EXT_UTAMA;
            $getUtama = './assets/original/' . $file_utama;
        }
        // File Dokumen Pelengkap 1
        if ($DOCD_PELENGKAP_1 != 'File_Not_Found') {
            if ($EXT_1 == 'doc' || $EXT_1 == 'docx' || $EXT_1 == 'xls' || $EXT_1 == 'xlsx' || $EXT_1 == 'vsd' || $EXT_1 == 'vsdx' || $EXT_1 == 'ppt' || $EXT_1 == 'pptx') {
                if ($STATUS_1 == 1) {
                    $GLOBALS['watermark_text'] = '';
                    $GLOBALS['watermark_second_text'] = $this->__getWatermarkText();
                    $GLOBALS['dokumen_pelengkap1'] = './assets/pdf/' . $DOCD_PELENGKAP_1 . '.pdf';
                    $GLOBALS['dokumen_pelengkap1_copy'] = './assets/pdf/' . $DOCD_PELENGKAP_1 . '-' . $this->session->userdata("session_bgm_edocument_id") . '.pdf';
                    copy($GLOBALS['dokumen_pelengkap1'], $GLOBALS['dokumen_pelengkap1_copy']);
                    chmod($GLOBALS['dokumen_pelengkap1_copy'], 0777);
                    include APPPATH . 'libraries/watermark/watermark_p1.php';
                    $pdf = new Watermark_p1();
                    $pdf->AddPage();
                    $pdf->SetFont('Arial', '', 12);
                    if ($pdf->numPages > 1) {
                        for ($i = 2; $i <= $pdf->numPages; $i++) {
                            $pdf->_tplIdx = $pdf->importPage($i);
                            $pdf->AddPage();
                        }
                    }
                    $pdf->Output($GLOBALS['dokumen_pelengkap1_copy'], 'F');
                    $get_1 = $GLOBALS['dokumen_pelengkap1_copy'];
                } else {
                    $file_1 = $DOCD_PELENGKAP_1 . '.' . $EXT_1;
                    $get_1 = './assets/original/' . $file_1;
                }
            } else {
                $file_1 = $DOCD_PELENGKAP_1 . '.' . $EXT_1;
                $get_1 = './assets/original/' . $file_1;
            }
        }
        // File Dokumen Pelengkap 2
        if ($DOCD_PELENGKAP_2 != 'File_Not_Found') {
            if ($EXT_2 == 'doc' || $EXT_2 == 'docx' || $EXT_2 == 'xls' || $EXT_2 == 'xlsx' || $EXT_2 == 'vsd' || $EXT_2 == 'vsdx' || $EXT_2 == 'ppt' || $EXT_2 == 'pptx') {
                if ($STATUS_2 == 1) {
                    $GLOBALS['watermark_text'] = '';
                    $GLOBALS['watermark_second_text'] = $this->__getWatermarkText();
                    $GLOBALS['dokumen_pelengkap2'] = './assets/pdf/' . $DOCD_PELENGKAP_2 . '.pdf';
                    $GLOBALS['dokumen_pelengkap2_copy'] = './assets/pdf/' . $DOCD_PELENGKAP_2 . '-' . $this->session->userdata("session_bgm_edocument_id") . '.pdf';
                    copy($GLOBALS['dokumen_pelengkap2'], $GLOBALS['dokumen_pelengkap2_copy']);
                    chmod($GLOBALS['dokumen_pelengkap2_copy'], 0777);
                    include APPPATH . 'libraries/watermark/watermark_p2.php';
                    $pdf = new Watermark_p2();
                    $pdf->AddPage();
                    $pdf->SetFont('Arial', '', 12);
                    if ($pdf->numPages > 1) {
                        for ($i = 2; $i <= $pdf->numPages; $i++) {
                            $pdf->_tplIdx = $pdf->importPage($i);
                            $pdf->AddPage();
                        }
                    }
                    $pdf->Output($GLOBALS['dokumen_pelengkap2_copy'], 'F');
                    $get_2 = $GLOBALS['dokumen_pelengkap2_copy'];
                } else {
                    $file_2 = $DOCD_PELENGKAP_2 . '.' . $EXT_2;
                    $get_2 = './assets/original/' . $file_2;
                }
            } else {
                $file_2 = $DOCD_PELENGKAP_2 . '.' . $EXT_2;
                $get_2 = './assets/original/' . $file_2;
            }
        }
        // File Dokumen Persetujuan
        $GLOBALS['watermark_text'] = '';
        $GLOBALS['watermark_second_text'] = $this->__getWatermarkText();
        $GLOBALS['dokumen_persetujuan'] = './assets/original/' . $DOCD_PERSETUJUAN;
        $GLOBALS['dokumen_persetujuan_copy'] = './assets/pdf/' . $DOCD_PERSETUJUAN . '-' . $this->session->userdata("session_bgm_edocument_id");
        copy($GLOBALS['dokumen_persetujuan'], $GLOBALS['dokumen_persetujuan_copy']);
        chmod($GLOBALS['dokumen_persetujuan_copy'], 0777);
        include APPPATH . 'libraries/watermark/watermark_persetujuan.php';
        $pdf = new Watermark_persetujuan();
        $pdf->AddPage();
        $pdf->SetFont('Arial', '', 12);
        if ($pdf->numPages > 1) {
            for ($i = 2; $i <= $pdf->numPages; $i++) {
                $pdf->_tplIdx = $pdf->importPage($i);
                $pdf->AddPage();
            }
        }
        $pdf->Output($GLOBALS['dokumen_persetujuan_copy'], 'F');
        $get_persetujuan = $GLOBALS['dokumen_persetujuan_copy'];
        // Add Info
        $tgl = date('Y-m-d');
        $name = 'info.txt';
        $text = 'Nomor Dokumen           : ' . $DOC_NOMOR .
        "\n\n" .
        'Nama Dokumen            : ' . $DOC_NAMA .
        "\n\n" .
        'Di Unduh pada tanggal   : ' . date('d/m/Y', strtotime($tgl)) .
            "\n\n" .
            'Oleh                    : ' . $SESSION_ID .
            "\n\n\n" .
            '===========================================' .
            "\n" .
            '           © Copyright Bakmi GM' .
            "\n" .
            '===========================================';
        $this->zip->add_data($name, $text);

        $this->zip->read_file($getUtama);
        $this->zip->read_file($get_1);
        $this->zip->read_file($get_2);
        $this->zip->read_file($get_persetujuan);
        $this->zip->download('[' . $ID . '] - ' . $DOC_NAMA . '.zip');
        unlink($GLOBALS['dokumen_utama_copy']);
        unlink($GLOBALS['dokumen_pelengkap1_copy']);
        unlink($GLOBALS['dokumen_pelengkap2_copy']);
        unlink($GLOBALS['dokumen_persetujuan_copy']);
    }

    public function setPictureProfile()
    {
        $employee_id = $this->input->post('employee_id');
        $picture = $this->input->post('picture');

        $config['upload_path'] = './assets/user-picture/';
        $config['allowed_types'] = 'jpeg|jpg|png';
        $config['file_name'] = round(microtime(true) * 1000);
        $config['overwrite'] = true;
        $config['max_size'] = 5000; // 1MB
        // $config['max_width']            = 1024;
        // $config['max_height']           = 768;

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('picture')) {
            $this->session->set_flashdata('msg', $this->upload->display_errors('', ''));
        }
        $is_exist_data = $this->db->from('employee_picture')->where('employee_id', $employee_id)->count_all_results();
        if ($is_exist_data == 1) {
            $data = array(
                'image_path' => "assets/user-picture/" . $this->upload->data("file_name"),
            );
            $this->db->update('employee_picture', $data, ['employee_id' => $employee_id]);
        } else {
            $data = array(
                'employee_id' => $employee_id,
                'image_path' => "assets/user-picture/" . $this->upload->data("file_name"),
            );

            $this->db->insert('employee_picture', $data);
        }

        redirect('welcome');
    }

    public function getProfilePicture($employee_id)
    {
        $data = $this->db->select('image_path')->from('employee_picture')->where('employee_id', $employee_id)->get()->row_array();

        echo json_encode($data);
    }

    public function logout()
    {
        $this->session->sess_destroy();
        // redirect(base_url());
        redirect('http://webportal.bakmigm.co.id/gms/home.php');
    }

    private function __getWatermarkText()
    {
        $get_format = $this->db->select("*")
            ->from('m_watermark')
            ->get()->row_array();
        $field_1 = $this->__conversionWatermarkField($get_format['field_1']);
        $field_2 = $this->__conversionWatermarkField($get_format['field_2']);
        $field_3 = $this->__conversionWatermarkField($get_format['field_3']);
        $field_4 = $this->__conversionWatermarkField($get_format['field_4']);

        return $field_1 . ' - ' . $field_2 . ' - ' . $field_3 . ' - ' . $field_4;
    }

    private function __conversionWatermarkField($value)
    {
        switch ($value) {
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