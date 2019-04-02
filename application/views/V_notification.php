<?php 
$count_news = 0;
$get_data_count = $this->M_notification->GET_NEWS_NEW($this->session->userdata("session_bgm_edocument_id"));
if(empty($get_data_count)||$get_data_count==""){

}else{
	$count_news = count($get_data_count);	
}
?>
<div class="row">
	<div class="widget-box">
		<div class="widget-header">
			<h4 class="smaller">
				Notification
				<span class="badge badge-primary"><?php echo count($notification); ?></span>
			</h4>
		</div>
	</div>
	<?php
	if(count($notification) > 0):
		foreach ($notification as $data_row_ext):
			$FILTER = $data_row_ext->DOC_STATUS;
			// Tanggal
			date_default_timezone_set('Asia/Jakarta');
			$sekarang = date('Y-m-d');
			$exp = $data_row_ext->DOC_TGL_EXPIRED;
			$sebulan = date('Y-m-d', strtotime('+30 days', strtotime($data_row_ext->DOC_TGL_EXPIRED)));
			$tgl_efektif = new DateTime($sekarang);
			$kadaluarsa = new DateTime($exp);
			$tgl_final = $kadaluarsa->diff($tgl_efektif)->format("%a");

			$sebulan2 = new DateTime($sebulan);
			$arcived = $sebulan2->diff($tgl_efektif)->format("%a");
	?>
	<!-- Menunggu Persetujuan Anda -->
	<?php 
	if ($this->session->userdata("session_bgm_edocument_departement_id")==$FILTER && in_array(6,$this->session->userdata("user_menu"))): 
	?>
		<div class="alert alert-warning fade in">
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, perlu persetujuan Anda!
					<br/>
					<?php echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));?> WIB
				</div>
				<div class="col-xs-2" style="text-align:right;">
					<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
				</div>
			</div>
		</div>
	<?php 
	elseif ($this->session->userdata("session_bgm_edocument_divisi_id")==$FILTER && $this->session->userdata("session_bgm_edocument_id") != $data_row_ext->DOC_MAKER && in_array(6,$this->session->userdata("user_menu"))):
	?>
		<div class="alert alert-warning fade in">
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, perlu persetujuan Anda!
					<br/>
					<?php echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));?> WIB
				</div>
				<div class="col-xs-2" style="text-align:right;">
					<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
				</div>
			</div>
		</div>
	<?php 
	elseif ($this->session->userdata("session_bgm_edocument_direktorat_id")==$FILTER && in_array(6,$this->session->userdata("user_menu"))):
	?>
		<div class="alert alert-warning fade in">
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, perlu persetujuan Anda!
					<br/>
					<?php echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));?> WIB
				</div>
				<div class="col-xs-2" style="text-align:right;">
					<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
				</div>
			</div>
		</div>
	<?php
	elseif (($this->session->userdata("session_bgm_edocument_departement_id") == $FILTER || $this->session->userdata("session_bgm_edocument_divisi_code") == $FILTER || $this->session->userdata("session_bgm_edocument_direktorat_id") == $FILTER) && strrpos($data_row_ext->DOC_STATUS, 'DITOLAK') !== FALSE): 
	?>
		<div class="alert alert-warning fade in">
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, <?php echo $data_row_ext->DOC_STATUS_ACTIVITY; ?>
					<br/>
					<?php echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));?> WIB
				</div>
				<div class="col-xs-2" style="text-align:right;">
					<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
				</div>
			</div>
		</div>
	<?php 
	elseif($this->session->userdata("session_bgm_edocument_id") == $data_row_ext->DOC_MAKER && strrpos($data_row_ext->DOC_STATUS, 'DITOLAK') !== FALSE):
	?>
		<div class="alert alert-danger fade in">
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, <?php echo $data_row_ext->DOC_STATUS_ACTIVITY; ?>. Mohon untuk segera di perbaiki!
					<br/>
					<?php
					$get_data_info_reject = $this->M_library_database->DB_GET_DATA_DOCUMENT_DETAIL_STATUS_BY_ID_EVO($data_row_ext->DOC_ID);
					$index_info_reject = 1;
						foreach($get_data_info_reject as $data_row_info_reject){
					?>
							<b>
							<?php echo $index_info_reject; ?>. Oleh : <?php echo $data_row_info_reject->DTDLSS_MAKER; ?>, Note : <?php echo $data_row_info_reject->DTDLSS_NOTE; ?>. Pada : <?php echo date('d/M/Y G:i', strtotime($data_row_info_reject->DTDLSS_DATE)); ?> WIB
							<br/>
							</b>
					<?php
							$index_info_reject++;
						}
					?>
				</div>
				<div class="col-xs-2" style="text-align:right;">
					<form id="form_revisi[]" name="form_revisi[]" action="<?php echo base_url('C_notification/revisi'); ?>" method="post" enctype="multipart/form-data">
					<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
					<button type="submit" class="ace-icon fa fa-pencil btn btn-sm btn-danger"></button>
					</form>
				</div>
			</div>
		</div>
	<?php 
	elseif($FILTER =="DIPUBLIKASI"): 
	?>
		<div class="alert alert-success fade in">
			<form action="<?= base_url('C_notification/delete_notification'); ?>" method="POST">
				<input type="hidden" name="doc_id" value="<?= $data_row_ext->DOC_ID; ?>">
				<input type="hidden" name="user_id" value="<?= $data_row_ext->NIP; ?>">
				<input type="hidden" name="notif_id" value="<?= $data_row_ext->NOTIF_ID; ?>">
				<button type="submit" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</form>
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, <?php echo $data_row_ext->DOC_STATUS_ACTIVITY; ?>
					<br/>
					<?php echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));?> WIB
				</div>
			</div>
		</div>
	<?php 
	elseif($this->session->userdata("session_bgm_edocument_id") == $data_row_ext->DOC_MAKER && $FILTER =="DIPUBLIKASI" && $tgl_final <= 90 && $tgl_final >= 1): 
	?>
		<div class="alert alert-warning fade in">
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?=$data_row_ext->DOC_NAMA; ?>, Akan <b>Kadaluarsa</b> dalam <?=$tgl_final; ?> hari
				</div>
				<div class="col-sm-2" style="width:4%;">
					<form id="form_versioning[]" name="form_versioning[]" action="<?php echo base_url('C_notification/versioning'); ?>" method="post" enctype="multipart/form-data" target="_blank">
						<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
						<button type="submit" class="ace-icon fa fa-edit btn btn-sm btn-info" data-popup="tooltip" data-placement="top" title="Pengkinian"></button>
					</form>
				</div>
				<div class="col-sm-2" style="width:4%;">
					<form id="form_comment[]" name="form_comment[]" action="<?php echo base_url('C_news/comment'); ?>" method="post" enctype="multipart/form-data">
						<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
						<button type="submit" class="ace-icon fa fa-comment btn btn-sm btn-success"></button>
					</form>
				</div>
				<div class="col-sm-2" style="width:4%;">
					<form id="form_revisi[]" name="form_revisi[]" action="<?php echo base_url('C_notification/obsolete'); ?>" method="post" enctype="multipart/form-data">
						<input type="hidden" id="si_key" name="si_key" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
						<button type="submit" class="ace-icon fa fa-remove btn btn-sm btn-danger"></button>
					</form>
				</div>
			</div>
		</div>
	<?php 
	elseif($this->session->userdata("session_bgm_edocument_id") == $data_row_ext->DOC_MAKER && $FILTER == "KADALUARSA" && $arcived <= 30 && $arcived >= 1): 
	?>
		<div class="alert alert-warning fade in">
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?=$data_row_ext->DOC_NAMA; ?>, Akan <b>Diarsipkan</b> dalam <?=$arcived; ?> hari ke depan
				</div>
				<div class="col-sm-2" style="width:4%;">
					<form id="form_versioning[]" name="form_versioning[]" action="<?php echo base_url('C_notification/versioning'); ?>" method="post" enctype="multipart/form-data" target="_blank">
						<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
						<button type="submit" class="ace-icon fa fa-edit btn btn-sm btn-info" data-popup="tooltip" data-placement="top" title="Pengkinian"></button>
					</form>
				</div>
				<div class="col-sm-2" style="width:4%;">
					<form id="form_comment[]" name="form_comment[]" action="<?php echo base_url('C_news/comment'); ?>" method="post" enctype="multipart/form-data">
						<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
						<button type="submit" class="ace-icon fa fa-comment btn btn-sm btn-success"></button>
					</form>
				</div>
				<div class="col-sm-2" style="width:4%;">
					<form id="form_revisi[]" name="form_revisi[]" action="<?php echo base_url('C_notification/obsolete'); ?>" method="post" enctype="multipart/form-data">
						<input type="hidden" id="si_key" name="si_key" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
						<button type="submit" class="ace-icon fa fa-remove btn btn-sm btn-danger"></button>
					</form>
				</div>
			</div>
		</div>
	<?php elseif ($FILTER == "DIARSIPKAN"):?>
		<div class="alert alert-info fade in">
			<form action="<?= base_url('C_notification/delete_notification'); ?>" method="POST">
				<input type="hidden" name="id" value="<?= $data_row_ext->DOC_ID; ?>">
				<button type="submit" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</form>
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, <?php echo $data_row_ext->DOC_STATUS_ACTIVITY; ?>
					<br/>
					<?php echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));?> WIB
				</div>
			</div>
		</div>
	<?php else: ?>
		<div class="alert alert-info fade in">
			<form action="<?= base_url('C_notification/delete_notification'); ?>" method="POST">
				<input type="hidden" name="doc_id" value="<?= $data_row_ext->DOC_ID; ?>">
				<input type="hidden" name="user_id" value="<?= $data_row_ext->NIP; ?>">
				<input type="hidden" name="notif_id" value="<?= $data_row_ext->NOTIF_ID; ?>">
				<button type="submit" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</form>
			<div class="row">
				<div class="col-xs-10">
					Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, <?php echo $data_row_ext->DOC_STATUS_ACTIVITY; ?>
					<br/>
					<?php echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));?> WIB
				</div>
			</div>
		</div>
	<?php endif; // END if SESSION ?>
	<?php
		endforeach; // END data_row_ext
	endif; // END if is_continue
	?>
