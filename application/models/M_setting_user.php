<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_setting_user extends CI_Model
{
	public function GET_DATA_EMPLOYEE_DETAIL()
	{
		$this->db->select('*');
		$this->db->from('tb_employee_detail');
		$this->db->join('tb_employee', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_job_level.JBLL_ID = tb_employee.JOBLVL', 'left');
		$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_employee.DEPCODE', 'left');
		$this->db->join('tb_roles', 'tb_employee_detail.ROLES = tb_roles.RS_ID', 'left');
		$this->db->order_by('tb_job_level.JBLL_INDEX', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}

	public function GET_DATA_EMPLOYEE()
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_job_level', 'tb_job_level.JBLL_ID = tb_employee.JOBLVL', 'left');
		$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_employee.DEPCODE', 'left');
		$this->db->order_by('tb_employee.FULL_NAME', 'ASC');
		$query = $this->db->get();
		return $query->result();
	}

	public function GET_DATA_EMPLOYEE_BY_ID($id)
	{
		$this->db->select('*,tb_employee.nip as emp_nip');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee.NIP = tb_employee_detail.NIP', 'left');
		$this->db->join('tb_job_level', 'tb_job_level.JBLL_ID = tb_employee.JOBLVL', 'left');
		$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_employee.DEPCODE', 'left');
		$this->db->where('tb_employee.NIP', $id);
		$query = $this->db->get();
		return $query->row_array();
	}

	public function UPDATE_DATA_EMPLOYEE_DETAIL($data,$id)
	{
		$this->db->where('NIP', $id);
		$this->db->update('tb_employee_detail', $data);
		return true;
	}

	public function GET_USER_DETAIL($id) {
		$this->db->select('*');
		$this->db->from('employee_detail');
		$this->db->where('NIP', $id);
		$query = $this->db->get();
		return $query->result();
	}

	public function DB_DATA_USER(){
		$result = "";
		try{
			//OLD
			$this->db->select('*');
			$this->db->from('tb_user');
			$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_user.DN_ID', 'left');
			$this->db->join('tb_divisi', 'tb_divisi.DI_ID = tb_departemen.DI_ID', 'left');
			$this->db->join('tb_direktorat', 'tb_direktorat.DT_ID = tb_divisi.DT_ID', 'left');
			$this->db->join('tb_roles', 'tb_roles.RS_ID = tb_user.RS_ID', 'left');
			$this->db->join('tb_job_level', 'tb_job_level.JBLL_ID = tb_user.JBLL_ID', 'left');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_DATA_USER]".$error;
		}
		return $result;
	}

	public function GET_DEPARTEMEN()
	{
		$this->db->select('*');
		$this->db->from('tb_departemen');
		$query = $this->db->get();
		return $query->result();
	}

	public function GET_JOB_LEVEL()
	{
		$this->db->select('*');
		$this->db->from('tb_job_level');
		$query = $this->db->get();
		return $query->result();
	}

	public function DB_DATA_USER_BY_ID(){
		$result = "";
		try{
			//OLD
			$this->db->select('*');
			$this->db->from('tb_user');
			$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_user.DN_ID', 'left');
			$this->db->join('tb_divisi', 'tb_divisi.DI_ID = tb_departemen.DI_ID', 'left');
			$this->db->join('tb_direktorat', 'tb_direktorat.DT_ID = tb_divisi.DT_ID', 'left');
			$this->db->join('tb_roles', 'tb_roles.RS_ID = tb_user.RS_ID', 'left');
			$this->db->join('tb_job_level', 'tb_job_level.JBLL_ID = tb_user.JBLL_ID', 'left');
			// $this->db->where('tb_user.NIP', $id);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_DATA_USER]".$error;
		}
		return $result;
	}

	public function UPDATE_DATA_USER($data,$id)
	{
		$this->db->where('NIP', $id);
		$this->db->update('tb_user', $data);
		return true;
	}

	public function DELETE_USER($id)
	{
		$this->db->where('NIP', $id);
		$this->db->delete('tb_user');
		return true;
	}

	public function DELETE_EMPLOYEE_DETAIL($nip) {
		$this->db->where('NIP', $nip);
		$this->db->delete('tb_employee_detail');
		return true;
	}

	// Data Master
	public function GET_DATA_MASTER_ALL()
	{
		$query = $this->db->query("
			SELECT * FROM m_group AS GROUP
			UNION ALL
			SELECT * FROM m_proses
			UNION ALL
			SELECT * FROM tb_confidential
			UNION ALL 
			SELECT * FROM tb_distribution_method
		");
		return $query->result();
	}

	function getDataLevel() {
		$query = $this->db->select('JBLL_ID,JBLL_NAME')
				 ->from('tb_job_level')
				 ->get()
				 ->result_array();

		return $query;
	}

	function getDataDepartemen() {
		$query = $this->db->select('DN_ID,DN_CODE,DN_NAME')
				 ->from('tb_departemen')
				 ->get()
				 ->result_array();

		return $query;
	}

	function getEmployeeByLevelDep($param) {
		$query = $this->db->select('NIP,FULL_NAME')
				 ->from('tb_employee');
		if (!empty($param['level'])) {
			$query = $query->where('JOBLVL', $param['level']);
		}
		if (!empty($param['departemen'])) {
			$query = $query->where('DEPCODE', $param['departemen']);
		}
		$query = $query->get()->result_array();

		return $query;
	}

}