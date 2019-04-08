<div class="row">
	<div class="alert alert-info" style="margin-bottom:0px;">
		Tabel HRIS <button data-toggle="modal" data-target="#modal-tambah" class="btn btn-success btn-sm" style="float:right;margin-top:-5px;">Tambah</button>
	</div>
	<table id="dynamic-table" class="table table-striped table-bordered table-hover" style="cursor:pointer">
		<thead>
			<tr>
				<th>No</th>
				<th>NIP</th>
				<th>Nama</th>
				<th>Job Level</th>
				<th>Departemen</th>
				<th>Roles</th>
				<th>Sync Date</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$is_continue = true;
			$no = 1;
			$get_data = $this->M_setting_user->GET_DATA_EMPLOYEE_DETAIL();
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
				<td><?php echo $data_row->NIP; ?></td>
				<td><?php echo $data_row->FULL_NAME; ?></td>
				<td><?php echo $data_row->JBLL_NAME; ?></td>
				<td><?php echo $data_row->DN_NAME; ?></td>
				<td><?php echo $data_row->ROLES 
								. ($data_row->ROLES_2 ? " | " . $data_row->ROLES_2 : '') 
								. ($data_row->ROLES_3 ? " | " . $data_row->ROLES_3 : '') 
								. ($data_row->ROLES_4 ? " | " . $data_row->ROLES_4 : '') 
								. ($data_row->ROLES_5 ? " | " . $data_row->ROLES_5 : '')
						?>
				</td>
				<td><?php echo date('d/M/Y H:i', strtotime($data_row->SYNC_DATE))." WIB"; ?></td>
				<td style="width:100px;"><button onclick="openModalEdit(<?php echo $data_row->NIP; ?>)" class="btn btn-xs btn-warning" id="edit-modal">E</button> | <a class="btn btn-xs btn-danger" href="<?= base_url('C_setting_user/destroy_user_detail/'.$data_row->NIP); ?>">D</a></td>
			</tr>
			<?php
				$no++;
				}
			}
			?>
			
		</tbody>
	</table>
	<div class="alert alert-info" style="margin-bottom:0;">
		<a class="btn btn-success" href="<?php echo base_url('C_setting_user/');?>">Back</a>
	</div>
</div>

