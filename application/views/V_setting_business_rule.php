<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
		<div id="accordion" class="accordion-style1 panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_new_data">
							<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
							&nbsp;Setting&nbsp;>&nbsp;Document Expired Reminder
						</a>
					</h4>
				</div>
				<div class="panel-collapse collapse in" id="collapse_new_data">
					<div class="panel-body">
						<form class="form-horizontal" id="form_new_data" name="form_new_data" action="<?php echo base_url('C_setting_business_rule/store'); ?>" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-sm-2 control-label" style="text-align:left">Nama Jadwal</label>
								<div class="col-sm-10">
									<input type="text" name="rule_name" value="<?php echo $rule->rule_name;?>" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" style="text-align:left">Berdasarkan Kolom</label>
								<div class="col-sm-9">
									<div class="col-sm-6">
										<select name="rule_column" class="form-control" required>
											<?php foreach ($this->config->item('rule_column') as $kColumn=>$vColumn) { ?>
												<option value="<?php echo $vColumn; ?>" <?php echo $rule->rule_column == $vColumn ? 'selected' : '';?>><?php echo $vColumn; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="text-align:left">Sebelum</label>
								<div class="col-sm-3">
									<select name="time_before" class="form-control" required>
										<?php foreach ($this->config->item('rule_time') as $k_before=>$v_before) { ?>
											<option value="<?php echo $k_before; ?>" <?php echo $rule->time_before == $k_before ? 'selected' : '';?>><?php echo $v_before; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="text-align:left">Sesudah</label>
								<div class="col-sm-3">
									<select name="time_after" class="form-control" required>
										<?php foreach ($this->config->item('rule_time') as $k_after=>$v_after) { ?>
											<option value="<?php echo $k_after; ?>" <?php echo $rule->time_after == $k_after ? 'selected' : '';?>><?php echo $v_after; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="text-align:left">Days</label>
								<div class="col-sm-9">
								<?php 
									foreach ($this->config->item('id_days') as $k_day=>$v_day) {
										$check = ''; 
										if (in_array($k_day, explode('|', $rule->days))) {
											$check = 'checked';
										}
									?>
									<input style="margin-left: 10px;" type="checkbox" name="days[]" value="<?php echo $k_day;?>" <?php echo $check;?>><label><?php echo $v_day;?></label>
								<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="text-align:left">Efektif</label>
								<div class="col-sm-3">
									<input type="text" name="efektif_date" value="<?php echo date("d-m-Y", strtotime($rule->efektif_date));?>" class="form-control date-picker" required>
								</div>
							</div>
							<button type="submit" id="btn_new" name="btn_new" class="ace-icon fa fa-save btn btn-success btn-sm"> SAVE</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-2 col-xl-2"></div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-2 col-xl-2"></div>
</div>

<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div id="accordion" class="accordion-style1 panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_new_data">
							<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
							&nbsp;Setting&nbsp;>&nbsp;Document Activity Notification
						</a>
					</h4>
				</div>
				<div class="panel-collapse collapse in" id="collapse_new_data">
					<div class="panel-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Role</th>
									<th>Menunggu</th>
									<th>Diperbaharui</th>
									<th>Dipublikasi</th>
									<th>Kadaluarsa</th>
									<th>Diarsip</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($document_activity as $activity) { ?>
								<tr>
									<td><?php echo $activity->role;?></td>
									<td><input type="checkbox" disabled <?php echo $activity->waiting_activity == 1 ? 'checked' : '';?>></td>
									<td><input type="checkbox" disabled <?php echo $activity->renewal_activity == 1 ? 'checked' : '';?>></td>
									<td><input type="checkbox" disabled <?php echo $activity->publish_activity == 1 ? 'checked' : '';?>></td>
									<td><input type="checkbox" disabled <?php echo $activity->expired_activity == 1 ? 'checked' : '';?>></td>
									<td><input type="checkbox" disabled <?php echo $activity->archive_activity == 1 ? 'checked' : '';?>></td>
									<td><button class="btn btn-warning btn-sm" onclick="update_role(<?php echo $activity->id;?>);">Update</button></td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
		<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Role Activity Setting</h4>
      </div>
			<form method="post" action="<?php echo base_url('C_setting_business_rule/store_activity');?>">
      <div class="modal-body">
				<div class="form-group">
					<label>Role</label>
					<input type="hidden" name="id" id="id">
					<input class="form-control" type="text" name="role" readonly id="role">
				</div>
				<div class="form-group">
					<input style="margin-left: 10px;" type="checkbox" name="waiting_activity" id="waiting_activity" value="1"><label>Menunggu</label>
					<input style="margin-left: 10px;" type="checkbox" name="renewal_activity" id="renewal_activity" value="1"><label>Diperbaharui</label>
					<input style="margin-left: 10px;" type="checkbox" name="publish_activity" id="publish_activity" value="1"><label>Dipublish</label>
					<input style="margin-left: 10px;" type="checkbox" name="expired_activity" id="expired_activity" value="1"><label>Expired</label>
					<input style="margin-left: 10px;" type="checkbox" name="archive_activity" id="archive_activity" value="1"><label>Archive</label>
				</div>
			</div>
			<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update</button>
      </div>
			</form>
    </div>
  </div>
</div>

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
		function update_role(id) {
			$.ajax({
        type: "GET",
        url: "<?php echo base_url('C_setting_business_rule/getRoleActivity');?>",     
				data: {id: id},        
        dataType: "json",   //expect html to be returned                
        success: function(response){
					
        }
			})
			.done(function(response) {
				$("#id").val(response.id);
				$("#role").val(response.role);
				if (response.waiting_activity == 1) {
					$('#waiting_activity').prop('checked', true);
				}
				if (response.renewal_activity == 1) {
					$('#renewal_activity').prop('checked', true);
				}
				if (response.publish_activity == 1) {
					$('#publish_activity').prop('checked', true);
				}
				if (response.expired_activity == 1) {
					$('#expired_activity').prop('checked', true);
				}
				if (response.archive_activity == 1) {
					$('#archive_activity').prop('checked', true);
				}
				$('#myModal').modal('show');
			});
		}
		$(function($) {
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true,
				format: 'dd-mm-yyyy'
			})
		});
	</script>