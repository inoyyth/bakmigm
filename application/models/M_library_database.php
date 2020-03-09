<?php
//-----------------------------------------------------------------------------------------------//
defined('BASEPATH') OR exit('No direct script access allowed');
//-----------------------------------------------------------------------------------------------//
class M_library_database extends CI_Model {
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	private $tb_business_rule	  	 		= "tb_business_rule";
	private $tb_confidential				= "tb_confidential";
	private $tb_distribution_method			= "tb_distribution_method";
	private $tb_document					= "tb_document";
	private $tb_document_comment			= "tb_document_comment";
	private $tb_document_detail				= "tb_document_detail";
	private $tb_document_detail_status		= "tb_document_detail_status";
	private $tb_document_form	  	 		= "tb_document_form";
	private $tb_document_level_access		= "tb_document_level_access";
	private $tb_document_status	  	 		= "tb_document_status";
	private $tb_document_structure_jenis	= "tb_document_structure_jenis";
	private $tb_document_structure_kategori	= "tb_document_structure_kategori";
	private $tb_document_structure_tipe		= "tb_document_structure_tipe";
	private $tb_document_template			= "tb_document_template";
	private $tb_job_level	  	 			= "tb_job_level";
	private $tb_master	  	 				= "tb_master";
	private $tb_review	  	 				= "tb_review";
	private $tb_roles	  	 				= "tb_roles";
	private $tb_structure_document			= "tb_structure_document";
	private $tb_structure_organization		= "tb_structure_organization";
	private $tb_user						= "tb_user";
	private $tb_periode_preview				= "tb_periode_preview";
	private $tb_direktorat					= "tb_direktorat";
	private $tb_divisi						= "tb_divisi";
	private $tb_departemen					= "tb_departemen";
	private $tb_document_versioning			= "tb_document_versioning";
	private $tb_document_bookmark			= "tb_document_bookmark";
	
	public function GET_COMMENT($DOC_ID)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document_comment');
			$this->db->join('tb_document', 'tb_document_comment.DOC_ID = tb_document.DOC_ID', 'left');
			$this->db->where('tb_document_comment.DOC_ID', $DOC_ID);
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

