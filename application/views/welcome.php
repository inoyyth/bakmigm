<div class="row">
	<div class="col-sm-3">
		<?php
		$get_icon = $this->M_general_setting->GET_ICON();
		foreach ($get_icon as $get_icon) {
			$id = $get_icon->id;
			$icon = $get_icon->logo;
			$text = $get_icon->text;
		}
		?>
		<img src="<?= base_url('template/icon/').$icon; ?>" alt="" class="img-responsive">
	</div>
	<div class="col-sm-9" style="text-align:justify;">
		<p style="font-size:15px;">
		<?= $text; ?>
		</p>
	</div>
</div>

<script src="<?= base_url('template/ckeditor/ckeditor.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/ace-elements.min.js'); ?>"></script>
<script src="<?php echo base_url('template/backend/assets/js/ace.min.js'); ?>"></script>
<!-- <script>
	$(document).ready(function() {
		CKEDITOR.replace('editor1');
		$('#id-input-file-3').ace_file_input({
			style: 'well',
			btn_choose: 'Drop image here or click to choose',
			btn_change: null,
			no_icon: 'ace-icon fa fa-cloud-upload',
			droppable: true,
			thumbnail: 'small',
		});
	});
</script> -->