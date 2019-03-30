<style type="text/css">
    .greenop{
        background-color:#00ff00;
        font-weight: bold;
        color:#00ff00;
    }

    .redop{
        background-color:#ff0000;
        font-weight: bold;
        color:#ff0000;
    }
</style>
<div class="row">
	<div class="alert alert-info" style="margin-bottom:0px;">
		Setting Role Menu: <?php echo $role['RS_ID']; ?>
	</div>
    <form name="save-role" method="post" action="<?php echo base_url('role-menus/save');?>">
        <input type="hidden" name="RS_ID" value="<?php echo $role['RS_ID']; ?>"/>
        <table id="dynamic-table" class="table table-striped table-bordered table-hover" style="cursor:pointer">
            <thead>
                <tr>
                    <th>Parent</th>
                    <th>Menus</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>			
                <?php
                    $menu_exist = menu_unserialize_id($role['ROLE_MENUS']);
                    foreach($menus as $k=>$v){
                        $selected = "";
                        $class= "redop";
                        if ($menu_exist != NULL && in_array($v['menu']['id'], $menu_exist)) {
                            $selected = "selected";
                            $class = "greenop";
                        }
                ?>
                <tr>
                    <td><?php echo $v['parent']; ?></td>
                    <td><?php echo $v['menu']['name']; ?></td>
                    <td><?php echo ($v['menu']['type'] == 1 ? 'Side Menu' : 'Button');?></td>
                    <td id="td-<?php echo $k;?>" class="<?php echo $class;?>">
                        <input type="hidden" name="key[]" value="<?php echo $v['menu']['id'];?>">
                        <select name="value[]" id="select-<?php echo $k;?>" onchange="changeColor(<?php echo $k;?>)">
                            <option value="0">Disable</option>
                            <option value="1" <?php echo $selected;?>>Enable</option>
                        </select>
                    </td>
                </tr>
                <?php
                    }
                ?>
            </tbody>
        </table>
        <div class="alert alert-info" style="margin-bottom:0;">
            <button class="btn btn-warning" type="submit">Submit</button> 
		    <a class="btn btn-danger" href="<?php echo base_url('role-menus');?>">Back</a>
        </div>
    </form>
</div>
<script>
function changeColor(id) {
    var val = $("#select-"+id).val();
    if (val === "0") {
        console.log(val);
        $("#td-"+id).removeClass('greenop').addClass('redop');
    } else {
        $("#td-"+id).removeClass('redop').addClass('greenop');
    }
    
}

$(document).ready(function() {
    
});
</script>