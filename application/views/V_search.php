<div class="row">
	<div class="center">
		<p class="lead">
			Halo <?php echo $this->session->userdata("session_bgm_edocument_name"); ?>, Selamat datang di e-Document
		</p>
		<ul class="list-unstyled spaced">
			<li>
				<h1>
					<img class="nav-user-photo" src="<?php echo base_url('template/backend/assets/images/avatars/logo_big.png'); ?>"/> e-DOKUMEN
				</h1>
			</li>
		</ul>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div id="accordion" class="accordion-style1 panel-group">
			<form class="form-horizontal" id="form_search" name="form_search" action="<?php echo base_url('search'); ?>" method="POST">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="ace-icon fa fa-check"></i>
					</span>
					<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search (Write A Keyword)" value="<?= set_value('keyword') ?>"  autocomplete="off" />
					<span class="input-group-btn">
						<button type="submit" id="search" name="cari" class="btn btn-purple btn-sm">
							<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
							Search
						</button>
						<a class="btn btn-red btn-sm" href="<?php echo base_url('menu');?>">
							<span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>
							Reload
						</a>
					</span>
				</div>
			</form>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div id="accordion" class="accordion-style1 panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse_advance_search">
							<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i> Pencarian Lanjutan
						</a>
					</h4>
				</div>
				<div class="panel-collapse collapse" id="collapse_advance_search">
					<div class="panel-body">
						<form class="form-horizontal" id="form_advance_search" name="form_advance_search" action="<?php echo base_url('advanced-search'); ?>" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="si_doc_type" class="col-sm-4 control-label" style="text-align:left">Tipe Dokumen</label>
								<div class="col-sm-8">
									<select id="si_doc_type" name="si_doc_type" class="form-control">
										<option value="">Pilih</option>
										<?php
										$is_continue = true;
										$get_data_ext = $this->M_library_database->DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_ALL();
										if(empty($get_data_ext)||$get_data_ext==""){
												$is_continue = false;
										}
										if($is_continue){
											foreach($get_data_ext as $data_row_ext){
												?>
												<option value="<?php echo $data_row_ext->DTSETE_ID; ?>"><?php echo $data_row_ext->DTSETE_TIPE; ?></option>
												<?php
											}
										}
										?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="ssa_dept_owner" class="col-sm-4 control-label" style="text-align:left">Dept Pemilik</label>
								<div class="col-sm-8">
									<select id="ssa_dept_owner" name="ssa_dept_owner" class="form-control">
										<option value="">Pilih</option>
										<?php 
											$dept_selected = "";
											foreach($list_department as $ls_dept) {
												if(isset($ssa_dept_owner)) {
													if ($ssa_dept_owner === $ls_dept->DN_ID) {
														$dept_selected = "selected";
													} else {
														$dept_selected = "";
													}
												}
										?>
											<option value="<?php echo $ls_dept->DN_ID;?>" <?php echo $dept_selected;?>><?php echo $ls_dept->DN_NAME;?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="ssa_group_proces" class="col-sm-4 control-label" style="text-align:left">Group Proses</label>
								<div class="col-sm-8">
									<select id="ssa_group_proces" name="ssa_group_proces" class="form-control">
										<option value="">Pilih</option>
										<option value="GROUP PROSES">GROUP PROSES</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="ssa_proces" class="col-sm-4 control-label" style="text-align:left">Proses</label>
								<div class="col-sm-8">
									<select id="ssa_proces" name="ssa_proces" class="form-control">
										<option value="">Pilih</option>
										<option value="PROSES">PROSES</option>
									</select>
								</div>
							</div>
							<button type="submit" id="btn_advance_search" name="btn_advance_search" class="btn btn-purple btn-sm">
								<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
								Search
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row" id="table">
	<table id="examplex" class="table table-bordered table-striped table-hovered example">
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
		<tbody>
			<?php
			if(!empty($detail)):
				// var_dump($detail);die;
			// $jml = count($detail);
			foreach($detail as $k=>$v):
			// for ($i=0; $i < $jml; $i++):
				date_default_timezone_set('Asia/Jakarta');
				$DOC_DATE_EXPIRED = date('Y-m-d',strtotime($v->DOC_TGL_EXPIRED));

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
				<tr>
					<td><?php echo $v->DOC_NOMOR;?></td>
					<td><?php echo $v->DOC_NAMA;?></td>
					<td><?php echo $v->DTSETE_SINGKATAN;?></td>
					<td><?php echo $v->DN_CODE;?></td>
					<td><?php echo date('d/M/Y', strtotime($v->DOC_DATE));?></td>
					<td><?php echo $v->DOC_STATUS;?></td>
					<td><?php echo $aging;?></td>
					<td>
						<a href="<?php echo base_url('document-details-'.$v->DOC_ID); ?>" class="fa fa-eye" style="font-size: 2rem;text-decoration: none;color: black;" target="_blank"></a>
						<?php 
							if (strrpos($v->JBLL_DOWNLOAD, $this->session->userdata("session_bgm_edocument_job_level_id")) !== FALSE): 
							// $doc_access_level = explode('|', $v->DOC_AKSES_LEVEL);
							// if (in_array('CRW', $doc_access_level) || in_array($this->session->userdata("session_bgm_edocument_job_level_id"), $doc_access_level)) :
						?>
						<a style="font-size: 2rem;text-decoration: none;color: black;" class="fa fa-download" href="<?=base_url('download-'.$v->DOC_ID.".zip");?>" id="btn-unduh" class="btn btn-sm btn-warning"></a>
						<?php endif; ?>
					</td>
				</tr>
			<?php
			endforeach;
			endif;
			?>
		</tbody>
	</table>
</div>
<script src="<?php echo base_url('template/backend/assets/js/jquery.dataTables.min.js');?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/jquery.dataTables.bootstrap.min.js');?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/dataTables.buttons.min.js');?>"></script>
<script type="text/javascript">
	$(document).ready( function () {
		$('#examplex').DataTable();
	});
</script>