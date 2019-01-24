<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_employee extends CI_Controller {
 function __construct() {
   parent::__construct();
   $this->load->model('M_employee');
 }
 function sync_employee() {
    $employee = $this->M_employee->getEmployee();
    $this->M_employee->updateEmployee($employee);
   //  $this->load->view('V_employee', $data);
 }

}
