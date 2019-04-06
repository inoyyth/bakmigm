<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Load library phpspreadsheet
require('./excel/vendor/autoload.php');

use PhpOffice\PhpSpreadsheet\Helper\Sample;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
// End load library phpspreadsheet

class C_coba extends CI_Controller {

	public function index()
	{
		$text = " 
		ID : {id}
		<br/>
		Nama : Aldi {jam} Malik
		<br/>
		Tanggal Daftar : {tanggal}
		<br/>
		Jam : {jam}
		";
		$id = "0101";
		$tanggal = date('D/M/Y');
		$jam = date('H:i');
		$nama = "Abdu";
		$find = array("/{id}/","/{tanggal}/","/{jam}/","/{nama}/");
		$replace = array($id, $tanggal, $jam, $nama);
		$hasil = preg_replace($find, $replace, $text);
		echo $hasil;
	}
	public function email()
	{
		include (APPPATH.'libraries/session_user.php');
		date_default_timezone_set('Asia/Jakarta');
		$text = $this->db->get('m_a')->result_array();
		foreach ($text as $key => $value) {
			$body = $value['text'];
		}
		$find = array("/{nip}/","/{nama}/","/{departemen}/");
		$user = $this->db->get('tb_user')->result_array();
		foreach ($user as $key => $v) {
			$data[] = array(
				'nip' => $v['NIP'],
				'nama' => $v['UR_ID'],
				'dari' => $v['DN_ID']
			);
			$email[] = array(
				$v['UR_EMAIL']
			);
		}
		$jml = count($user);
		for ($i=0; $i < $jml; $i++) { 
			$replace = $data[$i];
			$hasil[] = preg_replace($find, $replace, $body);
		}
		$jml_hasil = count($hasil);
		$config = [
			'useragent' => 'CodeIgniter',
			'protocol'  => 'smtp',
			'mailpath'  => '/usr/sbin/sendmail',
			'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_user' => 'akuntest437@gmail.com',
			'smtp_pass' => 'akuntest123',
			'smtp_port' => 465,
			'smtp_keepalive' => TRUE,
			'smtp_crypto' => 'SSL',
			'wordwrap'  => TRUE,
			'wrapchars' => 80,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'validate'  => TRUE,
			'crlf'      => "\r\n",
			'newline'   => "\r\n",
		];
		$this->load->library('email', $config);	
		for ($i=0; $i < $jml_hasil; $i++) {
			$this->email->from('email@gmail.com', 'Name');
			$this->email->to($email[$i][0]);
			$this->email->subject('subject');
			$this->email->message($hasil[$i]);
			
			$this->email->send();
		}
		// echo $this->email->print_debugger();
	}
	public function delete()
	{
		$id = $this->input->post('id');
		$this->db->delete('tb_document_notification', array('DOC_ID' => $id));
	}
	public function view()
	{
		$data['data'] = $this->db->get('search')->result();
		$this->load->view('coba/search.php', $data);
	}

	public function search()
	{
		$keyword = $this->input->post('keyword');
		$data['data'] = $this->db->select('*')->from('search')->like('text', $keyword, 'BOTH')->get()->result();
		$this->load->view('coba/search.php', $data);
	}

	public function test()
	{
		$data = array('Nama' => 'Aldi');
		$data2 = array('Aldi');
		$hasil = array_merge($data, $data2);
		print_r($hasil);die();
	}

	public function atasan()
	{
		$get_pencipta = $this->db
			->get_where('tb_employee', array('NIP' => '171270'))
			->result_array();
		foreach ($get_pencipta as $key => $value) {
			$id = $value['DEPCODE'];
		}
		$get_atasan = $this->db
			->select('*')
			->from('tb_employee')
			->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left')
			->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID OR tb_employee.DEPCODE = tb_divisi.DI_ID', 'left')
			->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID OR tb_employee.DEPCODE = tb_direktorat.DT_ID', 'left')
			->where('tb_employee.DEPCODE', $id)
			->get()->result_array();
		foreach ($get_atasan as $key => $value) {
			$DN = $value['DN_ID'];
			$DV = $value['DI_ID'];
			$DT = $value['DT_ID'];
		}
		if (!empty($DN)) {
			$get_atasan = $this->db->get_where('tb_employee', array('DEPCODE' => $DV))->result_array();
		}else{
			$get_atasan = $this->db->get_where('tb_employee', array('DEPCODE' => $DT))->result_array();
		}
	}

