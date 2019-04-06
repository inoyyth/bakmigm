<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_general_setting extends CI_Controller {

	public function __construct()
	{
        parent::__construct();
		if($this->session->userdata('session_bgm_edocument_status') != "LOGIN"){
			redirect(base_url());
		}
        // $SESSION_ID = $this->session->userdata("session_bgm_edocument_id");
        // $SESSION_NAME = $this->session->userdata("session_bgm_edocument_name");
        // $SESSION_EMAIL = $this->session->userdata("session_bgm_edocument_email");

        // $SESSION_DIREKTORAT_ID = $this->session->userdata("session_bgm_edocument_direktorat_id");
        // $SESSION_DIREKTORAT_NAME = $this->session->userdata("session_bgm_edocument_direktorat_name");

        // $SESSION_DIVISI_ID = $this->session->userdata("session_bgm_edocument_divisi_id");
        // $SESSION_DIVISI_CODE = $this->session->userdata("session_bgm_edocument_divisi_code");
        // $SESSION_DIVISI_NAME = $this->session->userdata("session_bgm_edocument_divisi_name");

        // $SESSION_DEPARTEMENT_ID = $this->session->userdata("session_bgm_edocument_departement_id");
        // $SESSION_DEPARTEMENT_CODE = $this->session->userdata("session_bgm_edocument_departement_code");
        // $SESSION_DEPARTEMENT_NAME = $this->session->userdata("session_bgm_edocument_departement_name");

        // $SESSION_ROLES = $this->session->userdata("session_bgm_edocument_roles");
        // $SESSION_ROLES_2 = $this->session->userdata("session_bgm_edocument_roles_2");
        // $SESSION_ROLES_3 = $this->session->userdata("session_bgm_edocument_roles_3");
        // $SESSION_ROLES_4 = $this->session->userdata("session_bgm_edocument_roles_4");
        // $SESSION_ROLES_5 = $this->session->userdata("session_bgm_edocument_roles_5");

        // $SESSION_JOB_LEVEL_ID = $this->session->userdata("session_bgm_edocument_job_level_id");
        // $SESSION_JOB_LEVEL_NAME = $this->session->userdata("session_bgm_edocument_job_level_name");
        // $SESSION_JOB_LEVEL_INDEX = $this->session->userdata("session_bgm_edocument_job_level_index");
    }

    public function welcome_speech()
    {
        $data['view'] = 'V_welcome';
    	$this->load->view('template', $data);
    }

    public function welcome()
    {
        $data['view'] = 'welcome';
    	$this->load->view('template', $data);
    }

    public function update_speech()
    {
    	$id = $this->input->post('id');
    	$text = $this->input->post('text');

    	$config['upload_path'] = './template/icon/';
    	$config['allowed_types'] = 'gif|jpg|jpeg|png|bmp';
    	$config['remove_spaces'] = TRUE;
    	$this->load->library('upload', $config);
    	$table = 'm_icon';
    	$kolom = 'id';
    	$logo = $_FILES['logo'];
    	if ($_FILES['logo']['size']!=0) {
    		$name = $this->upload->data('file_name');
    		if ($this->upload->do_upload('logo')){
    			$data_img = array(
    				'logo' => $name,
    			);
    			$update = $this->M_general_setting->update($table,$kolom,$id,$data_img);
    		}
    	}
		$data = array(
			'text' =>$text
		);
		$update = $this->M_general_setting->update($table,$kolom,$id,$data);
    	if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_general_setting/welcome_speech'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_general_setting/welcome_speech'),'refresh');
		}
    }

    public function nomor()
    {
        $data['view'] = 'V_setting_nomor';
    	$this->load->view('template', $data);
    }
    public function get_nomor()
    {
        $data = $this->M_general_setting->GET_NOMOR_DOKUMEN();
        $result = json_encode($data);
        echo $result;
        exit();
    }
    public function update_nomor()
    {
        $code = $this->input->post('kode');
        $nama = $this->input->post('nama');
    	$field_1 = $this->input->post('field_1');
        $field_2 = $this->input->post('field_2');
        $field_3 = $this->input->post('field_3');
        $field_4 = $this->input->post('field_4');
        $field_5 = $this->input->post('field_5');
        $untuk = $this->input->post('untuk');
        if ($untuk == 'form') {
            $get = $this->db->get_where('m_nomor', array('untuk' => $untuk))->result();
            if (!empty($get)) {
                $this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Format untuk Form Sudah Ada');
                redirect(base_url('C_general_setting/nomor'),'refresh');
            }
        }
        $data = array(
            'Code' => $code,
            'Nama' => $nama,
            'field_1' => $field_1,
            'field_2' => $field_2,
            'field_3' => $field_3,
            'field_4' => $field_4,
            'field_5' => $field_5,
            'untuk' => $untuk
        );
        $insert = $this->db->insert('m_nomor', $data);
        if($insert){
            $this->session->set_flashdata('pesan','Penambahan data Berhasil');
            redirect(base_url('C_general_setting/nomor'),'refresh');
        }else{
            $this->session->set_flashdata('pesan_gagal','Penambahan data Gagal, Mohon cek kembali!');
            redirect(base_url('C_general_setting/nomor'),'refresh');
        }
    }

    public function hapus_nomor($id)
    {
        $hapus = $this->db->where('Code', $id)->delete('m_nomor');
        if($hapus){
            $this->session->set_flashdata('pesan','Hapus data Berhasil');
            redirect(base_url('C_general_setting/nomor'),'refresh');
        }else{
            $this->session->set_flashdata('pesan_gagal','Hapus data Gagal, Mohon cek kembali!');
            redirect(base_url('C_general_setting/nomor'),'refresh');
        }
    }

    public function format_dokumen()
    {
        $data['view'] = 'V_setting_format_dokumen';
        $this->load->view('template', $data);
    }

    public function watermark()
    {
        $data['view'] = 'V_setting_watermark';
    	$this->load->view('template', $data);
    }
    public function update_watermark()
    {
    	$id = "1";
    	$satu = $this->input->post('1');
    	$dua = $this->input->post('2');
    	$tiga = $this->input->post('3');
    	$empat = $this->input->post('4');
    	$table = 'm_watermark';
    	$kolom = 'id';
    	$data = array(
    		'field_1' => $satu,
    		'field_2' => $dua,
    		'field_3' => $tiga,
    		'field_4' => $empat
    	);
    	$update = $this->M_general_setting->update($table,$kolom,$id,$data);
    	if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_general_setting/watermark'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_general_setting/watermark'),'refresh');
		}
    }
    public function update_watermark2()
    {
    	$satu = $this->input->post('1');
    	$dua = $this->input->post('2');
    	$tiga = $this->input->post('3');
    	$empat = $this->input->post('4');

    	$table = 'm_watermark';
    	$kolom = 'id';
    	$order_ke_1 = "";
    	$order_ke_2 = "";
    	$order_ke_3 = "";
    	$order_ke_4 = "";
    	if ($satu) {
    		$order_ke_1 = "1";
    	}
    	if ($dua) {
    		$order_ke_2 = "2";
    	}
    	if ($tiga) {
    		$order_ke_3 = "3";
    	}
    	if ($empat) {
    		$order_ke_4 = "4";
    	}
    	$data = array($satu,$dua,$tiga,$empat);
    	$order = array($order_ke_1,$order_ke_2,$order_ke_3,$order_ke_4);
    	$jumlah = count($data);
    	for ($i=0; $i < $jumlah; $i++) {
    		$data_x = array(
    			'field' => $data[$i],
    			'order_ke' => $order[$i]
    		); 
    		$update = $this->M_general_setting->update($table,$kolom,$order[$i],$data_x);
    	}
    	if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_general_setting/watermark'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_general_setting/watermark'),'refresh');
		}
    }

    public function sharelink()
    {
        $data['view'] = 'V_setting_sharelink';
    	$this->load->view('template', $data);
    }
    public function update_sharelink()
    {
    	$id = $this->input->post('id');
    	$time = $this->input->post('time');

    	$table = 'm_sharelink';
    	$kolom = 'id';
    	$data = array(
    		'time' => $time
    	);
    	$update = $this->M_general_setting->update($table,$kolom,$id,$data);
    	if($update){
			$this->session->set_flashdata('pesan','Perubahan data Berhasil');
			redirect(base_url('C_general_setting/sharelink'),'refresh');
		}else{
			$this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
			redirect(base_url('C_general_setting/sharelink'),'refresh');
		}
    }

    public function update_format()
    {
       $nama = $this->input->post('nama');
       $variable = $this->input->post('variable');
       $nomor = $this->input->post('no');
       $tipe = $this->input->post('tipe');
       $subject = $this->input->post('subject');
       $body = $this->input->post('body');
       $data = array(
            'variable' => $variable,
            'nomor' => $nomor,
            'tipe' => $tipe,
            'subject' => $subject,
            'isi' => $body
        );
       $update = $this->db->update('m_format', $data, array('nama' => $nama));
       if($update){
            $this->session->set_flashdata('pesan','Perubahan data Berhasil');
            redirect(base_url('C_general_setting/format_dokumen'),'refresh');
        }else{
            $this->session->set_flashdata('pesan_gagal','Perubahan data Gagal, Mohon cek kembali!');
            redirect(base_url('C_general_setting/format_dokumen'),'refresh');
        }
    }

    public function get_format()
    {
        $id = $this->input->post('id_key');
        $data = $this->db->get_where('m_format', array('nama' => $id))->result();
        $result = json_encode($data);
        echo $result;exit();
    }

}

/* End of file C_general_setting.php */
/* Location: ./application/controllers/C_general_setting.php */