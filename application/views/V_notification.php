<?php 
$count_news = 0;
$get_data_count = $this->M_notification->GET_NEWS_NEW($this->session->userdata("session_bgm_edocument_id"));
if(empty($get_data_count)||$get_data_count==""){

}else{
	$count_news = count($get_data_count);	
}
?>
<div class="row">
	<ul class="nav nav-tabs" role="tablist">
		<?php if ($this->session->userdata("user_menu") != NULL && in_array(5,$this->session->userdata("user_menu"))) { ?>
    	<li role="presentation" class="active">
			<a href="#news" aria-controls="news" role="tab" data-toggle="tab">
				News
				<span class="badge badge-primary"><?php echo $count_news; ?></span>
			</a>
		</li>
		<?php } ?>
		<?php if ($this->session->userdata("user_menu") != NULL && in_array(27,$this->session->userdata("user_menu"))) { ?>
		<li role="presentation">
			<a href="#notification" aria-controls="notification" role="tab" data-toggle="tab"
				>Notification 
				<span class="badge badge-primary"><?php echo count($notification); ?></span>
			</a>
		</li>
		<?php } ?>
	</ul>
	<div class="tab-content">
		<?php if ($this->session->userdata("user_menu") != NULL && in_array(5,$this->session->userdata("user_menu"))) { ?>
		<div role="tabpanel" class="tab-pane fade in active" id="news">
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
		<?php } ?>
		<?php if ($this->session->userdata("user_menu") != NULL && in_array(27,$this->session->userdata("user_menu"))) { ?>
		<div role="tabpanel" class="tab-pane fade" id="notification">
			<?php
			$x = [];
			foreach ($notification as $k=>$v) {
				$x[] = $v->DOC_NAMA;
			}
			// echo '<pre>' . var_dump($x);die;
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
					$versioning_document = $this->M_notification->getVersioning($data_row_ext->DOC_ID);
					$versioning_date = NULL;
					if (count($versioning_document) > 0) {
						$versioning_date = $versioning_document[0]['DOCV_DATE'];
					}
			?>
			<!-- Menunggu Persetujuan Anda -->
			<?php 
			if ($this->session->userdata("session_bgm_edocument_departement_id")==$FILTER): 
			?>
				<div class="alert alert-warning fade in">
					<div class="row">
						<div class="col-xs-10">
							Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, perlu persetujuan Anda!
							<br/>
							<?php 
							if ($versioning_date) {
								echo date('d/M/Y G:i', strtotime($versioning_date));
							} else {
								echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
							}
							?> WIB
						</div>
						<div class="col-xs-2" style="text-align:right;">
							<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
						</div>
					</div>
				</div>
			<?php 
			// as atasan
			elseif ($this->session->userdata("session_dep_code_employee")==$FILTER):
			?>
				<div class="alert alert-warning fade in">
					<div class="row">
						<div class="col-xs-10">
							Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, perlu persetujuan Anda!
							<br/>
							<?php 
							if ($versioning_date) {
								echo date('d/M/Y G:i', strtotime($versioning_date));
							} else {
								echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
							}
							?> WIB
						</div>
						<div class="col-xs-2" style="text-align:right;">
							<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
						</div>
					</div>
				</div>
			<?php 
			elseif ($this->session->userdata("session_bgm_edocument_direktorat_id")==$FILTER):
			?>
				<div class="alert alert-warning fade in">
					<div class="row">
						<div class="col-xs-10">
							Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, perlu persetujuan Anda!
							<br/>
							<?php 
								if ($versioning_date) {
									echo date('d/M/Y G:i', strtotime($versioning_date));
								} else {
									echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
								}
							?> WIB
						</div>
						<div class="col-xs-2" style="text-align:right;">
							<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
						</div>
					</div>
				</div>
			<?php
			//DItolak untuk atasan
			elseif (($this->session->userdata("session_bgm_edocument_departement_id") == $FILTER || $this->session->userdata("session_bgm_edocument_divisi_code") == $FILTER || $this->session->userdata("session_bgm_edocument_direktorat_id") == $FILTER) && strrpos($data_row_ext->DOC_STATUS, 'DITOLAK') !== FALSE): 
			?>
				<div class="alert alert-warning fade in">
					<div class="row">
						<div class="col-xs-10">
							Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, <?php echo $data_row_ext->DOC_STATUS_ACTIVITY; ?>
							<br/>
							<?php 
								if ($versioning_date) {
									echo date('d/M/Y G:i', strtotime($versioning_date));
								} else {
									echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
								}
							?> WIB
						</div>
						<div class="col-xs-2" style="text-align:right;">
							<a data-toggle="modal" data-target="#modal-preview<?=$data_row_ext->DOC_ID;?>" class="ace-icon fa fa-eye btn btn-sm btn-warning" data-popup="tooltip" data-placement="top" title="Preview"></a>
						</div>
					</div>
				</div>
			<?php 
			//DITOLAK untuk si pembuat
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
							<?php 
								if ($versioning_date) {
									echo date('d/M/Y G:i', strtotime($versioning_date));
								} else {
									echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
								}
							?> WIB
						</div>
					</div>
				</div>
			<?php 
			elseif($FILTER =="KADALUARSA"): 
			?>
				<div class="alert alert-danger fade in">
					<!-- <form action="<?= base_url('C_notification/delete_notification'); ?>" method="POST">
						<input type="hidden" name="doc_id" value="<?= $data_row_ext->DOC_ID; ?>">
						<input type="hidden" name="user_id" value="<?= $data_row_ext->NIP; ?>">
						<input type="hidden" name="notif_id" value="<?= $data_row_ext->NOTIF_ID; ?>">
						<button type="submit" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</form> -->
					<div class="row">
						<div class="col-xs-10">
							Dokumen <?php echo $data_row_ext->DOC_NAMA; ?>, <?php echo $data_row_ext->DOC_STATUS_ACTIVITY; ?>
							<br/>
							<?php 
								if ($versioning_date) {
									echo date('d/M/Y G:i', strtotime($versioning_date));
								} else {
									echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
								}
							?> WIB
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
							<?php 
								if ($versioning_date) {
									echo date('d/M/Y G:i', strtotime($versioning_date));
								} else {
									echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
								}
							?> WIB
						</div>
					</div>
				</div>
			<?php else:
				// //ditolak untuk pendistribusi
				$user_maker_department = $this->M_library_database->getUserMakerDepartemen($data_row_ext->DOC_MAKER);
				$user_maker_division = $this->M_library_database->getUserMakerDivisi($data_row_ext->DOC_MAKER);
				$user_approved_department = $this->M_library_database->getUserMakerDepartemen($data_row_ext->DOC_APPROVE);
				$user_approved_division = $this->M_library_database->getUserMakerDivisi($data_row_ext->DOC_APPROVE);
				// if (($user_maker_department['DEPCODE'] == $this->session->userdata("session_bgm_edocument_departement_id") || $user_maker_division['DI_ID'] == $this->session->userdata("session_bgm_edocument_divisi_id")) || (strrpos($data_row_ext->DOC_STATUS, 'DITOLAK') !== FALSE && $user_maker_department['DEPCODE'] == $this->session->userdata("session_bgm_edocument_departement_id") || $user_maker_division['DI_ID'] == $this->session->userdata("session_bgm_edocument_divisi_id"))) {
				if(
					strrpos($data_row_ext->DOC_STATUS, $this->session->userdata("session_bgm_edocument_departement_id")) !== FALSE || 
					$user_maker_department['DEPCODE'] == $this->session->userdata("session_bgm_edocument_departement_id") ||
					$user_approved_department['DEPCODE'] == $this->session->userdata("session_bgm_edocument_departement_id") || 
					$user_approved_division['DI_ID'] == $this->session->userdata("session_bgm_edocument_divisi_id") || 
					$this->session->userdata("session_bgm_edocument_departement_id") == $data_row_ext->DOC_PENDISTRIBUSI ||
					($user_maker_division['DI_ID'] == $this->session->userdata("session_bgm_edocument_divisi_id") &&  
					$this->session->userdata("session_bgm_edocument_departement_id") == "") 
				) {
			?>
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
							<?php 
								if ($versioning_date) {
									echo date('d/M/Y G:i', strtotime($versioning_date));
								} else {
									echo date('d/M/Y G:i', strtotime($data_row_ext->DOC_DATE));
								}
							?> WIB
						</div>
					</div>
				</div>
				<?php  } endif; // END if SESSION ?>
			<?php
				endforeach; // END data_row_ext
			endif; // END if is_continue
			?>
		</div>
		<?php } ?>
	</div>