	public function activity()
	{
		include APPPATH.'third_party/PHPExcel/PHPExcel.php';
		$excel = new PHPExcel();
		$excel->getProperties()->setCreator('My Notes Code')
			->setLastModifiedBy('Bakmi GM')
			->setTitle("Komentar")
			->setSubject("Komentar")
			->setDescription("Laporan Komentar")
			->setKeywords("Komentar");
		$style_col = array(
			'font' => array('bold' => true),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
				'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER
			),
			'borders' => array(
				'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),
				'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),
				'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),
				'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN)
			)
		);
		$style_row = array(
			'alignment' => array(
				'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER
			),
			'borders' => array(
				'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),
				'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),
				'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),
				'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN)
			)
		);
		$excel->setActiveSheetIndex(0)->setCellValue('A1', "Aktifitas Dokumen");
		$excel->getActiveSheet()->mergeCells('A1:D1');
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
		$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

		$excel->setActiveSheetIndex(0)->setCellValue('A7', "No");
		$excel->setActiveSheetIndex(0)->setCellValue('B7', "Tanggal");
		$excel->setActiveSheetIndex(0)->setCellValue('C7', "Nama Pengguna");
		$excel->setActiveSheetIndex(0)->setCellValue('D7', "Komentar");
		$excel->getActiveSheet()->getStyle('A7')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('B7')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('C7')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('D7')->applyFromArray($style_col);
		// Get Data
		$no = 1;
		$numrow = 8;
		// End
		$excel->getActiveSheet()->getColumnDimension('A')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('B')->setWidth(10);
		$excel->getActiveSheet()->getColumnDimension('C')->setWidth(50);
		$excel->getActiveSheet()->getColumnDimension('D')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('E')->setWidth(25);

		$excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);
		$excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		$excel->getActiveSheet(0)->setTitle("Laporan Rekap Komentar");
		$excel->setActiveSheetIndex(0);
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment; filename="Laporan Rekap Komentar.xlsx"');
		header('Cache-Control: max-age=0');
		$write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
		$write->save('php://output');
	}

	public function spreadsheet()
	{
		$spreadsheet = new Spreadsheet();
		$spreadsheet->getProperties()->setCreator('Andoyo - Java Web Media')
		->setLastModifiedBy('Andoyo - Java Web Medi')
		->setTitle('Office 2007 XLSX Test Document')
		->setSubject('Office 2007 XLSX Test Document')
		->setDescription('Test document for Office 2007 XLSX, generated using PHP classes.')
		->setKeywords('office 2007 openxml php')
		->setCategory('Test result file');

		// Add some data
		$spreadsheet->setActiveSheetIndex(0)
		->setCellValue('A1', 'KODE PROVINSI')
		->setCellValue('B1', 'NAMA PROVINSI');
		// Rename worksheet
		$spreadsheet->getActiveSheet()->setTitle('Report Excel '.date('d-m-Y H'));

		// Set active sheet index to the first sheet, so Excel opens this as the first sheet
		$spreadsheet->setActiveSheetIndex(0);

		// Redirect output to a client’s web browser (Xlsx)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="Report Excel.xlsx"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');

		// If you're serving to IE over SSL, then the following may be needed
		header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
		header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header('Pragma: public'); // HTTP/1.0

		$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
		$writer->save('php://output');
		exit;
	}
	public function report()
	{
		for ($i=0; $i < 2; $i++) { 
			$this->spreadsheet()[$i];
		}
	}
}

/* End of file C_coba.php */
/* Location: ./application/controllers/C_coba.php */