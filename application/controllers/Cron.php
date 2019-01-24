<?php
/**
* @author       Asim Zeeshan
* @web         http://www.asim.pk/
* @date     13th May, 2009
* @copyright    No Copyrights, but please link back in any way
*/
 
class Test extends CI_Controller {
 
     
    function index()
    {
    echo "testing from index \n";
    $data = array(
        'datetime' => date('Y-m-d H:i:s')
    );
    $this->db->insert('test_cron', $data);
    }
     
    function hallo() {
    echo "testing from test \n";
    }
    }