<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class M_contribution extends CI_Model {
	// GET PENDISTRIBUSI LEVEL DIVISI
	public function GET_PENDISTRIBUSI_DIVISI_FROM_DEPARTEMEN($DN)
	{
		$this->db->select('*');
		$this->db->from('tb_departemen');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_departemen.DN_ID', $DN);
		return $this->db->get()->result();
	}
	public function GET_PENDISTRIBUSI_DIVISI_FROM_DIVISI($DV)
	{
		$this->db->select('*');
		$this->db->from('tb_divisi');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_divisi.DI_ID', $DN);
		return $this->db->get()->result();
	}
	// END
	// Get Dokumen By ID Approve
	public function DB_GET_DOC_BY_ID($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document');
		$this->db->where('DOC_ID', $id);
		return $this->db->get()->result();
	}
	public function GET_USER_BY_ID_DEPARTEMEN($id)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$id.'" OR tb_employee.USER_NAME = "'.$id.'"');
		return $this->db->get()->result();
	}
	public function GET_USER_BY_ID_DIVISI($id)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_divisi', 'tb_employee.DEPCODE = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$id.'" OR tb_employee.USER_NAME = "'.$id.'"');
		return $this->db->get()->result();
	}
	public function GET_USER_BY_ID_DIREKTORAT($id)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$id.'" OR tb_employee.USER_NAME = "'.$id.'"');
		return $this->db->get()->result();
	}
	// END

	public function GET_USER_NOTIF_PENCIPTA($NIP)
	{
		$this->db->select('*');
		$this->db->from('tb_employee_detail');
		$this->db->join('tb_employee', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->where('tb_employee_detail.NIP', $NIP);
		return $this->db->get()->result();
	}
	public function GET_USER_NOTIF_PENDISTRIBUSI($DN)
	{
		$this->db->select('*');
		$this->db->from('tb_employee_detail');
		$this->db->join('tb_employee', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->where('tb_departemen.DN_ID', $DN);
		return $this->db->get()->result();
	}
	public function GET_USER_NOTIF_ATASAN($DV)
	{
		$this->db->select('*');
		$this->db->from('tb_employee_detail');
		$this->db->join('tb_employee', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
		$this->db->join('tb_divisi', 'tb_employee.DEPCODE = tb_divisi.DI_ID', 'left');
		$this->db->where('tb_divisi.DI_ID ', $DV);
		return $this->db->get()->result();
	}

	public function GET_USER_NOTIF_ATASANNYA_ATASAN($DIR)
	{
		$this->db->select('*');
		$this->db->from('tb_employee_detail');
		$this->db->join('tb_employee', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
		$this->db->join('tb_direktorat', 'tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_direktorat.DT_ID', $DIR);
		return $this->db->get()->result();
	}

	public function GET_DOKUMEN_ARRAY($DN,$JL)
	{
		$this->db->select('*');
		$this->db->from('tb_document');
		$this->db->where('DOC_STATUS', 'DIPUBLIKASI');
		$this->db->like('DOC_PENGGUNA', $DN, 'BOTH');
		$this->db->like('DOC_AKSES_LEVEL', $JL, 'BOTH');
		return $this->db->get()->result();
	}

	public function GET_USER_BY_DEPARTEMEN($DN_ID)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->where('DEPCODE', $DN_ID);
		return $this->db->get()->result_array();
	}

	public function GET_DOCUMENT_PENCIPTA($SESSION_ID)
	{
		$this->db->select('*');
		$this->db->from('tb_document');
		$this->db->join('tb_document_detail', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
		$this->db->join('tb_document_notification', 'tb_document.DOC_MAKER = tb_document_notification.UR_ID', 'left');
		$this->db->join('tb_document_structure_kategori', 'tb_document.DOC_KATEGORI = tb_document_structure_kategori.DTSEKI_ID', 'left');
		$this->db->join('tb_document_structure_jenis', 'tb_document.DOC_JENIS = tb_document_structure_jenis.DTSEJS_ID', 'left');
		$this->db->join('tb_document_structure_tipe', 'tb_document.DOC_TIPE = tb_document_structure_tipe.DTSETE_ID', 'left');
		$this->db->join('tb_document_form', 'tb_document.DOC_WUJUD = tb_document_form.DTFM_ID', 'left');
		$this->db->join('tb_distribution_method', 'tb_document.DOC_DISTRIBUSI = tb_distribution_method.DNMD_ID', 'left');
		$this->db->where('tb_document.DOC_MAKER', $SESSION_ID);
		return $this->db->get()->result();
	}
	public function buat_kode()   {
		$this->db->select('RIGHT(m_nomor,3) as kode', FALSE);
		$this->db->from('m_nomor');
		$this->db->where('untuk', 'form');
		$query = $this->db->get();   
		if ($query->num_rows() <> 0) {
			$data = $query->row();
			$kode = intval($data->kode) + 1;
		}else{
			$kode = 1;
		}
		$kodemax = str_pad($kode, 3, "0", STR_PAD_LEFT);
		$kodejadi = $kodemax;
		return $kodejadi;
	}
	public function GET_PENGGUNA_DOKUMEN()
	{
		$this->db->select('*');
		$this->db->from('tb_departemen');
		return $this->db->get()->result();
	}
	public function GET_DEPARTEMEN_ACCESS($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe_access');
		$this->db->join('tb_departemen', 'tb_document_structure_tipe_access.TD_DN = tb_departemen.DN_ID', 'left');
		$this->db->where('tb_departemen.DN_ID', $id);
		$this->db->order_by('tb_departemen.DN_NAME', 'ASC');
		return $this->db->get()->result();
	}
	public function GET_DEPARTEMEN_DISTRIBUTION($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe_distribution');
		$this->db->join('tb_departemen', 'tb_document_structure_tipe_distribution.TDD_DN = tb_departemen.DN_ID', 'left');
		$this->db->where('tb_departemen.DN_ID', $id);
		$this->db->order_by('tb_departemen.DN_NAME', 'ASC');
		return $this->db->get()->result();
	}
	public function GET_NOMER($id)
	{
		return $this->db->get_where('m_nomor', array('untuk' => $id))->result();
	}
	// Nomor Dokumen
	public function GET_RUNING_NOMOR($code)   {
		$this->db->select('RIGHT(m_nomor,3) as kode', FALSE);
		$this->db->from('m_nomor');
		$this->db->where('code', $code);
		$query = $this->db->get();   
		if ($query->num_rows() <> 0) {
			$data = $query->row();
			$kode = intval($data->kode) + 1;
		}else{
			$kode = 1;
		}
		$kodemax = str_pad($kode, 3, "0", STR_PAD_LEFT);
		$kodejadi = $kodemax;
		return $kodejadi;
	}
}

/* End of file M_contribution.php */
/* Location: ./application/models/M_contribution.php */