</div><!-- END Row -->

<!-- Modal Preview-->
<?php 
	if(count($notification) > 0) {
		foreach ($notification as $data_row_ext) {
?>
<div id="modal-preview<?=$data_row_ext->DOC_ID;?>" class="modal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="blue bigger">Preview</h5>
			</div>
			<div class="modal-body">
				<div class="row">
					<?php
					$get_data_doc = $this->M_library_database->DB_GET_DATA_DOCUMENT_DETAIL_BY_ID_EVO($data_row_ext->DOC_ID);
					// Dokumen Detail
					foreach($get_data_doc as $data_row_doc){
						$DOCD_UTAMA = $data_row_doc->DOCD_UTAMA;
						$EXT_UTAMA	= $data_row_doc->DOCD_UTAMA_EXT;
						$STATUS_UTAMA = $data_row_doc->DOCD_UTAMA_STATUS;

						$DOCD_PELENGKAP_1 = $data_row_doc->DOCD_PELENGKAP_1;
						$EXT_1 = $data_row_doc->DOCD_PELENGKAP_1_EXT;
						$STATUS_1 = $data_row_doc->DOCD_PELENGKAP_1_STATUS;

						$DOCD_PELENGKAP_2 = $data_row_doc->DOCD_PELENGKAP_2;
						$EXT_2 = $data_row_doc->DOCD_PELENGKAP_2_EXT;
						$STATUS_2 = $data_row_doc->DOCD_PELENGKAP_2_STATUS;

						$DOCD_PERSETUJUAN = $data_row_doc->DOCD_PERSETUJUAN;
					}
					if ($EXT_UTAMA=="doc" || $EXT_UTAMA=="docx" || $EXT_UTAMA=="xls" || $EXT_UTAMA=="xlsx" || $EXT_UTAMA=="ppt" || $EXT_UTAMA=="pptx") {
						$url_path_utama = base_url('assets/original/').$DOCD_UTAMA.".".$EXT_UTAMA;
					}else{
						$url_path_utama = base_url('assets/pdf/').$DOCD_UTAMA.'.pdf';
					}
					if ($EXT_1=="doc" || $EXT_1=="docx" || $EXT_1=="xls" || $EXT_1=="xlsx" || $EXT_1=="ppt" || $EXT_1=="pptx") {
						$url_path_pelengkap_1 = base_url('assets/original/').$DOCD_PELENGKAP_1.".".$EXT_1;
					}else{
						$url_path_pelengkap_1 = base_url('assets/pdf/').$DOCD_PELENGKAP_1.".pdf";
					}
					if ($EXT_2=="doc" || $EXT_2=="docx" || $EXT_2=="xls" || $EXT_2=="xlsx" || $EXT_2=="ppt" || $EXT_2=="pptx") {
						$url_path_pelengkap_2 = base_url('assets/original/').$DOCD_PELENGKAP_2.".".$EXT_2;
					}else{
						$url_path_pelengkap_2 = base_url('assets/pdf/').$DOCD_PELENGKAP_2.".pdf";
					}
					$url_path_persetujuan = base_url('assets/original/').$DOCD_PERSETUJUAN;
					// Pemilik Proses
					$DOC_PEMILIK_PROSES = $data_row_ext->DOC_PEMILIK_PROSES;
					$DOC_PEMILIK_PROSES_FINAL = "";
					if($DOC_PEMILIK_PROSES=="BPI"){
						$DOC_PEMILIK_PROSES_FINAL = ""."BPI";
					}else if($DOC_PEMILIK_PROSES==$this->session->userdata("session_bgm_edocument_divisi_id") ){
						$DOC_PEMILIK_PROSES_FINAL = "".$this->session->userdata("session_bgm_edocument_divisi_name");
					}else{
						$get_data = $this->M_library_database->DB_GET_DATA_DEPARTEMEN_BY_ID_EVO($DOC_PEMILIK_PROSES);
						if ($get_data) {
							foreach($get_data as $data_row){
								$DN_ID = $data_row->DN_ID;
								$DN_CODE = $data_row->DN_CODE;
								$DN_NAME = $data_row->DN_NAME;
							}
							$DOC_PEMILIK_PROSES_FINAL = "".$DN_CODE;
						}
					}
					?>
					<?php if ($data_row_ext->DOC_DISTRIBUSI=="EDOC"): ?>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6" style="position: relative;">
					<div style="width: 386px;height:500px;background-color:rgba(201, 76, 76, 0);z-index: 99999;position: absolute;"></div>
							<div class="form-group">
								<!-- <object data="<?=$url_path_persetujuan;?>" type="application/pdf" width="400px" height="500px"> -->
									<iframe src="<?=$url_path_persetujuan.'#toolbar=0&navpanes=0&scrollbar=0&docId=456';?>" width="400px" height="500px"></iframe>
								<!-- </object> -->
								<label for="" class="col-sm-12 control-label" style="text-align:left">
									<!-- <a target="_blank" href="<?=$url_path_persetujuan;?>">Dokumen Persetujuan</a> -->
								</label>
							</div>
							
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">
									<a target="_blank" href="<?= base_url('C_notification/document/'.$data_row_ext->DOC_ID.'/'.$DOCD_UTAMA); ?>">Dokumen Utama</a> | Original File Type "<?php echo $EXT_UTAMA;?>"
								</label>
							</div>
							<?php if($data_row_doc->DOCD_PELENGKAP_1!="File_Not_Found"): ?>
								<div class="form-group">
									<label for="" class="col-sm-12 control-label" style="text-align:left">
										<a target="_blank" href="<?= base_url('C_notification/document/'.$data_row_ext->DOC_ID.'/'.$DOCD_PELENGKAP_1); ?>">Dokumen Pelengkap 1</a> | Original File Type "<?php echo $EXT_1;?>"
									</label>
								</div>
							<?php endif; ?>
							<?php if($data_row_doc->DOCD_PELENGKAP_2!="File_Not_Found"): ?>
								<div class="form-group">
									<label for="" class="col-sm-12 control-label" style="text-align:left">
										<a target="_blank" href="<?= base_url('C_notification/document/'.$data_row_ext->DOC_ID.'/'.$DOCD_PELENGKAP_2); ?>">Dokumen Pelengkap 2</a> | Original File Type "<?php echo $EXT_2;?>"
									</label>
								</div>
							<?php endif; ?>
						</div>
						
					<?php endif; ?>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6">
						<div class="row">
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Nama Dokumen</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="<?=$data_row_ext->DOC_NAMA;?>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Nomor Dokumen</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="<?=$data_row_ext->DOC_NOMOR;?>"readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Versi</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="<?=$data_row_ext->DOC_VERSI;?>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Tipe Dokumen</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="<?=$data_row_ext->DTSETE_TIPE;?>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Standar Kerahasian</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="<?=$data_row_ext->CL_NAME;?>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Abstrak</label>
								<div class="col-sm-12">
									<textarea readonly type="text" rows="3" class="form-control" style="resize:none;background-color:white;"><?=$data_row_ext->DOC_ABSTRAK;?></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Dept Pemilik Proses</label>
								<div class="col-sm-12">
									<textarea type="text" rows="1" class="form-control" style="resize:none;background-color:white;" readonly><?=$DOC_PEMILIK_PROSES_FINAL;?></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Tanggal Berlaku</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="<?= date('d/M/Y', strtotime($data_row_ext->DOC_TGL_EFEKTIF)); ?>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-12 control-label" style="text-align:left">Tanggal Kadaluarsa</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" value="<?= date('d/M/Y', strtotime($data_row_ext->DOC_TGL_EXPIRED));?>" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="row">
					<div class="col-sm-12">
						<form id="form_detail" name="form_view[]" action="<?php echo base_url('pmd-details'); ?>" method="post" enctype="multipart/form-data" target="_blank">
							<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $data_row_ext->DOC_ID; ?>" class="form-control" required/>
							<button type="button" class="btn btn-sm" data-dismiss="modal">
								<i class="ace-icon fa fa-times"></i>
								Close
							</button>
							<button type="submit" class="ace-icon fa fa-eye btn btn-sm btn-success"> Detail PMD </button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php } } ?>
<!-- END Modal Preview-->
