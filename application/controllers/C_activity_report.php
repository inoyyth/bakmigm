<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_activity_report extends CI_Controller {
    function index() {
        $data['view'] = 'activity_report/index';
		$this->load->view('template', $data);
    }

    function filterDocumentName() {
        $search= $this->input->get('search');
        $kategori= $this->input->get('kategori');
        $jenis= $this->input->get('jenis');
        $tipe= $this->input->get('tipe');
        $group= $this->input->get('group');
        $proses= $this->input->get('proses');
        

        $query = $this->db->select('DOC_ID as id, DOC_NAMA as text');
        $query = $query->from('tb_document');

        if ($kategori !== '') {
            $query = $query->where('DOC_KATEGORI', $kategori);
        }

        if ($jenis !== '') {
            $query = $query->where('DOC_JENIS', $jenis);
        }

        if ($tipe !== '') {
            $query = $query->where('DOC_TIPE', $tipe);
        }

        if ($group !== '') {
            $query = $query->where('DOC_GROUP_PROSES', $group);
        }

        if ($proses !== '') {
            $query = $query->where('DOC_PROSES', $proses);
        }

        if ($search !== '') {
            $query = $query->like('DOC_NAMA', $search);
        }

        $query = $query->get()->result();

        echo json_encode(['results' => $query]);
    }

    function activityReportDataTable() {
        $data = [];
        $doc_id= $this->input->get('doc_id');
        $kategori= $this->input->get('kategori');
        $jenis= $this->input->get('jenis');
        $tipe= $this->input->get('tipe');
        $group= $this->input->get('group');
        $proses= $this->input->get('proses');
        try {
            $query = $this->db
                ->select('a.DOC_ID,a.DOC_NAMA,a.DOC_NOMOR,b.LogAct,b.LogDate,c.FULL_NAME')
                ->from('tb_document a')
                ->join('m_log b', 'a.DOC_ID = b.LogDoc', 'inner')
                ->join('tb_employee c', 'b.LogUserName = c.NIP', 'inner');

            if ($kategori !== '') {
                $query = $query->where('a.DOC_KATEGORI', $kategori);
            }
        
            if ($jenis !== '') {
                $query = $query->where('a.DOC_JENIS', $jenis);
            }
    
            if ($tipe !== '') {
                $query = $query->where('a.DOC_TIPE', $tipe);
            }
    
            if ($group !== '') {
                $query = $query->where('a.DOC_GROUP_PROSES', $group);
            }
    
            if ($proses !== '') {
                $query = $query->where('a.DOC_PROSES', $proses);
            }

            if ($doc_id !== '') {
                $query = $query->where('b.LogDoc', $doc_id);
            }
                
            $query = $query->where_in('b.LogAct',['Lihat','Download'])->order_by('b.LogDoc','ASC')->order_by('b.LogDate', 'ASC')->get()->result();

            foreach ($query as $k=>$q) {
                $data[] = array(
                    'DOC_ID' => $q->DOC_ID . ' / ' . $q->DOC_NAMA  ,
                    'FULL_NAME' => $q->FULL_NAME,
                    'ACTIVITY' => $q->LogAct,
                    'DATE' => $q->LogDate
                );
            }
        } catch (Exception $e) {
            var_dump($e->getMessage());
            die;
        }

        echo json_encode(array('data' => $data));
    }

    public function activity_excel() {
        $doc_id= $this->input->get('nama_dokumen');
        $kategori= $this->input->get('kategori_dokumen');
        $jenis= $this->input->get('jenis_dokumen');
        $tipe= $this->input->get('tipe_dokumen');
        $group= $this->input->get('group_prosess');
        $proses= $this->input->get('proses');

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
		$excel->setActiveSheetIndex(0)->setCellValue('A1', "LAPORAN PENGGUNAAN DOKUMEN");
		$excel->getActiveSheet()->mergeCells('A1:G1');
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
		$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$excel->setActiveSheetIndex(0)->setCellValue('A3', "No");
		$excel->setActiveSheetIndex(0)->setCellValue('B3', "Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('C3', "Nama");
        $excel->setActiveSheetIndex(0)->setCellValue('D3', "Aktifitas");
        $excel->setActiveSheetIndex(0)->setCellValue('E3', "Tanggal");
		$excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
        $excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
        $excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);
		$no = 1;
        $numrow = 4;
        $datas = [];

        try {
            $query = $this->db
                ->select('a.DOC_ID,a.DOC_NAMA,a.DOC_NOMOR,b.LogAct,b.LogDate,c.FULL_NAME')
                ->from('tb_document a')
                ->join('m_log b', 'a.DOC_ID = b.LogDoc', 'inner')
                ->join('tb_employee c', 'b.LogUserName = c.NIP', 'inner');

            if ($kategori !== '') {
                $query = $query->where('a.DOC_KATEGORI', $kategori);
            }
        
            if ($jenis !== '') {
                $query = $query->where('a.DOC_JENIS', $jenis);
            }
    
            if ($tipe !== '') {
                $query = $query->where('a.DOC_TIPE', $tipe);
            }
    
            if ($group !== '') {
                $query = $query->where('a.DOC_GROUP_PROSES', $group);
            }
    
            if ($proses !== '') {
                $query = $query->where('a.DOC_PROSES', $proses);
            }

            if ($doc_id !== NULL) {
                $query = $query->where('b.LogDoc', $doc_id);
            }
                
            $query = $query->where_in('b.LogAct',['Lihat','Download'])->order_by('b.LogDoc','ASC')->order_by('b.LogDate', 'ASC')->get()->result();

            foreach ($query as $k=>$q) {
                $datas[] = array(
                    'DOC_ID' => $q->DOC_ID . ' / ' . $q->DOC_NAMA  ,
                    'FULL_NAME' => $q->FULL_NAME,
                    'ACTIVITY' => $q->LogAct,
                    'DATE' => $q->LogDate
                );
            }
        } catch (Exception $e) {
            var_dump($e->getMessage());
            die;
        }
        // var_dump($datas);die;
        if (!empty($datas)){
            foreach ($datas as $k => $data) {
                $excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
                $excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data['DOC_ID']);
                $excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $data['FULL_NAME']);
                $excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $data['DATE']);
                $excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $data['ACTIVITY']);

                $excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
                $excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
                $excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
                $excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
                $excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
                $numrow++;
                $no++;
            }
        }

        $excel->getActiveSheet()->getColumnDimension('A')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $excel->getActiveSheet()->getColumnDimension('D')->setWidth(25);
        $excel->getActiveSheet()->getColumnDimension('E')->setWidth(25);

		$excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);
		$excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		$excel->getActiveSheet(0)->setTitle("Log Akt. Pengguna Dokumen");
		$excel->setActiveSheetIndex(0);

		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="Laporan-Aktifitas-Penggunaam-Dokumen.xlsx"');
		header('Cache-Control: max-age=0');
		$objWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
		ob_end_clean();
		$objWriter->save('php://output');
		exit;
    }

    function activityLogReportDataTable() {
        $data = [];
        $departemen= $this->input->get('departemen');
        $level_akses= $this->input->get('level_akses');
        $start_date= $this->input->get('start_date');
        $end_date= $this->input->get('end_date');
        try {
            $query = $this->db
                ->select('a.DOC_ID,a.DOC_NAMA,a.DOC_VERSI,a.DOC_NOMOR,b.LogAct,b.LogDate,c.FULL_NAME')
                ->from('tb_document a')
                ->join('m_log b', 'a.DOC_ID = b.LogDoc', 'inner')
                ->join('tb_employee c', 'b.LogUserName = c.NIP', 'inner')
                ->where('a.DOC_PEMILIK_PROSES', $departemen)
                ->where('b.LogDate >=', $start_date)
                ->where('b.LogDate <=', $end_date)
                ->like('a.DOC_AKSES_LEVEL', $level_akses)
                ->order_by('b.LogDate', 'ASC')
                ->get()->result();

            foreach ($query as $k=>$q) {
                $data[] = array(
                    'NO' => $k +1,
                    'DOC_ID' => $q->DOC_ID,
                    'FULL_NAME' => $q->FULL_NAME,
                    'DOC_NOMOR' => $q->DOC_NOMOR,
                    'DOC_VERSI' => $q->DOC_VERSI,
                    'DOC_NAMA' => $q->DOC_NAMA,
                    'ACTIVITY' => $q->LogAct,
                    'DATE' => $q->LogDate
                );
            }
        } catch (Exception $e) {
            var_dump($e->getMessage());
            die;
        }

        echo json_encode(array('data' => $data));
    }

    public function activity_log_excel() {
        $departemen= $this->input->get('departemen');
        $level_akses= $this->input->get('job_level');
        $start_date= $this->input->get('si_date_from');
        $end_date= $this->input->get('si_date_to');

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
		$excel->setActiveSheetIndex(0)->setCellValue('A1', "LAPORAN AKTIVITAS PENGGUNA");
		$excel->getActiveSheet()->mergeCells('A1:G1');
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
		$excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
		$excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$excel->setActiveSheetIndex(0)->setCellValue('A3', "No");
        $excel->setActiveSheetIndex(0)->setCellValue('B3', "Nama Pengguna");
        $excel->setActiveSheetIndex(0)->setCellValue('C3', "Nomo Dokumen");
		$excel->setActiveSheetIndex(0)->setCellValue('D3', "Versi");
        $excel->setActiveSheetIndex(0)->setCellValue('E3', "Nama Dokumen");
        $excel->setActiveSheetIndex(0)->setCellValue('F3', "Tanggal : Jam Akses");
        $excel->setActiveSheetIndex(0)->setCellValue('G3', "Keterangan");
		$excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
		$excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
        $excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
        $excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);
        $excel->getActiveSheet()->getStyle('F3')->applyFromArray($style_col);
        $excel->getActiveSheet()->getStyle('G3')->applyFromArray($style_col);
		$no = 1;
        $numrow = 4;
        $datas = [];

        try {
            $query = $this->db
                ->select('a.DOC_ID,a.DOC_NAMA,a.DOC_VERSI,a.DOC_NOMOR,b.LogAct,b.LogDate,c.FULL_NAME')
                ->from('tb_document a')
                ->join('m_log b', 'a.DOC_ID = b.LogDoc', 'inner')
                ->join('tb_employee c', 'b.LogUserName = c.NIP', 'inner')
                ->where('a.DOC_PEMILIK_PROSES', $departemen)
                ->where('b.LogDate >=', $start_date)
                ->where('b.LogDate <=', $end_date)
                ->like('a.DOC_AKSES_LEVEL', $level_akses)
                ->order_by('b.LogDate', 'ASC')
                ->get()->result();

            foreach ($query as $k=>$q) {
                $datas[] = array(
                    'NO' => $k +1,
                    'DOC_ID' => $q->DOC_ID,
                    'FULL_NAME' => $q->FULL_NAME,
                    'DOC_NOMOR' => $q->DOC_NOMOR,
                    'DOC_VERSI' => $q->DOC_VERSI,
                    'DOC_NAMA' => $q->DOC_NAMA,
                    'ACTIVITY' => $q->LogAct,
                    'DATE' => $q->LogDate
                );
            }
        } catch (Exception $e) {
            var_dump($e->getMessage());
            die;
        }
        // var_dump($datas);die;
        if (!empty($datas)){
            foreach ($datas as $k => $data) {
                $excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
                $excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data['FULL_NAME']);
                $excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $data['DOC_NOMOR']);
                $excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $data['DOC_VERSI']);
                $excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, $data['DOC_NAMA']);
                $excel->setActiveSheetIndex(0)->setCellValue('F'.$numrow, $data['DATE']);
                $excel->setActiveSheetIndex(0)->setCellValue('G'.$numrow, $data['ACTIVITY']);

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
        }

        $excel->getActiveSheet()->getColumnDimension('A')->setWidth(5);
		$excel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
		$excel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $excel->getActiveSheet()->getColumnDimension('D')->setWidth(5);
        $excel->getActiveSheet()->getColumnDimension('E')->setWidth(25);
        $excel->getActiveSheet()->getColumnDimension('F')->setWidth(25);
        $excel->getActiveSheet()->getColumnDimension('G')->setWidth(25);

		$excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);
		$excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		$excel->getActiveSheet(0)->setTitle("Laporan Aktifitas Pengguna");
		$excel->setActiveSheetIndex(0);

		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="Laporan-Aktivitas-Pengguna.xlsx"');
		header('Cache-Control: max-age=0');
		$objWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
		ob_end_clean();
		$objWriter->save('php://output');
		exit;
    }
}