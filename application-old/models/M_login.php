<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_login extends CI_Model {
	
	// Login Public
	public function DB_GET_LOGIN_TB_USER($username,$password)
	{
		$this->db->select('*');
		$this->db->from('tb_user');
		$this->db->join('tb_job_level', 'tb_user.JBLL_ID = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_departemen', 'tb_user.DN_ID = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_user.NIP = "'.$username.'" OR tb_user.UR_ID = "'.$username.'" AND tb_user.UR_PASSWORD = "'.$password.'"');
		return $this->db->get()->result();
	}
	public function DB_GET_LOGIN_DEPARTEMEN($username)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$username.'" OR tb_employee.USER_NAME = "'.$username.'"');
		return $this->db->get()->result();
	}
	public function DB_GET_LOGIN_DIVISI($username)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_divisi', 'tb_employee.DEPCODE = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$username.'" OR tb_employee.USER_NAME = "'.$username.'"');
		return $this->db->get()->result();
	}
	public function DB_GET_LOGIN_DIREKTORAT($username)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$username.'" OR tb_employee.USER_NAME = "'.$username.'"');
		return $this->db->get()->result();
	}
	// End Login Public


}

/* End of file M_login.php */
/* Location: ./application/models/M_login.php */