<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<style>
		h2{
			text-align: center;
			font-weight: bold;
		}
		table{
			margin: 0 auto;
			width: 100%;
		}
		th{
			text-align: center;
		}
		td{
			text-align: center;
		}
	</style>
</head>
<body>
	<h2>CATATAN REVISI PROSES</h2>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>Nama Dokumen</th>
			<th>Nomor Dokumen</th>
			<th>Tanggal Efektif</th>
			<th>Versi</th>
			<th>Penjelasan<br/>(Alasan, Perubahan, Lokasi Perubahan)</th>
			<th>Diajukan Oleh</th>
			<th>Disetujui Oleh</th>
		</tr>
		<?php
		$no = 1;
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

		foreach ($dokumen as $k => $data):
		?>
		
		<tr>
			<td><?= $data->DOC_NAMA; ?></td>
			<td><?= $data->DOC_NOMOR; ?></td>
			<td><?= date('d/M/Y', strtotime($data->DOC_TGL_EFEKTIF)); ?></td>
			<td><?= $data->DTDLSS_VERSI; ?></td>
			<td><?= $data->DTDLSS_NOTE; ?></td>
			<td><?= $data->FULL_NAME; ?></td>
			<td><?= $data->DTDLSS_MAKER; ?></td>
		</tr>

		<?php
		$no++;
		endforeach;
		endif;
		endfor;
		?>
	</table>
</body>
</html>