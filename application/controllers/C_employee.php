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

 function sync_department() {
   $department = $this->M_employee->getDepartment();
   $this->M_employee->updateDepartment($department);
 }

 function sync_division() {
  $division = $this->M_employee->getDivision();
  $this->M_employee->updateDivision($division);
}

}
