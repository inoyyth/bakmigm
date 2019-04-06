<div class="row">
	<div class="col-sm-12">
		<h3>Format Dokumen</h3>
	</div>
	<div class="col-sm-6">
		<form method="POST" action="<?= base_url('C_general_setting/update_format'); ?>">
			<div class="form-group">
				<label for="nama">Nama Template :</label>
				<input type="text" name="nama" id="nama" class="form-control" required readonly autocomplete="off">
			</div>
			<div class="form-group">
				<label for="variable">Nama Variable :</label>
				<input type="text" name="variable" id="variable" class="form-control" required autocomplete="off">
			</div>
			<div class="form-group">
				<label for="no">Nomor Dokumen :</label>
				<select name="no" id="no" class="form-control" required>
					<option value="">Pilih</option>
					<?php
					$is_continue = true;
					$get_no = $this->db->get_where('m_nomor', array('untuk' => 'email'))->result();
					if (empty($get_no)) {
						$is_continue = false;
					}else{
						foreach ($get_no as $key => $value) {
					?>
					<option value="<?= $value->Code; ?>"><?= $value->Nama; ?></option>
					<?php
						}
					}
					?>
					
				</select>
			</div>
			<div class="form-group">
				<label for="tipe">Tipe Dokumen :</label>
				<select name="tipe" id="tipe" class="form-control" required>
					<option value="">Pilih</option>
					<option value="A4">A4</option>
					<option value="Legal">Legal</option>
				</select>
			</div>
			<div class="form-group">
				<label for="subject">Subject :</label>
				<input type="text" name="subject" id="subject" class="form-control" required autocomplete="off">
			</div>
			<div class="form-group">
				<label for="body">Body Email :</label>
				<textarea name="body" id="body" class="form-control" cols="30" rows="10" required></textarea>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-sm btn-info" value="Simpan">
			</div>
		</form>
	</div>
	<div class="col-sm-6">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h4 class="panel-title">
					Template
				</h4>
			</div>
			<div class="list-group">
				<a href="#Receipt" class="list-group-item list-group-item-action">Mail Receipt</a>
				<a href="#Notification" class="list-group-item list-group-item-action">Mail Notification</a>
				<a href="#News" class="list-group-item list-group-item-action">Mail News</a>
				<a href="#Obselete" class="list-group-item list-group-item-action">Mail Obselete</a>
				<a href="#Archived" class="list-group-item list-group-item-action">Mail Archived</a>
			</div>
		</div>
	</div>
</div>

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
		CKEDITOR.replace('body');
		jQuery(function($) {

			$('a').click(function(){
				var href = $(this).attr('href');
				var id_key = href.substr(1);
				$.ajax({
					url: '<?=base_url('C_general_setting/get_format')?>',
					type: 'POST', 
					data: {id_key: id_key},
					async: false,
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						//Add Options
						$.each(response,function(index,data){
							$('#nama').val(data['nama']);
							$('#variable').val(data['variable']);
							$('#no').val(data['nomor']);
							$('#tipe').val(data['tipe']);
							$('#subject').val(data['subject']);
							CKEDITOR.instances['body'].setData(data['isi']);
						});
					}
				});
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

			$.ajax({
				type: "GET",
				url: "<?php echo base_url();?>C_notification/getNotification/<?php echo $this->session->userdata("session_bgm_edocument_id");?>/true/",             
				dataType: "html",   //expect html to be returned                
				success: function(response){
							$(".nofication-count").text(JSON.parse(response).length);
				}
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
	</script>