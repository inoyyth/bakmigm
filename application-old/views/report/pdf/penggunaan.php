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
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>No</th>
			<th>Nama Dokumen</th>
			<th>Kategori Dokumen</th>
			<th>Jenis Dokumen</th>
			<th>Tipe Dokumen</th>
			<th>Group Process (5M)</th>
			<th>Proses</th>
			<th>Div./Dept. Pemilik Proses</th>
			<th>Nama Pengguna</th>
			<th>Tanggal ; Jam Akses</th>
			<th>Ketarangan <br> (Lihat/Unduh)</th>
			<th>Total Lihat</th>
			<th>Total Unduh</th>
		</tr>
		<tr>
			<td>1</td>
			<td>Nama Dokumen</td>
			<td>Kategori Dokumen</td>
			<td>Jenis Dokumen</td>
			<td>Tipe Dokumen</td>
			<td>Group Process (5M)</td>
			<td>Proses</td>
			<td>ITY</td>
			<td>Nama Pengguna</td>
			<td><?= date('d/M/Y H:i')." WIB"; ?></td>
			<td>Lihat</td>
			<td>100</td>
			<td>100</td>
		</tr>
	</table>
</body>
</html>