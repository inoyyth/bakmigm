<div class="page-content">
	<!------------------------------------------------------------------------------------------------->
	<!-- PAGE CONTENT BEGINS -->
	<!------------------------------------------------------------------------------------------------->
	<?php
	$get_sharelink = $this->M_general_setting->GET_SHARELINK();
	foreach ($get_sharelink as $get_sharelink) {
		$id = $get_sharelink->id;
		$time = $get_sharelink->time;
	}
	?>
	<div class="row">
		<div class="col-sm-12">
			<h3 align="center">Setting Sharelink Timeout</h3>
		</div>
		<div class="col-sm-6">
			<form method="POST" action="<?= base_url('C_general_setting/update_sharelink'); ?>">
				<input type="hidden" name="id" value="<?= $id; ?>">
				<label for="time">Sharing Timeout :</label>
				<div class="input-group">
					<input type="number" class="form-control" name="time" value="<?= $time; ?>">
					<span class="input-group-btn">
						<button class="btn btn-sm btn-default" type="submit">
							<i class="ace-icon fa fa-clock-o bigger-110"></i>
							Update
						</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<!------------------------------------------------------------------------------------------------->
	<!-- PAGE CONTENT ENDS -->
	<!------------------------------------------------------------------------------------------------->
</div>