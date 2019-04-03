<?php foreach ($detaillist as $key) : ?>
<div class="row">
	<div class="col-md-5">
		<div class="row">
			<div class="col-md-12">
				<div class="embed-responsive embed-responsive-16by9" style="height:500px;">
					<object data="<?= base_url('assets/original/'.$key['DOCD_PERSETUJUAN']);?>#toolbar=0&navpanes=0&scrollbar=0" class="mbed-responsive-item">
					</object>
				</div>
			</div>
			<?php if($key['DOC_MAKER']!=$this->session->userdata("session_bgm_edocument_id")): ?>
			<div class="col-md-12">
				<div class="form-group">
					<?php
					$get_maks_comment = $this->db->get('m_maks_comment')->result();
					?>
					<label for="">Tulis Komentar :</label>
					<form class="form-horizontal" id="form_new_data" name="form_new_data" action="<?php echo base_url('C_menu/comment'); ?>" method="post" enctype="multipart/form-data">

						<input type="hidden" id="si_docid" name="si_docid" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
						<input type="hidden" id="si_maker" name="si_maker" value="<?php echo $key['DOC_MAKER']; ?>" class="form-control" required/>

						<div class="form-group">
							<textarea type="text" maxlength="<?= $get_maks_comment[0]->maks; ?>" name="si_review" id="si_review" rows="7" class="form-control" style="resize:none;width: 430px;margin-left: 1rem;" required></textarea>
						</div>

						<button type="submit" id="btn_comment" name="btn_comment" class="ace-icon fa fa-check btn btn-success btn-sm">Kirim</button>
					</form>
				</div>
			</div>
			<div class="col-md-12">
				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">
							Daftar Komentar
						</h4>
					</div>
				</div>
				<div class="widget-box transparent">
					<div class="widget-header widget-header-small">
						<div class="widget-toolbar action-buttons">
							<a href="#" data-action="reload">
								<i class="ace-icon fa fa-refresh blue"></i>
							</a>
						</div>
					</div>
					<div class="widget-body">
						<?php
						$get_comment = $this->db
							->select('*')
							->from('tb_document_comment')
							->join('tb_employee', 'tb_document_comment.DTCT_USER = tb_employee.NIP', 'left')
							->where(array('tb_document_comment.DTCT_USER' => $this->session->userdata("session_bgm_edocument_id"), 'tb_document_comment.DOC_ID' => $key['DOC_ID']))
							->get()->result();
						if (!empty($get_comment)):
							foreach ($get_comment as $get_comment_1) {
								$COMMENTER = $get_comment_1->DTCT_USER;
							}
							if ($COMMENTER == $this->session->userdata("session_bgm_edocument_id") && $COMMENTER != $key['DOC_MAKER']):
						?>
						<ul class="list-group">
							<?php foreach ($get_comment as $get_comment): ?>
							<li class="list-group-item">
								<?=$get_comment->NIP." - ".$get_comment->FULL_NAME;?> : <?=$get_comment->DTCT_NOTE;?>
								<hr>
								<?= date('d/M/Y', strtotime($get_comment->DTCT_DATE))." WIB"; ?>
							</li>
							<?php endforeach; ?>
						</ul>
							<?php endif; ?>
						<?php endif; ?>
					</div>
				</div>
			</div>
		<?php endif; ?>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="form-group">
			<label>Abstrak</label>
			<textarea readonly name="" id="" style="resize: none;" cols="105" rows="6"><?php echo $key['DOC_ABSTRAK'] ?></textarea>
		</div>
		<div class="form-group">
			<h5><b><?php echo $key['DOC_NOMOR'] ?></b></h5>
		</div>
		<form class="form-horizontal">
			<div class="form-group">
				<label for="" class="col-sm-6">Tipe Dokumen</label>
				<label for="" class="col-sm-2">
					<input readonly style="width: 40rem;" type="text" id="" value="<?php echo $key['DTSETE_TIPE'] ?>">
				</label>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-6">Dept. Pemilik Proses</label>
				<label for="" class="col-sm-2">
					<input readonly style="width: 40rem;" type="text" id="" value="<?php echo $key['DN_NAME'] ?>">
				</label>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-6">Group Proses</label>
				<label for="" class="col-sm-2">
					<input readonly style="width: 40rem;" type="text" id="" value="<?php echo $key['DOC_GROUP_PROSES'] ?>">
				</label>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-6">Proses</label>
				<label for="" class="col-sm-2">
					<input readonly style="width: 40rem;" type="text" id="" value="<?php echo $key['DOC_PROSES'] ?>">
				</label>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-6">Jenis Dokumen</label>
				<label for="" class="col-sm-2">
					<input readonly style="width: 40rem;" type="text" id="" value="<?php echo $key['DTSEJS_JENIS'] ?>">
				</label>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-6">Nama Dokumen</label>
				<label for="" class="col-sm-2">
					<input readonly style="width: 40rem;" type="text" id="" value="<?php echo $key['DOC_NAMA'] ?>">
				</label>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-6" style="">
					<!-- DOKUMEN UTAMA -->
					<!-- <a id="click" href="" data-toggle="modal" data-target="#dokumenutama<?= $key['DOCD_UTAMA'];?>">DOKUMEN UTAMA</a> -->
					<a target="_blank" href="<?= base_url('C_notification/document/'.$key['DOC_ID'].'/'.$key['DOCD_UTAMA']); ?>">Dokumen Utama</a>
					<!-- END DOKUMEN UTAMA -->
					<br>
					<!-- Dokumen Pelengkap 1 -->
					<?php if($key['DOCD_PELENGKAP_1']!="File_Not_Found"): ?>
					<!-- <a href="" data-toggle="modal" data-target="#dokumenpelengkap1<?= $key['DOCD_PELENGKAP_1'];?>">DOKUMEN PELENGKAP 1</a>  -->
					<a target="_blank" href="<?= base_url('C_notification/document/'.$key['DOC_ID'].'/'.$key['DOCD_PELENGKAP_1']); ?>">Dokumen Pelengkap 1</a>
					<br>
					<?php endif; ?>
					<!-- Dokumen Pelengkap 2 -->
					<?php if($key['DOCD_PELENGKAP_2']!="File_Not_Found"): ?>
					<!-- <a href="" data-toggle="modal" data-target="#dokumenpelengkap2<?= $key['DOCD_PELENGKAP_2'];?>">DOKUMEN PELENGKAP 2</a> -->
					<a target="_blank" href="<?= base_url('C_notification/document/'.$key['DOC_ID'].'/'.$key['DOCD_PELENGKAP_2']); ?>">Dokumen Pelengkap 2</a>
					<br>
					<?php endif; ?>
				</label>
				<label for="" class="col-sm-6" style="font-size:10px;">
					*Dengan Anda Membuka Dokumen Utama, Berarti Anda Sudah Membaca dan Memahami Dokumen ini
				</label>
			</div>

		</form>
		<h5 id="show" style="color:orange;"><b>Saya sudah membaca dan memahami dokumen ini</b></h5>
		<?php $pengguna = $this->Model_detail->getDetail($this->session->userdata("session_bgm_edocument_departement_id"),$key['DOC_ID'],$this->session->userdata("session_bgm_edocument_job_level_id"));  ?>
		<?php if ($pengguna): ?>
			<form id="form_detail" name="form_view[]" action="<?php echo base_url('C_notification/detail'); ?>" method="post" enctype="multipart/form-data" target="_blank">
				<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
				<button type="submit" class="btn btn-info"><b>Detail PMD</b></button>
			</form>
		<?php endif ?>
		
	</div>
	<div class="col-md-3" style="float: left;">
	<?php
		$DOC_ID = $key['DOC_ID'];
		$session_dpt = $this->Model_detail->getDetail($this->session->userdata("session_bgm_edocument_departement_id"),$DOC_ID,$this->session->userdata("session_bgm_edocument_job_level_id")); 
	?>
	<?php if ($session_dpt): ?>
		<!-- sharelink -->
		<a data-toggle="modal" data-target="#modal-sharelink<?= $key['DOC_ID'];?>" data-popup="tooltip" data-placement="top" title="Sharelink" href="" style="color: black;"><i class="glyphicon glyphicon-link" style="font-size: 2.5rem;float: right;cursor: pointer;margin-left: .7rem"></i></a>
		<!-- sharelink -->
	<?php endif ?>
	<?php if ($key['DOC_MAKER'] == $this->session->userdata("session_bgm_edocument_id")): ?>
		<!-- comment -->
	<form id="form_comment[]" style="float: right; " name="form_comment[]" action="<?php echo base_url('C_news/comment'); ?>" method="post" enctype="multipart/form-data">
		<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
		<button type="submit" class="btn btn-link" data-placement="top" title="comment-list"><i class="fa fa-comment" style="color:black;font-size: 2.5rem;float: right;margin-left:.7rem;cursor: pointer;margin: -.4rem -1.7rem 0 -.7rem;"></i> </button>
	</form>
	<!-- end comment -->
	<?php endif; ?>
	<?php if ($key['DOC_MAKER'] == $this->session->userdata("session_bgm_edocument_id") && ($key['DOC_STATUS'] == 'DIPUBLIKASI' || $key['DOC_STATUS'] == 'KADALUARSA' || $key['DOC_STATUS'] == 'DIARSIPKAN')): ?>
	<!-- versioning -->
	<a data-toggle="modal" data-target="#modal-versioning<?= $key['DOC_ID'];?>" data-popup="tooltip" data-placement="top" title="Pengkinian" href="" style="color: black;"><i class="glyphicon glyphicon-edit" style="font-size: 2.5rem;float: right;cursor: pointer;margin-left: .7rem"></i></a>
	<!-- end versioning -->
	<?php endif ?>
	<?php if (
		$this->session->userdata("session_bgm_edocument_id") == $key['DOC_MAKER'] &&

		(
			$this->session->userdata("session_bgm_edocument_roles") == "PENDISTRIBUSI" || $this->session->userdata("session_bgm_edocument_roles") == "PENCIPTA" ||
			$this->session->userdata("session_bgm_edocument_roles_2") == "PENDISTRIBUSI" || $this->session->userdata("session_bgm_edocument_roles_2") == "PENCIPTA" ||
			$this->session->userdata("session_bgm_edocument_roles_3") == "PENDISTRIBUSI" || $this->session->userdata("session_bgm_edocument_roles_3") == "PENCIPTA" ||
			$this->session->userdata("session_bgm_edocument_roles_4") == "PENDISTRIBUSI" || $this->session->userdata("session_bgm_edocument_roles_4") == "PENCIPTA" ||
			$this->session->userdata("session_bgm_edocument_roles_5") == "PENDISTRIBUSI" || $this->session->userdata("session_bgm_edocument_roles_5") == "PENCIPTA"
		) 
		&&
		$key['DOC_STATUS'] == 'DIPUBLIKASI'): ?>
	<!-- archive -->
	<a href="" data-placement="top" title="Arsipkan" data-toggle="modal" data-target="#myModal" style="color: black;"><i class="fa fa-archive" style="font-size: 2.5rem;float: right;cursor: pointer;margin-left: .7rem"></i></a>
	<!-- end archive -->
	<?php endif; ?>
	
	<!-- bookmark -->
	<form id="form_bookmark[]" style="float: right; " name="form_bookmark" action="<?php echo base_url('C_bookmarks/bookmark'); ?>" method="post" enctype="multipart/form-data">
		<input type="hidden" id="si_key" name="si_key" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
		<input type="hidden" id="ur_id" name="ur_id" value="<?php echo $this->session->userdata("session_bgm_edocument_id"); ?>" class="form-control" required/>
		<button data-placement="top" title="Bookmark" type="submit" class="btn btn-link"><i class="glyphicon glyphicon-bookmark" style="color:black;font-size: 2.5rem;float: right;margin-left:.7rem;cursor: pointer;margin: -.4rem -1.5rem 0 -.7rem;"></i> </button>
	</form>
	<!-- bookmark end -->
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<form action="<?php echo base_url('C_bookmarks/archived_by') ?>" method="POST">
				<h4><b>Alasan Non Aktifkan Dokumen</b></h4>
				<textarea style="resize: none;" name="note" id="" cols="60" rows="9" minlength="20"></textarea>
				<?php
				if ($this->session->userdata("session_bgm_edocument_departement_code") == "BPI") {
					$si_archived = "BPI";
				}else{
					$si_archived = $this->session->userdata("session_bgm_edocument_id");
				}
			?>
				<input type="hidden" name="si_archived" value="<?php echo $si_archived; ?>">
				<input type="hidden" name="si_key" value="<?php echo $key['DOC_ID']; ?>">
			</div>
			<div class="modal-footer">
				<button type="submit" name="nonaktif" class="btn btn-primary">Arsipkan</button>
			</div>
				</form>
		</div>
	</div>
