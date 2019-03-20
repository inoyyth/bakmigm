<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_notification extends CI_Model {
	public function GET_NOTIFICATION_NEW($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document_notification');
		$this->db->join('tb_document', 'tb_document_notification.DOC_ID = tb_document.DOC_ID', 'left');
		$this->db->join('tb_document_detail', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
		$this->db->join('tb_document_structure_kategori', 'tb_document.DOC_KATEGORI = tb_document_structure_kategori.DTSEKI_ID', 'left');
		$this->db->join('tb_document_structure_jenis', 'tb_document.DOC_JENIS = tb_document_structure_jenis.DTSEJS_ID', 'left');
		$this->db->join('tb_document_structure_tipe', 'tb_document.DOC_TIPE = tb_document_structure_tipe.DTSETE_ID', 'left');
		$this->db->join('tb_document_form', 'tb_document.DOC_WUJUD = tb_document_form.DTFM_ID', 'left');
		$this->db->join('tb_distribution_method', 'tb_document.DOC_DISTRIBUSI = tb_distribution_method.DNMD_ID', 'left');
		$this->db->join('tb_confidential', 'tb_document.DOC_KERAHASIAAN = tb_confidential.CL_ID', 'left');
		$this->db->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left outer');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID OR tb_employee.DEPCODE = tb_divisi.DI_ID', 'left outer');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID OR tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_document_notification.UR_ID', $id);
		return $this->db->get()->result();
	}
	public function GET_NEWS_NEW($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document_news');
		$this->db->join('tb_document', 'tb_document_news.DOC_ID = tb_document.DOC_ID', 'left');
		$this->db->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left');
		$this->db->where(array('tb_document_news.UR_ID' => $id, 'tb_document.DOC_STATUS' => 'DIPUBLIKASI'));
		$this->db->order_by('tb_document.DOC_DATE', 'ASC');
		return $this->db->get()->result();
	}
	public function NotifPencipta($NIP)
	{
		$result = "";
		try{
			$query = $this->db->query('
			SELECT
			*
			FROM
			tb_document
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.NIP
			INNER JOIN tb_departemen ON tb_employee.DEPCODE = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_document.DOC_MAKER LIKE "%'.$NIP.'%"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_notification][NotifPencipta]".$error;
		}
		return $result;
	}
	public function NotifPendistribusi($DN_ID,$STATUS)
	{
		$result = "";
		try{
			$query = $this->db->query('
			SELECT
			*
			FROM
			tb_document
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.NIP
			INNER JOIN tb_departemen ON tb_employee.DEPCODE = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_document.DOC_PENDISTRIBUSI LIKE "%'.$DN_ID.'%"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_notification][NotifPendistribusi]".$error;
		}
		return $result;
	}
	public function NotifAtasan($DI_CODE,$STATUS)
	{
		$result = "";
		try{
			$query = $this->db->query('
			SELECT
			*
			FROM
			tb_document
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.NIP
			INNER JOIN tb_departemen ON tb_employee.DEPCODE = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_divisi.DI_CODE LIKE "%'.$DI_CODE.'%"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_notification][NotifAtasan]".$error;
		}
		return $result;
	}

	public function NOTIF_ARCHIV_DIVISI($NIP)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_divisi', 'tb_employee.DEPCODE = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_employee.NIP', $NIP);
		return $this->db->get()->result();
	}
}

/* End of file M_notification.php */
/* Location: ./application/models/M_notification.php */