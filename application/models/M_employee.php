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

    public function updateEmployee($employee)
    {
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
                'ORG_PARENT' => $v['ORG_PARENT']
                'SYNC_DATE' => date('Y-m-d H:i:s)
            );
        }

        $insert = $this->db->insert_batch('tb_employee', $data);
        if ($insert) {
            echo "ok";
        } else {
            echo "gagal";
        }

    }
}
