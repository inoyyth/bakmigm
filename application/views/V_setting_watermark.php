<div class="row">
	<div class="col-sm-12">
		<h3>Watermark For Download</h3>
	</div>
	<?php
	$GET_WATERMARK = $this->M_general_setting->GET_WATERMARK();
	foreach ($GET_WATERMARK as $watermark) {
		$satu = $watermark->field_1;
		$dua = $watermark->field_2;
		$tiga = $watermark->field_3;
		$empat = $watermark->field_4;
	}
	?>
	<div class="col-sm-12">
		<form method="POST" action="<?= base_url('C_general_setting/update_watermark'); ?>">
			<input type="hidden" >
			<div class="input-group">
				<input type="text" name="1" placeholder="Free Text" value="<?= $satu; ?>">
				<label> &nbsp;&nbsp;-&nbsp;&nbsp; </label>
				<select name="2" id="" class="" required>
					<option value="">Pilih</option>
					<option value="NIP">NIP</option>
					<option value="Nama">Nama</option>
					<option value="Tanggal/Bulan/Tahun">Tanggal/Bulan/Tahun</option>
				</select>
				<label> &nbsp;&nbsp;-&nbsp;&nbsp; </label>
				<select name="3" id="" class="" required>
					<option value="">Pilih</option>
					<option value="NIP">NIP</option>
					<option value="Nama">Nama</option>
					<option value="Tanggal/Bulan/Tahun">Tanggal/Bulan/Tahun</option>
				</select>
				<label> &nbsp;&nbsp;-&nbsp;&nbsp; </label>
				<select name="4" id="" class="" required>
					<option value="">Pilih</option>
					<option value="NIP">NIP</option>
					<option value="Nama">Nama</option>
					<option value="Tanggal/Bulan/Tahun">Tanggal/Bulan/Tahun</option>
				</select>
				&nbsp;&nbsp;
				<input type="submit" class="btn btn-sm btn-info">
			</div>
		</form>
	</div>
	<div class="col-sm-12">
		<h4>Watermark Saat Ini</h4>
		<p><?= $satu." - ".$dua." - ".$tiga." - ".$empat; ?></p>
	</div>
</div>