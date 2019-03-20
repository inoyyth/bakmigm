<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_library_report extends CI_Model {

	public function GET_COMMENT($DOC_ID)
	{
		// $where = "tb_document_comment.DTCT_DATE BETWEEN '".$dari."' AND '".$sampai."' ";
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document_comment');
			$this->db->join('tb_document', 'tb_document_comment.DOC_ID = tb_document.DOC_ID', 'left');
			$this->db->join('tb_employee', 'tb_document_comment.DTCT_USER = tb_employee.NIP', 'left');
			$this->db->where('tb_document_comment.DOC_ID', $DOC_ID);
			// $this->db->where($where);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_REPORT][GET_COMENTAR]".$error;
		}
		return $result;
	}

	public function GET_DOCUMENT_EX($DOC_ID)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document');
			$this->db->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left');
			$this->db->where('tb_document.DOC_ID', $DOC_ID);
			$this->db->where('tb_document.DOC_STATUS = "KADALUARSA" OR tb_document.DOC_TGL_EXPIRED = "DIARSIPKAN"');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_REPORT][GET_DOCUMENT_EX]".$error;
		}
		return $result;
	}

	public function GET_DOCUMENT_REVISI($DOC_ID)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document_detail_status');
			$this->db->join('tb_document	', 'tb_document.DOC_ID = tb_document_detail_status.DOC_ID', 'left');
			$this->db->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left');
			$this->db->where('tb_document.DOC_ID', $DOC_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_REPORT][GET_DOCUMENT_REVISI]".$error;
		}
		return $result;
	}

}

/* End of file M_library_report.php */
/* Location: ./application/models/M_library_report.php */