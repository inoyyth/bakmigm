<div class="row">
	<div class="alert alert-info" style="margin-bottom:0px;">
		Role Menus
	</div>
	<table id="dynamic-table" class="table table-striped table-bordered table-hover" style="cursor:pointer">
		<thead>
			<tr>
				<th>No</th>
				<th>Role</th>
				<th>Access Menus</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>			
			<?php
				foreach($roles as $k=>$v){
			?>
			<tr>
				<td><?= $k+1; ?></td>
				<td><?php echo $v['RS_ID']; ?></td>
				<td><?php echo menu_unserialize($v['ROLE_MENUS']); ?></td>
				<td><a href="<?php echo base_url('role-menus/update/' . str_replace(' ', '_',$v['RS_ID']));?>" class="btn btn-warning btn-sm">Edit</a></td>
			</tr>
			<?php
                }
			?>
		</tbody>
	</table>
</div>