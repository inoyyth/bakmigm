<div class="row">
	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div id="accordion" class="accordion-style1 panel-group">
			<form class="form-horizontal" id="form_search" name="form_search" action="<?php echo base_url('C_bookmarks/cari_bookmark'); ?>" method="POST">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="ace-icon fa fa-check"></i>
					</span>
					<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search (Write A Keyword)" />
					<span class="input-group-btn">
						<button type="submit" id="search" name="cari" class="btn btn-purple btn-sm">
							<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
							Search
						</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12"></div>

</div>
<div class="row">
	<table id="example" class="table table-bordered table-striped table-hovered example">
		<thead>
			<tr>
				<th>Nomor Dokumen</th>
				<th>Nama Dokumen</th>
				<th>Tipe Dokumen</th>
				<th>Dept Pemilik Proses</th>
				<th>Tanggal Berlaku</th>
				<th>Status Dokumen</th>
				<th>Sisa Umur</th>
				<th>Aktivitas</th>
			</tr>
		</thead>
		<?php if (!empty($bookmark)) : ?>
		<?php foreach ($bookmark as $key) : ?>
			
			<?php
			date_default_timezone_set('Asia/Jakarta');
			$DOC_DATE_EXPIRED = date('Y-m-d',strtotime($key['DOC_TGL_EXPIRED']));

			$tanggal = new DateTime($DOC_DATE_EXPIRED);
			$today = new DateTime('today');
			$y = $today->diff($tanggal)->y;
			$m = $today->diff($tanggal)->m;
			$d = $today->diff($tanggal)->d;
			if (date('Y-m-d') > $DOC_DATE_EXPIRED) {
				$aging = "0 tahun 0 bulan 0 hari";
			}else{
				$aging = $y." tahun ".$m." bulan ".$d." hari";
			}
			?>
			<tbody>
				<tr>
					<td><?php echo $key['DOC_NOMOR']?></td>
					<td><?php echo $key['DOC_NAMA']?></td>
					<td><?php echo $key['DTSETE_SINGKATAN']?></td>
					<td><?php echo $key['DN_CODE'];?></td>
					<td><?php echo date('d/M/Y', strtotime($key['DOC_DATE']));?></td>
					<td><?php echo $key['DOC_STATUS']?></td>
					<td><?php echo $aging;?></td>
					<td>
						<a href="<?php echo base_url('C_menu/detail/'.$key['DOC_ID']) ?>" class="fa fa-eye" style="font-size: 2rem;text-decoration: none;color: black;" target="_blank"></a>
						<?php if (strrpos($key['JBLL_DOWNLOAD'], $this->session->userdata("session_bgm_edocument_job_level_id")) !== FALSE): ?>
						<a style="font-size: 2rem;text-decoration: none;color: black;" class="fa fa-download" href="<?=base_url('C_menu/zip/'.$key['DOC_ID']);?>" id="btn-unduh" class="btn btn-sm btn-warning"></a>
						<?php endif; ?>
					</td>
				</tr>
			</tbody>
		<?php endforeach; ?>
		<?php endif; ?>
		</table>
</div>