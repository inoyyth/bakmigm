<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include (APPPATH.'libraries/session_user.php');
// Tools
$is_continue = true;
$count_notification = 0;
$count_news = 0;
// Notification
$get_data_ext = $this->M_notification->GET_NOTIFICATION_NEW($SESSION_ID);
if (empty($get_data_ext)) {
	$is_continue = false;
}else{
	$count_notification = count($get_data_ext);
}
// News
$get_data_count = $this->M_notification->GET_NEWS_NEW($SESSION_ID);
if(empty($get_data_count)||$get_data_count==""){

}else{
	$count_news = count($get_data_count);	
}
// Jumlah Notification
$count_notification = $count_notification + $count_news;
?>
<!DOCTYPE html>
<html lang="en">
<!------------------------------------------------------------------------------------------------->
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="X-Content-Type-Options: nosniff, width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<title><?php echo $this->M_library_module->WEB_TITLE; ?></title>
	<meta name="description" content="RL" />
	<meta name="author" content="RL" />
	<link rel="icon" href="<?php echo base_url('template/rion/'.$this->M_library_module->WEB_ICON); ?>" />

	<!-- CSS / JAVA SCRIPT / BOOTSTRAP / ETC -->
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/font-awesome/4.5.0/css/font-awesome.min.css'); ?>" />

	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/jquery-ui.custom.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/jquery.gritter.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/select2.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap-editable.min.css'); ?>" />

	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/prettify.min.css'); ?>" />

	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/chosen.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap-datepicker3.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap-timepicker.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/daterangepicker.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap-datetimepicker.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap-colorpicker.min.css'); ?>" />

	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap-duallistbox.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/bootstrap-multiselect.min.css'); ?>" />

	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/fonts.googleapis.com.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style'); ?>" />
	<!--[if lte IE 9]>
		<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/ace-part2.min.css" class="ace-main-stylesheet'); ?>" />
	<![endif]-->
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/ace-skins.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/ace-rtl.min.css'); ?>" />
	<!--[if lte IE 9]>
	  <link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/ace-ie.min.css'); ?>" />
	<![endif]-->
	<script src="<?php echo base_url('template/backend/assets/js/ace-extra.min.js'); ?>"></script>
	<!--[if lte IE 8]>
	<script src="<?php echo base_url('template/backend/assets/js/html5shiv.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/respond.min.js'); ?>"></script>
	<![endif]-->