</div>
<!-- Modal Versioning -->
<div id="modal-versioning<?=$key['DOC_ID'];?>" class="modal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="blue bigger">Pengkinian Dokumen</h5>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-2" style="width:20%;">
								<p>Nomor Dokumen</p>
							</div>
							<div class="col-sm-2" style="width:5%;">
								<p>:</p>
							</div>
							<div class="col-sm-8">
								<p><?php echo $key['DOC_NOMOR']; ?></p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2" style="width:20%;">
								<p>Nama Dokumen</p>
							</div>
							<div class="col-sm-2" style="width:5%;">
								<p>:</p>
							</div>
							<div class="col-sm-8">
								<p><?php echo $key['DOC_NAMA']; ?></p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2" style="width:20%;">
								<p>Versi</p>
							</div>
							<div class="col-sm-2" style="width:5%;">
								<p>:</p>
							</div>
							<div class="col-sm-1">
								<?php
								$versi_awal = $key['DOC_VERSI'];
								$num_char = 3;
								$cut_text = substr($versi_awal, 0, $num_char);
								if ($versi_awal{$num_char - 1} != '.') { // jika huruf ke 50 (50 - 1 karena index dimulai dari 0) bukan  spasi
									$new_pos = strrpos($cut_text, '.'); // cari posisi spasi, pencarian dari huruf terakhir
									$cut_text = substr($versi_awal, 0, $new_pos);
								}
								$versi = $cut_text+1;
								$versi_isi = $versi.".0";
								$versi_meta = $versi_awal + 0.1;
								?>
								<input type="number" id="si_history_version" name="si_history_version" placeholder="1.0" min="0" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==5) return false;" class="form-control" value="<?php echo $versi_awal; ?>" />
								</div>
							</div>
							<div class="row" id="radio">
								<div class="col-sm-12">
									<input type="radio" class="radio_isi" id="radio1" name="up_doc" value="perubahan_isi"/> Perubahan Isi Dokumen
								</div>
								<div class="col-sm-12">
									<input type="radio" class="radio_meta" id="radio2" name="up_doc"/> Perubahan Meta Data Dokumen
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-sm-12">
									<form id="v_isi" class="hide" name="v_isi[]" action="<?php echo base_url('C_notification/versioning_isi'); ?>" method="post" enctype="multipart/form-data">
									<p>Catatan Versi</p>
									<textarea class="form-control catatan" id="catatan_isi" name="catatan_versi" style="resize:none;height:300px;" required></textarea>
									<br/>
									<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
									<a href="<?=base_url('C_menu/zip/'.$key['DOC_ID']);?>" id="btn-unduh" class="btn-unduh btn btn-sm btn-warning">Unduh</a>
									<button type="submit" class="btn btn-sm btn-success">Registrasi</button>
									</form>
								</div>
								<div class="col-sm-12">
									<form id="v_meta" class="hide" name="v_meta[]" action="<?php echo base_url('C_notification/versioning_meta'); ?>" method="post" enctype="multipart/form-data">
									<p>Catatan Versi</p>
									<textarea class="form-control catatan" id="catatan_meta" name="catatan_versi" style="resize:none;height:300px;" required></textarea>
									<br/>
									<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
									<button type="submit" class="btn btn-sm btn-info">Registrasi</button>
									</form>
								</div>
							</div>
						</div>
						</div>
							<div class="modal-footer">
								<button class="btn btn-sm" data-dismiss="modal">
									<i class="ace-icon fa fa-times"></i>
									Close
								</button>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END -->
