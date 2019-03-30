<div class="row">
	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h4 class="panel-title">
					Data Master
				</h4>
			</div>
			<div class="list-group">
				<a href="<?= base_url('C_setting_data_master/group_proses');?>" class="list-group-item list-group-item-action">
					Group Proses (5M)
				</a>
				<a href="<?= base_url('C_setting_data_master/proses');?>" class="list-group-item list-group-item-action">
					Proses
				</a>
				<a href="<?= base_url('C_setting_data_master/wujud_dokumen');?>" class="list-group-item list-group-item-action">
					Wujud Dokumen Master
				</a>
				<a href="<?= base_url('C_setting_data_master/metode_distribusi');?>" class="list-group-item list-group-item-action">
					Metode Distribusi
				</a>
				<a href="<?= base_url('C_setting_data_master/kerahasiaan');?>" class="list-group-item list-group-item-action">
					Standard Kerahasiaan
				</a>
				<a href="<?= base_url('C_setting_data_master/priode_review');?>" class="list-group-item list-group-item-action">
					Periode Review
				</a>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h4 class="panel-title">
					Tambah Data Master
				</h4>
			</div>
			<form action="<?= base_url('C_setting_data_master/insert'); ?>" method="POST" style="margin:10px 10px;">
				<div class="form-group">
					<label for="tipe">Tipe Data Master</label>
					<select name="tipe" id="tipe" class="form-control" required>
						<option value="">Pilih</option>
						<option value="Group Proses (5M)">Group Proses (5M)</option>
						<option value="Proses">Proses</option>
						<option value="Wujud Dokumen Master">Wujud Dokumen Master</option>
						<option value="Metode Distribusi">Metode Distribusi</option>
						<option value="Standard Kerahasiaan">Standard Kerahasiaan</option>
						<option value="Periode Review">Periode Review</option>
					</select>
				</div>
				<div class="form-group">
					<label for="id">ID</label>
					<input type="text" name="id" id="id" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="nama">Nama</label>
					<input type="text" name="nama" id="nama" class="form-control" required>
				</div>
				<div class="form-group" align="right">
					<input type="submit" class="btn btn-sm btn-primary" value="Tambah Data">
				</div>
			</form>
		</div>
	</div>
</div>