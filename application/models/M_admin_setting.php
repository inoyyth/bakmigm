<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_admin_setting extends CI_Model {

	public function GET_LVL_ORG()
	{
		$this->db->select('*');
		$this->db->from('tb_level_organization');
		$query = $this->db->get();
		return $query->result();
	}

	// TABEL DIREKTORAT
	public function GET_DIREKTORAT_ALL()
	{
		$this->db->select('*');
		$this->db->from('tb_structure_organization_direktorat');
		$this->db->join('tb_direktorat', 'tb_structure_organization_direktorat.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->order_by('tb_direktorat.DT_ID', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function INSERT_DIREKTORAT($data)
	{
		$this->db->insert('tb_direktorat', $data);
		return true;
	}
	public function INSERT_SO_DIREKTORAT($data_detail)
	{
		$this->db->insert('tb_structure_organization_direktorat', $data_detail);
		return true;
	}
	public function UPDATE_DIREKTORAT($data,$id)
	{
		$this->db->where('DT_ID', $id);
		$this->db->update('tb_direktorat', $data);
		return true;
	}
	public function UPDATE_SO_DIREKTORAT($data_detail,$id_sod)
	{
		$this->db->where('SODT_ID', $id_sod);
		$this->db->update('tb_structure_organization_direktorat', $data_detail);
		return true;
	}
	public function DELETE_DIREKTORAT($id)
	{
		$this->db->where('DT_ID', $id);
		$this->db->delete('tb_direktorat');
		return true;
	}
	// END TABEL DIREKTORAT

	// TABEL DIVISI
	public function GET_DIVISI_ALL()
	{
		$this->db->select('*');
		$this->db->from('tb_divisi');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->order_by('tb_divisi.DI_CODE', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_DIVISI_PARENT()
	{
		$this->db->select('*');
		$this->db->from('tb_direktorat');
		$this->db->order_by('DT_ID', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_USER_BY_DIVISI($DN_ID)
	{
		$this->db->select('*');
		$this->db->from('tb_user');
		$this->db->join('tb_departemen', 'tb_user.DN_ID = tb_departemen.DN_ID', 'left');
		$this->db->where('tb_user.RS_ID', 'ATASAN PENCIPTA');
		$this->db->where('tb_departemen.DN_ID', $DN_ID);
		$query = $this->db->get();
		return $query->result();
	}
	public function INSERT_DIVISI($data)
	{
		$this->db->insert('tb_divisi', $data);
		return true;
	}
	public function INSERT_SO_DIVISI($data_detail)
	{
		$this->db->insert('tb_structure_organization_divisi', $data_detail);
		return true;
	}
	public function UPDATE_DIVISI($data,$id)
	{
		$this->db->where('DI_ID', $id);
		$this->db->update('tb_divisi', $data);
		return true;
	}
	public function UPDATE_SO_DIVISI($data_detail,$id_sod)
	{
		$this->db->where('SODI_ID', $id_sod);
		$this->db->update('tb_structure_organization_divisi', $data_detail);
		return true;
	}
	public function DELETE_DIVISI($id)
	{
		$this->db->where('DI_ID', $id);
		$this->db->delete('tb_divisi');
		return true;
	}
	// END TABEL DIVISI

	// TABEL DEPARTEMEN
	public function GET_DEPT_DIVISI_ALL()
	{
		$this->db->select('*');
		$this->db->from('tb_departemen');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->order_by('tb_departemen.DN_CODE', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_DEPT_PARENT()
	{
		$this->db->select('*');
		$this->db->from('tb_divisi');
		$this->db->order_by('DI_CODE', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_USER_BY_DEPARTEMEN($DN_ID)
	{
		$this->db->select('*');
		$this->db->from('tb_user');
		$this->db->where('tb_user.RS_ID !=', 'ATASAN PENCIPTA');
		$this->db->where('tb_user.DN_ID', $DN_ID);
		$query = $this->db->get();
		return $query->result();
	}
	public function INSERT_DEPARTEMEN($data)
	{
		$this->db->insert('tb_departemen', $data);
		return true;
	}
	public function INSERT_SO_DEPARTEMEN($data_detail)
	{
		$this->db->insert('tb_structure_organization_departemen', $data_detail);
		return true;
	}
	public function UPDATE_DEPARTEMEN($data,$id)
	{
		$this->db->where('DN_ID', $id);
		$this->db->update('tb_departemen', $data);
		return true;
	}
	public function UPDATE_SO_DEPARTEMEN($data_detail,$id_sod)
	{
		$this->db->where('SOD_ID', $id_sod);
		$this->db->update('tb_structure_organization_departemen', $data_detail);
		return true;
	}
	public function DELETE_DEPARTEMEN($id)
	{
		$this->db->where('DN_ID', $id);
		$this->db->delete('tb_departemen');
		return true;
	}
	// END TABEL DEPARTEMEN

	// USER SETTING
	public function GET_USER()
	{
		$this->db->select('*');
		$this->db->from('tb_user');
		$this->db->order_by('UR_ID', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_USER_DETAIL()
	{
		$this->db->select('*');
		$this->db->from('tb_user_detail');
		$this->db->join('tb_user', 'tb_user_detail.UR_ID = tb_user.UR_ID', 'left');
		$this->db->join('tb_departemen', 'tb_user.DN_ID = tb_departemen.DN_ID', 'left');
		$this->db->order_by('tb_user.UR_ID', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_USER_BY_ID($id)
	{
		$this->db->select('*');
		$this->db->from('tb_user');
		$this->db->join('tb_departemen', 'tb_user.DN_ID = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->where('tb_user.UR_ID', $id);
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_ROLE()
	{
		$this->db->select('*');
		$this->db->from('tb_roles');
		$this->db->order_by('RS_ID', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_ROLE_ARRAY()
	{
		$this->db->select('*');
		$this->db->from('tb_roles');
		$this->db->where('RS_ID !=', 'PENGGUNA');
		$this->db->order_by('RS_INDEX', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_JBL()
	{
		$this->db->select('*');
		$this->db->from('tb_job_level');
		$this->db->order_by('JBLL_INDEX', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	// END USER SETTING

	// STRUKTUR DOKUMEN
	public function GET_STRUKTUR_DOKUMEN_ALL()
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe');
		$this->db->join('tb_document_structure_jenis', 'tb_document_structure_tipe.DTSEJS_ID = tb_document_structure_jenis.DTSEJS_ID', 'left');
		$this->db->join('tb_document_structure_kategori', 'tb_document_structure_jenis.DTSEKI_ID = tb_document_structure_kategori.DTSEKI_ID', 'left');
		$this->db->where('tb_document_structure_tipe.DTSETE_ACTIVE', 1);
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_STRUKTUR_DOKUMEN_ALL_NA()
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe');
		$this->db->join('tb_document_structure_jenis', 'tb_document_structure_tipe.DTSEJS_ID = tb_document_structure_jenis.DTSEJS_ID', 'left');
		$this->db->join('tb_document_structure_kategori', 'tb_document_structure_jenis.DTSEKI_ID = tb_document_structure_kategori.DTSEKI_ID', 'left');
		$this->db->where('tb_document_structure_tipe.DTSETE_ACTIVE', 0);
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_KATEGORI()
	{
		
		$this->db->select('*');
		$this->db->from('tb_document_structure_kategori');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_JENIS()
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_jenis');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_STANDAR_KERAHASIAN()
	{
		$this->db->select('*');
		$this->db->from('tb_confidential');
		// $this->db->where('CL_ID !=', $id);
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_JOB_LEVEL()
	{
		$this->db->select('*');
		$this->db->from('tb_job_level');
		$this->db->order_by('JBLL_INDEX', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_PARENT_JENIS($parent)
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_jenis');
		$this->db->where('DTSEJS_ID', $parent);
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_TIPE_BY_ID($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe');
		$this->db->join('tb_document_structure_jenis', 'tb_document_structure_tipe.DTSEJS_ID = tb_document_structure_jenis.DTSEJS_ID', 'left');
		$this->db->join('tb_document_structure_kategori', 'tb_document_structure_jenis.DTSEKI_ID = tb_document_structure_kategori.DTSEKI_ID', 'left');
		$this->db->join('tb_confidential', 'tb_document_structure_tipe.CL_ID = tb_confidential.CL_ID', 'left');
		$this->db->where('tb_document_structure_tipe.DTSETE_ID', $id);
		$query = $this->db->get();
		return $query->result();
	}
	public function DISABLE_TIPE($id,$data)
	{
		$this->db->where('DTSETE_ID', $id);
		$this->db->update('tb_document_structure_tipe', $data);
		return true;
	}
	public function update($table,$kolom,$kode,$data)
	{
		$this->db->where($kolom, $kode);
		$this->db->update($table, $data);
		return true;
	}
	// END STRUKTUR DOKUMEN

	// LEVEL AKSES DPT
	public function GET_TIPE_ALL()
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe');
		$this->db->join('tb_confidential', 'tb_document_structure_tipe.CL_ID = tb_confidential.CL_ID', 'left');
		$this->db->join('tb_job_level', 'tb_document_structure_tipe.JBLL_ID = tb_job_level.JBLL_ID', 'left');
		$this->db->order_by('tb_document_structure_tipe.DTSETE_ID', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_TIPE_ALL_BY_ID($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe');
		$this->db->join('tb_document_structure_jenis', 'tb_document_structure_tipe.DTSEJS_ID = tb_document_structure_jenis.DTSEJS_ID', 'left');
		$this->db->join('tb_document_structure_kategori', 'tb_document_structure_jenis.DTSEKI_ID = tb_document_structure_kategori.DTSEKI_ID', 'left');
		$this->db->join('tb_confidential', 'tb_document_structure_tipe.CL_ID = tb_confidential.CL_ID', 'left');
		$this->db->join('tb_document_structure_tipe_access', 'tb_document_structure_tipe.DTSETE_ID = tb_document_structure_tipe_access.DTSETE_ID', 'left');
		$this->db->join('tb_departemen', 'tb_document_structure_tipe_access.TD_DN = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_document_structure_tipe_distribution', 'tb_document_structure_tipe.DTSETE_ID = tb_document_structure_tipe_distribution.DTSETE_ID', 'left');
		$this->db->where('tb_document_structure_tipe.DTSETE_ID', $id);
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_DEPARTEMEN_ACCSESS($id)
	{
		$this->db->select('*');
		$this->db->from('tb_document_structure_tipe_distribution');
		$this->db->join('tb_departemen', 'tb_document_structure_tipe_distribution.TDD_DN = tb_departemen.DN_ID', 'left');
		$this->db->where('tb_document_structure_tipe_distribution.TDD_DN', $id);
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_JBL_BY_ID()
	{
		$this->db->select('*');
		$this->db->from('tb_job_level');
		// $this->db->where('JBLL_ID !=', $id);
		$this->db->order_by('JBLL_INDEX', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_ARRAY_DEPARTEMEN($DN_ID)
	{
		$this->db->select('*');
		$this->db->from('tb_departemen');
		$this->db->where('DN_ID', $DN_ID);
		$query = $this->db->get();
		return $query->result();
	}
	// END LEVEL AKSES DPT
	public function delete($table,$kolom,$id)
	{
		$this->db->where($kolom, $id);
		$this->db->delete($table);
		return true;
	}

	// Data Master
	public function GET_GROUP_PROSES()
	{
		$this->db->select('*');
		$this->db->from('m_group');
		return $this->db->get()->result();
	}
	public function GET_PROSES()
	{
		$this->db->select('*');
		$this->db->from('m_proses');
		return $this->db->get()->result();
	}
	public function GET_WUJUD_DOKUMEN()
	{
		$this->db->select('*');
		$this->db->from('tb_document_form');
		return $this->db->get()->result();
	}
	public function GET_METHODE_DISTRIBUTION()
	{
		$this->db->select('*');
		$this->db->from('tb_distribution_method');
		return $this->db->get()->result();
	}
	public function GET_PRIODE_REVIEW()
	{
		$this->db->select('*');
		$this->db->from('tb_periode_preview');
		$this->db->order_by('PEPW_INDEX', 'ASC');
		return $this->db->get()->result();
	}

}

/* End of file M_admin_setting.php */
/* Location: ./application/models/M_admin_setting.php */