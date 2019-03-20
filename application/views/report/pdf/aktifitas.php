<?php
include (APPPATH.'libraries/session_user.php');
if (empty($SESSION_DEPARTEMENT_ID) && !empty($SESSION_DIVISI_ID)) {
	$Store = $SESSION_DIVISI_NAME;
// }elseif (empty($SESSION_DIVISI_ID) && !empty($SESSION_DIREKRORAT_ID)) {
}elseif (empty($SESSION_DIVISI_ID)) {
	$Store = $SESSION_DIREKRORAT_NAME;
}else{
	$Store = $SESSION_DEPARTEMENT_NAME;
}
?>
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
	<h2>PENGGUNAAN DOKUMEN</h2>
	<p>Departemen / Store : <?= $Store; ?></p>
	<p>Level Akses : <?= $SESSION_JOB_LEVEL_NAME; ?></p>
	<p>Priode Akses : <u><?= date('d/M/Y', strtotime($dari)); ?></u> s/d <u><?= date('d/M/Y', strtotime($sampai)); ?></u></p>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>No</th>
			<th>Nama Pengguna</th>
			<th>Nomor Dokumen</th>
			<th>Versi</th>
			<th>Nama Dokumen</th>
			<th>Tanggal ; Jam Akses</th>
			<th>Keterangan <br> (Lihat / unduh)</th>
		</tr>
		<?php
		$no = 1;
		for ($x=0; $x < $jml; $x++):

		$dokumen = $this->db
			->select('*')
			->from('m_log')
			->join('tb_document', 'm_log.DOC_ID = tb_document.DOC_ID', 'left')
			->join('tb_employee', 'm_log.LogUserName = tb_employee.NIP', 'left')
			->join('tb_departemen', 'tb_employee.DEPCODE = tb_departemen.DN_ID', 'left outer')
			->join('tb_divisi', 'tb_departemen.DI_ID = tb_divisi.DI_ID OR tb_employee.DEPCODE = tb_divisi.DI_ID', 'left outer')
			->join('tb_direktorat', 'tb_divisi.DT_ID = tb_direktorat.DT_ID OR tb_employee.DEPCODE = tb_direktorat DEPCODE', 'left outer')
			->where('m_log.LogAct = Lihat OR m_log.LogAct = Download')
			// ->where('tb_departemen.DN_ID = "'.$SESSION_DEPARTEMENT_ID.'" OR tb_divisi.DI_ID = "'.$SESSION_DIVISI_ID.'" OR tb_direktorat.DT_ID = "'.$SESSION_DIREKRORAT_ID.'" ')
			->where('tb_departemen.DN_ID', $SESSION_DEPARTEMENT_ID)
			->or_where('tb_divisi.DI_ID', $SESSION_DIVISI_ID)
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
			<td><?= $data->FULL_NAME; ?></td>
			<td><?= $data->DOC_NOMOR; ?></td>
			<td><?= $data->DOC_VERSI; ?></td>
			<td><?= $data->DOC_NAMA; ?></td>
			<td><?= date('d/M/Y H:i', strtotime($data->LogDate))." WIB"; ?></td>
			<td><?= $data->LogAct; ?></td>
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