</div><!-- END Row -->
<?php if(in_array(5,$this->session->userdata("user_menu"))) { ?>
<div class="row"><!-- Row -->
	<div class="widget-box">
		<div class="widget-header">
			<h4 class="smaller">
				News
				<span class="badge badge-primary"><?php echo $count_news; ?></span>
			</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<?php
			if($count_news > 0){
				foreach($get_data_count as $data_row){
			?>
			<div class="media search-media">
				<div class="media-body">
					<div>
						<h5 class="media-heading">
							<a class="black"><?= $data_row->FULL_NAME; ?></a>
						</h5>
					</div>
					<div class="space-1"></div>
					<p>
						Nomor Dokumen : <?= $data_row->DOC_NOMOR; ?>
						<br/>
						Nama Dokumen : <?= $data_row->DOC_NAMA; ?>
					</p>

					<div class="search-actions text-center">
						<span class="text-info"><?php echo date('d M Y', strtotime($data_row->DOC_DATE)); ?></span>
						<br/>
						<span class="text-info"><?php echo date('G:i', strtotime($data_row->DOC_DATE))." WIB"; ?></span>
						<a href="<?php echo base_url('document-details-'.$data_row->DOC_ID) ?>" class="search-btn-action btn btn-sm btn-block btn-info">Lihat</a>
					</div>
				</div>
			</div>
			<?php } } ?>
		</div>
	</div><!-- Row News -->
	<?php } ?>

</div><!-- END Row -->