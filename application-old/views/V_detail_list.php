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
<style>
	input[readonly]{
		background-color: white!important;
	}
	input[type=number]::-webkit-inner-spin-button, 
	input[type=number]::-webkit-outer-spin-button { 
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0; 
	}
	.modal-dialog1 {
    width: 100%;
    height: 100%;
    padding: 0;
    margin:0;
	}
	.navbar-toggle {
	    display: inline;
	}
	.sidebar.responsive+.main-content {
    margin-left: 0!important;
    margin-right: 0!important;
	}
	.sidebar.responsive.display {
    -moz-transform: none!important;
    -webkit-transform: none!important;
    -o-transform: none!important;
    -ms-transform: none!important;
    transform: none!important;
    overflow: visible;
    max-height: 2000px;
    -webkit-transition-delay: 0s;
    -moz-transition-delay: 0s;
    -o-transition-delay: 0s;
    transition-delay: 0s;
	}
	.sidebar.responsive {
    -webkit-box-shadow: 2px 1px 2px 0 rgba(0,0,0,.15);
    box-shadow: 2px 1px 2px 0 rgba(0,0,0,.15);
    z-index: 1027;
    overflow: hidden;
    max-height: 0;
    -moz-transform: translateX(-200px);
    -webkit-transform: translateX(-200px);
    -o-transform: translateX(-200px);
    -ms-transform: translateX(-200px);
    transform: translateX(-200px);
    -webkit-transition: -webkit-transform .2s linear 0s,max-height 0s linear .2s;
    -moz-transition: -moz-transform .2s linear 0s,max-height 0s linear .2s;
    -o-transition: -o-transform .2s linear 0s,max-height 0s linear .2s;
    transition: transform .2s linear 0s,max-height 0s linear .2s;
    position: relative;
    bottom: auto;
    left: 190px;
    margin-left: -190px;
	}
</style>
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
							<span class="badge badge-primary"><?php echo $count_notification; ?></span>
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
				<li class="active">
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
									<?php if($key['DOC_MAKER']!=$SESSION_ID): ?>
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
													<textarea type="text" maxlength="<?= $get_maks_comment[0]->maks; ?>" name="si_review" id="si_review" rows="7" class="form-control" style="resize:none;width: 50.3rem;margin-left: 1rem;" required></textarea>
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
													->where(array('tb_document_comment.DTCT_USER' => $SESSION_ID, 'tb_document_comment.DOC_ID' => $key['DOC_ID']))
													->get()->result();
												if (!empty($get_comment)):
													foreach ($get_comment as $get_comment_1) {
														$COMMENTER = $get_comment_1->DTCT_USER;
													}
													if ($COMMENTER == $SESSION_ID && $COMMENTER != $key['DOC_MAKER']):
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
								<?php $pengguna = $this->Model_detail->getDetail($SESSION_DEPARTEMENT_ID,$key['DOC_ID'],$SESSION_JOB_LEVEL_ID);  ?>
								<?php if ($pengguna): ?>
									<form id="form_detail" name="form_view[]" action="<?php echo base_url('C_notification/detail'); ?>" method="post" enctype="multipart/form-data" target="_blank">
										<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
										<button type="submit" class="btn btn-link"><b style="font-size: 1.6rem;">Detail PMD</b></button>
									</form>
								<?php endif ?>
								
							</div>
							<div class="col-md-3" style="float: left;">
							<?php
								$DOC_ID = $key['DOC_ID'];
								$session_dpt = $this->Model_detail->getDetail($SESSION_DEPARTEMENT_ID,$DOC_ID,$SESSION_JOB_LEVEL_ID); 
							?>
							<?php if ($session_dpt): ?>
								<!-- sharelink -->
								<a data-toggle="modal" data-target="#modal-sharelink<?= $key['DOC_ID'];?>" data-popup="tooltip" data-placement="top" title="Sharelink" href="" style="color: black;"><i class="glyphicon glyphicon-link" style="font-size: 2.5rem;float: right;cursor: pointer;margin-left: .7rem"></i></a>
								<!-- sharelink -->
							<?php endif ?>
							<?php if ($key['DOC_MAKER'] == $SESSION_ID): ?>
								<!-- comment -->
							<form id="form_comment[]" style="float: right; " name="form_comment[]" action="<?php echo base_url('C_news/comment'); ?>" method="post" enctype="multipart/form-data">
								<input type="hidden" id="si_key[]" name="si_key[]" value="<?php echo $key['DOC_ID']; ?>" class="form-control" required/>
								<button type="submit" class="btn btn-link" data-placement="top" title="comment-list"><i class="fa fa-comment" style="color:black;font-size: 2.5rem;float: right;margin-left:.7rem;cursor: pointer;margin: -.4rem -1.7rem 0 -.7rem;"></i> </button>
							</form>
							<!-- end comment -->
							<?php endif; ?>
							<?php if ($key['DOC_MAKER'] == $SESSION_ID && ($key['DOC_STATUS'] == 'DIPUBLIKASI' || $key['DOC_STATUS'] == 'KADALUARSA' || $key['DOC_STATUS'] == 'DIARSIPKAN')): ?>
							<!-- versioning -->
							<a data-toggle="modal" data-target="#modal-versioning<?= $key['DOC_ID'];?>" data-popup="tooltip" data-placement="top" title="Pengkinian" href="" style="color: black;"><i class="glyphicon glyphicon-edit" style="font-size: 2.5rem;float: right;cursor: pointer;margin-left: .7rem"></i></a>
							<!-- end versioning -->
							<?php endif ?>
							<?php if (
								$SESSION_ID == $key['DOC_MAKER'] &&

								(
									$SESSION_ROLES == "PENDISTRIBUSI" || $SESSION_ROLES == "PENCIPTA" ||
									$SESSION_ROLES_2 == "PENDISTRIBUSI" || $SESSION_ROLES_2 == "PENCIPTA" ||
									$SESSION_ROLES_3 == "PENDISTRIBUSI" || $SESSION_ROLES_3 == "PENCIPTA" ||
									$SESSION_ROLES_4 == "PENDISTRIBUSI" || $SESSION_ROLES_4 == "PENCIPTA" ||
									$SESSION_ROLES_5 == "PENDISTRIBUSI" || $SESSION_ROLES_5 == "PENCIPTA"
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
								<input type="hidden" id="ur_id" name="ur_id" value="<?php echo $SESSION_ID; ?>" class="form-control" required/>
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
						        if ($SESSION_DEPARTEMENT_CODE == "BPI") {
						        	$si_archived = "BPI";
						        }else{
						        	$si_archived = $SESSION_ID;
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
												</div><br/>
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
											<input type="hidden" name="pengirim" value="<?= $SESSION_ID ?>">
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