	public function get_nomor($si_header_no)
	{
		$this->db->where('DOC_NOMOR' , $si_header_no);
		$query = $this->db->get('tb_document');
		if ($query->num_rows()>0) {
			return true;
		}else{
			return false;
		}
	}
	public function GET_DOC_PENGGUNA($SESSION_DEPARTEMENT_ID,$SESSION_JOB_LEVEL_ID){
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document');
			$this->db->join('tb_document_detail', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
			$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
			$this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
			$this->db->where('tb_document.DOC_STATUS', 'DIPUBLIKASI');
			$this->db->like('tb_document.DOC_AKSES_LEVEL', $SESSION_JOB_LEVEL_ID, 'BOTH');
			$this->db->like('tb_document.DOC_PENGGUNA', $SESSION_DEPARTEMENT_ID, 'BOTH');
			$query = $this->db->get();
			if ($query->num_rows()>0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_DOC_PENGGUNA]".$error;
		}
		return $result;
	}
	public function GET_DOC_PENCIPTA($SESSION_DEPARTEMENT_ID,$SESSION_JOB_LEVEL_ID){
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document');
			$this->db->join('tb_document_detail', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
			$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
			$this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
			$this->db->where('tb_document.DOC_STATUS', 'DIPUBLIKASI');
			$this->db->like('tb_document.DOC_AKSES_LEVEL', $SESSION_JOB_LEVEL_ID, 'BOTH');
			$this->db->like('tb_document.DOC_PENGGUNA', $SESSION_DEPARTEMENT_ID, 'BOTH');
			$query = $this->db->get();
			if ($query->num_rows()>0) {
				return $query->result_array();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_DOC_PENCIPTA]".$error;
		}
		return $result;
	}
	public function GET_DOC_ARCHIVED($SESSION_ID)
	{
		$result = "";
		$where = "tb_document.DOC_STATUS = 'DIPUBLIKASI' OR tb_document.DOC_STATUS = 'DIARSIPKAN' ";
		try {
			$this->db->select('*');
			$this->db->from('tb_document');
			$this->db->join('tb_document_detail', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
			$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
			$this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
			$this->db->where($where);
			$query = $this->db->get();
			if ($query->num_rows()>0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_DOC_ARCHIVED]".$error;
		}
		return $result;
	}
	public function GET_COMMENT_BY_PENGGUNA($DOC_ID,$SESSION_ID)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document_comment');
			$this->db->where('DOC_ID', $DOC_ID);
			$this->db->where('DTCT_USER', $SESSION_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_COMMENT_BY_PENGGUNA]".$error;
		}
		return $result;
	}
	public function GET_COMMENT_BY_PENCIPTA($DOC_ID)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document_comment');
			$this->db->where('DOC_ID', $DOC_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_COMMENT_BY_PENCIPTA]".$error;
		}
		return $result;
	}
	public function getTerkait($DOC_TERKAIT)
	{
		$result = "";
		try {
			$query = $this->db->query('SELECT * FROM tb_document_detail WHERE DOC_ID LIKE "%'.$DOC_TERKAIT.'%" ');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][getTerkait]".$error;
		}
		return $result;
	}
	public function GET_DOC_TERKAIT($DOC_TERKAIT)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document');
			$this->db->join('tb_document_detail', 'tb_document_detail.DOC_ID = tb_document.DOC_ID', 'left');
			$this->db->where('tb_document.DOC_ID', $DOC_TERKAIT);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->row();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_DOC_TERKAIT]".$error;
		}
		return $result;
	}
	public function GET_DOC_TERKAIT_2($data){
		$result = "";
		try{
			$array_data = explode(",",$data);
			
			$this->db->select('*');
			$this->db->from('tb_document');
			$this->db->join('tb_document_detail', 'tb_document_detail.DOC_ID = tb_document.DOC_ID', 'left');
			$this->db->where('tb_document.DOC_STATUS', 'DIPUBLIKASI');
			$this->db->where_not_in('tb_document.DOC_ID', $array_data);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_DOC_TERKAIT_2]".$error;
		}
		return $result;
	}
	// Get Pendistribusi
	public function getDEPARTEMEN($si_owner_dept_pendistribusi)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_departemen');
			$this->db->where('DN_ID', $si_owner_dept_pendistribusi);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][getDEPARTEMEN]".$error;
		}
		return $result;
	}
	public function getDIVISI($si_owner_dept_pendistribusi)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_divisi');
			$this->db->where('DI_ID', $si_owner_dept_pendistribusi);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][getDIVISI]".$error;
		}
		return $result;
	}
	public function GET_DEPT_DIVISI($si_owner_dept_pendistribusi)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_departemen');
			$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
			$this->db->where('tb_departemen.DN_ID', $si_owner_dept_pendistribusi);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][GET_DEPT_DIVISI]".$error;
		}
		return $result;
	}
	public function getAtasan($DOC_MAKER)
	{
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_employee');
			$this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_employee.DEPCODE', 'left');
			$this->db->join('tb_divisi', 'tb_divisi.DI_ID = tb_departemen.DI_ID', 'left');
			$this->db->where('tb_employee.NIP', $DOC_MAKER);
			$query = $this->db->get();
			if ($query->num_rows()>0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][getAtasan]".$error;
		}
		return $result;
	}
	public function DB_GET_DATA_DOCUMENT_TEMPLATE_OR_DOCUMENT_STRUCTURE_TIPE($ID_KEY){
		$result = "";
		try{
			if(strpos($ID_KEY,'DTSETE')!==false){
				$query = $this->db->query('
				SELECT
				*
				FROM
				tb_document_structure_tipe
				INNER JOIN tb_job_level ON tb_document_structure_tipe.JBLL_ID = tb_job_level.JBLL_ID
				WHERE tb_document_structure_tipe.DTSETE_ID = "'.$ID_KEY.'"
				LIMIT 1
				');
			}else{
				$query = $this->db->query('
				SELECT
				*
				FROM
				tb_document_template
				INNER JOIN tb_document_structure_tipe ON tb_document_template.DTSETE_ID = tb_document_structure_tipe.DTSETE_ID
				INNER JOIN tb_job_level ON tb_document_structure_tipe.JBLL_ID = tb_job_level.JBLL_ID
				WHERE tb_document_structure_tipe.DTSETE_ACTIVE = "1" AND tb_document_template.DOCTEMP_ID = "'.$ID_KEY.'"
				LIMIT 1
				');
			}
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_TEMPLATE_OR_DOCUMENT_STRUCTURE_TIPE]".$error;
		}
		return $result;
	}
	public function DB_INSERT_DATA_BOOKMARK($data)
	{
		$status = false;
		try{
			$this->db->insert($this->tb_document_bookmark, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_BOOKMARK]".$error;
		}
		return $status;
	}
	public function DB_INPUT_DATA_VERSIONING($data)
	{
		$status = false;
		try{
			$this->db->insert($this->tb_document_versioning, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INPUT_DATA_VERSIONING]".$error;
		}
		return $status;
	}
	public function DB_GET_DATA_LOGIN_TOKEN($USERNAME)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_roles', 'tb_employee_detail.ROLES = tb_roles.RS_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$USERNAME.'" OR tb_employee.USER_NAME = "'.$USERNAME.'" ');
		return $this->db->get()->result();
	}
	public function CEK_TOKEN($TOKEN)
	{
		$this->db->select('*');
		$this->db->from('tb_document_link');
		$this->db->where('TOKEN', $TOKEN);
		return $this->db->get()->result();
	}
	public function DB_GET_DATA_LOGIN_DIRECT($NIP)
	{
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_roles', 'tb_employee_detail.ROLES = tb_roles.RS_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$NIP.'" OR tb_employee.USER_NAME = "'.$NIP.'"');
		return $this->db->get()->result();
	}
	public function DB_GET_DATA_LOGIN($UR_ID,$UR_PASSWORD){
		$this->db->select('*');
		$this->db->from('tb_employee');
		$this->db->join('tb_employee_detail', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
		$this->db->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->join('tb_job_level', 'tb_employee.JOBLVL = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_roles', 'tb_employee_detail.ROLES = tb_roles.RS_ID', 'left');
		$this->db->where('tb_employee.NIP = "'.$UR_ID.'" OR tb_employee.USER_NAME = "'.$UR_ID.'"');
		return $this->db->get()->result();
	}
	public function DB_GET_DATA_LOGIN_TB_USER($UR_ID,$UR_PASSWORD){
		$this->db->select('*');
		$this->db->from('tb_user');
		$this->db->join('tb_departemen', 'tb_user.DN_ID = tb_departemen.DN_ID', 'left');
		$this->db->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID', 'left');
		$this->db->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID', 'left');
		$this->db->join('tb_job_level', 'tb_user.JBLL_ID = tb_job_level.JBLL_ID', 'left');
		$this->db->join('tb_roles', 'tb_user.ROLES = tb_roles.RS_ID', 'left');
		$this->db->where('(tb_user.UR_ID = "'.$UR_ID.'" OR tb_user.NIP = "'.$UR_ID.'") AND tb_user.UR_PASSWORD = "'.$UR_PASSWORD.'"');
		return $this->db->get()->result();
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_MASTER_ARRAY(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_master);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_MASTER_ARRAY]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_MASTER($data){
		$status = false;
		try{
			$this->db->insert($this->tb_master, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_MASTER]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_DELETE_DATA_MASTER($MR_ID){
		$status = false;
		try{
			$this->db->where('MR_ID', $MR_ID);
			$this->db->delete($this->tb_master);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_DELETE_DATA_MASTER]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_STRUCTURE_ORGANIZATION_ARRAY(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_structure_organization);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_STRUCTURE_ORGANIZATION_ARRAY]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_STRUCTURE_ORGANIZATION($data){
		$status = false;
		try{
			$this->db->insert($this->tb_structure_organization, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_STRUCTURE_ORGANIZATION]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_DELETE_DATA_STRUCTURE_ORGANIZATION($SEON_ID){
		$status = false;
		try{
			$this->db->where('SEON_ID', $SEON_ID);
			$this->db->delete($this->tb_structure_organization);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_DELETE_DATA_STRUCTURE_ORGANIZATION]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_USER($data){
		$status = false;
		try{
			$this->db->insert($this->tb_user, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_USER]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_DELETE_DATA_USER($UR_ID){
		$status = false;
		try{
			$this->db->where('UR_ID', $UR_ID);
			$this->db->delete($this->tb_user);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_DELETE_DATA_USER]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_JOB_ROLE_ARRAY(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_job_role);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_JOB_ROLE_ARRAY]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_ROLES(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_roles);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_ROLES]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_LEVEL_ACCESS_ARRAY(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_level_access);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_LEVEL_ACCESS_ARRAY]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_DOCUMENT_LEVEL_ACCESS($data){
		$status = false;
		try{
			$this->db->insert($this->tb_document_level_access, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_DOCUMENT_LEVEL_ACCESS]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_DELETE_DATA_DOCUMENT_LEVEL_ACCESS($DTLLAS_ID){
		$status = false;
		try{
			$this->db->where('DTLLAS_ID', $DTLLAS_ID);
			$this->db->delete($this->tb_document_level_access);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_DELETE_DATA_DOCUMENT_LEVEL_ACCESS]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_ARRAY(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_ARRAY]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_DOCUMENT($data){
		$status = false;
		try{
			$this->db->insert($this->tb_document, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_DOCUMENT]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_UPDATE_DATA_DOCUMENT($DOC_ID,$data){
		$status = false;
		try{
			$this->db->where('DOC_ID', $DOC_ID);
			$this->db->update($this->tb_document, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_UPDATE_DATA_DOCUMENT]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_DELETE_DATA_DOCUMENT($DOC_ID){
		$status = false;
		try{
			$this->db->where('DOC_ID', $DOC_ID);
			$this->db->delete($this->tb_document);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_DELETE_DATA_DOCUMENT]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_SEARCH_DATA_DOCUMENT_ARRAY($DOC_ID,$DOC_NOMOR,$DOC_NAMA,$DOC_MAKER,$DOC_APPROVE,$DOC_STATUS){
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
			INNER JOIN tb_user ON tb_document.DOC_MAKER = tb_user.UR_ID
			INNER JOIN tb_departemen ON tb_user.DN_ID = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_document.DOC_ID LIKE "%'.$DOC_ID.'%"
			AND tb_document.DOC_NOMOR LIKE "%'.$DOC_NOMOR.'%"
			AND tb_document.DOC_NAMA LIKE "%'.$DOC_NAMA.'%"
			AND tb_document.DOC_MAKER LIKE "%'.$DOC_MAKER.'%"
			AND tb_document.DOC_APPROVE LIKE "%'.$DOC_APPROVE.'%"
			AND tb_document.DOC_STATUS LIKE "%'.$DOC_STATUS.'%"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT_ARRAY]".$error;
		}
		return $result;
	}
	public function DB_GET_SEARCH_DATA_DOCUMENT_ARRAY_COBA($SESSION_ID){
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
			INNER JOIN tb_user ON tb_document.DOC_MAKER = tb_user.UR_ID
			INNER JOIN tb_departemen ON tb_user.DN_ID = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_document.DOC_MAKER = "'.$SESSION_ID.'" ');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT_ARRAY_COBA]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DOCUMENT()
	{
		$where = "DOC_STATUS='DIPUBLIKASI' OR DOC_STATUS='KADALUARSA' OR DOC_STATUS='DIARSIPKAN'";
		$result = "";
		try {
			$this->db->select('*');
			$this->db->from('tb_document');
			$this->db->where($where);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		} catch (Exception $exc) {
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DOCUMENT]".$error;
		}
		return $result;
	}
	public function DB_GET_SEARCH_DATA_DOCUMENT_ARRAY2($DOC_ID,$DOC_NOMOR,$DOC_NAMA,$DOC_MAKER,$DOC_APPROVE,$DOC_STATUS){
		$result = "";
		try{
			//OLD
			//$this->db->select('*');
			//$this->db->from($this->tb_document);
			//$this->db->like('DOC_ID', $DOC_ID);
			//$this->db->like('DOC_NOMOR', $DOC_NOMOR);
			//$this->db->like('DOC_NAMA', $DOC_NAMA);
			//$this->db->like('DOC_MAKER', $DOC_MAKER);
			//$this->db->like('DOC_APPROVE', $DOC_APPROVE);
			//$this->db->like('DOC_STATUS', $DOC_STATUS);
			//$query = $this->db->get();
			//if ($query->num_rows() > 0) {
			//	return $query->result();
			//}
			//
			//NEW
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
			INNER JOIN tb_user ON tb_document.DOC_MAKER = tb_user.UR_ID
			INNER JOIN tb_departemen ON tb_user.DN_ID = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_document.DOC_STATUS = "DIPUBLIKASI" AND tb_document.DOC_ID LIKE "%'.$DOC_ID.'%"
			AND tb_document.DOC_NOMOR LIKE "%'.$DOC_NOMOR.'%"
			AND tb_document.DOC_NAMA LIKE "%'.$DOC_NAMA.'%"
			AND tb_document.DOC_MAKER LIKE "%'.$DOC_MAKER.'%"
			AND tb_document.DOC_APPROVE LIKE "%'.$DOC_APPROVE.'%"
			AND tb_document.DOC_STATUS LIKE "%'.$DOC_STATUS.'%"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT_ARRAY]".$error;
		}
		return $result;
	}
	public function DB_GET_SEARCH_NEWS_DATA_DOCUMENT_ARRAY($DOC_AKSES_LEVEL,$DOC_PENGGUNA){
		$result = "";
		try{
			//NEW
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
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.UR_ID
			INNER JOIN tb_departemen ON tb_employee.DEPCODE = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_document.DOC_AKSES_LEVEL LIKE "%'.$DOC_AKSES_LEVEL.'%"
			AND tb_document.DOC_PENGGUNA LIKE "%'.$DOC_PENGGUNA.'%"
			AND tb_document.DOC_STATUS = "DIPUBLIKASI"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_NEWS_DATA_DOCUMENT_ARRAY]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_SEARCH_DATA_DOCUMENT($DOC_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document);
			$this->db->where('DOC_ID', $DOC_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_BUSINESS_RULE_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_business_rule);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_BUSINESS_RULE_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_CONFIDENTIAL_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_confidential);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_CONFIDENTIAL_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DISTRIBUTION_METHOD_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_distribution_method);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DISTRIBUTION_METHOD_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DOCUMENT_FORM_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_form);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DOCUMENT_FORM_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DOCUMENT_STATUS_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_status);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DOCUMENT_STATUS_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_JOB_LEVEL_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_job_level);
			$this->db->order_by("JBLL_INDEX","ASC");
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_JOB_LEVEL_EVO]".$error;
		}
		return $result;
	}
	public function DB_GET_JOB_LEVEL_EVO_EXT($arrays){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_job_level);
			$this->db->where_in("JBLL_ID", $arrays);
			$this->db->order_by("JBLL_INDEX","DESC");
			$this->db->limit(1);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_JOB_LEVEL_EVO_EXT]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_JOB_LEVEL_NOT_IN_EVO($data){
		$result = "";
		try{
			$array_data = explode(",",$data);
			
			$this->db->select('*');
			$this->db->from($this->tb_job_level);
			$this->db->where_not_in('JBLL_ID', $array_data);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_JOB_LEVEL_NOT_IN_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_JOB_LEVEL_BY_ID_EVO($JBLL_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_job_level);
			$this->db->where('JBLL_ID', $JBLL_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_JOB_LEVEL_BY_ID_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_ROLES_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_roles);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_ROLES_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_STRUCTURE_KATEGORI_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_structure_kategori);
			$this->db->order_by('DTSEKI_KATEGORI', 'asc');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_STRUCTURE_KATEGORI_EVO]".$error;
		}
		return $result;
	}
	public function DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_ALL(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_structure_tipe);
			$this->db->order_by('DTSETE_TIPE', 'ASC');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_ALL]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_STRUCTURE_JENIS_EVO($DTSEKI_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_structure_jenis);
			$this->db->where('DTSEKI_ID', $DTSEKI_ID);
			$this->db->order_by('DTSEJS_JENIS', 'asc');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_STRUCTURE_JENIS_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_EVO($DTSEJS_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_structure_tipe);
			$this->db->where('DTSEJS_ID', $DTSEJS_ID);
			$this->db->order_by('DTSETE_TIPE', 'asc');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_CONFIDENTAL_EVO($DTSETE_ID){
		$result = "";
		try{
			$query = $this->db->query('
			SELECT
			*
			FROM
			tb_document_structure_tipe
			INNER JOIN tb_confidential ON
			tb_document_structure_tipe.CL_ID = tb_confidential.CL_ID 
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_tipe.DTSEJS_ID = tb_document_structure_jenis.DTSEJS_ID 
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_tipe.DTSEKI_ID = tb_document_structure_kategori.DTSEKI_ID
			WHERE tb_document_structure_tipe.DTSETE_ID = "'.$DTSETE_ID.'"
			LIMIT 1
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_CONFIDENTAL_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_PERIODE_PREVIEW_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_periode_preview);
			$this->db->order_by("PEPW_INDEX","ASC");
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_PERIODE_PREVIEW_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_DETAIL_ALL_EVO(){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_detail);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_DETAIL_ALL_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_DETAIL_BY_ID_EVO($DOC_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_detail);
			$this->db->join('tb_document', 'tb_document_detail.DOC_ID = tb_document_detail.DOC_ID', 'left');
			$this->db->where('tb_document_detail.DOC_ID', $DOC_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_DETAIL_BY_ID_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_DOCUMENT_DETAIL_EVO($data){
		$status = false;
		try{
			$this->db->insert($this->tb_document_detail, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_DOCUMENT_DETAIL_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_UPDATE_DATA_DOCUMENT_DETAIL_EVO($DOC_ID,$data){
		$status = false;
		try{
			$this->db->where('DOC_ID', $DOC_ID);
			$this->db->update($this->tb_document_detail, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_UPDATE_DATA_DOCUMENT_DETAIL_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_TEMPLATE_EVO($SESSION_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_template);
			$this->db->where('UR_ID', $SESSION_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_TEMPLATE_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_TEMPLATE_BY_ID_EVO($UR_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_template);
			$this->db->where('UR_ID', $UR_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_TEMPLATE_BY_ID_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_TEMPLATE_AUTO_BUILD_EVO($DOCTEMP_ID){
		$result = "";
		try{
			$query = $this->db->query('
			SELECT
			*
			FROM
			tb_document_template
			INNER JOIN tb_document_structure_tipe ON tb_document_template.DTSETE_ID = tb_document_structure_tipe.DTSETE_ID
			INNER JOIN tb_document_structure_jenis ON tb_document_template.DTSEJS_ID = tb_document_structure_jenis.DTSEJS_ID
			INNER JOIN tb_document_structure_kategori ON tb_document_template.DTSEKI_ID = tb_document_structure_kategori.DTSEKI_ID
			INNER JOIN tb_confidential ON tb_document_template.DOC_KERAHASIAAN = tb_confidential.CL_ID
			INNER JOIN tb_document_form ON tb_document_template.DOC_WUJUD = tb_document_form.DTFM_ID
			INNER JOIN tb_distribution_method ON tb_document_template.DOC_DISTRIBUSI = tb_distribution_method.DNMD_ID
			WHERE tb_document_template.DOCTEMP_ID = "'.$DOCTEMP_ID.'"
			LIMIT 1
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_TEMPLATE_AUTO_BUILD_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_DOCUMENT_TEMPLATE_EVO($data){
		$status = false;
		try{
			$this->db->insert($this->tb_document_template, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_DOCUMENT_TEMPLATE_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_UPDATE_DATA_DOCUMENT_TEMPLATE_EVO($DOCTEMP_ID,$data){
		$status = false;
		try{
			$this->db->where('DOCTEMP_ID', $DOCTEMP_ID);
			$this->db->update($this->tb_document_template, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_UPDATE_DATA_DOCUMENT_TEMPLATE_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_DETAIL_STATUS_BY_ID_EVO($DOC_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_document_detail_status);
			$this->db->where('DOC_ID', $DOC_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_DETAIL_STATUS_BY_ID_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_DOCUMENT_DETAIL_STATUS_EVO($data){
		$status = false;
		try{
			$this->db->insert($this->tb_document_detail_status, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_DOCUMENT_DETAIL_STATUS_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($DOC_ID){
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
			INNER JOIN tb_document_detail ON tb_document_detail.DOC_ID = tb_document.DOC_ID
			WHERE tb_document.DOC_ID = "'.$DOC_ID.'"
			');
		if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_UPDATE_DATA_DOCUMENT_REFISI_EVO($DOC_ID,$data){
		$status = false;
		try{
			$this->db->where('DOC_ID', $DOC_ID);
			$this->db->update($this->tb_document, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_UPDATE_DATA_DOCUMENT_REFISI_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO($DOC_ID,$data){
		$status = false;
		try{
			$this->db->where('DOC_ID', $DOC_ID);
			$this->db->update($this->tb_document_detail, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_UPDATE_DATA_DOCUMENT_DETAIL_REFISI_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_INSERT_DATA_DOCUMENT_COMMENT_EVO($data){
		$status = false;
		try{
			$this->db->insert($this->tb_document_comment, $data);
			if($this->db->affected_rows() == 1){
				$status = true;
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_INSERT_DATA_DOCUMENT_COMMENT_EVO]".$error;
		}
		return $status;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DOCUMENT_COMMENT_BY_AUTHOR($DTCT_AUTHOR,$DOC_ID){
		$result = "";
		try{
			$query = $this->db->query('
			SELECT tbe.NIP 
			,tbe.FULL_NAME
			,tbe.DEPNAME 
			,dcc.DTCT_USER
			,dcc.DTCT_DATE
			,dcc.DTCT_ID
			,dcc.DTCT_NOTE
			FROM tb_document_comment dcc
			INNER JOIN tb_employee tbe ON dcc.DTCT_USER = tbe.NIP
			WHERE 1=1
			AND DTCT_AUTHOR="'.$DTCT_AUTHOR.'"
			AND DOC_ID ="'.$DOC_ID.'"
			');
		
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DOCUMENT_COMMENT_BY_AUTHOR]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DEPARTEMEN_BY_ID_EVO($DN_ID){
		$result = "";
		try{
			$query = $this->db->query('
			SELECT
			*
			FROM
			tb_direktorat
			INNER JOIN tb_divisi ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			INNER JOIN tb_departemen ON tb_departemen.DI_ID = tb_divisi.DI_ID
			WHERE tb_departemen.DN_ID = "'.$DN_ID.'"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DEPARTEMEN_BY_ID_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DEPARTEMENT_ARRAY($DN_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_departemen);
			$this->db->where('DN_ID !=', $DN_ID);
			$this->db->order_by('DN_NAME','ASC');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DEPARTEMENT_ARRAY]".$error;
		}
		return $result;
	}

	public function get_departemen_pengguna($departments, $in = true){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_departemen);
			if ($in) {
				$this->db->where_in('DN_ID', $departments);
			} else {
				$this->db->where_not_in('DN_ID', $departments);
			}
			$this->db->order_by('DN_NAME','ASC');
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DEPARTEMENT_ARRAY]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DEPARTEMENT_NOT_IN_EVO($data){
		$result = "";
		try{
			$array_data = explode(",",$data);
			
			$this->db->select('*');
			$this->db->from($this->tb_departemen);
			$this->db->where_not_in('DN_ID', $array_data);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DEPARTEMENT_NOT_IN_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DIREKTORAT_BY_ID_EVO($DT_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_direktorat);
			$this->db->where('DT_ID', $DT_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DIREKTORAT_BY_ID_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DIVISI_BY_ID_DIREKTORAT_EVO($DT_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_divisi);
			$this->db->where('DT_ID', $DT_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DIVISI_BY_ID_DIREKTORAT_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_DATA_DEPARTEMEN_BY_ID_DIVISI_EVO($DI_ID){
		$result = "";
		try{
			$this->db->select('*');
			$this->db->from($this->tb_departemen);
			$this->db->where('DI_ID', $DI_ID);
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_DATA_DEPARTEMEN_BY_ID_DIVISI_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	//
	//-----------------------------------------------------------------------------------------------//
	//
	//-----------------------------------------------------------------------------------------------//
	//
	//-----------------------------------------------------------------------------------------------//
	//
	//-----------------------------------------------------------------------------------------------//
	//
	//-----------------------------------------------------------------------------------------------//
	//
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_SEARCH_DATA_DOCUMENT_ARRAY_EVO($DOC_ID,$DOC_NOMOR,$DOC_NAMA,$DOC_MAKER,$DOC_APPROVE,$DOC_STATUS,$DN_ID){
		$result = "";
		try{
			
			//NEW
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
			INNER JOIN tb_user ON tb_document.DOC_MAKER = tb_user.UR_ID
			INNER JOIN tb_departemen ON tb_user.DN_ID = tb_departemen.DN_ID
			INNER JOIN tb_divisi ON tb_departemen.DI_ID = tb_divisi.DI_ID
			INNER JOIN tb_direktorat ON tb_divisi.DT_ID = tb_direktorat.DT_ID
			WHERE tb_document.DOC_ID LIKE "%'.$DOC_ID.'%"
			AND tb_document.DOC_NOMOR LIKE "%'.$DOC_NOMOR.'%"
			AND tb_document.DOC_NAMA LIKE "%'.$DOC_NAMA.'%"
			AND tb_document.DOC_MAKER LIKE "%'.$DOC_MAKER.'%"
			AND tb_document.DOC_APPROVE LIKE "%'.$DOC_APPROVE.'%"
			AND tb_document.DOC_STATUS LIKE "%'.$DOC_STATUS.'%"
			AND tb_user.DN_ID LIKE "%'.$DN_ID.'%"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT_ARRAY_EVO]".$error;
		}
		return $result;
	}
	//-----------------------------------------------------------------------------------------------//
	public function DB_GET_SEARCH_NEWS_DATA_DOCUMENT_ARRAY_EVO($DOC_AKSES_LEVEL,$DOC_PENGGUNA){

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
			WHERE tb_document.DOC_AKSES_LEVEL LIKE "%'.$DOC_AKSES_LEVEL.'%"
			AND tb_document.DOC_PENGGUNA LIKE "%'.$DOC_PENGGUNA.'%"
			AND tb_document.DOC_STATUS = "DIPUBLIKASI"
			');
			if ($query->num_rows() > 0) {
				return $query->result();
			}
		}catch(Exception $exc){
			$error = $exc->getMessage();
			echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_NEWS_DATA_DOCUMENT_ARRAY_EVO]".$error;
		}
		return $result;
	}

	public function getAllDivision($field) {
		$query = $this->db->select($field)
				 ->from('tb_divisi')
				 ->get()->result();
		
		return $query;
	}

	public function getAllDepartemen() {
		$query = $this->db->select('*')
				 ->from('tb_departemen')
				 ->order_by('DN_NAME')
				 ->get()->result();
		
		return $query;
	}

	public function getAllJobLevel() {
		$query = $this->db->select('*')
				 ->from('tb_job_level')
				 ->get()->result();
		
		return $query;
	}

	function getUserMakerDepartemen($maker) {
		$query = $this->db->select('DEPCODE')
				 ->from('tb_employee')
				 ->where('NIP', $maker)
				 ->get()
				 ->row_array();
		
		return $query;			  
	}

	function getUserMakerDivisi($maker) {
		$query = $this->db->select('tb_divisi.DI_ID')
				 ->from('tb_divisi')
				 ->join('tb_employee', 'tb_employee.ORG_PARENT=tb_divisi.DI_CODE')
				 ->where('tb_employee.NIP', $maker)
				 ->get()
				 ->row_array();
		
		return $query;			  
	}

	public function getOcrDocument() {
		$query = $this->db->select('DTSETE_ID')
		->from('tb_document_structure_tipe')
		->where('IS_CONVERT_OCR', 2)
		->get()
		->result();

		$result = [];
		foreach($query as $k=>$v) {
			$result[] = $v->DTSETE_ID;
		}

		return $result;
	}
}