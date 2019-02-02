<?php
//-----------------------------------------------------------------------------------------------//
defined('BASEPATH') OR exit('No direct script access allowed');
//-----------------------------------------------------------------------------------------------//
class C_login extends CI_Controller {
    public function direct_login(){
		if($_SERVER['REQUEST_METHOD']!="GET" && $this->input->get('NIP')){
			echo '
				<script>
					alert("UNKNOWN COMMAND");
					window.location.href = "'.base_url('C_index').'";
				</script>
			';
			exit();
		}
	
		$si_userid = $this->input->get('NIP');

		$data_login = $this->M_library_database->DB_GET_DATA_LOGIN_DIRECT($si_userid);
		if(empty($data_login)){
			echo '
				<script>
					alert("USERID & PASSWORD NOT FOUND");
					window.location.href = "'.base_url('C_index').'";
				</script>
			';
			exit();
		}
		//$data_login[0] BECAUSE ONLY RETURN 1 ARRAY
		$session_data['session_bgm_edocument_status'] = "LOGIN";
		$session_data['session_bgm_edocument_id'] = $data_login[0]->NIP;
		$session_data['session_bgm_edocument_job_level_id'] = $data_login[0]->JOBLVL;
		$session_data['session_bgm_edocument_job_level_name'] = $data_login[0]->JOBTITLE;
		//SET VARIABLE SESSION
		$this->session->set_userdata($session_data);
		if ($_SESSION['link']) {
			redirect($_SESSION['link'],'refresh');
		}else{
			redirect(base_url('menu'));
		}
	}
}