</head>
<!------------------------------------------------------------------------------------------------->
<body class="no-skin">
	<!------------------------------------------------------------------------------------------------->
	<!-- CONTENT -->
	<div id="navbar" class="navbar navbar-default ace-save-state">
		<div class="navbar-container ace-save-state" id="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="<?php echo base_url('C_index'); ?>" class="navbar-brand">
					<small>
						<img class="nav-user-photo" src="<?php echo base_url('template/backend/assets/images/avatars/logo.png'); ?>" />
					</small>
				</a>
			</div>

			<div class="navbar-buttons navbar-header pull-right" role="navigation">
				<!-- no content -->
			</div>
		</div><!-- /.navbar-container -->
	</div>

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try{ace.settings.loadState('main-container')}catch(e){}
		</script>

		<div id="sidebar" class="sidebar responsive ace-save-state">
			<script type="text/javascript">
				try{ace.settings.loadState('sidebar')}catch(e){}
			</script>

			<div id="user-profile-1" class="user-profile row">
				<div class="col-12 center">
					<span class="profile-picture">
						<img id="avatar" class="editable img-responsive" src="<?php echo base_url('template/backend/assets/images/avatars/profile-pic.jpg'); ?>" />
					</span>
					<br />
					<i class="menu-icon fa fa-user"></i>
					<span class="menu-text">
						<?php echo $SESSION_NAME; ?>
					</span>
					<br />
				</div>
			</div>
			<ul class="nav nav-list">

				<li class="">
					<a href="<?php echo base_url('menu'); ?>">
						<i class="menu-icon fa fa-history"></i>
						<span class="menu-text"> Pencarian </span>
					</a>
					<b class="arrow"></b>
				</li>
				
				<li class="">
					<a href="<?php echo base_url('bookmarks'); ?>">
						<i class="menu-icon fa fa-bookmark"></i>
						<span class="menu-text"> Favorit </span>
					</a>
					<b class="arrow"></b>
				</li>
				
				<?php if(
				$SESSION_ROLES=="PENGGUNA"||
				$SESSION_ROLES=="PENCIPTA"||
				$SESSION_ROLES=="PENDISTRIBUSI"||
				$SESSION_ROLES=="ATASAN PENCIPTA" ||

				$SESSION_ROLES_2=="PENGGUNA"||
				$SESSION_ROLES_2=="PENCIPTA"||
				$SESSION_ROLES_2=="PENDISTRIBUSI"||
				$SESSION_ROLES_2=="ATASAN PENCIPTA" ||

				$SESSION_ROLES_3=="PENGGUNA"||
				$SESSION_ROLES_3=="PENCIPTA"||
				$SESSION_ROLES_3=="PENDISTRIBUSI"||
				$SESSION_ROLES_3=="ATASAN PENCIPTA" ||

				$SESSION_ROLES_4=="PENGGUNA"||
				$SESSION_ROLES_4=="PENCIPTA"||
				$SESSION_ROLES_4=="PENDISTRIBUSI"||
				$SESSION_ROLES_4=="ATASAN PENCIPTA" ||

				$SESSION_ROLES_5=="PENGGUNA"||
				$SESSION_ROLES_5=="PENCIPTA"||
				$SESSION_ROLES_5=="PENDISTRIBUSI"||
				$SESSION_ROLES_5=="ATASAN PENCIPTA"
				){ ?>
				<li class="">
					<a href="<?php echo base_url('notification'); ?>">
						<i class="menu-icon fa fa-exclamation"></i>
						<span class="menu-text">
							Aktifitas
							<span class="badge badge-primary nofication-count"></span>
						</span>
					</a>
					<b class="arrow"></b>
				</li>
				<?php } ?>
				
				<?php if(
				$SESSION_ROLES=="PENCIPTA" ||
				$SESSION_ROLES_2=="PENCIPTA" ||
				$SESSION_ROLES_3=="PENCIPTA" ||
				$SESSION_ROLES_4=="PENCIPTA" ||
				$SESSION_ROLES_5=="PENCIPTA"
				){ ?>
				<li class="">
					<a href="<?php echo base_url('contribution'); ?>">
						<i class="menu-icon fa fa-database"></i>
						<span class="menu-text"> Kontribusi </span>
					</a>
					<b class="arrow"></b>
				</li>
				<?php } ?>
				
				<?php if(
				$SESSION_ROLES=="PENCIPTA"||
				$SESSION_ROLES=="ADMIN DOKUMEN"||

				$SESSION_ROLES_2=="PENCIPTA"||
				$SESSION_ROLES_2=="ADMIN DOKUMEN"||

				$SESSION_ROLES_3=="PENCIPTA"||
				$SESSION_ROLES_3=="ADMIN DOKUMEN"||

				$SESSION_ROLES_4=="PENCIPTA"||
				$SESSION_ROLES_4=="ADMIN DOKUMEN"||

				$SESSION_ROLES_5=="PENCIPTA"||
				$SESSION_ROLES_5=="ADMIN DOKUMEN"
				){ ?>
				<li class="">
					<a href="<?php echo base_url('report'); ?>">
						<i class="menu-icon fa fa-database"></i>
						<span class="menu-text"> Laporan </span>
					</a>
					<b class="arrow"></b>
				</li>
				<?php } ?>

				<?php if(
				$SESSION_ROLES=="ADMIN KONFIGURASI"||
				$SESSION_ROLES_2=="ADMIN KONFIGURASI"||
				$SESSION_ROLES_3=="ADMIN KONFIGURASI"||
				$SESSION_ROLES_4=="ADMIN KONFIGURASI"||
				$SESSION_ROLES_5=="ADMIN KONFIGURASI"
				){ ?>
				<li class="">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-cog"></i>
						<span class="menu-text"> Setting </span>
						<b class="arrow fa fa-angle-down"></b>
					</a>
					<b class="arrow"></b>
					<ul class="submenu">
						<li class="">
							<a href="<?php echo base_url('C_setting_data_master'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Data Master
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_setting_structure_organization'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Struktur Organisasi
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_setting_user'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								User
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_setting_structure_document'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Struktur Dokumen
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_setting_business_rule'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Aturan Bisnis
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_setting_document_level_access'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Tingkat Akses Dokumen
							</a>
							<b class="arrow"></b>
						</li>
					</ul>
				</li>
				<li class="">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-cog"></i>
						<span class="menu-text">General Setting </span>
						<b class="arrow fa fa-angle-down"></b>
					</a>
					<b class="arrow"></b>
					<ul class="submenu">
						<li class="">
							<a href="<?php echo base_url('C_general_setting/welcome_speech'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Welcome Speech
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_general_setting/nomor'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Nomor Dokumen
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_general_setting/format_dokumen'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Format Dokumen
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_general_setting/sharelink'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Sharelink
							</a>
							<b class="arrow"></b>
						</li>
						<li class="">
							<a href="<?php echo base_url('C_general_setting/watermark'); ?>">
								<i class="menu-icon fa fa-caret-right"></i>
								Watermark
							</a>
							<b class="arrow"></b>
						</li>
					</ul>
				</li>
				<?php } ?>

				<li class="">
					<a href="<?php echo base_url('C_menu/logout'); ?>">
						<i class="menu-icon fa fa-power-off"></i>
						<span class="menu-text"> Keluar </span>
					</a>
					<b class="arrow"></b>
				</li>

			</ul><!-- /.nav-list -->
		</div>

		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<!------------------------------------------------------------------------------------------------->
					<!-- PAGE CONTENT BEGINS -->
					<!------------------------------------------------------------------------------------------------->
					<div class="row">
						<!-- ??? -->
					</div>
					
					<?php
						//-----------------------------------------------------------------------------------------------//
						$si_key = $this->input->post('si_key');
						$si_key = $si_key[0];
						//-----------------------------------------------------------------------------------------------//
						$get_data = $this->M_library_database->DB_GET_SEARCH_DATA_DOCUMENT_BY_ID_EVO($si_key);
						if(empty($get_data)||$get_data==""){
							echo '
								<script>
									alert("DATA NOT FOUND");
									window.location.href = "'.base_url('C_notification').'";
								</script>
							';
							exit();
						}
						//-----------------------------------------------------------------------------------------------//
						foreach($get_data as $data_row){
							$DOC_ID					= $data_row->DOC_ID;
							$DOC_DATE               = $data_row->DOC_DATE;
							$DOC_KATEGORI           = $data_row->DOC_KATEGORI;
							$DOC_JENIS              = $data_row->DOC_JENIS;
							$DOC_TIPE               = $data_row->DOC_TIPE;
							$DOC_GROUP_PROSES       = $data_row->DOC_GROUP_PROSES;
							$DOC_PROSES             = $data_row->DOC_PROSES;
							$DOC_NOMOR              = $data_row->DOC_NOMOR;
							$DOC_NAMA               = $data_row->DOC_NAMA;
							$DOC_WUJUD              = $data_row->DOC_WUJUD;
							$DOC_DISTRIBUSI         = $data_row->DOC_DISTRIBUSI;
							$DOC_KERAHASIAAN        = $data_row->DOC_KERAHASIAAN;
							$DOC_AKSES_LEVEL        = $data_row->DOC_AKSES_LEVEL;
							$DOC_PENGGUNA           = $data_row->DOC_PENGGUNA;
							$DOC_PEMILIK_PROSES     = $data_row->DOC_PEMILIK_PROSES;
							$DOC_PENYIMPAN          = $data_row->DOC_PENYIMPAN;
							$DOC_PENDISTRIBUSI      = $data_row->DOC_PENDISTRIBUSI;
							$DOC_VERSI              = $data_row->DOC_VERSI;
							$DOC_TGL_EFEKTIF        = $data_row->DOC_TGL_EFEKTIF;
							$DOC_PERIODE_PREVIEW	= $data_row->DOC_PERIODE_PREVIEW;
							$DOC_TGL_EXPIRED        = $data_row->DOC_TGL_EXPIRED;
							$DOC_KATA_KUNCI         = $data_row->DOC_KATA_KUNCI;
							$DOC_ABSTRAK            = $data_row->DOC_ABSTRAK;
							$DOC_TERKAIT            = $data_row->DOC_TERKAIT;
							$DOC_MAKER              = $data_row->DOC_MAKER;
							$DOC_APPROVE            = $data_row->DOC_APPROVE;
							$DOC_STATUS             = $data_row->DOC_STATUS;
							$DOC_NOTE               = $data_row->DOC_NOTE;
							$DTSEKI_ID				= $data_row->DTSEKI_ID;
							$DTSEKI_KATEGORI        = $data_row->DTSEKI_KATEGORI;
							$DTSEJS_ID				= $data_row->DTSEJS_ID;
							$DTSEJS_JENIS           = $data_row->DTSEJS_JENIS;
							$DTSETE_ID				= $data_row->DTSETE_ID;
							$DTSETE_TIPE            = $data_row->DTSETE_TIPE;
							$DTSETE_SINGKATAN       = $data_row->DTSETE_SINGKATAN;
							$DTFM_ID				= $data_row->DTFM_ID;
							$DTFM_NAME              = $data_row->DTFM_NAME;
							$DNMD_ID				= $data_row->DNMD_ID;
							$DNMD_NAME              = $data_row->DNMD_NAME;
							$CL_ID					= $data_row->CL_ID;
							$CL_NAME                = $data_row->CL_NAME;
							$DOCD_UTAMA				= $data_row->DOCD_UTAMA;
							$DOCD_UTAMA_TYPE		= $data_row->DOCD_UTAMA_TYPE;
							$DOCD_UTAMA_STATUS		= $data_row->DOCD_UTAMA_STATUS;
							$DOCD_UTAMA_EXT			= $data_row->DOCD_UTAMA_EXT;
							$DOCD_PELENGKAP_1		= $data_row->DOCD_PELENGKAP_1;
							$DOCD_PELENGKAP_1_TYPE	= $data_row->DOCD_PELENGKAP_1_TYPE;
							$DOCD_PELENGKAP_1_STATUS= $data_row->DOCD_PELENGKAP_1_STATUS;
							$DOCD_PELENGKAP_1_EXT= $data_row->DOCD_PELENGKAP_1_EXT;
							$DOCD_PELENGKAP_2		= $data_row->DOCD_PELENGKAP_2;
							$DOCD_PELENGKAP_2_TYPE	= $data_row->DOCD_PELENGKAP_2_TYPE;
							$DOCD_PELENGKAP_2_STATUS= $data_row->DOCD_PELENGKAP_2_STATUS;
							$DOCD_PELENGKAP_2_EXT= $data_row->DOCD_PELENGKAP_2_EXT;
							$DOCD_PERSETUJUAN		= $data_row->DOCD_PERSETUJUAN;
							$DOCD_PERSETUJUAN_TYPE	= $data_row->DOCD_PERSETUJUAN_TYPE;
						}

						// $query = $this->M_library_database->GET_DOC_TERKAIT($si_key);
						// var_dump($DOC_TERKAIT);die();
						
					?>
					
					<form class="form-horizontal" id="form_revisi" name="form_revisi" action="<?php echo base_url('C_notification/revisi_process'); ?>" method="post" enctype="multipart/form-data" onkeypress="return event.keyCode != 13;">
						<div class="widget-box">
							<div class="widget-header widget-header-blue widget-header-flat">
								<h4 class="widget-title lighter">Revisi</h4>
							</div>
							<div class="widget-body">
								<div class="widget-main">
										<input type="hidden" name="watermark" id="watermark">
										<input type="hidden" id="si_userid" name="si_userid" value="<?php echo $SESSION_ID; ?>" class="form-control" required>
										<input type="hidden" id="si_code" name="si_code" value="<?php echo $DOC_ID; ?>" class="form-control" required>

										<input type="hidden" id="si_approve" name="si_approve" value="<?= $DOC_STATUS; ?>" class="form-control" required>
									
										<!-- STEP 1 -->
										<div class="form-group">
											<label for="si_template_new_kategori" class="col-sm-3 control-label" style="text-align:left">Kategori Dokumen*</label>
											<div class="col-sm-9">
												<select id="si_template_new_kategori" name="si_template_new_kategori" class="form-control" required />
													<option value="<?php echo $DTSEKI_ID; ?>" selected><?php echo $DTSEKI_KATEGORI; ?></option>
													<!-- <?php
														$is_continue = true;
														$get_data_ext = $this->M_library_database->DB_GET_DATA_DOCUMENT_STRUCTURE_KATEGORI_EVO();
														if(empty($get_data_ext)||$get_data_ext==""){
															$is_continue = false;
														}
														if($is_continue){
															foreach($get_data_ext as $data_row_ext){
																if($DTSEKI_ID!=$data_row_ext->DTSEKI_ID){
													?>
													<option value="<?php echo $data_row_ext->DTSEKI_ID; ?>"><?php echo $data_row_ext->DTSEKI_KATEGORI; ?></option>
													<?php
																}
															}
														}
													?> -->
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_template_new_jenis" class="col-sm-3 control-label" style="text-align:left">Jenis Dokumen*</label>
											<div class="col-sm-9">
												<select id="si_template_new_jenis" name="si_template_new_jenis" class="form-control" required />
													<option value="">Pilih</option>
													<option value="<?php echo $DTSEJS_ID; ?>" selected><?php echo $DTSEJS_JENIS; ?></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_template_new_tipe" class="col-sm-3 control-label" style="text-align:left">Tipe Dokumen*</label>
											<div class="col-sm-9">
												<select id="si_template_new_tipe" name="si_template_new_tipe" class="form-control" required />
													<option value="">Pilih</option>
													<option value="<?php echo $DTSETE_ID; ?>" selected><?php echo $DTSETE_TIPE; ?></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_template_new_group_proses" class="col-sm-3 control-label" style="text-align:left">Group Proses (5M)</label>
											<div class="col-sm-9">
												<select id="si_template_new_group_proses" name="si_template_new_group_proses" class="form-control">
													<option value="GROUP PROSES" selected>GROUP PROSES</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_template_new_proses" class="col-sm-3 control-label" style="text-align:left">Proses</label>
											<div class="col-sm-9">
												<select id="si_template_new_proses" name="si_template_new_proses" class="form-control">
													<option value="PROSES" selected>PROSES</option>
												</select>
											</div>
										</div>
									
										<!-- STEP 2 -->
										<div class="form-group">
											<label for="si_header_no" class="col-sm-3 control-label" style="text-align:left">Nomor Dokumen*</label>
											<div class="col-sm-9">
												<input type="text" id="si_header_no" name="si_header_no" maxlength="40" value="<?php echo $DOC_NOMOR; ?>" class="form-control" readonly />
											</div>
										</div>
										<div class="form-group">
											<label for="si_header_name" class="col-sm-3 control-label" style="text-align:left">Nama Dokumen*</label>
											<div class="col-sm-9">
												<input type="text" id="si_header_name" name="si_header_name" maxlength="100" value="<?php echo $DOC_NAMA; ?>" class="form-control" required />
											</div>
										</div>
										<div class="form-group">
											<label for="si_header_master" class="col-sm-3 control-label" style="text-align:left">Wujud Dokumen Master*</label>
											<div class="col-sm-9">
												<select id="si_header_master" name="si_header_master" class="form-control" required />
													<option value="<?php echo $DTFM_ID; ?>" selected><?php echo $DTFM_NAME; ?></option>
													<?php
														$is_continue = true;
														$get_data_ext = $this->M_library_database->DB_GET_DOCUMENT_FORM_EVO();
														if(empty($get_data_ext)||$get_data_ext==""){
															$is_continue = false;
														}
														if($is_continue){
															foreach($get_data_ext as $data_row_ext){
																if($DTFM_ID!=$data_row_ext->DTFM_ID){
													?>
													<option value="<?php echo $data_row_ext->DTFM_ID; ?>"><?php echo $data_row_ext->DTFM_NAME; ?></option>
													<?php
																}
															}
														}
													?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_header_distribution" class="col-sm-3 control-label" style="text-align:left">Metode Distribusi*</label>
											<div class="col-sm-9">
												<select id="si_header_distribution" name="si_header_distribution" class="form-control" required />
													<option value="<?php echo $DNMD_ID; ?>" selected><?php echo $DNMD_NAME; ?></option>
													<?php
														$is_continue = true;
														$get_data_ext = $this->M_library_database->DB_GET_DISTRIBUTION_METHOD_EVO();
														if(empty($get_data_ext)||$get_data_ext==""){
															$is_continue = false;
														}
														if($is_continue){
															foreach($get_data_ext as $data_row_ext){
																if($DNMD_ID!=$data_row_ext->DNMD_ID){
													?>
													<option value="<?php echo $data_row_ext->DNMD_ID; ?>"><?php echo $data_row_ext->DNMD_NAME; ?></option>
													<?php
																}
															}
														}
													?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_header_confidential" class="col-sm-3 control-label" style="text-align:left">Standard Kerahasiaan*</label>
											<div class="col-sm-9">
												<select id="si_header_confidential" name="si_header_confidential" class="form-control" required />
													<option value="<?php echo $CL_ID; ?>" selected><?php echo $CL_NAME; ?></option>
												</select>
											</div>
										</div>
									
										<!-- STEP 3 -->
										<div class="form-group">
											<label for="duallistbox_akses_level" class="col-sm-3 control-label" style="text-align:left">Akses Level*</label>
											<div class="col-sm-9">
												<select id="duallistbox_akses_level" multiple="multiple" size="5" name="duallistbox_akses_level[]" required />
													<?php
														$DOC_AKSES_LEVEL = $DOC_AKSES_LEVEL;
														$DOC_AKSES_LEVEL_FINAL = "";
														if(strpos($DOC_AKSES_LEVEL,'|')!==false){
															$data_array = explode('|',$DOC_AKSES_LEVEL);
															$count = count($data_array);
															for($x=0;$x<$count;$x++){
																$get_data = $this->M_library_database->DB_GET_JOB_LEVEL_BY_ID_EVO($data_array[$x]);
																foreach($get_data as $data_row){
																	$JBLL_ID = $data_row->JBLL_ID;
																	$JBLL_NAME = $data_row->JBLL_NAME;
																	$JBLL_INDEX = $data_row->JBLL_INDEX;
													?>
													<option value="<?php echo $JBLL_ID; ?>" selected><?php echo $JBLL_NAME; ?></option>
													<?php
																}
																$DOC_AKSES_LEVEL_FINAL .= $JBLL_ID.",";
															}
														}else{
															$get_data = $this->M_library_database->DB_GET_JOB_LEVEL_BY_ID_EVO($DOC_AKSES_LEVEL);
															foreach($get_data as $data_row){
																$JBLL_ID = $data_row->JBLL_ID;
																$JBLL_NAME = $data_row->JBLL_NAME;
																$JBLL_INDEX = $data_row->JBLL_INDEX;
													?>
													<option value="<?php echo $JBLL_ID; ?>" selected><?php echo $JBLL_NAME; ?></option>
													<?php
															}
															$DOC_AKSES_LEVEL_FINAL = $JBLL_ID.",";
														}

														$is_continue = true;
														$get_data_ext = $this->M_library_database->DB_GET_JOB_LEVEL_NOT_IN_EVO($DOC_AKSES_LEVEL_FINAL);
														if(empty($get_data_ext)||$get_data_ext==""){
															$is_continue = false;
														}
														if($is_continue){
															foreach($get_data_ext as $data_row_ext){
																if($JBLL_ID!=$data_row_ext->JBLL_ID){
													?>
													<option value="<?php echo $data_row_ext->JBLL_ID; ?>"><?php echo $data_row_ext->JBLL_NAME; ?></option>
													<?php
																}
															}
														}
													?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="duallistbox_pengguna_dokumen" class="col-sm-3 control-label" style="text-align:left">Pengguna Dokumen*</label>
											<div class="col-sm-9">
												<select id="duallistbox_pengguna_dokumen" multiple="multiple" size="5" name="duallistbox_pengguna_dokumen[]" required />
													<?php
														$DOC_PENGGUNA = $DOC_PENGGUNA;
														$DOC_PENGGUNA_FINAL = "";
														if(strpos($DOC_PENGGUNA,'|')!==false){
															$data_array = explode('|',$DOC_PENGGUNA);
															$count = count($data_array);
															for($x=0;$x<$count;$x++){
																$get_data = $this->M_library_database->DB_GET_DATA_DEPARTEMEN_BY_ID_EVO($data_array[$x]);
																foreach($get_data as $data_row){
																	$DN_ID = $data_row->DN_ID;
																	$DN_CODE = $data_row->DN_CODE;
																	$DN_NAME = $data_row->DN_NAME;
													?>
													<option value="<?php echo $DN_ID; ?>" selected><?php echo $data_row->DN_CODE; ?> (<?php echo $data_row->DN_NAME; ?>)</option>
													<?php
																}
																$DOC_PENGGUNA_FINAL .= $DN_ID.",";
															}
														}else{
															$get_data = $this->M_library_database->DB_GET_DATA_DEPARTEMEN_BY_ID_EVO($DOC_PENGGUNA);
															foreach($get_data as $data_row){
																$DN_ID = $data_row->DN_ID;
																$DN_CODE = $data_row->DN_CODE;
																$DN_NAME = $data_row->DN_NAME;
													?>
													<option value="<?php echo $DN_ID; ?>" selected><?php echo $data_row->DN_CODE; ?> (<?php echo $data_row->DN_NAME; ?>)</option>
													<?php
															}
															$DOC_PENGGUNA_FINAL = $DN_ID.",";
														}
													
													
													
														$is_continue = true;
														$get_data_ext = $this->M_library_database->DB_GET_DEPARTEMENT_NOT_IN_EVO($DOC_PENGGUNA_FINAL);
														if(empty($get_data_ext)||$get_data_ext==""){
															$is_continue = false;
														}
														if($is_continue){
															foreach($get_data_ext as $data_row_ext){
																if($DN_ID!=$data_row_ext->DN_ID){
													?>
													<option value="<?php echo $data_row_ext->DN_ID; ?>"><?php echo $data_row_ext->DN_CODE; ?> (<?php echo $data_row_ext->DN_NAME; ?>)</option>
													<?php
																}
															}
														}
													?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_owner_pemilik_proses" class="col-sm-3 control-label" style="text-align:left">Dept Pemilik Proses*</label>
											<div class="col-sm-9">
												<select id="si_owner_pemilik_proses" name="si_owner_pemilik_proses" class="form-control" required />
												<?php
												if($DOC_PEMILIK_PROSES=="7550"){
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>"><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>"><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}else if($DOC_PEMILIK_PROSES==$SESSION_DIVISI_ID ){
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>" selected><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>"><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}else{
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>" selected><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>" selected><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}
												?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_owner_dept_penyimpan" class="col-sm-3 control-label" style="text-align:left">Dept Penyimpan*</label>
											<div class="col-sm-9">
												<select id="si_owner_dept_penyimpan" name="si_owner_dept_penyimpan" class="form-control" required />
												<?php
												if($DOC_PENYIMPAN=="7550"){
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>"><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>"><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}else if($DOC_PEMILIK_PROSES==$SESSION_DIVISI_ID ){
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>" selected><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>"><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}else{
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>" selected><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>" selected><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}
												?>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="si_owner_dept_pendistribusi" class="col-sm-3 control-label" style="text-align:left">Dept Pendistribusi*</label>
											<div class="col-sm-9">
												<select id="si_owner_dept_pendistribusi" name="si_owner_dept_pendistribusi" class="form-control" required />
												<?php
												if($DOC_PENDISTRIBUSI=="7550"){
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>"><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>"><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}else if($DOC_PEMILIK_PROSES==$SESSION_DIVISI_ID ){
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>" selected><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>"><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}else{
												?>
													<option value="7550" selected>BPI</option>
													<option value="<?php echo $SESSION_DIVISI_ID; ?>" selected><?php echo $SESSION_DIVISI_NAME; ?></option>
													<option value="<?php echo $SESSION_DEPARTEMENT_ID; ?>" selected><?php echo $SESSION_DEPARTEMENT_NAME; ?></option>
												<?php
												}
												?>
												</select>
											</div>
										</div>
									
										<!-- STEP 4 -->
										<div class="form-group">
											<label for="si_history_version" class="col-sm-3 control-label" style="text-align:left">Versi*</label>
											<div class="col-sm-9">
												<input type="text" id="si_history_version" name="si_history_version" maxlength="20" value="<?php echo $DOC_VERSI; ?>" class="form-control" required />
											</div>
										</div>
										<div class="form-group">
											<label for="si_history_date" class="col-sm-3 control-label" style="text-align:left">Tanggal Efektif Berlaku*</label>
											<div class="col-sm-3">
												<div class="input-group">
													<input class="form-control date-picker" id="si_history_date" name="si_history_date" value="<?php echo date('m/d/Y', strtotime($DOC_TGL_EFEKTIF)); ?>" type="text" required />
													<span class="input-group-addon">
														<i class="fa fa-calendar bigger-110"></i>
													</span>
													<input class="form-control" id="si_history_date2" name="si_history_date2" type="text" readonly value="<?php echo date('d/M/Y', strtotime($DOC_TGL_EFEKTIF)); ?>" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="si_history_period" class="col-sm-3 control-label" style="text-align:left">Periode Review*</label>
											<div class="col-sm-3">
												<select id="si_history_period" name="si_history_period" class="form-control" required />
													<option value="<?php echo $DOC_PERIODE_PREVIEW; ?>"><?php echo $DOC_PERIODE_PREVIEW; ?> BULAN</option>
													<?php
														$is_continue = true;
														$get_data_ext = $this->M_library_database->DB_GET_DATA_PERIODE_PREVIEW_EVO();
														if(empty($get_data_ext)||$get_data_ext==""){
															$is_continue = false;
														}
														if($is_continue){
															foreach($get_data_ext as $data_row_ext){
																if($DOC_PERIODE_PREVIEW!=($data_row_ext->PEPW_ID)){
													?>
													<option value="<?php echo $data_row_ext->PEPW_ID; ?>"><?php echo $data_row_ext->PEPW_ID; ?> BULAN</option>
													<?php
																}
															}
														}
													?>
												</select>
											</div>
											<div class="col-sm-3">
												<div class="input-group">
													<input class="form-control" id="si_history_date_final" name="si_history_date_final" value="<?php echo date('d/M/Y', strtotime($DOC_TGL_EXPIRED)); ?>" type="text" readonly required />
													<span class="input-group-addon">
														<i class="fa fa-calendar bigger-110"></i>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="si_history_keyword" class="col-sm-3 control-label" style="text-align:left">Kata Kunci*</label>
											<div class="col-sm-9">
												<input type="text" id="si_history_keyword" name="si_history_keyword" maxlength="200" value="<?php echo $DOC_KATA_KUNCI; ?>" class="form-control" required />
											</div>
										</div>
										<div class="form-group">
											<label for="si_history_abstract" class="col-sm-3 control-label" style="text-align:left">Abstrak (Max. 400 Karakter)*</label>
											<div class="col-sm-9">
												<textarea type="text" id="si_history_abstract" name="si_history_abstract" rows="3" maxlength="400" class="form-control" style="resize:none" required><?php echo $DOC_ABSTRAK; ?></textarea>
											</div>
										</div>

								</div>
							</div>
						</div>
						
						<!-- STEP 5 -->
						<div class="col-md-12">
							<div class="form-group">
								<label for="duallistbox_dokumen_terkait" class="col-sm-3 control-label" style="text-align:left">Dokumen Terkait</label>
								<div class="col-sm-9">
									<select id="duallistbox_dokumen_terkait" multiple="multiple" size="5" name="duallistbox_dokumen_terkait[]"/>
									<?php

									$DOC_TERKAIT = $DOC_TERKAIT;
									$DOC_TERKAIT_FINAL = "";
									if (strrpos($DOC_TERKAIT, '|') !== false):
										$data_array = explode('|',$DOC_TERKAIT);
										$count = count($data_array);
										for($x=0;$x<$count;$x++):
											$get_data = $this->M_library_database->GET_DOC_TERKAIT($data_array[$x]);
											foreach($get_data as $data_row):
												$DOC_ID = $data_row->DOC_ID;
												$DOC_NAMA = $data_row->DOC_NAMA;
									?>
										<option selected value="<?= $DOC_ID; ?>"><?= $DOC_NAMA; ?></option>
									<?php
											endforeach;
											$DOC_TERKAIT_FINAL .= $DOC_ID.",";
										endfor;
									else:
										$get_data = $this->M_library_database->GET_DOC_TERKAIT($DOC_TERKAIT);
										foreach($get_data as $data_row):
											$DOC_ID = $data_row->DOC_ID;
											$DOC_NAMA = $data_row->DOC_NAMA;
									?>
										<option selected value="<?= $DOC_ID; ?>"><?= $DOC_NAMA; ?></option>
									<?php
										endforeach;
									endif;

									$is_continue = true;
									$get_data_ext = $this->M_library_database->GET_DOC_TERKAIT_2($DOC_TERKAIT_FINAL);
									if(empty($get_data_ext)||$get_data_ext==""){
										$is_continue = false;
									}
									if ($is_continue):
										foreach($get_data_ext as $data_row_ext):
											if ($DOC_ID!=$data_row_ext->DOC_ID):
									?>
										<option value="<?= $data_row_ext->DOC_ID; ?>"><?= $data_row_ext->DOC_NAMA; ?></option>
									<?php
											endif;
										endforeach;
									endif;
									?>
									</select>
								</div>
							</div>
						</div>

						<?php if($DOC_DISTRIBUSI == "EDOC"): ?>
						<div class="col-sm-12">
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-sm-9">
									<div class="widget-box">
										<div class="widget-body">
											<div class="widget-main">
											
												<div class="form-group">
													<label for="dokumen_utama" class="col-sm-6 control-label" style="text-align:left">Dokumen Utama</label>
													<label for="dokumen_utama" class="col-sm-6 control-label" style="text-align:left">Di Unduh Dalam Format</label>
													<div class="col-xs-6">
														<div class="col-xs-4">
															<input multiple="" type="file" id="dokumen_utama" name="dokumen_utama" style="color:transparent;">
														</div>
														<div class="col-xs-6">
															<?php if ($DOCD_UTAMA_STATUS == 1): ?>
																
															<p id="utama"><?= $DOCD_UTAMA.'.pdf'; ?></p>
															<?php else: ?>
															<p id="utama"><?= $DOCD_UTAMA.'.'.$DOCD_UTAMA_EXT; ?></p>
															<?php endif; ?>
														</div>
													</div>
													<div class="col-xs-6">
														<label>
														<?php if($DOCD_UTAMA_STATUS!=1): ?>
														<input name="dokumen_utama_on" type="checkbox" class="ace" id="dokumen_utama_dpdf" />
														<?php else: ?>
														<input name="dokumen_utama_on" type="checkbox" class="ace" id="dokumen_utama_dpdf" checked />
														<?php endif; ?>
														<span class="lbl"> .PDF</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<label for="dokumen_pelengkap_1" class="col-sm-12 control-label" style="text-align:left">Dokumen Pelengkap 1</label>
													<div class="col-xs-6">
														<div class="col-xs-4">
															<input multiple="" type="file" id="dokumen_pelengkap_1" name="dokumen_pelengkap_1" style="color:transparent;">
														</div>
														<div class="col-xs-6">
															<?php if ($DOCD_PELENGKAP_1_STATUS == 1): ?>
																
															<p id="p1"><?= $DOCD_PELENGKAP_1.'.pdf'; ?></p>
															<?php else: ?>
															<p id="p1"><?= $DOCD_PELENGKAP_1.'.'.$DOCD_PELENGKAP_1_EXT; ?></p>
															<?php endif; ?>
															
														</div>
													</div>
													<div class="col-xs-6">
														<label>
														<?php if($DOCD_PELENGKAP_1_STATUS!=1): ?>
														<input name="dokumen_pelengkap_1_on" type="checkbox" class="ace" id="dokumen_pelengkap_1_dpdf" />
														<?php else: ?>
														<input name="dokumen_pelengkap_1_on" type="checkbox" class="ace" id="dokumen_pelengkap_1_dpdf" checked />
														<?php endif; ?>
														<span class="lbl"> .PDF</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<label for="dokumen_pelengkap_2" class="col-sm-12 control-label" style="text-align:left">Dokumen Pelengkap 2</label>
													<div class="col-xs-6">
														<div class="col-xs-4">
															<input multiple="" type="file" id="dokumen_pelengkap_2" name="dokumen_pelengkap_2" style="color:transparent;">
														</div>
														<div class="col-xs-6">
															<?php if ($DOCD_PELENGKAP_2_STATUS == 1): ?>
																
															<p id="p2"><?= $DOCD_PELENGKAP_2.'.pdf'; ?></p>
															<?php else: ?>
															<p id="p2"><?= $DOCD_PELENGKAP_2.'.'.$DOCD_PELENGKAP_2_EXT; ?></p>
															<?php endif; ?>
														</div>
													</div>
													<div class="col-xs-6">
														<label>
														<?php if($DOCD_PELENGKAP_2_STATUS!=1): ?>
														<input name="dokumen_pelengkap_2_on" type="checkbox" class="ace" id="dokumen_pelengkap_2_dpdf" />
														<?php else: ?>
														<input name="dokumen_pelengkap_2_on" type="checkbox" class="ace" id="dokumen_pelengkap_2_dpdf" checked />
														<?php endif; ?>
														<span class="lbl"> .PDF</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<label for="dokumen_persetujuan" class="col-sm-12 control-label" style="text-align:left">Dokumen Persetujuan</label>
													<div class="col-xs-6">
														<div class="col-xs-4">
															<input multiple="" type="file" id="dokumen_persetujuan" name="dokumen_persetujuan" style="color:transparent;">
														</div>
														<div class="col-xs-6">
															<p id="persetujuan"><?= $DOCD_PERSETUJUAN; ?></p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<?php endif; ?>
						<div class="row">
							<div class="col-md-12">
						<button style="float: right; width:50%; margin-top: 2rem;margin-right:10px;" type="submit" id="simpan" class="ace-icon fa fa-save btn btn-sm btn-success"> Simpan </button>
							</div>
						</div>
						
					</form>
					<!------------------------------------------------------------------------------------------------->
					<!-- PAGE CONTENT ENDS -->
					<!------------------------------------------------------------------------------------------------->
				</div><!-- /.page-content -->
			</div>
		</div><!-- /.main-content -->

		<div class="footer">
			<div class="footer-inner">
				<div class="footer-content">
					<span class="bigger-120">
						<span class="blue bolder">Ace</span>
						Modif &copy; 2018
					</span>
				</div>
			</div>
		</div>

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div><!-- /.main-container -->
	<!------------------------------------------------------------------------------------------------->
	<!-- JAVA SCRIPT / BOOTSTRAP / ETC -->
	<!--[if !IE]> -->
	<script src="<?php echo base_url('template/backend/assets/js/jquery-2.1.4.min.js'); ?>"></script>
	<!-- <![endif]-->
	<!--[if IE]>
	<script src="<?php echo base_url('template/backend/assets/js/jquery-1.11.3.min.js'); ?>"></script>
	<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='<?php echo base_url('template/backend/assets/js/jquery.mobile.custom.min.js'); ?>'>"+"<"+"/script>");
	</script>
	<script src="<?php echo base_url('template/backend/assets/js/bootstrap.min.js'); ?>"></script>

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
	
	<script type="text/javascript">
		var id_key = $('#si_template_new_tipe').val();

		$.ajax({
			type: "GET",
			url: "<?php echo base_url();?>C_notification/getNotification/<?php echo $this->session->userdata("session_bgm_edocument_id");?>/true/",             
			dataType: "html",   //expect html to be returned                
			success: function(response){
				$(".nofication-count").text(JSON.parse(response).length);
			}
		});

		$.ajax({
			url: '<?=base_url('C_contribution/get_data_document_structure_tipe_confidental2')?>',
			type: 'POST', 
			data: {id_key: id_key},
			success: function(response){
				//Parsing Json
				response = $.parseJSON(response);
				//Add Options
				$.each(response,function(index,data){
					$('#watermark').val(data['WATERMARK']);
				});
			}
		});
		$('#simpan').click(function() {
			$('#form_revisi').submit();
			$('#simpan').attr('disabled', true);
		});
		$('#dokumen_utama').on('change', function() {
			var utama = $('#dokumen_utama').val();
			if (utama!='') {
				$('#dokumen_utama').css("color","black");
				$('#utama').addClass('hide');
			}else{
				$('#dokumen_utama').css("color","transparent");
				$('#utama').removeClass('hide');
			}
		});
		$('#dokumen_pelengkap_1').on('change', function() {
			var utama = $('#dokumen_pelengkap_1').val();
			if (utama!='') {
				$('#dokumen_pelengkap_1').css("color","black");
				$('#p1').addClass('hide');
			}else{
				$('#dokumen_pelengkap_1').css("color","transparent");
				$('#p1').removeClass('hide');
			}
		});
		$('#dokumen_pelengkap_2').on('change', function() {
			var utama = $('#dokumen_pelengkap_2').val();
			if (utama!='') {
				$('#dokumen_pelengkap_2').css("color","black");
				$('#p2').addClass('hide');
			}else{
				$('#dokumen_pelengkap_2').css("color","transparent");
				$('#p2').removeClass('hide');
			}
		});
		$('#dokumen_persetujuan').on('change', function() {
			var utama = $('#dokumen_persetujuan').val();
			if (utama!='') {
				$('#dokumen_persetujuan').css("color","black");
				$('#persetujuan').addClass('hide');
			}else{
				$('#dokumen_persetujuan').css("color","transparent");
				$('#persetujuan').removeClass('hide');
			}
		});
		// filter dokumen utama
			$('#dokumen_utama').on('change', function() {
				var dokumen_utama = $('#dokumen_utama').val();
				var file = dokumen_utama.split('\\').pop();
				var jumlah = file.substr(0, file.lastIndexOf('.'));
				if (jumlah.length > 100) {
					alert("Nama File Harus Kurang dari 100 Karakter!");
					$(this).val('');
					return false;
				}
			});
			// filter dokumen pelengkap 1
			$('#dokumen_pelengkap_1').on('change', function() {
				var dokumen_pelengkap_1 = $('#dokumen_pelengkap_1').val();
				var file = dokumen_pelengkap_1.split('\\').pop();
				var jumlah = file.substr(0, file.lastIndexOf('.'));
				if (jumlah.length > 100) {
					alert("Nama File Harus Kurang dari 100 Karakter!");
					$(this).val('');
					return false;
				}
			});
			// filter dokumen pelengkap 2
			$('#dokumen_pelengkap_2').on('change', function() {
				var dokumen_pelengkap_2 = $('#dokumen_pelengkap_2').val();
				var file = dokumen_pelengkap_2.split('\\').pop();
				var jumlah = file.substr(0, file.lastIndexOf('.'));
				if (jumlah.length > 100) {
					alert("Nama File Harus Kurang dari 100 Karakter!");
					$(this).val('');
					return false;
				}
			});
			// filter dokumen persetujuan
			$('#dokumen_persetujuan').on('change', function() {
				var persetujuan_doc = $('#dokumen_persetujuan').val();
				var file = persetujuan_doc.split('\\').pop();
				var jumlah = file.substr(0, file.lastIndexOf('.'));
				var exten = persetujuan_doc.split('.')[1]
				if (exten != 'pdf' ) {
					alert("File Persetujuan Harus PDF!");
					$(this).val('');
					return false;
				}
				if (jumlah.length > 100) {
					alert("Nama File Harus Kurang dari 100 Karakter!");
					$(this).val('');
					return false;
				}
			});
		//si_template_new_kategori Change
		$('#si_template_new_kategori').change(function(){
			var id_key = document.getElementById("si_template_new_kategori");
			id_key = id_key.options[id_key.selectedIndex].value;
			
			//AJAX Request
			$.ajax({
				url: '<?=base_url('C_notification/get_data_document_structure_jenis')?>',
				type: 'POST', 
				data: {id_key: id_key},
				success: function(response){
					//Parsing Json
					response = $.parseJSON(response);
					
					//Remove Options
					$('#si_template_new_jenis').find('option').not(':first').remove().val('');
					$('#si_template_new_tipe').find('option').not(':first').remove().val('');
					
					//Add Options
					$.each(response,function(index,data){
						$('#si_template_new_jenis').append('<option value="'+data['DTSEJS_ID']+'">'+data['DTSEJS_JENIS']+'</option>');
					});
				}
			});
		});
		
		//si_template_new_jenis Change
		$('#si_template_new_jenis').change(function(){
			var id_key = document.getElementById("si_template_new_jenis");
			id_key = id_key.options[id_key.selectedIndex].value;
			
			//AJAX Request
			$.ajax({
				url: '<?=base_url('C_notification/get_data_document_structure_tipe')?>',
				type: 'POST', 
				data: {id_key: id_key},
				success: function(response){
					//Parsing Json
					response = $.parseJSON(response);
					
					//Remove Options 
					$('#si_template_new_tipe').find('option').not(':first').remove();
					
					//Add Options
					$.each(response,function(index,data){
						$('#si_template_new_tipe').append('<option value="'+data['DTSETE_ID']+'">'+data['DTSETE_TIPE']+'</option>');
					});
				}
			});
		});
		//si_template_new_tipe
		$('#si_template_new_tipe').change(function(){
			var id_key = document.getElementById("si_template_new_tipe");
			id_key = id_key.options[id_key.selectedIndex].value;

			var field_1,field_2,field_3,field_4,field_5,nom;
			let access;
			let dist;
			// Request nomor
			$.ajax({
				url: '<?= base_url('C_contribution/nomor_doc'); ?>',
				type: 'GET',
				success: function(response){
					//Parsing Json
					response = $.parseJSON(response);
					nom = response[0].kode;
					$.ajax({
						url: '<?= base_url('C_contribution/get_nomor'); ?>',
						type: 'GET',
						success: function(response){
							//Parsing Json
							response = $.parseJSON(response);
							field_1 = response[0].field_1;
							field_2 = response[0].field_2;
							field_3 = response[0].field_3;
							field_4 = response[0].field_4;
							field_5 = response[0].field_5;
							//AJAX Request Tipe
							$.ajax({
								url: '<?=base_url('C_contribution/get_data_document_structure_tipe_confidental')?>',
								type: 'POST', 
								data: {id_key: id_key},
								success: function(response){
									//Parsing Json
									response = $.parseJSON(response);
									//Add Options
									$.each(response,function(index,data){
										$('#si_template_new_jenis').append('<option value="'+data['DTSEJS_ID']+'" selected>'+data["DTSEJS_JENIS"]+'</option>');
										$('#si_template_new_kategori').val(data['DTSEKI_ID']);
										$('#si_header_confidential').val(data['CL_ID']);
										let singkatan = data['DTSETE_SINGKATAN'];
										var date_now = new Date();
										// Field_1
										if (field_1 == 'Table') {
											field_1 = singkatan
										}else if(field_1 == 'Year'){
											field_1 = date_now.getFullYear();
										}else if(field_1 == 'Month'){
											field_1 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_1 == 'Delimeter'){
											field_1 = "/";
										}else if (field_1 == 'Free Text') {
											field_1 = nom;
										}else{
											field_1 = "";
										}
										// Field_2
										if (field_2 == 'Table') {
											field_2 = singkatan
										}else if(field_2 == 'Year'){
											field_2 = date_now.getFullYear();
										}else if(field_2 == 'Month'){
											field_2 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_2 == 'Delimeter'){
											field_2 = "/";
										}else if (field_2 == 'Free Text') {
											field_2 = nom;
										}else{
											field_2 = "";
										}
										// Field_3
										if (field_3 == 'Table') {
											field_3 = singkatan
										}else if(field_3 == 'Year'){
											field_3 = date_now.getFullYear();
										}else if(field_3 == 'Month'){
											field_3 = ("0" + (date_now.getMonth() + 1)).slice(-2);
										}else if(field_3 == 'Delimeter'){
											field_3 = "/";
										}else if (field_3 == 'Free Text') {
											field_3 = nom;
										}else{
											field_3 = "";
										}
										// Field_4
										if (field_4 == 'Table') {
											field_4 = singkatan
										}else if(field_4 == 'Year'){
											field_4 = date_now.getFullYear();
										}else if(field_4 == 'Month'){
											field_4 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_4 == 'Delimeter'){
											field_4 = "/";
										}else if (field_4 == 'Free Text') {
											field_4 = nom;
										}else{
											field_4 = "";
										}
										// Field_5
										if (field_5 == 'Table') {
											field_5 = singkatan
										}else if(field_5 == 'Year'){
											field_5 = date_now.getFullYear();
										}else if(field_5 == 'Month'){
											field_5 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_5 == 'Delimeter'){
											field_5 = "/";
										}else if (field_5 == 'Free Text') {
											field_5 = nom;
										}else{
											field_5 = "";
										}
										var hasil = field_1 + field_2 + field_3 + field_4 + field_5;
										$('#si_header_no').val(hasil);
										$('#watermark').val(data['WATERMARK']);
										access = data['DTSETE_ACCESS'];
										dist = data['DTSETE_DISTRIBUTION'];
									});
									if (access == 'All') {
										$.ajax({
											url: '<?=base_url('C_contribution/AllDepartmen')?>',
											type: 'POST', 
											data: {id_key: id_key},
											success: function(response){
												//Parsing Json
												response = $.parseJSON(response);
												$('#duallistbox_pengguna_dokumen').find('option').remove();
												$.each(response,function(index,data){
													$('#duallistbox_pengguna_dokumen').append('<option value="'+data['DN_ID']+'">'+data['DN_CODE']+' ('+data['DN_NAME']+')</option>');
												});
												$('#duallistbox_pengguna_dokumen option[value="<?=$SESSION_DEPARTEMENT_ID;?>"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7550"]').attr('selected','selected');
												
												$('#duallistbox_pengguna_dokumen option[value="7559"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen').bootstrapDualListbox('refresh', true);
											}
										});
									}else{
										$.ajax({
											url: '<?=base_url('C_contribution/GetDepatemenAccess')?>',
											type: 'POST', 
											data: {id_key: id_key},
											success: function(response){
												//Parsing Json
												response = $.parseJSON(response);
												$('#duallistbox_pengguna_dokumen').find('option').remove();
												$.each(response,function(index,data){
													$('#duallistbox_pengguna_dokumen').append('<option value="'+data['DN_ID']+'">'+data['DN_CODE']+' ('+data['DN_NAME']+')</option>');
												});
												$('#duallistbox_pengguna_dokumen option[value="<?=$SESSION_DEPARTEMENT_ID;?>"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7550"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7559"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen').bootstrapDualListbox('refresh', true);
											}
										});
									}
									if (dist == 'Available') {
										$.ajax({
											url: '<?=base_url('C_contribution/GetDepatemenDistribution')?>',
											type: 'POST', 
											data: {id_key: id_key},
											success: function(response){
												//Parsing Json
												response = $.parseJSON(response);
												$('#si_owner_dept_pendistribusi').find('option').not(':first').remove();
												// $('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BUSINESS PROCESS IMPROVEMENT</option>');
												$('#si_owner_dept_pendistribusi').append('<option value="<?= $SESSION_DIVISI_ID; ?>"><?= $SESSION_DIVISI_NAME; ?></option>');
												$('#si_owner_dept_pendistribusi').append('<option value="<?= $SESSION_DEPARTEMENT_ID; ?>"><?= $SESSION_DEPARTEMENT_NAME; ?></option>');
												$.each(response,function(index,data){
													$('#si_owner_dept_pendistribusi').append('<option value="'+data['DN_ID']+'">'+data['DN_NAME']+'</option>');
												});
											}
										});
									}else{
										$('#si_owner_dept_pendistribusi').find('option').not(':first').remove();
										$('#si_owner_dept_pendistribusi').append('<option value="<?= $SESSION_DIVISI_ID; ?>"><?= $SESSION_DIVISI_NAME; ?></option>');
										$('#si_owner_dept_pendistribusi').append('<option value="<?= $SESSION_DEPARTEMENT_ID; ?>"><?= $SESSION_DEPARTEMENT_NAME; ?></option>');
									}
								}
							});
						}
					});

				}
			});
		});
		$('#si_template_new_tipe').change(function(){
			var id_key = document.getElementById("si_template_new_tipe");
			id_key = id_key.options[id_key.selectedIndex].value;
			if(id_key!=""){
				//AJAX Request 1
				var JBLL_ID,JBLL_NAME,JBLL_INDEX;
				$.ajax({
					url: '<?=base_url('C_contribution/get_data_document_template_or_document_structure_tipe')?>',
					type: 'POST',
					data: {id_key: id_key},
					async: false,
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						
						//Add Options
						$.each(response,function(index,data){
							JBLL_ID = data['JBLL_ID'];
							JBLL_NAME = data['JBLL_NAME'];
							JBLL_INDEX = data['JBLL_INDEX'];
						});
					}
				});
				
				$("#duallistbox_akses_level").children().remove();
				//AJAX Request 2
				$.ajax({
					url: '<?=base_url('C_contribution/get_data_job_level_evo')?>',
					type: 'POST',
					async: false,
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						//Add Options
						$.each(response,function(index,data){
							//LOOP
							if(JBLL_INDEX>=(data['JBLL_INDEX'])){
								$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'" selected>'+data['JBLL_NAME']+'</option>');
							}else{
								$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'">'+data['JBLL_NAME']+'</option>');
							}
							//LOOP
						});
					}
				});
				$("#duallistbox_akses_level").bootstrapDualListbox('refresh', true);
			}
		});
		
		// $("#duallistbox_akses_level").change(function(){
		// 	var JBLL_ID = $("#duallistbox_akses_level").val();
		// 	if(JBLL_ID!=null){
		// 		var JBLL_ID,JBLL_NAME,JBLL_INDEX;
		// 		//AJAX Request 1
		// 		$.ajax({
		// 			url: '<?=base_url('C_contribution/get_data_job_level_evo_ext')?>',
		// 			type: 'POST',
		// 			data: {id_key: JBLL_ID},
		// 			async: false,
		// 			success: function(response){
		// 				//Parsing Json
		// 				response = $.parseJSON(response);
		// 				//Add Options
		// 				$.each(response,function(index,data){
		// 					JBLL_ID = data['JBLL_ID'];
		// 					JBLL_NAME = data['JBLL_NAME'];
		// 					JBLL_INDEX = data['JBLL_INDEX'];
		// 				});
		// 			}
		// 		});
				
		// 		$("#duallistbox_akses_level").children().remove();
		// 		//AJAX Request 2
		// 		$.ajax({
		// 			url: '<?=base_url('C_contribution/get_data_job_level_evo')?>',
		// 			type: 'POST',
		// 			async: false,
		// 			success: function(response){
		// 				//Parsing Json
		// 				response = $.parseJSON(response);
		// 				//Add Options
		// 				$.each(response,function(index,data){
		// 					//LOOP
		// 					if(JBLL_INDEX>=(data['JBLL_INDEX'])){
		// 						$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'" selected>'+data['JBLL_NAME']+'</option>');
		// 					}else{
		// 						$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'">'+data['JBLL_NAME']+'</option>');
		// 					}
		// 					//LOOP
		// 				});
		// 			}
		// 		});
		// 		$("#duallistbox_akses_level").bootstrapDualListbox('refresh', true);
		// 	}
		// });
		$('#si_history_date').on('changeDate', function() {
			var tgl_awal = $('#si_history_date').val();
			$('#si_history_date2').val(moment(tgl_awal).format("DD/MMM/YYYY"));
		});
		$('#si_history_period').change(function(){
			var period = document.getElementById("si_history_period");
			period = period.options[period.selectedIndex].value;

			var date_start = document.getElementById("si_history_date").value;
			if(date_start==""){
				alert("Mohon Isi Tanggal Efektif Berlaku");
				document.getElementById("si_history_period").selectedIndex = 0;
			}else{
				var tgl_awal = $('#si_history_date').val();
				var tgl_priod = $('#si_history_period').val();
				a = moment(tgl_awal).add(tgl_priod, 'month').calendar();
				b = moment(a).subtract(1, 'days').calendar();
				c = moment(b).format("DD/MMM/YYYY");
				$('#si_history_date_final').val(c);
			}
		});
		jQuery(function($) {
			$('#avatar').on('click', function(){
				var modal = 
				'<div class="modal fade">\
				  <div class="modal-dialog">\
				   <div class="modal-content">\
					<div class="modal-header">\
						<button type="button" class="close" data-dismiss="modal">&times;</button>\
						<h4 class="blue">Change Avatar</h4>\
					</div>\
					\
					<form class="no-margin">\
					 <div class="modal-body">\
						<div class="space-4"></div>\
						<div style="width:75%;margin-left:12%;"><input type="file" name="file-input" /></div>\
					 </div>\
					\
					 <div class="modal-footer center">\
						<button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Submit</button>\
						<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
					 </div>\
					</form>\
				  </div>\
				 </div>\
				</div>';
				
				var modal = $(modal);
				modal.modal("show").on("hidden", function(){
					modal.remove();
				});
			
				var working = false;
			
				var form = modal.find('form:eq(0)');
				var file = form.find('input[type=file]').eq(0);
				file.ace_file_input({
					style:'well',
					btn_choose:'Click to choose new avatar',
					btn_change:null,
					no_icon:'ace-icon fa fa-picture-o',
					thumbnail:'small',
					before_remove: function() {
						//don't remove/reset files while being uploaded
						return !working;
					},
					allowExt: ['jpg', 'jpeg', 'png', 'gif'],
					allowMime: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
				});
			
				form.on('submit', function(){
					if(!file.data('ace_input_files')) return false;
					
					file.ace_file_input('disable');
					form.find('button').attr('disabled', 'disabled');
					form.find('.modal-body').append("<div class='center'><i class='ace-icon fa fa-spinner fa-spin bigger-150 orange'></i></div>");
					
					var deferred = new $.Deferred;
					working = true;
					deferred.done(function() {
						form.find('button').removeAttr('disabled');
						form.find('input[type=file]').ace_file_input('enable');
						form.find('.modal-body > :last-child').remove();
						
						modal.modal("hide");
			
						var thumb = file.next().find('img').data('thumb');
						if(thumb) $('#avatar').get(0).src = thumb;
			
						working = false;
					});
					
					setTimeout(function(){
						deferred.resolve();
					} , parseInt(Math.random() * 800 + 800));
			
					return false;
				});
			});
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			window.prettyPrint && prettyPrint();
			$('#id-check-horizontal').removeAttr('checked').on('click', function(){
				$('#dt-list-1').toggleClass('dl-horizontal').prev().html(this.checked ? '&lt;dl class="dl-horizontal"&gt;' : '&lt;dl&gt;');
			});
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			$('#id-disable-check').on('click', function() {
				var inp = $('#form-input-readonly').get(0);
				if(inp.hasAttribute('disabled')) {
					inp.setAttribute('readonly' , 'true');
					inp.removeAttribute('disabled');
					inp.value="This text field is readonly!";
				}
				else {
					inp.setAttribute('disabled' , 'disabled');
					inp.removeAttribute('readonly');
					inp.value="This text field is disabled!";
				}
			});
			
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				//resize the chosen on window resize
			
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					})
				}).trigger('resize.chosen');
				//resize chosen on sidebar collapse/expand
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					})
				});
			
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			$('[data-rel=tooltip]').tooltip({container:'body'});
			$('[data-rel=popover]').popover({container:'body'});
			
			autosize($('textarea[class*=autosize]'));
			
			$('textarea.limited').inputlimiter({
				remText: '%n character%s remaining...',
				limitText: 'max allowed : %n.'
			});
			
			$.mask.definitions['~']='[+-]';
			$('.input-mask-date').mask('99/99/9999');
			$('.input-mask-phone').mask('(999) 999-9999');
			$('.input-mask-eyescript').mask('~9.99 ~9.99 999');
			$(".input-mask-product").mask("a*-999-a999",{placeholder:" ",completed:function(){alert("You typed the following: "+this.val());}});
			
			$( "#input-size-slider" ).css('width','200px').slider({
				value:1,
				range: "min",
				min: 1,
				max: 8,
				step: 1,
				slide: function( event, ui ) {
					var sizing = ['', 'input-sm', 'input-lg', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
					var val = parseInt(ui.value);
					$('#form-field-4').attr('class', sizing[val]).attr('placeholder', '.'+sizing[val]);
				}
			});
			
			$( "#input-span-slider" ).slider({
				value:1,
				range: "min",
				min: 1,
				max: 12,
				step: 1,
				slide: function( event, ui ) {
					var val = parseInt(ui.value);
					$('#form-field-5').attr('class', 'col-xs-'+val).val('.col-xs-'+val);
				}
			});
			
			//"jQuery UI Slider"
			//range slider tooltip example
			$( "#slider-range" ).css('height','200px').slider({
				orientation: "vertical",
				range: true,
				min: 0,
				max: 100,
				values: [ 17, 67 ],
				slide: function( event, ui ) {
					var val = ui.values[$(ui.handle).index()-1] + "";
			
					if( !ui.handle.firstChild ) {
						$("<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
						.prependTo(ui.handle);
					}
					$(ui.handle.firstChild).show().children().eq(1).text(val);
				}
			}).find('span.ui-slider-handle').on('blur', function(){
				$(this.firstChild).hide();
			});
			
			$( "#slider-range-max" ).slider({
				range: "max",
				min: 1,
				max: 10,
				value: 2
			});
			
			$( "#slider-eq > span" ).css({width:'90%', 'float':'left', margin:'15px'}).each(function() {
				// read initial values from markup and remove that
				var value = parseInt( $( this ).text(), 10 );
				$( this ).empty().slider({
					value: value,
					range: "min",
					animate: true
					
				});
			});
			
			$("#slider-eq > span.ui-slider-purple").slider('disable');//disable third item
			
			$('#id-input-file-1 , #id-input-file-2').ace_file_input({
				no_file:'No File ...',
				btn_choose:'Choose',
				btn_change:'Change',
				droppable:false,
				onchange:null,
				thumbnail:false //| true | large
				//whitelist:'gif|png|jpg|jpeg'
				//blacklist:'exe|php'
				//onchange:''
				//
			});
			//pre-show a file name, for example a previously selected file
			//$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])
			
			$('#upload_file_input').ace_file_input({
				style: 'well',
				btn_choose: 'Drop files here or click to choose',
				btn_change: null,
				no_icon: 'ace-icon fa fa-cloud-upload',
				droppable: true,
				thumbnail: 'small'//large | fit
				//,icon_remove:null//set null, to hide remove/reset button
				/**,before_change:function(files, dropped) {
					//Check an example below
					//or examples/file-upload.html
					return true;
				}*/
				/**,before_remove : function() {
					return true;
				}*/
				,
				preview_error : function(filename, error_code) {
					//name of the file that failed
					//error_code values
					//1 = 'FILE_LOAD_FAILED',
					//2 = 'IMAGE_LOAD_FAILED',
					//3 = 'THUMBNAIL_FAILED'
					//alert(error_code);
				}
			
			}).on('change', function(){
				//console.log($(this).data('ace_input_files'));
				//console.log($(this).data('ace_input_method'));
			});
			
			//$('#upload_file_input')
			//.ace_file_input('show_file_list', [
				//{type: 'image', name: 'name of image', path: 'http://path/to/image/for/preview'},
				//{type: 'file', name: 'hello.txt'}
			//]);
			
			//dynamically change allowed formats by changing allowExt && allowMime function
			$('#id-file-format').removeAttr('checked').on('change', function() {
				var whitelist_ext, whitelist_mime;
				var btn_choose
				var no_icon
				if(this.checked) {
					btn_choose = "Drop images here or click to choose";
					no_icon = "ace-icon fa fa-picture-o";
			
					whitelist_ext = ["jpeg", "jpg", "png", "gif" , "bmp"];
					whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
				}
				else {
					btn_choose = "Drop files here or click to choose";
					no_icon = "ace-icon fa fa-cloud-upload";
					
					whitelist_ext = null;//all extensions are acceptable
					whitelist_mime = null;//all mimes are acceptable
				}
				var file_input = $('#upload_file_input');
				file_input
				.ace_file_input('update_settings',
				{
					'btn_choose': btn_choose,
					'no_icon': no_icon,
					'allowExt': whitelist_ext,
					'allowMime': whitelist_mime
				})
				file_input.ace_file_input('reset_input');
				
				file_input
				.off('file.error.ace')
				.on('file.error.ace', function(e, info) {
					//console.log(info.file_count);//number of selected files
					//console.log(info.invalid_count);//number of invalid files
					//console.log(info.error_list);//a list of errors in the following format
					
					//info.error_count['ext']
					//info.error_count['mime']
					//info.error_count['size']
					
					//info.error_list['ext']  = [list of file names with invalid extension]
					//info.error_list['mime'] = [list of file names with invalid mimetype]
					//info.error_list['size'] = [list of file names with invalid size]
					
					/**
					if( !info.dropped ) {
						//perhapse reset file field if files have been selected, and there are invalid files among them
						//when files are dropped, only valid files will be added to our file array
						e.preventDefault();//it will rest input
					}
					*/
					
					//if files have been selected (not dropped), you can choose to reset input
					//because browser keeps all selected files anyway and this cannot be changed
					//we can only reset file field to become empty again
					//on any case you still should check files with your server side script
					//because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
				});
				
				/**
				file_input
				.off('file.preview.ace')
				.on('file.preview.ace', function(e, info) {
					console.log(info.file.width);
					console.log(info.file.height);
					e.preventDefault();//to prevent preview
				});
				*/
			
			});
			
			$('#spinner1').ace_spinner({value:0,min:0,max:200,step:10, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
			.closest('.ace-spinner')
			.on('changed.fu.spinbox', function(){
				//console.log($('#spinner1').val())
			}); 
			$('#spinner2').ace_spinner({value:0,min:0,max:10000,step:100, touch_spinner: true, icon_up:'ace-icon fa fa-caret-up bigger-110', icon_down:'ace-icon fa fa-caret-down bigger-110'});
			$('#spinner3').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
			$('#spinner4').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus', icon_down:'ace-icon fa fa-minus', btn_up_class:'btn-purple' , btn_down_class:'btn-purple'});
			
			//$('#spinner1').ace_spinner('disable').ace_spinner('value', 11);
			//or
			//$('#spinner1').closest('.ace-spinner').spinner('disable').spinner('enable').spinner('value', 11);//disable, enable or change value
			//$('#spinner1').closest('.ace-spinner').spinner('value', 0);//reset to 0
			
			//datepicker plugin
			//link
			$('.date-picker').datepicker({
				format: 'mm/dd/yyyy',
				autoclose: true,
				todayHighlight: true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			//or change it into a date range picker
			$('.input-daterange').datepicker({autoclose:true});
			
			//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
			$('input[name=date-range-picker]').daterangepicker({
				'applyClass' : 'btn-sm btn-success',
				'cancelClass' : 'btn-sm btn-default',
				locale: {
					applyLabel: 'Apply',
					cancelLabel: 'Cancel',
				}
			})
			.prev().on(ace.click_event, function(){
				$(this).next().focus();
			});
			
			$('#timepicker1').timepicker({
				minuteStep: 1,
				showSeconds: true,
				showMeridian: false,
				disableFocus: true,
				icons: {
					up: 'fa fa-chevron-up',
					down: 'fa fa-chevron-down'
				}
			}).on('focus', function() {
				$('#timepicker1').timepicker('showWidget');
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			if(!ace.vars['old_ie']) $('#date-timepicker1').datetimepicker({
			 //format: 'MM/DD/YYYY h:mm:ss A',//use this option to display seconds
			 icons: {
				time: 'fa fa-clock-o',
				date: 'fa fa-calendar',
				up: 'fa fa-chevron-up',
				down: 'fa fa-chevron-down',
				previous: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right',
				today: 'fa fa-arrows ',
				clear: 'fa fa-trash',
				close: 'fa fa-times'
			 }
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$('#colorpicker1').colorpicker();
			//$('.colorpicker').last().css('z-index', 2000);//if colorpicker is inside a modal, its z-index should be higher than modal'safe
			
			$('#simple-colorpicker-1').ace_colorpicker();
			//$('#simple-colorpicker-1').ace_colorpicker('pick', 2);//select 2nd color
			//$('#simple-colorpicker-1').ace_colorpicker('pick', '#fbe983');//select #fbe983 color
			//var picker = $('#simple-colorpicker-1').data('ace_colorpicker')
			//picker.pick('red', true);//insert the color if it doesn't exist
			
			$(".knob").knob();
			
			var tag_input = $('#si_history_keyword');
			tag_input.tag();
			
			$('#modal-form input[type=file]').ace_file_input({
				style:'well',
				btn_choose:'Drop files here or click to choose',
				btn_change:null,
				no_icon:'ace-icon fa fa-cloud-upload',
				droppable:true,
				thumbnail:'large'
			})
			
			//chosen plugin inside a modal will have a zero width because the select element is originally hidden
			//and its width cannot be determined.
			//so we set the width after modal is show
			$('#modal-form').on('shown.bs.modal', function () {
				if(!ace.vars['touch']) {
					$(this).find('.chosen-container').each(function(){
						$(this).find('a:first-child').css('width' , '210px');
						$(this).find('.chosen-drop').css('width' , '210px');
						$(this).find('.chosen-search input').css('width' , '200px');
					});
				}
			})
			/**
			//or you can activate the chosen plugin after modal is shown
			//this way select element becomes visible with dimensions and chosen works as expected
			$('#modal-form').on('shown', function () {
				$(this).find('.modal-chosen').chosen();
			})
			*/
			
			$(document).one('ajaxloadstart.page', function(e) {
				autosize.destroy('textarea[class*=autosize]')
				
				$('.limiterBox,.autosizejs').remove();
				$('.daterangepicker.dropdown-menu,.colorpicker.dropdown-menu,.bootstrap-datetimepicker-widget.dropdown-menu').remove();
			});

			var demo1 = $('select[name="duallistbox_akses_level[]"]').bootstrapDualListbox({
				infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>',
				moveOnSelect: false
			});
			var container1 = demo1.bootstrapDualListbox('getContainer');
			container1.find('.btn').addClass('btn-white btn-info btn-bold');
			container1.find('.move').html('Move');
			container1.find('.remove').html('Remove');
			container1.find('.moveall').html('All');
			container1.find('.removeall').html('All');

			var demo2 = $('select[name="duallistbox_pengguna_dokumen[]"]').bootstrapDualListbox({
				infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>',
				moveOnSelect: false
			});
			var container2 = demo2.bootstrapDualListbox('getContainer');
			container2.find('.btn').addClass('btn-white btn-info btn-bold');
			container2.find('.move').html('Move');
			container2.find('.remove').html('Remove');
			container2.find('.moveall').html('All');
			container2.find('.removeall').html('All');

			var demo3 = $('select[name="duallistbox_dept_pendistribusi[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
			var container3 = demo3.bootstrapDualListbox('getContainer');
			container3.find('.btn').addClass('btn-white btn-info btn-bold').html('All');;
			
			var demo4 = $('select[name="duallistbox_dokumen_terkait[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
			var container4 = demo4.bootstrapDualListbox('getContainer');
			container4.find('.btn').addClass('btn-white btn-info btn-bold').remove();
			
			$('.rating').raty({
				'cancel' : true,
				'half': true,
				'starType' : 'i'
			})//.find('i:not(.star-raty)').addClass('grey');

			//select2
			$('.select2').css('width','200px').select2({allowClear:true})
			$('#select2-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('.select2').addClass('tag-input-style');
				 else $('.select2').removeClass('tag-input-style');
			});

			$('.multiselect').multiselect({
			 enableFiltering: true,
			 enableHTML: true,
			 buttonClass: 'btn btn-white btn-primary',
			 templates: {
				button: '<button type="button" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> &nbsp;<b class="fa fa-caret-down"></b></button>',
				ul: '<ul class="multiselect-container dropdown-menu"></ul>',
				filter: '<li class="multiselect-item filter"><div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input class="form-control multiselect-search" type="text"></div></li>',
				filterClearBtn: '<span class="input-group-btn"><button class="btn btn-default btn-white btn-grey multiselect-clear-filter" type="button"><i class="fa fa-times-circle red2"></i></button></span>',
				li: '<li><a tabindex="0"><label></label></a></li>',
			    divider: '<li class="multiselect-item divider"></li>',
			    liGroup: '<li class="multiselect-item multiselect-group"><label></label></li>'
			 }
			});

			//typeahead.js
			//example taken from plugin's page at: https://twitter.github.io/typeahead.js/examples/
			var substringMatcher = function(strs) {
				return function findMatches(q, cb) {
					var matches, substringRegex;
				 
					// an array that will be populated with substring matches
					matches = [];
				 
					// regex used to determine if a string contains the substring `q`
					substrRegex = new RegExp(q, 'i');
				 
					// iterate through the pool of strings and for any string that
					// contains the substring `q`, add it to the `matches` array
					$.each(strs, function(i, str) {
						if (substrRegex.test(str)) {
							// the typeahead jQuery plugin expects suggestions to a
							// JavaScript object, refer to typeahead docs for more info
							matches.push({ value: str });
						}
					});
			
					cb(matches);
				}
			 }
			
			 $('input.typeahead').typeahead({
				hint: true,
				highlight: true,
				minLength: 1
			 }, {
				name: 'states',
				displayKey: 'value',
				source: substringMatcher(ace.vars['US_STATES']),
				limit: 10
			 });
				
			//in ajax mode, remove remaining elements before leaving page
			$(document).one('ajaxloadstart.page', function(e) {
				$('[class*=select2]').remove();
				$('select[name="duallistbox_akses_level[]"]').bootstrapDualListbox('destroy');
				$('select[name="duallistbox_pengguna_dokumen[]"]').bootstrapDualListbox('destroy');
				$('select[name="duallistbox_dept_pendistribusi[]"]').bootstrapDualListbox('destroy');
				$('select[name="duallistbox_dokumen_terkait[]"]').bootstrapDualListbox('destroy');
				$('.rating').raty('destroy');
				$('.multiselect').multiselect('destroy');
			});
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//$('[data-rel=tooltip]').tooltip();
			//
			//$('.select2').css('width','200px').select2({allowClear:true})
			//.on('change', function(){
			//	$(this).closest('form').validate().element($(this));
			//}); 
			//
			//var $validation = false;
			//$('#fuelux-wizard-container')
			//.ace_wizard({
			//	//step: 2 //optional argument. wizard will jump to step "2" at first
			//	//buttons: '.wizard-actions:eq(0)'
			//})
			//.on('actionclicked.fu.wizard' , function(e, info){
			//	if(info.step == 1 && $validation) {
			//		if(!$('#validation-form').valid()) e.preventDefault();
			//	}
			//})
			//.on('finished.fu.wizard', function(e) {
			//	$('#auto_wizard_form').submit();//!!!
			//}).on('stepclick.fu.wizard', function(e){
			//	//e.preventDefault();//this will prevent clicking and selecting steps
			//});
			//
			////jump to a step
			///**
			//var wizard = $('#fuelux-wizard-container').data('fu.wizard')
			//wizard.currentStep = 3;
			//wizard.setState();
			//*/
			//
			////determine selected step
			////wizard.selectedItem().step
			//
			////hide or show the other form which requires validation
			////this is for demo only, you usullay want just one form in your application
			//$('#skip-validation').removeAttr('checked').on('click', function(){
			//	$validation = this.checked;
			//	if(this.checked) {
			//		$('#auto_wizard_form').hide();
			//		$('#validation-form').removeClass('hide');
			//	}
			//	else {
			//		$('#validation-form').addClass('hide');
			//		$('#auto_wizard_form').show();
			//	}
			//})
			//
			////documentation : http://docs.jquery.com/Plugins/Validation/validate
			//
			//$.mask.definitions['~']='[+-]';
			//$('#phone').mask('(999) 999-9999');
			//
			//jQuery.validator.addMethod("phone", function (value, element) {
			//	return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
			//}, "Enter a valid phone number.");
			//
			//$('#validation-form').validate({
			//	errorElement: 'div',
			//	errorClass: 'help-block',
			//	focusInvalid: false,
			//	ignore: "",
			//	rules: {
			//		upload_file_input: {
			//			required: true,
			//			email:true
			//		},//!!!
            //
			//		email: {
			//			required: true,
			//			email:true
			//		},
			//		password: {
			//			required: true,
			//			minlength: 5
			//		},
			//		password2: {
			//			required: true,
			//			minlength: 5,
			//			equalTo: "#password"
			//		},
			//		name: {
			//			required: true
			//		},
			//		phone: {
			//			required: true,
			//			phone: 'required'
			//		},
			//		url: {
			//			required: true,
			//			url: true
			//		},
			//		comment: {
			//			required: true
			//		},
			//		state: {
			//			required: true
			//		},
			//		platform: {
			//			required: true
			//		},
			//		subscription: {
			//			required: true
			//		},
			//		gender: {
			//			required: true,
			//		},
			//		agree: {
			//			required: true,
			//		}
			//	},
			//
			//	messages: {
			//		email: {
			//			required: "Please provide a valid email.",
			//			email: "Please provide a valid email."
			//		},
			//		password: {
			//			required: "Please specify a password.",
			//			minlength: "Please specify a secure password."
			//		},
			//		state: "Please choose state",
			//		subscription: "Please choose at least one option",
			//		gender: "Please choose gender",
			//		agree: "Please accept our policy"
			//	},
			//
			//	highlight: function (e) {
			//		$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			//	},
			//
			//	success: function (e) {
			//		$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
			//		$(e).remove();
			//	},
			//
			//	errorPlacement: function (error, element) {
			//		if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
			//			var controls = element.closest('div[class*="col-"]');
			//			if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
			//			else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
			//		}
			//		else if(element.is('.select2')) {
			//			error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
			//		}
			//		else if(element.is('.chosen-select')) {
			//			error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
			//		}
			//		else error.insertAfter(element.parent());
			//	},
			//
			//	submitHandler: function (form) {
			//	},
			//	invalidHandler: function (form) {
			//	}
			//});
			//
			//$('#modal-wizard-container').ace_wizard();
			//$('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
			//
			///**
			//$('#date').datepicker({autoclose:true}).on('changeDate', function(ev) {
			//	$(this).closest('form').validate().element($(this));
			//});
			//
			//$('#mychosen').chosen().on('change', function(ev) {
			//	$(this).closest('form').validate().element($(this));
			//});
			//*/
			//
			//$(document).one('ajaxloadstart.page', function(e) {
			//	//in ajax mode, remove remaining elements before leaving page
			//	$('[class*=select2]').remove();
			//});
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
		});
	</script>
	<!------------------------------------------------------------------------------------------------->
</body>
<!------------------------------------------------------------------------------------------------->
</html>
<!------------------------------------------------------------------------------------------------->