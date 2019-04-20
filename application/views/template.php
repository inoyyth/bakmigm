<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$count_notification = 0;
$count_news = 0;
// Notification
$get_data_ext = $this->M_notification->GET_NOTIFICATION_NEW($this->session->userdata("session_bgm_edocument_name"));
if (empty($get_data_ext)) {
	$is_continue = false;
}else{
	$count_notification = count($get_data_ext);
}
// News
$get_data_count = $this->M_notification->GET_NEWS_NEW($this->session->userdata("session_bgm_edocument_name"));
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
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/ace-skins.min.css'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('template/backend/assets/css/ace-rtl.min.css'); ?>" />
	<script src="<?php echo base_url('template/backend/assets/js/jquery-2.1.4.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/ace-extra.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/html5shiv.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/respond.min.js'); ?>"></script>
    <script src="<?php echo base_url('template/backend/assets/js/bootstrap.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/respond.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/ace-elements.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/ace.min.js'); ?>"></script>
</head>
<body class="no-skin">
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
			</div>
        </div>
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
						<img id="avatar-profile" class="img-responsive" width="180px" height="200px" src="<?php echo base_url('template/backend/assets/images/avatars/profile-pic.jpg'); ?>" />
						<button id="btn-profile-picture" style="position: fixed;margin-top: -30px; margin-left: 15px;" data-toggle="modal" data-target="#modal-picture">Change</button>
					</span>
					<br />
					<i class="menu-icon fa fa-user"></i>
					<span class="menu-text">
						<?php echo $this->session->userdata("session_bgm_edocument_name"); ?>
					</span>
					<br />
				</div>
			</div>
			<ul class="nav nav-list">
				<?php 
				foreach($this->session->userdata("menu") as $k => $v) {
					if ($this->session->userdata("session_bgm_edocument_name") == "ADMIN APLIKASI") {
				?>
					<li class="">
						<a href="<?php echo base_url($v['slug']); ?>" <?php echo (!empty($v['children']) ? 'class="dropdown-toggle"' : '');?>>
							<i class="menu-icon fa <?php echo $v['icon'];?>"></i>
							<?php if($v['id'] == 4) { ?>
								<span class="menu-text"> <?php echo $v['name'];?> <span class="nofication-count"></span> </span>
							<?php } else { ?>
								<span class="menu-text"> <?php echo $v['name'];?> </span>
							<?php } ?>
						</a>
						<?php 
							if(!empty($v['children'])) { 
							foreach($v['children'] as $kChild => $vChild) {
						?>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="<?php echo base_url($vChild['slug']); ?>">
									<i class="menu-icon fa fa-caret-right"></i>
									<?php echo $vChild['name'];?>
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
						<?php } } ?>
					</li>
				<?php } else {
						if (in_array($v['id'],$this->session->userdata("user_menu"))) {
				?>
					<li class="">
						<a href="<?php echo base_url($v['slug']); ?>" <?php echo (!empty($v['children']) ? 'class="dropdown-toggle"' : '');?>>
							<i class="menu-icon fa <?php echo $v['icon'];?>"></i>
							<?php if($v['id'] == 4) { ?>
								<span class="menu-text"> <?php echo $v['name'];?> <span class="badge nofication-count"></span> </span>
							<?php } else { ?>
								<span class="menu-text"> <?php echo $v['name'];?> </span>
							<?php } ?>
						</a>
						<?php 
							if(!empty($v['children'])) { 
							foreach($v['children'] as $kChild => $vChild) {
								if (in_array($vChild['id'],$this->session->userdata("user_menu"))) {
						?>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="<?php echo base_url($vChild['slug']); ?>">
									<i class="menu-icon fa fa-caret-right"></i>
									<?php echo $vChild['name'];?>
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
						<?php } } } ?>
					</li>
				<?php } } } ?>
				<!-- <li class="">
					<a href="<?php echo base_url('bookmarks'); ?>">
						<i class="menu-icon fa fa-bookmark"></i>
						<span class="menu-text"> Favorit </span>
					</a>
					<b class="arrow"></b>
				</li>
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
				<li class="">
					<a href="<?php echo base_url('contribution'); ?>">
						<i class="menu-icon fa fa-database"></i>
						<span class="menu-text"> Kontribusi </span>
					</a>
					<b class="arrow"></b>
				</li>
				<li class="">
					<a href="<?php echo base_url('report'); ?>">
						<i class="menu-icon fa fa-database"></i>
						<span class="menu-text"> Laporan </span>
					</a>
					<b class="arrow"></b>
				</li>
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
						<li class="active">
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
				</li> -->
				<li class="">
					<a href="<?php echo base_url('C_menu/logout'); ?>">
						<i class="menu-icon fa fa-power-off"></i>
						<span class="menu-text"> Keluar </span>
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</div>
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
                    <?php $this->load->view($view);?>
				</div>
			</div>
		</div>
		<div class="footer"></div>
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<div class="modal fade" id="modal-picture" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Change Profile Picture</h4>
				</div>
				<div class="modal-body">
					<form action="<?php echo base_url("C_menu/setPictureProfile");?>" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label>Select Picture (max. 5MB)</label>
							<input type="hidden" name="employee_id" value="<?php echo $this->session->userdata("session_bgm_edocument_id");?>">
							<input type="file" name="picture" id="picture_txt" class="form-control" required="true">
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary btn-success" value="Save">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	jQuery(function($) {
		$.ajax({    //create an ajax request to display.php
			type: "GET",
			url: "<?php echo base_url();?>C_notification/getNotification/<?php echo $this->session->userdata("session_bgm_edocument_id");?>/true/",
			dataType: "html",   //expect html to be returned                
			success: function(response){
				$(".nofication-count").text(JSON.parse(response).length);
			}
		});

		$.ajax({    //create an ajax request to display.php
			type: "GET",
			url: "<?php echo base_url();?>C_menu/getProfilePicture/<?php echo $this->session->userdata("session_bgm_edocument_id");?>",
			dataType: "html",   //expect html to be returned                
			success: function(res){
				var response = JSON.parse(res);
				console.log(response.image_path);
				if (response.image_path !== "" ) {
					$("#avatar-profile").removeAttr('src');
					$("#avatar-profile").attr('src', "<?php echo base_url();?>" + response.image_path);
				}
			}
		});

		$('#picture_txt').on('change', function() {
			var filePath = $(this).val(); 
			var file_ext = filePath.substr(filePath.lastIndexOf('.')+1,filePath.length);
			var file_size = this.files[0].size / 1024;
			var iSize = (Math.round((file_size / 1024) * 100) / 100);
		
			var allow_extention = new Array("png","jpg","jpeg");
			if (allow_extention.indexOf(file_ext) != -1) {
				if (iSize > 5) {
					alert("Maksimal Ukuran File 5MB!");
					$(this).val('');

					return false;
				}

				return true;
			} else {
				alert("File Harus JPG, PNG Atau JPEG!");
				$(this).val('');

				return false;
			}
		});
	});
</script>
</body>
</html>