<!-- ShareLink -->
<div id="modal-sharelink<?=$key['DOC_ID'];?>" class="modal" tabindex="-1">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="blue bigger">ShareLink</h5>
			</div>
			<div class="modal-body">
				<form action="<?php echo base_url('C_menu/sharelink'); ?>" id="form_link[]" name="form_link[]" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="email">Email</label>
					<select id="email" multiple="multiple" size="5" name="email[]" class="form-control" />
					<?php
					$get_data_ext = $this->Model_detail->DB_GET_EMAIL();
					foreach($get_data_ext as $data_row_ext){
					?>
					<option value="<?php echo $data_row_ext->NIP; ?>"><?php echo $data_row_ext->FULL_NAME; ?> ( <?php echo $data_row_ext->EMAIL; ?> )</option>
					<?php
					}
					?>
					</select>
				</div>
				<div class="form-group">
					<label for="pesan">Tulis Pesan</label>
					<textarea style="resize: none;" class="form-control" name="pesan" id="pesan" cols="30" rows="10" required></textarea>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="si_key" name="si_key" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
					<input type="hidden" name="pengirim" value="<?= $this->session->userdata("session_bgm_edocument_id") ?>">
					<button class="btn btn-primary btn-sm">
						<i class="glyphicon glyphicon-plus"></i> Kirim
					</button>
					<button class="btn btn-sm" data-dismiss="modal">
					<i class="ace-icon fa fa-times"></i>
					Close
					</button>
				</form>
			</div>
			</div>
		</div>
	</div>
