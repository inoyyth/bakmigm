<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_report extends CI_Controller {
	public function __construct()
	{
        parent::__construct();
		if($this->session->userdata('session_bgm_edocument_status') != "LOGIN")
		{
			redirect('index','refresh');
		}
		$this->load->library('pdf');
    }
	public function index(){
		$data['view'] = 'V_report';
		$this->load->view('template', $data);
	}
	public function style_excel()
	{
		include APPPATH.'third_party/PHPExcel/PHPExcel.php';
		$excel = new PHPExcel();
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
	}
	public function rekapKomentar($document,$dari,$sampai)
	{
		$jml = count($document);
		include APPPATH.'third_party/PHPExcel/PHPExcel.php';
		$excel = new PHPExcel();
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
		$excel->setActiveSheetIndex(0)->setCellValue('A1', "LAPORAN REKAP KOMENTAR");
		$excel->getActiveSheet()->mergeCells('A1:G1');
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
		$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$excel->setActiveSheetIndex(0)->setCellValue('A3', "No");
		$excel->setActiveSheetIndex(0)->setCellValue('B3', "Tanggal");
		$excel->setActiveSheetIndex(0)->setCellValue('C3', "Nama Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('D3', "Nomor Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('E3', "Versi");
		$excel->setActiveSheetIndex(0)->setCellValue('F3', "Nama Pengguna");
		$excel->setActiveSheetIndex(0)->setCellValue('G3', "Komentar");
		$excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('F3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('G3')->applyFromArray($style_col);
		$no = 1;
		$numrow = 4;

		for ($x=0; $x < $jml; $x++):

		$dokumen = $this->db
			->select('*')
			->from('tb_document_comment')
			->join('tb_document', 'tb_document_comment.DOC_ID = tb_document.DOC_ID', 'left')
			->join('tb_employee', 'tb_document_comment.DTCT_USER = tb_employee.NIP', 'left')
			->where(
				array(
					'tb_document.DOC_ID' => $document[$x], 
					'tb_document_comment.DTCT_DATE >=' => $dari,
					'tb_document_comment.DTCT_DATE <=' => $sampai
				)
			)
			->get()
			->result();
		if (!empty($dokumen)):

		foreach ($dokumen as $k => $data) {
			$excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
			$excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, date('d/M/Y', strtotime($data->DTCT_DATE)));
			$excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $data->DOC_NAMA);
			$excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $data->DOC_NOMOR);
			$excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $data->DOC_VERSI);
			$excel->setActiveSheetIndex(0)->setCellValue('F'.$numrow, $data->FULL_NAME);
			$excel->setActiveSheetIndex(0)->setCellValue('G'.$numrow, $data->DTCT_NOTE);

			$excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('F'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('G'.$numrow)->applyFromArray($style_row);
			$numrow++;
			$no++;
		}

		endif;
		endfor;

		$excel->getActiveSheet()->getColumnDimension('A')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('D')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('E')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('F')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('G')->setWidth(50);

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

	public function rekapExp($document,$dari,$sampai)
	{
		$jml = count($document);
		include APPPATH.'third_party/PHPExcel/PHPExcel.php';
		$excel = new PHPExcel();
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
		$excel->setActiveSheetIndex(0)->setCellValue('A1', "REKAP DOKUMEN EXPIRED");
		$excel->getActiveSheet()->mergeCells('A1:E1');
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
		$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$excel->setActiveSheetIndex(0)->setCellValue('A3', "Priode Expired");
		$excel->getActiveSheet()->mergeCells('A3:B3');
		$excel->setActiveSheetIndex(0)->setCellValue('C3', ": ".date('d/M/Y', strtotime($dari))." s/d ".date('d/M/Y', strtotime($sampai)));
		$excel->getActiveSheet()->mergeCells('C3:E3');

		$excel->setActiveSheetIndex(0)->setCellValue('A5', "No");
		$excel->setActiveSheetIndex(0)->setCellValue('B5', "Nomor Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('C5', "Nama Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('D5', "Tanggal Expired");
		$excel->setActiveSheetIndex(0)->setCellValue('E5', "Pencipta");
		$excel->getActiveSheet()->getStyle('A5')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('B5')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('C5')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('D5')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('E5')->applyFromArray($style_col);
		$no = 1;
		$numrow = 6;

		for ($x=0; $x < $jml; $x++):
			$dokumen = $this->db
			->select('*')
			->from('tb_document')
			->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
			->where('tb_document.DOC_STATUS','DIARSIPKAN')
			->or_where('tb_document.DOC_STATUS', 'KADALUARSA')
			->where(
				array(
					'tb_document.DOC_ID' => $document[$x], 
					'tb_document.DOC_TGL_EXPIRED >=' => $dari,
					'tb_document.DOC_TGL_EXPIRED <=' => $sampai
				))
			->get()
			->result();
		// $dokumen = $this->db
		// 	->select('*')
		// 	->from('tb_documentX')
		// 	->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
		// 	->where('tb_document.DOC_STATUS = DIARSIPKAN OR tb_document.DOC_STATUS = KADALUARSA')
		// 	->where(
		// 		array(
		// 			'tb_document.DOC_ID' => $document[$x], 
		// 			'tb_document.DOC_TGL_EXPIRED >=' => $dari,
		// 			'tb_document.DOC_TGL_EXPIRED <=' => $sampai
		// 		)
		// 	)
		// 	->get()
		// 	->result();
		if (!empty($dokumen)):

		foreach ($dokumen as $k => $data) {
			$excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
			$excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data->DOC_NOMOR);
			$excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $data->DOC_NAMA);
			$excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, date('d/M/Y', strtotime($data->DOC_TGL_EXPIRED)));
			$excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $data->FULL_NAME);

			$excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
			$numrow++;
			$no++;
		}

		endif;
		endfor;

		$excel->getActiveSheet()->getColumnDimension('A')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('D')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('E')->setWidth(25);

		$excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);
		$excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		$excel->getActiveSheet(0)->setTitle("Laporan Rekap Dokumen Expired");
		$excel->setActiveSheetIndex(0);
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment; filename="Laporan Rekap Dokumen Expired.xlsx"');
		header('Cache-Control: max-age=0');
		$write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
		$write->save('php://output');
	}

	public function reportRevisi($document,$dari,$sampai)
	{
		$jml = count($document);
		include APPPATH.'third_party/PHPExcel/PHPExcel.php';
		$excel = new PHPExcel();
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
		$excel->setActiveSheetIndex(0)->setCellValue('A1', "CATATAN REVISI PROSES");
		$excel->getActiveSheet()->mergeCells('A1:E1');
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
		$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

		$excel->setActiveSheetIndex(0)->setCellValue('A3', "Nama Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('B3', "Nomor Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('C3', "Tanggal Efektif");
		$excel->setActiveSheetIndex(0)->setCellValue('D3', "Versi");
		$excel->setActiveSheetIndex(0)->setCellValue('E3', "Penjelasan \n (Alasan, Perubahan, Lokasi Perubahan)");
		$excel->setActiveSheetIndex(0)->setCellValue('F3', "Diajukan Oleh");
		$excel->setActiveSheetIndex(0)->setCellValue('G3', "Distujui Oleh");

		$excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('F3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('G3')->applyFromArray($style_col);

		$no = 1;
		$numrow = 4;

		for ($x=0; $x < $jml; $x++):

		$dokumen = $this->db
			->select('*')
			->from('tb_document_detail_status')
			->join('tb_document', 'tb_document_detail_status.DOC_ID = tb_document.DOC_STATUS', 'left')
			->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
			->where(
				array(
					'tb_document.DOC_ID' => $document[$x], 
					'tb_document_detail_status.DTDLSS_DATE >=' => $dari,
					'tb_document_detail_status.DTDLSS_DATE <=' => $sampai
				)
			)
			->get()
			->result();
		if (!empty($dokumen)):

		foreach ($dokumen as $k => $data) {
			$excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $data->DOC_NAMA);
			$excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data->DOC_NOMOR);
			$excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, date('d/M/Y', strtotime($data->DOC_TGL_EFEKTIF)));
			$excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $data->DTDLSS_VERSI);
			$excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $data->DTDLSS_NOTE);
			$excel->setActiveSheetIndex(0)->setCellValue('F'.$numrow, $data->FULL_NAME);
			$excel->setActiveSheetIndex(0)->setCellValue('G'.$numrow, $data->DTDLSS_MAKER);

			$excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('F'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('G'.$numrow)->applyFromArray($style_row);
			$numrow++;
			$no++;
		}

		endif;
		endfor;

		$excel->getActiveSheet()->getColumnDimension('A')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('D')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('E')->setWidth(50);
		$excel->getActiveSheet()->getColumnDimension('F')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('G')->setWidth(25);

		$excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);
		$excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		$excel->getActiveSheet(0)->setTitle("Laporan Catatan Revisi");
		$excel->setActiveSheetIndex(0);
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment; filename="Laporan Catatan Revisi.xlsx"');
		header('Cache-Control: max-age=0');
		$write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
		$write->save('php://output');
	}

	public function reportAktifitas($document,$dari,$sampai)
	{
		$jml = count($document);
		include APPPATH.'third_party/PHPExcel/PHPExcel.php';
		$excel = new PHPExcel();
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
		$excel->setActiveSheetIndex(0)->setCellValue('A1', "CATATAN REVISI PROSES");
		$excel->getActiveSheet()->mergeCells('A1:E1');
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
		$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

		$excel->setActiveSheetIndex(0)->setCellValue('A3', "Nama Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('B3', "Nomor Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('C3', "Tanggal Efektif");
		$excel->setActiveSheetIndex(0)->setCellValue('D3', "Versi");
		$excel->setActiveSheetIndex(0)->setCellValue('E3', "Penjelasan \n (Alasan, Perubahan, Lokasi Perubahan)");
		$excel->setActiveSheetIndex(0)->setCellValue('F3', "Diajukan Oleh");
		$excel->setActiveSheetIndex(0)->setCellValue('G3', "Distujui Oleh");

		$excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('F3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('G3')->applyFromArray($style_col);

		$no = 1;
		$numrow = 4;

		for ($x=0; $x < $jml; $x++):

		$dokumen = $this->db
			->select('*')
			->from('tb_document_detail_status')
			->join('tb_document', 'tb_document_detail_status.DOC_ID = tb_document.DOC_STATUS', 'left')
			->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
			->where(
				array(
					'tb_document.DOC_ID' => $document[$x], 
					'tb_document_detail_status.DTDLSS_DATE >=' => $dari,
					'tb_document_detail_status.DTDLSS_DATE <=' => $sampai
				)
			)
			->get()
			->result();
		if (!empty($dokumen)):

		foreach ($dokumen as $k => $data) {
			$excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $data->DOC_NAMA);
			$excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data->DOC_NOMOR);
			$excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, date('d/M/Y', strtotime($data->DOC_TGL_EFEKTIF)));
			$excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $data->DTDLSS_VERSI);
			$excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $data->DTDLSS_NOTE);
			$excel->setActiveSheetIndex(0)->setCellValue('F'.$numrow, $data->FULL_NAME);
			$excel->setActiveSheetIndex(0)->setCellValue('G'.$numrow, $data->DTDLSS_MAKER);

			$excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('F'.$numrow)->applyFromArray($style_row);
			$excel->getActiveSheet()->getStyle('G'.$numrow)->applyFromArray($style_row);
			$numrow++;
			$no++;
		}

		endif;
		endfor;

		$excel->getActiveSheet()->getColumnDimension('A')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('D')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('E')->setWidth(50);
		$excel->getActiveSheet()->getColumnDimension('F')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('G')->setWidth(25);

		$excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);
		$excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		$excel->getActiveSheet(0)->setTitle("Laporan Catatan Revisi");
		$excel->setActiveSheetIndex(0);
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment; filename="Laporan Catatan Revisi.xlsx"');
		header('Cache-Control: max-age=0');
		$write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
		$write->save('php://output');
	}

	public function report()
	{
		$dari_awal 			= $this->input->post('si_date_from');
		$sampai_awal 		= $this->input->post('si_date_to');
		$dari 				= date('Y-m-d', strtotime($dari_awal));
		$sampai 			= date('Y-m-d', strtotime($sampai_awal));
		$tipe 				= $this->input->post('tipe');
		$dokumen 			= $this->input->post('duallistbox_dokumen');
		$jml_dokumen 		= count($dokumen);

		// Variable send to view
		$data['document'] = $dokumen;
		$data['dari'] = $dari;
		$data['sampai'] = $sampai;
		$data['jml'] = count($dokumen);
		// Set
		// $this->pdf->setPaper('A4', 'landscape');

		if ($tipe == "komentar") {
			$this->rekapKomentar($dokumen,$dari,$sampai);
			$this->pdf->filename = "Rekap_Komentar.pdf";
			$this->pdf->load_view('report/pdf/comment', $data);
		}elseif ($tipe == "expired") {
			$this->rekapExp($dokumen,$dari,$sampai);
			$this->pdf->filename = "Rekap_Dokumen_Expired.pdf";
			$this->pdf->load_view('report/pdf/exp', $data);
		}elseif ($tipe == "revisi") {
			$this->reportRevisi($dokumen,$dari,$sampai);
			$this->pdf->filename = "Rekap_Revisi_Dokumen.pdf";
			$this->pdf->load_view('report/pdf/revisi', $data);
		}elseif ($tipe == "Laporan Penggunaan Dokumen") {
			# code...
		}elseif ($tipe == "log") {
			$this->pdf->filename = "Rekap_Log_Aktifitas.pdf";
			$this->pdf->load_view('report/pdf/log', $data);
		}else{
			$this->pdf->filename = "Rekap_Aktifitas.pdf";
			$this->pdf->load_view('report/pdf/aktifitas', $data);
		}
	}

	function filter_report() {
		$dari 			= $this->input->post('start');
		$sampai 		= $this->input->post('end');
		// $dari 				= date('Y-m-d', strtotime($dari_awal));
		// $sampai 			= date('Y-m-d', strtotime($sampai_awal));
		$tipe 				= $this->input->post('type');
		$dokumen 			= $this->input->post('dokumen');

		$data = [];
		if ($tipe === "komentar") {
			$query = $this->db
			->select('*')
			->from('tb_document_comment')
			->join('tb_document', 'tb_document_comment.DOC_ID = tb_document.DOC_ID', 'left')
			->join('tb_employee', 'tb_document_comment.DTCT_USER = tb_employee.NIP', 'left')
			->where(
				array(
					'tb_document_comment.DTCT_DATE >=' => $dari,
					'tb_document_comment.DTCT_DATE <=' => $sampai
				))
			->where_in('tb_document.DOC_ID', $dokumen)
			->get()
			->result();

			$data = [];
			foreach ($query as $k=>$q) {
				// $depexplode = explode('|',$q->DOC_PENGGUNA);
				$get_dept = $this->db->select('DN_NAME')->from('tb_departemen')->where('DN_ID', $q->DEPCODE)->get()->row();

				// $pengguna = array_column($get_dept, 'DN_NAME');
				// $pengguna_implode = implode('|',$pengguna);
				$data[] = array(
					'DOC_ID' => $q->DOC_ID . ' / ' . $q->DOC_NAMA . ' / ' . $q->DOC_VERSI ,
					'DOC_DATE' => $q->DOC_DATE,
					'DOC_NAMA' => $q->DOC_NAMA,
					'DOC_NOMOR' => $q->DOC_NOMOR,
					'DOC_VERSI' => $q->DOC_VERSI,
					'DTCT_NOTE' => $q->DTCT_NOTE,
					'DOC_PENGGUNA' => $get_dept->DN_NAME,
					'COMENTATOR' => $q->FULL_NAME,
					'COMENT_DATE' => $q->DTCT_DATE
				);
			}
		}

		if ($tipe == "expired") {
			$data = $this->db
			->select('*')
			->from('tb_document')
			->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
			->where('tb_document.DOC_STATUS','DIARSIPKAN')
			->or_where('tb_document.DOC_STATUS', 'KADALUARSA')
			->where(
				array(
					'tb_document.DOC_TGL_EXPIRED >=' => $dari,
					'tb_document.DOC_TGL_EXPIRED <=' => $sampai
				))
			->where_in('tb_document.DOC_ID', $dokumen)
			->get()
			->result();
		}

		if ($tipe == "revisi") {
			$data = $this->db
			->select('*')
			->from('tb_document_detail_status')
			->join('tb_document', 'tb_document_detail_status.DOC_ID = tb_document.DOC_STATUS', 'left')
			->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
			->where(
				array( 
					'tb_document_detail_status.DTDLSS_DATE >=' => $dari,
					'tb_document_detail_status.DTDLSS_DATE <=' => $sampai
			))
			->where_in('tb_document.DOC_ID', $dokumen)
			->get()
			->result();
		}

		if ($tipe == "pengguna") {
			$data = $this->db
			->select('*')
			->from('tb_document_detail_status')
			->join('tb_document', 'tb_document_detail_status.DOC_ID = tb_document.DOC_STATUS', 'left')
			->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
			->where(
				array( 
					'tb_document_detail_status.DTDLSS_DATE >=' => $dari,
					'tb_document_detail_status.DTDLSS_DATE <=' => $sampai
			))
			->where_in('tb_document.DOC_ID', $dokumen)
			->get()
			->result();
		}

		echo json_encode(array('data' => $data));
	}
}