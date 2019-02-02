<?php
class M_employee extends CI_Model {
    public function __construct() {
        parent::__construct();
    }

    public function getEmployee() {
        $db = $this->load->database('sql_server', TRUE);
        if(!$db) {
          echo "Not connected";
          die;
        }
        $employee = $db->query('exec USEREDOC');
        return $employee->result_array();
    }

    public function getDepartment() {
        $db = $this->load->database('sql_server', TRUE);
        if(!$db) {
          echo "Not connected";
          die;
        }
        $department = $db->query('exec EDOCDEP');
        return $department->result_array();
    }

    public function getDivision() {
        $db = $this->load->database('sql_server', TRUE);
        if(!$db) {
          echo "Not connected";
          die;
        }
        $division = $db->query('exec EDOCDIV');
        return $division->result_array();
    }

    public function updateEmployee($employee) {
	    date_default_timezone_set('Asia/Jakarta');
        $db = $this->load->database('default', TRUE);
        $db->truncate('tb_employee');
        $data = array();
        foreach($employee as $k=>$v) {
            $data[] = array(
                'NIP' => $v['NIP'],
                'USER_NAME' => $v['USER_NAME'],
                'FULL_NAME' => $v['FULL_NAME'],
                'JOBTITLE' => $v['JOBTITLE'],
                'JOBLVL' => $v['JOBLVL'],
                'DEPCODE' => $v['DEPCODE'],
                'DEPNAME' => $v['DEPNAME'],
                'ORG_PARENT' => $v['ORG_PARENT'],
                'SYNC_DATE' => date('Y-m-d H:i:s')
            );
        }

        $insert = $this->db->insert_batch('tb_employee', $data);
        if ($insert) {
            echo "ok";
        } else {
            echo "gagal";
        }
    }

    public function updateDepartment($department) {
	    date_default_timezone_set('Asia/Jakarta');
        $db = $this->load->database('default', TRUE);
        $db->truncate('tb_departemen');
        $data = array();
        foreach($department as $k=>$v) {
            $data[] = array(
                'DN_ID' => $v['DN_ID'],
                'DN_CODE' => $v['DN_CODE'],
                'DN_NAME' => $v['DN_NAME'],
                'DI_ID' => $v['DI_ID'],
                'SYNC_DATE' => date('Y-m-d H:i:s')
            );
        }

        $insert = $this->db->insert_batch('tb_departemen', $data);
        if ($insert) {
            echo "ok";
        } else {
            echo "gagal";
        }
    }

    public function updateDivision($division) {
	    date_default_timezone_set('Asia/Jakarta');
        $db = $this->load->database('default', TRUE);
        $db->truncate('tb_divisi');
        $data = array();
        foreach($division as $k=>$v) {
            $data[] = array(
                'DI_ID' => $v['DI_ID'],
                'DI_CODE' => $v['DI_CODE'],
                'DI_NAME' => $v['DI_NAME'],
                'DT_ID' => $v['DT_ID'],
                'SYNC_DATE' => date('Y-m-d H:i:s')
            );
        }

        $insert = $this->db->insert_batch('tb_divisi', $data);
        if ($insert) {
            echo "ok";
        } else {
            echo "gagal";
        }
    }
}