</div>
<!-- end -->
<?php endforeach; ?>
<!--[if lte IE 8]>
  <script src="<?php echo base_url('template/backend/assets/js/excanvas.min.js'); ?>"></script>
<![endif]-->
<script src="<?php echo base_url('template/backend/assets/js/jquery-ui.custom.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.ui.touch-punch.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.gritter.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootbox.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.easypiechart.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-datepicker.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.hotkeys.index.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-wysiwyg.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/select2.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/spinbox.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-editable.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/ace-editable.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.maskedinput.min.js'); ?>"></script>

<script src="<?php echo base_url('template/backend/assets/js/prettify.min.js'); ?>"></script>

<script src="<?php echo base_url('template/backend/assets/js/chosen.jquery.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-timepicker.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/moment.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/daterangepicker.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-datetimepicker.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-colorpicker.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.knob.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/autosize.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.inputlimiter.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-tag.min.js'); ?>"></script>

<script src="<?php echo base_url('template/backend/assets/js/jquery.dataTables.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.dataTables.bootstrap.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/dataTables.buttons.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/buttons.flash.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/buttons.html5.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/buttons.print.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/buttons.colVis.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/dataTables.select.min.js'); ?>"></script>

<script src="<?php echo base_url('template/backend/assets/js/jquery.bootstrap-duallistbox.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.raty.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/bootstrap-multiselect.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery-typeahead.js'); ?>"></script>

