<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_obselete extends CI_Controller {

	public function index()
	{
		date_default_timezone_set('Asia/Jakarta');
		$get_dokumen = $this->db->select('*')->from('tb_document')->get()->result();
		if (!empty($get_dokumen)) {
			foreach ($get_dokumen as $doc) {
				// Obselete
				$tanggal = new DateTime($doc->DOC_TGL_EXPIRED);
				$today = new DateTime('today');
				$y = $today->diff($tanggal)->y;
				$m = $today->diff($tanggal)->m;
				$d = $today->diff($tanggal)->d;
				
				if ($y == 0 && $m == 0 && $d == 0 && $doc->DOC_STATUS == "DIPUBLIKASI") {
					$data = array(
						'DOC_STATUS' => 'KADALUARSA',
						'DOC_STATUS_ACTIVITY' => 'KADALUARSA'
					);
					$this->db->update('tb_document', $data, array('DOC_ID', $doc->DOC_ID));
					$this->db->delete('tb_document_notification', array('DOC_ID' => $DOC_ID));
					$data_user_notif = array();
					if ($DOC_LEVEL == "DEPARTEMEN") {
						$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
						foreach ($get_user_bpi as $data => $v) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $v->NIP
							);
						}
						$get_user_notif_pencipta = $this->M_contribution->GET_USER_NOTIF_PENCIPTA($DOC_MAKER);
						foreach ($get_user_notif_pencipta as $p => $e) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $e->NIP
							);
							$DV = $e->DI_ID;
						}
						$get_user_notif_atasan = $this->M_contribution->GET_USER_NOTIF_ATASAN($DV);
						foreach ($get_user_notif_atasan as $a => $b) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $b->NIP
							);
						}
					}elseif ($DOC_LEVEL == "DIVISI") {
						$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
						foreach ($get_user_bpi as $data => $v) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $v->NIP
							);
						}
						$get_user_notif_pencipta = $this->M_notification->NOTIF_ARCHIV_DIVISI($DOC_MAKER);
						foreach ($get_user_notif_pencipta as $a => $b) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $b->NIP
							);
							$DIR = $b->DT_ID;
						}
						$get_user_notif_atasan_nya_atasan = $this->M_contribution->GET_USER_NOTIF_ATASANNYA_ATASAN($DIR);
						foreach ($get_user_notif_atasan_nya_atasan as $a => $b) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $b->NIP
							);
						}
					}else{
						$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
						foreach ($get_user_bpi as $data => $v) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $v->NIP
							);
						}
						$data_user_notif[] = array(
							'DOC_ID' => $doc->DOC_ID,
							'UR_ID' => $DOC_MAKER
						);
					}
					$insert = $this->db->insert_batch('tb_document_notification', $data_user_notif);
				}

				// Archived
				$sekarang = date('Y-m-d');
				$tgl_efektif = new DateTime($sekarang);
				$sebulan = date('Y-m-d', strtotime('+30 days', strtotime($doc->DOC_TGL_EXPIRED)));
				$sebulan2 = new DateTime($sebulan);
				$arcived = $sebulan2->diff($tgl_efektif)->format("%a");
				if ($arcived == 0 && $doc->DOC_STATUS == "KADALUARSA") {
					$data = array(
						'DOC_STATUS' => 'DIARSIPKAN',
						'DOC_STATUS_ACTIVITY' => 'Diarsipkan Oleh System'
					);
					$this->db->update('tb_document', $data, array('DOC_ID', $doc->DOC_ID));
					$this->db->delete('tb_document_notification', array('DOC_ID' => $DOC_ID));
					$data_user_notif = array();
					if ($DOC_LEVEL == "DEPARTEMEN") {
						$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
						foreach ($get_user_bpi as $data => $v) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $v->NIP
							);
						}
						$get_user_notif_pencipta = $this->M_contribution->GET_USER_NOTIF_PENCIPTA($DOC_MAKER);
						foreach ($get_user_notif_pencipta as $p => $e) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $e->NIP
							);
							$DV = $e->DI_ID;
						}
						$get_user_notif_atasan = $this->M_contribution->GET_USER_NOTIF_ATASAN($DV);
						foreach ($get_user_notif_atasan as $a => $b) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $b->NIP
							);
						}
					}elseif ($DOC_LEVEL == "DIVISI") {
						$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
						foreach ($get_user_bpi as $data => $v) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $v->NIP
							);
						}
						$get_user_notif_pencipta = $this->M_notification->NOTIF_ARCHIV_DIVISI($DOC_MAKER);
						foreach ($get_user_notif_pencipta as $a => $b) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $b->NIP
							);
							$DIR = $b->DT_ID;
						}
						$get_user_notif_atasan_nya_atasan = $this->M_contribution->GET_USER_NOTIF_ATASANNYA_ATASAN($DIR);
						foreach ($get_user_notif_atasan_nya_atasan as $a => $b) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $b->NIP
							);
						}
					}else{
						$get_user_bpi = $this->M_contribution->GET_USER_NOTIF_PENDISTRIBUSI('7550');
						foreach ($get_user_bpi as $data => $v) {
							$data_user_notif[] = array(
								'DOC_ID' => $doc->DOC_ID,
								'UR_ID' => $v->NIP
							);
						}
						$data_user_notif[] = array(
							'DOC_ID' => $doc->DOC_ID,
							'UR_ID' => $DOC_MAKER
						);
					}
					$insert = $this->db->insert_batch('tb_document_notification', $data_user_notif);
				}

			}
		}
	}

}

/* End of file C_obselete.php */
/* Location: ./application/controllers/C_obselete.php */