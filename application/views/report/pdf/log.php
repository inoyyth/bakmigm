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
	<h2>LOG AKTIFITAS DOKUMEN</h2>
	<p>Priode Aktifitas : <u><?= date('d/M/Y', strtotime($dari)); ?></u> s/d <u><?= date('d/M/Y', strtotime($sampai)); ?></u></p>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>No</th>
			<th>Nama Dokumen</th>
			<th>Nama Pengguna</th>
			<th>Aktifitas</th>
			<th>Dibagikan Kepada <br> (Sharelink)</th>
			<th>Tanggal ; Jam Aktifitas</th>
		</tr>
		<?php
		$no = 1;
		for ($x=0; $x < $jml; $x++):

		$dokumen = $this->db
			->select('*')
			->from('m_log')
			->join('tb_document', 'm_log.DOC_ID = tb_document.DOC_ID', 'left')
			->join('tb_employee', 'm_log.LogUserName = tb_employee.NIP', 'left')
			->where(
				array(
					'tb_document.DOC_ID' => $document[$x],
					'm_log.LogDate >=' => $dari,
					'm_log.LogDate <=' => $sampai
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
			<td><?= $data->FULL_NAME; ?></td>
			<td><?= $data->LogAct; ?></td>
			<td><?= $data->Shareto; ?></td>
			<td><?= date('d/M/Y H:i', strtotime($data->LogDate))." WIB"; ?></td>
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