<script src="<?php echo base_url('template/backend/assets/js/ace-elements.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/ace.min.js'); ?>"></script>

<script src="<?php echo base_url('template/rion/jquery_costum.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/sweetalert.min.js'); ?>"></script>
	<?php if ($pesan = $this->session->flashdata('pesan')): ?>
	<script>
		swal("<?php echo $pesan; ?>", "Berhasil Di Bookmark!", "success");
	</script>
	<?php endif; ?>
	<?php if ($pesan_gagal = $this->session->flashdata('pesan_gagal')): ?>
	<script>
		swal("Maaf!", "Dokumen telah terbookmark!", "warning");
	</script>
	<?php endif; ?>
	<!-- pesan email -->
	<?php if ($pesan = $this->session->flashdata('pesan_email')): ?>
	<script>
		swal("<?php echo $pesan; ?>", "Email Berhasil Terkirim!", "success");
	</script>
	<?php endif; ?>
	<?php if ($pesan_gagal = $this->session->flashdata('pesan_email_gagal')): ?>
	<script>
		swal("Maaf!", "Email Gagal dikirim!", "error");
	</script>
	<?php endif; ?>

</body>
<!------------------------------------------------------------------------------------------------->
</html>
<!------------------------------------------------------------------------------------------------->
<script>
	$('#si_history_version').keydown(function(e) {
		if(e.keyCode == 189 || e.keyCode == 69) {
	        return false;
	    }
	});
$('#show').hide();

	$('#click').click(function(){
		$('#show').show();
	});

	$('#myModal').on('shown.bs.modal', function () {
  		$('#myInput').focus()
	});

	$('#modal-versioning').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	});
	
	$(function () {
		$('#radio1').change(function() {
			$('#v_isi').removeClass('hide');
			$('#v_meta').addClass('hide');
			$('#si_history_version').val('<?=$versi_isi?>');
		});
		$('#radio2').change(function() {
			$('#v_isi').addClass('hide');
			$('#v_meta').removeClass('hide');
			$('#si_history_version').val('<?=$versi_meta?>');
		});
		$('[data-toggle="tooltip"]').tooltip()
	});

	// $(function(){
	// 	$('#email').autocomplete({
	// 		source : "<?php echo base_url('C_menu/autocompleteemail'); ?>"
	// 	});
	// })
	var demo1 = $('select[name="email[]"]').bootstrapDualListbox({
		infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>',
		moveOnSelect: false
	});
	var container1 = demo1.bootstrapDualListbox('getContainer');
	container1.find('.btn').addClass('btn-white btn-info btn-bold');
</script>