<!-- MODAL TAMBAH -->
<div id="modal-tambah" class="modal" tabindex="-1">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="blue bigger">Tambah Data</h5>
				</div>
				<form method="POST" action="<?= base_url('C_setting_user/insert_user_detail'); ?>" class="form-horizontal">
				<div class="modal-body" style="margin: 0 15px">
					<div class="row">

						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
							<div class="form-group">
								<label for="full_name">Level</label>
								<select name="combo-level" id="combo-level" class="form-control" required>
									<option value="">Pilih</option>
									<?php
									$level = $this->M_setting_user->getDataLevel();
									foreach ($level as $k=>$v):
									?>
									<option value="<?= $v['JBLL_ID']; ?>"><?= $v['JBLL_NAME']; ?></option>
									<?php endforeach; ?>
								</select>
							</div>
							<div class="form-group">
								<label for="full_name">Departemen</label>
								<select name="combo-departemen" id="combo-departemen" class="form-control" required>
									<option value="">Pilih</option>
									<?php
									$departemen = $this->M_setting_user->getDataDepartemen();
									foreach ($departemen as $k=>$v):
									?>
									<option value="<?= $v['DN_ID']; ?>"><?= $v['DN_NAME']; ?></option>
									<?php endforeach; ?>
								</select>
							</div>
							<div class="form-group">
								<label for="full_name">Nama</label>
								<select name="full_name" id="full_name" class="form-control" required>
									<!-- <option value="">Pilih</option>
									<?php
									$GET_DATA_EMPLOYEE = $this->M_setting_user->GET_DATA_EMPLOYEE();
									foreach ($GET_DATA_EMPLOYEE as $employee):
									?>
									<option value="<?= $employee->NIP; ?>"><?= $employee->FULL_NAME; ?></option>
									<?php endforeach; ?> -->
								</select>
							</div>
							<div class="form-group">
								<label for="nip">NIP</label>
								<input type="text" name="nip" id="nip" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="user_name">User Name</label>
								<input type="text" name="user_name" id="user_name" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="job_level">Job Level</label>
								<input type="text" name="job_level" id="job_level" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="departemen">Departemen</label>
								<input type="text" name="departemen" id="departemen" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="user_group">User Group</label>
								<input type="text" name="user_group" id="user_group" class="form-control">
							</div>
							<div class="form-group">
								<label for="role">Roles :</label>
								<select name="role[]" id="role" multiple="multiple" size="5" class="form-control" required>
									<?php
									$is_continue = true;
									$get_data_ext = $this->M_admin_setting->GET_ROLE_ARRAY();
									if(empty($get_data_ext)||$get_data_ext==""){
										$is_continue = false;
									}
									if($is_continue):
									?>
									<?php foreach ($get_data_ext as $role): ?>
									<option value="<?= $role->RS_ID; ?>"><?= $role->RS_ID; ?></option>
									<?php endforeach;endif; ?>
								</select>
								<br/>
								* Setiap Roles (Pencipta, Pendistribusi ataupun Atasan Pencipta) sudah diberi role Pengguna.
							</div>
							</div>
						</div><!-- col -->
					</div><!-- row -->
				</div><!-- body -->
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-warning btn-sm" style="float:left;">Cancel</button>
					<button type="submit" class="btn btn-success btn-sm">Tambah</button>
				</div><!-- footer -->
				</form>
			</div>
		</div>
	</div>

	<!-- MODAL TAMBAH -->
	<div id="modal-edit" class="modal" tabindex="-1">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="blue bigger">Edit Data</h5>
				</div>
				<form method="POST" action="<?= base_url('C_setting_user/insert_user_detail'); ?>" class="form-horizontal">
				<div class="modal-body" style="margin: 0 15px">
					<div class="row">

						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
						<div class="form-group">
								<label for="nip">Nama</label>
								<input type="text" name="nama" id="nama-edit" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="nip">NIP</label>
								<input type="text" name="nip" id="nip-edit" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="user_name">User Name</label>
								<input type="text" name="user_name" id="user-name-edit" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="job_level">Job Level</label>
								<input type="text" name="job_level" id="job-level-edit" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="departemen">Departemen</label>
								<input type="text" name="departemen" id="departemen-edit" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label for="user_group">User Group</label>
								<input type="text" name="user_group" id="user-group-edit" class="form-control">
							</div>
							<div class="form-group">
								<label for="role">Roles :</label>
								<select name="role[]" id="role-edit" multiple="multiple" size="5" class="form-control" required>

								</select>
								<br/>
								* Setiap Roles (Pencipta, Pendistribusi ataupun Atasan Pencipta) sudah diberi role Pengguna.
							</div>
							</div>
						</div><!-- col -->
					</div><!-- row -->
				</div><!-- body -->
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-warning btn-sm" style="float:left;">Cancel</button>
					<button type="submit" class="btn btn-success btn-sm">Update</button>
				</div><!-- footer -->
				</form>
			</div>
		</div>
	</div>
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
		swal("Berhasil!", "<?= $pesan; ?>", "success");
	</script>
	<?php endif; ?>
	<?php if ($pesan_gagal = $this->session->flashdata('pesan_gagal')): ?>
	<script>
		swal("Gagal!", "<?= $pesan_gagal; ?>", "error");
	</script>
	<?php endif; ?>
	
	<script type="text/javascript">

		function openModalEdit(id) {
			$.ajax({
					url: '<?=base_url('C_setting_user/get_detail_employee')?>',
					type: 'POST', 
					data: {nip: id},
					success: function(response){
						response = $.parseJSON(response);
						$('#role-edit').find('option').remove();
						$("#nama-edit").val(response.employee_detail.FULL_NAME);
						$("#nip-edit").val(response.employee_detail.NIP);
						$("#user-name-edit").val(response.employee_detail.USER_NAME);
						$("#job-level-edit").val(response.employee_detail.JOBLVL);
						$("#departemen-edit").val(response.employee_detail.DEPNAME);
						$("#user-group-edit").val(response.employee_detail.USER_GROUP);
						var role1 = (response.employee_detail.ROLES !== "" ? response.employee_detail.ROLES : '');
						var role2 = (response.employee_detail.ROLES_2 !== "" ? response.employee_detail.ROLES_2 : '');
						var role3 = (response.employee_detail.ROLES_3 !== "" ? response.employee_detail.ROLES_3 : '');
						var role4 = (response.employee_detail.ROLES_4 !== "" ? response.employee_detail.ROLES_4 : '');
						var role5 = (response.employee_detail.ROLES_5 !== "" ? response.employee_detail.ROLES_5 : '');
						console.log(role1);
						var rolex1, rolex2, rolex3, rolex4, rolex5 = '';
						switch(role1) {
							case 'ATASAN PENCIPTA':
								rolex1 = 'selected';
								break;
							case 'PENDISTRIBUSI':
								rolex2 = 'selected';
								break;
							case 'ADMIN DOKUMEN':
								rolex3 = 'selected';
								break;
							case 'PENCIPTA':
								rolex4 = 'selected';
								break;
							case 'ADMIN KONFIGURASI':
								rolex5 = 'selected';
								break;
						} 

						switch(role2) {
							case 'ATASAN PENCIPTA':
								rolex1 = 'selected';
								break;
							case 'PENDISTRIBUSI':
								rolex2 = 'selected';
								break;
							case 'ADMIN DOKUMEN':
								rolex3 = 'selected';
								break;
							case 'PENCIPTA':
								rolex4 = 'selected';
								break;
							case 'ADMIN KONFIGURASI':
								rolex5 = 'selected';
								break;
						} 

						switch(role3) {
							case 'ATASAN PENCIPTA':
								rolex1 = 'selected';
								break;
							case 'PENDISTRIBUSI':
								rolex2 = 'selected';
								break;
							case 'ADMIN DOKUMEN':
								rolex3 = 'selected';
								break;
							case 'PENCIPTA':
								rolex4 = 'selected';
								break;
							case 'ADMIN KONFIGURASI':
								rolex5 = 'selected';
								break;
						} 

						switch(role4) {
							case 'ATASAN PENCIPTA':
								rolex1 = 'selected';
								break;
							case 'PENDISTRIBUSI':
								rolex2 = 'selected';
								break;
							case 'ADMIN DOKUMEN':
								rolex3 = 'selected';
								break;
							case 'PENCIPTA':
								rolex4 = 'selected';
								break;
							case 'ADMIN KONFIGURASI':
								rolex5 = 'selected';
								break;
						} 

						switch(role5) {
							case 'ATASAN PENCIPTA':
								rolex1 = 'selected';
								break;
							case 'PENDISTRIBUSI':
								rolex2 = 'selected';
								break;
							case 'ADMIN DOKUMEN':
								rolex3 = 'selected';
								break;
							case 'PENCIPTA':
								rolex4 = 'selected';
								break;
							case 'ADMIN KONFIGURASI':
								rolex5 = 'selected';
								break;
						} 

						$("#role-edit").append('<option value="ATASAN PENCIPTA" '+rolex1+'>ATASAN PENCIPTA</option>');
						$("#role-edit").append('<option value="PENDISTRIBUSI" '+rolex2+'>PENDISTRIBUSI</option>');
						$("#role-edit").append('<option value="ADMIN DOKUMEN" '+rolex3+'>ADMIN DOKUMEN</option>');
						$("#role-edit").append('<option value="PENCIPTA" '+rolex4+'>PENCIPTA</option>');
						$("#role-edit").append('<option value="ADMIN KONFIGURASI" '+rolex5+'>ADMIN KONFIGURASI</option>');
						$("#role-edit").bootstrapDualListbox('refresh', true);
						$('#modal-edit').modal('show');
					}
			});
		}

		function getEmployee(dept,level) {
			$.ajax({
				url: '<?=base_url('C_setting_user/get_data_employee_by_dept_level')?>',
				type: 'POST', 
				data: {level: level, dept: dept},
				async: false,
				success: function(res){
					$('#full_name').find('option').remove().append('<option value="" selected>--SELECT--</option>');
					$('#full_name').append('<option value="" selected>--SELECT--</option>');
					response = $.parseJSON(res);
					$.each(response, function( index, value ) {
						$('#full_name').append('<option value="'+value.NIP+'">'+value.FULL_NAME+'</option>');
					});
				}
			});
		}

		jQuery(function($) {

			$('#full_name').change(function(){
				var id_key = document.getElementById("full_name");
				id_key = id_key.options[id_key.selectedIndex].value;

				if(id_key!=""){
					$.ajax({
						url: '<?=base_url('C_setting_user/get_data_employee')?>',
						type: 'POST', 
						data: {id_key: id_key},
						async: false,
						success: function(response){
							console.log('x', response);
							response = $.parseJSON(response);
								$('#nip').val(response.emp_nip);
								$('#user_name').val(response.USER_NAME);
								$('#job_level').val(response.JBLL_NAME);
								$('#departemen').val(response.DN_NAME);
						}
					});
				}
			});

			$("#combo-level,#combo-departemen").change(function(){
				var departemen = $("#combo-departemen").val();
				var level = $("#combo-level").val();
				getEmployee(departemen,level);
			});

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

			window.prettyPrint && prettyPrint();
			$('#id-check-horizontal').removeAttr('checked').on('click', function(){
				$('#dt-list-1').toggleClass('dl-horizontal').prev().html(this.checked ? '&lt;dl class="dl-horizontal"&gt;' : '&lt;dl&gt;');
			});

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
				var value = parseInt( $( this ).text(), 10 );
				$( this ).empty().slider({
					value: value,
					range: "min",
					animate: true
					
				});
			});
			
			$("#slider-eq > span.ui-slider-purple").slider('disable');
			
			$('#id-input-file-1 , #id-input-file-2').ace_file_input({
				no_file:'No File ...',
				btn_choose:'Choose',
				btn_change:'Change',
				droppable:false,
				onchange:null,
				thumbnail:false
			});
			
			$('#id-input-file-3').ace_file_input({
				style: 'well',
				btn_choose: 'Drop files here or click to choose',
				btn_change: null,
				no_icon: 'ace-icon fa fa-cloud-upload',
				droppable: true,
				thumbnail: 'small',
				preview_error : function(filename, error_code) {
				}
			
			}).on('change', function(){

			});
			
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
					
					whitelist_ext = null;
					whitelist_mime = null;
				}
				var file_input = $('#id-input-file-3');
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
					
				});
			
			});
			
			$('#spinner1').ace_spinner({value:0,min:0,max:200,step:10, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
			.closest('.ace-spinner')
			.on('changed.fu.spinbox', function(){

			}); 
			$('#spinner2').ace_spinner({value:0,min:0,max:10000,step:100, touch_spinner: true, icon_up:'ace-icon fa fa-caret-up bigger-110', icon_down:'ace-icon fa fa-caret-down bigger-110'});
			$('#spinner3').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
			$('#spinner4').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus', icon_down:'ace-icon fa fa-minus', btn_up_class:'btn-purple' , btn_down_class:'btn-purple'});
			
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			})
			.next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			
			$('.input-daterange').datepicker({autoclose:true});
			
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
			
			var tag_input = $('#form-field-tags');
			try{
				tag_input.tag(
				  {
					placeholder:tag_input.attr('placeholder'),
					//enable typeahead by specifying the source array
					source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
					/**
					//or fetch data from database, fetch those that match "query"
					source: function(query, process) {
					  $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
					  .done(function(result_items){
						process(result_items);
					  });
					}
					*/
				  }
				)
			
				//programmatically add/remove a tag
				var $tag_obj = $('#form-field-tags').data('tag');
				$tag_obj.add('Programmatically Added');
				
				var index = $tag_obj.inValues('some tag');
				$tag_obj.remove(index);
			}
			catch(e) {
				//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
				tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
				//autosize($('#form-field-tags'));
			}
			
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
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//initiate dataTables plugin
			var myTable = $('#dynamic-table')
			//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
			.DataTable( {
				bAutoWidth: false,
				//PLEASE CHECK columns TABLE!!!				
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
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			var demo2 = $('select[name="role[]"]').bootstrapDualListbox({
				infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>',
				moveOnSelect: false
			});
			var container2 = demo2.bootstrapDualListbox('getContainer');
			container2.find('.btn').addClass('btn-white btn-info btn-bold');
			container2.find('.move').html('Move');
			container2.find('.remove').html('Remove');
			container2.find('.moveall').html('All');
			container2.find('.removeall').html('All');
			
			/**var setRatingColors = function() {
				$(this).find('.star-on-png,.star-half-png').addClass('orange2').removeClass('grey');
				$(this).find('.star-off-png').removeClass('orange2').addClass('grey');
			}*/
			$('.rating').raty({
				'cancel' : true,
				'half': true,
				'starType' : 'i'
				/**,
				
				'click': function() {
					setRatingColors.call(this);
				},
				'mouseover': function() {
					setRatingColors.call(this);
				},
				'mouseout': function() {
					setRatingColors.call(this);
				}*/
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
					$.each(strs, function(i, str) {
						if (substrRegex.test(str)) {
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
				$('select[name="duallistbox_demo1[]"]').bootstrapDualListbox('destroy');
				$('.rating').raty('destroy');
				$('.multiselect').multiselect('destroy');
			});
		});
	</script>