<?php
/**
* @author       Asim Zeeshan
* @web         http://www.asim.pk/
* @date     13th May, 2009
* @copyright    No Copyrights, but please link back in any way
*/
 
class Cron extends CI_Controller {
 
     
    function index()
    {
    echo "testing from index \n";
    $data = array(
        'SYNC_DATE' => date('Y-m-d H:i:s')
    );
    $this->db->insert('tb_employee', $data);
    }
     
    function hallo() {
    echo "testing from test \n";
    }
    }