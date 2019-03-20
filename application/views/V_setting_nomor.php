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
	<div id="navbar" class="navbar navbar-default ace-save-state navbar-fixed-top">
		<div class="navbar-container ace-save-state" id="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="<?php echo base_url(); ?>" class="navbar-brand">
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

		<div id="sidebar" class="sidebar responsive ace-save-state sidebar-fixed">
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
						<li class="active">
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
						<div class="col-sm-12">
							<h3>Nomor Dokumen</h3>
						</div>
						<div class="col-sm-12">
						<form method="POST" action="<?= base_url('C_general_setting/update_nomor'); ?>">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="kode">Kode :</label>
										<input type="text" name="kode" maxlength="5" class="form-control" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="nama">Nama :</label>
										<input type="text" name="nama" maxlength="50" class="form-control" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="untuk">Untuk Format :</label>
										<select name="untuk" id="untuk" class="form-control" required>
											<option value="">Pilih</option>
											<option value="form">From Kontribusi</option>
											<option value="email">Email</option>
										</select>
									</div>
								</div>
							</div>
							<table class="table table-bordered">
								<thead>
									<tr align="center">
										<td>No</td>
										<td>Field Name</td>
										<td>Length</td>
										<td>Value</td>
										<td>Increment</td>
										<td>Order</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>
											<select name="field_1" id="1">
												<option value="">None</option>
												<option value="Table">Table</option>
												<option value="Year">Year</option>
												<option value="Month">Month</option>
												<option value="Delimeter">Delimeter</option>
												<option value="Free Text">Free Text</option>
											</select>
										</td>
										<td><input id="length1" type="text" readonly></td>
										<td><input id="value1" type="text" readonly></td>
										<td><input id="increment1" type="text" readonly></td>
										<td><input id="order1" type="text" readonly></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>2</td>
										<td>
											<select name="field_2" id="2">
												<option value="">None</option>
												<option value="Table">Table</option>
												<option value="Year">Year</option>
												<option value="Month">Month</option>
												<option value="Delimeter">Delimeter</option>
												<option value="Free Text">Free Text</option>
											</select>
										</td>
										<td><input id="length2" type="text" readonly></td>
										<td><input id="value2" type="text" readonly></td>
										<td><input id="increment2" type="text" readonly></td>
										<td><input id="order2" type="text" readonly></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>3</td>
										<td>
											<select name="field_3" id="3">
												<option value="">None</option>
												<option value="Table">Table</option>
												<option value="Year">Year</option>
												<option value="Month">Month</option>
												<option value="Delimeter">Delimeter</option>
												<option value="Free Text">Free Text</option>
											</select>
										</td>
										<td><input id="length3" type="text" readonly></td>
										<td><input id="value3" type="text" readonly></td>
										<td><input id="increment3" type="text" readonly></td>
										<td><input id="order3" type="text" readonly></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>4</td>
										<td>
											<select name="field_4" id="4">
												<option value="">None</option>
												<option value="Table">Table</option>
												<option value="Year">Year</option>
												<option value="Month">Month</option>
												<option value="Delimeter">Delimeter</option>
												<option value="Free Text">Free Text</option>
											</select>
										</td>
										<td><input id="length4" type="text" readonly></td>
										<td><input id="value4" type="text" readonly></td>
										<td><input id="increment4" type="text" readonly></td>
										<td><input id="order4" type="text" readonly></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>5</td>
										<td>
											<select name="field_5" id="5">
												<option value="">None</option>
												<option value="Table">Table</option>
												<option value="Year">Year</option>
												<option value="Month">Month</option>
												<option value="Delimeter">Delimeter</option>
												<option value="Free Text" selected>Free Text</option>
											</select>
										</td>
										<td><input id="length5" type="text" readonly></td>
										<td><input id="value5" type="text" readonly></td>
										<td><input id="increment5" type="text" readonly></td>
										<td><input id="order5" type="text" readonly></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td colspan="6" align="right"><input type="submit" class="btn btn-sm btn-success" value="Tambah"></td>
									</tr>
								</tbody>
							</table>
						</form>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="dynamic-table" class="table table-striped table-bordered table-hover" style="cursor:pointer">
								<thead>
									<tr>
										<th>No</th>
										<th>Kode</th>
										<th>Nama</th>
										<th>Untuk Format</th>
										<th>Aksi</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$is_continue = true;
									$no = 1;
									$get_data = $this->M_general_setting->GET_NOMOR_DOKUMEN();
									if(empty($get_data)||$get_data==""){
										$is_continue = false;
									}
									?>
									
									<?php
									if($is_continue){
										foreach($get_data as $data_row){
									?>
									<tr>
										<td><?= $no ?></td>
										<td><?php echo $data_row->Code; ?></td>
										<td><?php echo $data_row->Nama; ?></td>
										<td><?php echo $data_row->untuk; ?></td>
										<td><a href="<?= base_url('C_general_setting/hapus_nomor/'.$data_row->Code); ?>" class="btn btn-danger btn-sm fa fa-trash"></a></td>
									</tr>
									<?php
									 $no++;
										}
									}
									?>
									
								</tbody>
							</table>
						</div>
					</div>
					<!------------------------------------------------------------------------------------------------->
					<!-- PAGE CONTENT ENDS -->
					<!------------------------------------------------------------------------------------------------->
				</div><!-- /.page-content -->
			</div>
		</div><!-- /.main-content -->

		<div class="footer"></div>

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
	<script src="<?= base_url('template/ckeditor/ckeditor.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/sweetalert.min.js'); ?>"></script>
	<?php if ($pesan = $this->session->flashdata('pesan')): ?>
	<script>
		swal("Berhasil!", "<?= $pesan; ?>", "success");
	</script>
	<?php endif; ?>
	<?php if ($pesan_gagal = $this->session->flashdata('pesan_gagal')): ?>
	<script>
		swal("Gagal!", "<?= $pesan_gagal; ?>", "error");
	</script>
	<?php endif; ?>
	
	<script type="text/javascript">
		jQuery(function($) {
			$.ajax({
        type: "GET",
        url: "<?php echo base_url();?>C_notification/getNotification/<?php echo $this->session->userdata("session_bgm_edocument_id");?>/true/",             
        dataType: "html",   //expect html to be returned                
        success: function(response){
					$(".nofication-count").text(JSON.parse(response).length);
        }
			});
			
			$.ajax({
				url: '<?= base_url('C_general_setting/get_nomor'); ?>',
				type: 'GET',
				success: function(response){
					//Parsing Json
					response = $.parseJSON(response);
					//Add Options
					$.each(response,function(index,data){
						$('#1').val(data['field_1']);
						$('#2').val(data['field_2']);
						$('#3').val(data['field_3']);
						$('#4').val(data['field_4']);
						$('#5').val(data['field_5']);
					});
					var satu = $('#1').val();
					var dua = $('#2').val();
					var tiga = $('#3').val();
					var empat = $('#4').val();
					var lima = $('#5').val();
					if (satu == 'Table') {
						$('#length1').val('3');
						$('#value1').val('TDoc.TipeDokumen');
						$('#increment1').val('0');
						$('#order1').val('1');
					}else if(satu == 'Year'){
						$('#length1').val('4');
						$('#value1').val('YYYY');
						$('#increment1').val('0');
						$('#order1').val('1');
					}else if(satu == 'Month'){
						$('#length1').val('2');
						$('#value1').val('MM');
						$('#increment1').val('0');
						$('#order1').val('1');
					}else if(satu == 'Delimeter'){
						$('#length1').val('1');
						$('#value1').val('/');
						$('#increment1').val('0');
						$('#order1').val('1');
					}else if(satu == 'Free Text'){
						$('#length1').val('3');
						$('#value1').val('999');
						$('#increment1').val('1');
						$('#order1').val('1');
					}else{
						$('#length1').val('');
						$('#value1').val('');
						$('#increment1').val('0');
						$('#order1').val('1');
					}
					if (dua == 'Table') {
						$('#length2').val('3');
						$('#value2').val('TDoc.TipeDokumen');
						$('#increment2').val('0');
						$('#order2').val('2');
					}else if(dua == 'Year'){
						$('#length2').val('4');
						$('#value2').val('YYYY');
						$('#increment2').val('0');
						$('#order2').val('2');
					}else if(dua == 'Month'){
						$('#length2').val('2');
						$('#value2').val('MM');
						$('#increment2').val('0');
						$('#order2').val('2');
					}else if(dua == 'Delimeter'){
						$('#length2').val('1');
						$('#value2').val('/');
						$('#increment2').val('0');
						$('#order2').val('2');
					}else if(dua == 'Free Text'){
						$('#length2').val('3');
						$('#value2').val('999');
						$('#increment2').val('1');
						$('#order2').val('2');
					}else{
						$('#length2').val('');
						$('#value2').val('');
						$('#increment2').val('0');
						$('#order2').val('2');
					}
					if (tiga == 'Table') {
						$('#length3').val('3');
						$('#value3').val('TDoc.TipeDokumen');
						$('#increment3').val('0');
						$('#order3').val('3');
					}else if(tiga == 'Year'){
						$('#length3').val('4');
						$('#value3').val('YYYY');
						$('#increment3').val('0');
						$('#order3').val('3');
					}else if(tiga == 'Month'){
						$('#length3').val('2');
						$('#value3').val('MM');
						$('#increment3').val('0');
						$('#order3').val('3');
					}else if(tiga == 'Delimeter'){
						$('#length3').val('1');
						$('#value3').val('/');
						$('#increment3').val('0');
						$('#order3').val('3');
					}else if(tiga == 'Free Text'){
						$('#length3').val('3');
						$('#value3').val('999');
						$('#increment3').val('1');
						$('#order3').val('3');
					}else{
						$('#length3').val('');
						$('#value3').val('');
						$('#increment3').val('0');
						$('#order3').val('3');
					}
					if (empat == 'Table') {
						$('#length4').val('3');
						$('#value4').val('TDoc.TipeDokumen');
						$('#increment4').val('0');
						$('#order4').val('4');
					}else if(empat == 'Year'){
						$('#length4').val('4');
						$('#value4').val('YYYY');
						$('#increment4').val('0');
						$('#order4').val('4');
					}else if(empat == 'Month'){
						$('#length4').val('2');
						$('#value4').val('MM');
						$('#increment4').val('0');
						$('#order4').val('4');
					}else if(empat == 'Delimeter'){
						$('#length4').val('1');
						$('#value4').val('/');
						$('#increment4').val('0');
						$('#order4').val('4');
					}else if(empat == 'Free Text'){
						$('#length4').val('3');
						$('#value4').val('999');
						$('#increment4').val('1');
						$('#order4').val('4');
					}else{
						$('#length4').val('');
						$('#value4').val('');
						$('#increment4').val('0');
						$('#order4').val('4');
					}
					if (lima == 'Table') {
						$('#length5').val('3');
						$('#value5').val('TDoc.TipeDokumen');
						$('#increment5').val('0');
						$('#order5').val('5');
					}else if(lima == 'Year'){
						$('#length5').val('4');
						$('#value5').val('YYYY');
						$('#increment5').val('0');
						$('#order5').val('5');
					}else if(lima == 'Month'){
						$('#length5').val('2');
						$('#value5').val('MM');
						$('#increment5').val('0');
						$('#order5').val('5');
					}else if(lima == 'Delimeter'){
						$('#length5').val('1');
						$('#value5').val('/');
						$('#increment5').val('0');
						$('#order5').val('5');
					}else if(lima == 'Free Text'){
						$('#length5').val('3');
						$('#value5').val('999');
						$('#increment5').val('1');
						$('#order5').val('5');
					}else{
						$('#length5').val('');
						$('#value5').val('');
						$('#increment5').val('0');
						$('#order5').val('5');
					}
				}
			});
			
			$('#1').change(function(){
				var satu = $('#1').val();
				if (satu == 'Table') {
					$('#length1').val('3');
					$('#value1').val('TDoc.TipeDokumen');
					$('#increment1').val('0');
					$('#order1').val('1');
				}else if(satu == 'Year'){
					$('#length1').val('4');
					$('#value1').val('YYYY');
					$('#increment1').val('0');
					$('#order1').val('1');
				}else if(satu == 'Month'){
					$('#length1').val('2');
					$('#value1').val('MM');
					$('#increment1').val('0');
					$('#order1').val('1');
				}else if(satu == 'Delimeter'){
					$('#length1').val('1');
					$('#value1').val('/');
					$('#increment1').val('0');
					$('#order1').val('1');
				}else if(satu == 'Free Text'){
					$('#length1').val('3');
					$('#value1').val('999');
					$('#increment1').val('1');
					$('#order1').val('1');
				}else{
					$('#length1').val('');
					$('#value1').val('');
					$('#increment1').val('0');
					$('#order1').val('1');
				}
			});
			$('#2').change(function() {
				var dua = $('#2').val();
				if (dua == 'Table') {
					$('#length2').val('3');
					$('#value2').val('TDoc.TipeDokumen');
					$('#increment2').val('0');
					$('#order2').val('2');
				}else if(dua == 'Year'){
					$('#length2').val('4');
					$('#value2').val('YYYY');
					$('#increment2').val('0');
					$('#order2').val('2');
				}else if(dua == 'Month'){
					$('#length2').val('2');
					$('#value2').val('MM');
					$('#increment2').val('0');
					$('#order2').val('2');
				}else if(dua == 'Delimeter'){
					$('#length2').val('1');
					$('#value2').val('/');
					$('#increment2').val('0');
					$('#order2').val('2');
				}else if (dua == 'Free Text'){
					$('#length2').val('3');
					$('#value2').val('999');
					$('#increment2').val('1');
					$('#order2').val('2');
				}else{
					$('#length2').val('');
					$('#value2').val('');
					$('#increment2').val('0');
					$('#order2').val('2');
				}
			});
			$('#3').change(function() {
				var tiga = $('#3').val();
				if (tiga == 'Table') {
					$('#length3').val('3');
					$('#value3').val('TDoc.TipeDokumen');
					$('#increment3').val('0');
					$('#order3').val('3');
				}else if(tiga == 'Year'){
					$('#length3').val('4');
					$('#value3').val('YYYY');
					$('#increment3').val('0');
					$('#order3').val('3');
				}else if(tiga == 'Month'){
					$('#length3').val('2');
					$('#value3').val('MM');
					$('#increment3').val('0');
					$('#order3').val('3');
				}else if(tiga == 'Delimeter'){
					$('#length3').val('1');
					$('#value3').val('/');
					$('#increment3').val('0');
					$('#order3').val('3');
				}else if(tiga == 'Free Text'){
					$('#length3').val('3');
					$('#value3').val('999');
					$('#increment3').val('1');
					$('#order3').val('3');
				}else{
					$('#length3').val('');
					$('#value3').val('');
					$('#increment3').val('0');
					$('#order3').val('3');
				}
			});
			$('#4').change(function() {
				var empat = $('#4').val();
				if (empat == 'Table') {
					$('#length4').val('3');
					$('#value4').val('TDoc.TipeDokumen');
					$('#increment4').val('0');
					$('#order4').val('4');
				}else if(empat == 'Year'){
					$('#length4').val('4');
					$('#value4').val('YYYY');
					$('#increment4').val('0');
					$('#order4').val('4');
				}else if(empat == 'Month'){
					$('#length4').val('2');
					$('#value4').val('MM');
					$('#increment4').val('0');
					$('#order4').val('4');
				}else if(empat == 'Delimeter'){
					$('#length4').val('1');
					$('#value4').val('/');
					$('#increment4').val('0');
					$('#order4').val('4');
				}else if(empat == 'Free Text'){
					$('#length4').val('3');
					$('#value4').val('999');
					$('#increment4').val('1');
					$('#order4').val('4');
				}else{
					$('#length4').val('');
					$('#value4').val('');
					$('#increment4').val('0');
					$('#order4').val('4');
				}
			});
			$('#5').change(function() {
				var lima = $('#5').val();
				if (lima == 'Table') {
					$('#length5').val('3');
					$('#value5').val('TDoc.TipeDokumen');
					$('#increment5').val('0');
					$('#order5').val('5');
				}else if(lima == 'Year'){
					$('#length5').val('4');
					$('#value5').val('YYYY');
					$('#increment5').val('0');
					$('#order5').val('5');
				}else if(lima == 'Month'){
					$('#length5').val('2');
					$('#value5').val('MM');
					$('#increment5').val('0');
					$('#order5').val('5');
				}else if(lima == 'Delimeter'){
					$('#length5').val('1');
					$('#value5').val('/');
					$('#increment5').val('0');
					$('#order5').val('5');
				}else if(lima == 'Free Text'){
					$('#length5').val('3');
					$('#value5').val('999');
					$('#increment5').val('1');
					$('#order5').val('5');
				}else{
					$('#length5').val('');
					$('#value5').val('');
					$('#increment5').val('0');
					$('#order5').val('5');
				}
			});
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
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
		});
		$('#id-input-file-3').ace_file_input({
			style: 'well',
			btn_choose: 'Drop image here or click to choose',
			btn_change: null,
			no_icon: 'ace-icon fa fa-cloud-upload',
			droppable: true,
			thumbnail: 'small'
			//large | fit
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
		//initiate dataTables plugin
			var myTable = $('#dynamic-table')
			//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
			.DataTable( {
				bAutoWidth: false,
				//PLEASE CHECK columns TABLE!!!
				"aaSorting": [],
				
				//"bProcessing": true,
			    //"bServerSide": true,
			    //"sAjaxSource": "http://127.0.0.1/table.php"	,
			
				//,
				//"sScrollY": "200px",
				//"bPaginate": false,
			
				//"sScrollX": "100%",
				//"sScrollXInner": "120%",
				//"bScrollCollapse": true,
				//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
				//you may want to wrap the table inside a "div.dataTables_borderWrap" element
			
				//"iDisplayLength": 50
			
				select: {
					style: 'single'
				}
			});
			// $('#dynamic-table tbody').on('click', 'tr', function () {
			// 	var data = myTable.row( this ).data();
			// 	// alert( 'You clicked on '+data[0]+'\'s row' );
			// });
			
			$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
			
			new $.fn.dataTable.Buttons( myTable, {
				buttons: [
				  {
					"extend": "colvis",
					"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
					"className": "btn btn-white btn-primary btn-bold",
					columns: ':not(:first):not(:last)'
				  },
				  {
					"extend": "copy",
					"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
					"className": "btn btn-white btn-primary btn-bold"
				  },
				  {
					"extend": "csv",
					"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
					"className": "btn btn-white btn-primary btn-bold"
				  },
				  {
					"extend": "excel",
					"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
					"className": "btn btn-white btn-primary btn-bold"
				  },
				  {
					"extend": "pdf",
					"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
					"className": "btn btn-white btn-primary btn-bold"
				  },
				  {
					"extend": "print",
					"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
					"className": "btn btn-white btn-primary btn-bold",
					autoPrint: false,
					message: 'This print was produced using the Print button for DataTables'
				  }		  
				]
			} );
			myTable.buttons().container().appendTo( $('.tableTools-container') );
			
			//style the message box
			var defaultCopyAction = myTable.button(1).action();
			myTable.button(1).action(function (e, dt, button, config) {
				defaultCopyAction(e, dt, button, config);
				$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
			});
			
			var defaultColvisAction = myTable.button(0).action();
			myTable.button(0).action(function (e, dt, button, config) {
				
				defaultColvisAction(e, dt, button, config);
				
				
				if($('.dt-button-collection > .dropdown-menu').length == 0) {
					$('.dt-button-collection')
					.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
					.find('a').attr('href', '#').wrap("<li />")
				}
				$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
			});

			setTimeout(function() {
				$($('.tableTools-container')).find('a.dt-button').each(function() {
					var div = $(this).find(' > div').first();
					if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
					else $(this).tooltip({container: 'body', title: $(this).text()});
				});
			}, 500);
			
			myTable.on( 'select', function ( e, dt, type, index ) {
				if ( type === 'row' ) {
					$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
				}
			} );
			myTable.on( 'deselect', function ( e, dt, type, index ) {
				if ( type === 'row' ) {
					$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
				}
			} );			
			
			/////////////////////////////////
			//table checkboxes
			$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
			
			//select/deselect all rows according to table header checkbox
			$('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				
				$('#dynamic-table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) myTable.row(row).select();
					else  myTable.row(row).deselect();
				});
			});
			
			//select/deselect a row when the checkbox is checked/unchecked
			$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
				var row = $(this).closest('tr').get(0);
				if(this.checked) myTable.row(row).deselect();
				else myTable.row(row).select();
			});
					
			$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
				e.stopImmediatePropagation();
				e.stopPropagation();
				e.preventDefault();
			});
	</script>
	<!------------------------------------------------------------------------------------------------->
</body>
<!------------------------------------------------------------------------------------------------->
</html>
<!------------------------------------------------------------------------------------------------->