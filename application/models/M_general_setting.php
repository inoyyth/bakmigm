<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_general_setting extends CI_Model {

	public function GET_ICON()
	{
		$this->db->select('*');
		$this->db->from('m_icon');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_SHARELINK()
	{
		$this->db->select('*');
		$this->db->from('m_sharelink');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_WATERMARK()
	{
		$this->db->select('*');
		$this->db->from('m_watermark');
		$query = $this->db->get();
		return $query->result();
	}
	public function GET_WATERMARK2()
	{
		$this->db->select('*');
		$this->db->from('m_watermark');
		$query = $this->db->get();
		return $query->row();
	}
	public function update($table,$kolom,$id,$data)
	{
		$this->db->where($kolom, $id);
		$this->db->update($table, $data);
		return true;
	}
	public function GET_NOMOR_DOKUMEN()
	{
		$this->db->select('*');
		$this->db->from('m_nomor');
		$query = $this->db->get();
		return $query->result();
	}
}

/* End of file M_general_setting.php */
/* Location: ./application/models/M_general_setting.php */