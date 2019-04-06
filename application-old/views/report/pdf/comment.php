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
	<h2>LAPORAN REKAP KOMENTAR</h2>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>No</th>
			<th>Tanggal</th>
			<th>Nama Dokumen</th>
			<th>Nomor Dokumen</th>
			<th>Versi</th>
			<th>Nama Pengguna</th>
			<th>Komentar</th>
		</tr>
		
		<?php
		$no = 1;
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
		foreach ($dokumen as $k => $data):
		?>
		
		<tr>
			<td><?= $no; ?></td>
			<td><?= date('d/M/Y', strtotime($data->DTCT_DATE)); ?></td>
			<td><?= $data->DOC_NAMA; ?></td>
			<td><?= $data->DOC_NOMOR; ?></td>
			<td><?= $data->DOC_VERSI; ?></td>
			<td><?= $data->FULL_NAME; ?></td>
			<td><?= $data->DTCT_NOTE; ?></td>
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