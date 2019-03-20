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
	<h2>REKAP DOKUMEN EXPIRED</h2>
	<p>Priode Expired : <u><?= date('d/M/Y', strtotime($dari)); ?></u> s/d <u><?= date('d/M/Y', strtotime($sampai)); ?></u></p>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>No</th>
			<th>Nomor Dokumen</th>
			<th>Nama Dokumen</th>
			<th>Tanggal Expired</th>
			<th>Pencipta</th>
		</tr>
		<?php
		$no = 1;
		for ($x=0; $x < $jml; $x++):

		$dokumen = $this->db
			->select('*')
			->from('tb_document')
			->join('tb_employee', 'tb_document.DOC_MAKER = tb_employee.NIP', 'left')
			->where('tb_document.DOC_STATUS = DIARSIPKAN OR tb_document.DOC_STATUS = KADALUARSA')
			->where(
				array(
					'tb_document.DOC_ID' => $document[$x], 
					'tb_document.DOC_TGL_EXPIRED >=' => $dari,
					'tb_document.DOC_TGL_EXPIRED <=' => $sampai
				)
			)
			->get()
			->result();
		if (!empty($dokumen)):

		foreach ($dokumen as $k => $data):
		?>

		<tr>
			<td><?= $no; ?></td>
			<td><?= $data->DOC_NOMOR; ?></td>
			<td><?= $data->DOC_NAMA; ?></td>
			<td><?= date('d/M/Y', strtotime($data->DOC_TGL_EXPIRED)); ?></td>
			<td><?= $data->FULL_NAME; ?></td>
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