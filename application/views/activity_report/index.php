<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div id="accordion" class="accordion-style1 panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_new_data">
							<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
							Aktivitas Penggunaan
						</a>
					</h4>
				</div>
				<div class="panel-collapse collapse in" id="collapse_new_data">
					<div class="panel-body">
                    <form name="activity_pengguna_form" id="activity_pengguna_form" method="get" action="<?php echo base_url('C_activity_report/activity_excel');?>">
                        <div class="row">
                            <div class="form-group">
                                <label for="si_template_new_kategori" class="col-sm-3 control-label" style="text-align:left">Kategori Dokumen*</label>
                                <div class="col-sm-5">
                                    <input type="hidden" name="watermark" id="watermark">
                                    <select id="si_template_new_kategori" name="kategori_dokumen" class="form-control" />
                                        <option value="">Pilih</option>
                                        <?php
                                        $is_continue = true;
                                        $get_data_ext = $this->M_library_database->DB_GET_DATA_DOCUMENT_STRUCTURE_KATEGORI_EVO();
                                        if(empty($get_data_ext)||$get_data_ext==""){
                                            $is_continue = false;
                                        }
                                        if($is_continue){
                                            foreach($get_data_ext as $data_row_ext){
                                        ?>
                                        <option value="<?php echo $data_row_ext->DTSEKI_ID; ?>"><?php echo $data_row_ext->DTSEKI_KATEGORI; ?></option>
                                        <?php
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                                <span id="req_kategori" class="text-danger hide">Harap Isi Kategori Dokumen!</span>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="form-group">
                                <label for="si_template_new_jenis" class="col-sm-3 control-label" style="text-align:left">Jenis Dokumen*</label>
                                <div class="col-sm-5">
                                    <select id="si_template_new_jenis" name="jenis_dokumen" class="form-control" />
                                        <option value="">Pilih</option>
                                    </select>
                                </div>
                                <span id="req_jenis" class="text-danger hide">Harap Isi Jenis Dokumen!</span>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="form-group">
                                <label for="si_template_new_tipe" class="col-sm-3 control-label" style="text-align:left">Tipe Dokumen*</label>
                                <div class="col-sm-5">
                                    <select id="si_template_new_tipe" name="tipe_dokumen" class="form-control" />
                                        <option value="">Pilih</option>
                                        <?php
                                        $is_continue = true;
                                        $get_data_ext = $this->M_library_database->DB_GET_DATA_DOCUMENT_STRUCTURE_TIPE_ALL();
                                        if(empty($get_data_ext)||$get_data_ext==""){
                                            $is_continue = false;
                                        }
                                        if($is_continue){
                                            foreach($get_data_ext as $data_row_ext){
                                        ?>
                                        <option value="<?php echo $data_row_ext->DTSETE_ID; ?>"><?php echo $data_row_ext->DTSETE_TIPE; ?></option>
                                        <?php
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                                <span id="req_tipe" class="text-danger hide">Harap Isi Tipe Dokumen!</span>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="form-group">
                                <label for="si_template_new_group_proses" class="col-sm-3 control-label" style="text-align:left">Group Proses (5M)</label>
                                <div class="col-sm-5">
                                    <select id="si_template_new_group_proses" name="group_prosess" class="form-control">
                                        <option value="">Pilih</option>
                                        <?php
                                        $is_continue = true;
                                        $get_group = $this->db->get('m_group')->result();
                                        if (empty($get_group)):
                                            $is_continue = false;
                                        else:
                                            foreach ($get_group as $key => $v):
                                        ?>
                                        <option value="<?= $v->GROUP_NAME; ?>"><?= $v->GROUP_NAME; ?></option>
                                        <?php
                                                endforeach;
                                            endif;
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="form-group">
                                <label for="si_template_new_proses" class="col-sm-3 control-label" style="text-align:left">Proses</label>
                                <div class="col-sm-5">
                                    <select id="si_template_new_proses" name="proses" class="form-control">
                                        <option value="">Pilih</option>
                                        <!-- <option value="PROSES">PROSES</option> -->
                                        <?php
                                        $is_continue = true;
                                        $get_proses = $this->db->get('m_proses')->result();
                                        if (empty($get_proses)):
                                            $is_continue = false;
                                        else:
                                            foreach ($get_proses as $key => $v):
                                        ?>
                                        <option value="<?= $v->PROSES_NAME; ?>"><?= $v->PROSES_NAME; ?></option>
                                        <?php
                                                endforeach;
                                            endif;
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="form-group">
                                <label for="si_template_new_proses" class="col-sm-3 control-label" style="text-align:left">Nama Dokumen</label>
                                <div class="col-sm-5">
                                    <select class="nama_dokumen" name="nama_dokumen" style="width: 400px;"></select>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div>
                        <button type="button" class="btn btn-warning" id="btn-cari-activity">Cari</button>	
						<button type="submit" class="btn btn-success" id="btn-export-activity">Export</button>	
                        </div>
                    </form>
                    <div id="content_aktivity" class="class_content_report" style="display: none;">
						<table id="table_aktivity" class="table table-striped table_content">
			
						</table>
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script>
 $(document).ready(function () {
    //si_template_new_kategori Change
    $('#si_template_new_kategori').change(function(){
        var id_key = document.getElementById("si_template_new_kategori");
        id_key = id_key.options[id_key.selectedIndex].value;
        
        //AJAX Request
        $.ajax({
            url: '<?=base_url('C_contribution/get_data_document_structure_jenis')?>',
            type: 'POST', 
            data: {id_key: id_key},
            success: function(response){
                //Parsing Json
                response = $.parseJSON(response);
                
                //Remove Options 
                $('#si_template_new_jenis').find('option').not(':first').remove();
                $('#si_template_new_tipe').find('option').not(':first').remove();
                
                //Add Options
                $.each(response,function(index,data){
                    $('#si_template_new_jenis').append('<option value="'+data['DTSEJS_ID']+'">'+data['DTSEJS_JENIS']+'</option>');
                });
            }
        });
    });
		
    //si_template_new_jenis Change
    $('#si_template_new_jenis').change(function(){
        var id_key = document.getElementById("si_template_new_jenis");
        id_key = id_key.options[id_key.selectedIndex].value;
        
        //AJAX Request
        $.ajax({
            url: '<?=base_url('C_contribution/get_data_document_structure_tipe')?>',
            type: 'POST', 
            data: {id_key: id_key},
            success: function(response){
                //Parsing Json
                response = $.parseJSON(response);
                
                //Remove Options 
                $('#si_template_new_tipe').find('option').not(':first').remove();
                
                //Add Options
                $.each(response,function(index,data){
                    $('#si_template_new_tipe').append('<option value="'+data['DTSETE_ID']+'">'+data['DTSETE_TIPE']+'</option>');
                });
            }
        });
    });
    var form=$("#activity_pengguna_form");
    $('.nama_dokumen').select2({
        ajax: {
            url: "<?php echo base_url('C_activity_report/filterDocumentName');?>",
            dataType: "json",
            type: "get",
            allowClear: true,
            data: function (params) {
                return {
                    search: params.term,
                    kategori: $("#si_template_new_kategori").val(),
                    jenis: $("#si_template_new_jenis").val(),
                    tipe: $("#si_template_new_tipe").val(),
                    group: $("#si_template_new_group_proses").val(),
                    proses: $("#si_template_new_proses").val()  
                }
            },
            processResults: function (data) {
                // Transforms the top-level key of the response object from 'items' to 'results'
                return {
                    results: data.results
                };
            }
        }
    });

    $("#btn-cari-activity").click(function() {
        show_table_activity();
    });
 });

 function show_table_activity() {
    $('#table_aktivity').remove();
    $("#content_aktivity").html('<table id="table_aktivity" class="table table-striped">').show();
    $('#table_aktivity').DataTable({
        processing: false, //Feature control the processing indicator.
        serverSide: true, //Feature control DataTables' server-side processing mode.
        bPaginate: false,
        searching: false,
        responsive: true,
        columnDefs: [
            { title: "No", targets: 0, visible: false	 },
            { title: "Nama", targets: 1 },
            { title: "Tanggal/Jam Akses", targets: 2 },
            { title: "Keterangan (Lihat/Unduh)", targets: 3 }
        ],
        columns: [
            { data: 'DOC_ID' },
            { data: 'FULL_NAME' },
            { data: 'DATE' },
            { data: 'ACTIVITY' },
        ],
        drawCallback: function (settings) {
            var api = this.api();
            var rows = api.rows({ page: 'current' }).nodes();
            var last = null;

            api.column(0, { page: 'current' }).data().each(function (group, i) {

                if (last !== group) {

                    $(rows).eq(i).before(
                        '<tr class="group"><td colspan="8" style="BACKGROUND-COLOR:rgb(237, 208, 0);font-weight:700;color:#006232;">' + 'Document: ' + group + '</td></tr>'
                    );

                    last = group;
                }
            });
        },
        ajax: {
            url: '<?php echo base_url('C_activity_report/activityReportDataTable');?>',
            type: 'GET',
            data: {
                doc_id: $(".nama_dokumen").val(),
                kategori: $("#si_template_new_kategori").val(),
                jenis: $("#si_template_new_jenis").val(),
                tipe: $("#si_template_new_tipe").val(),
                group: $("#si_template_new_group_proses").val(),
                proses: $("#si_template_new_proses").val()  
            }
        }
    });
}
</script>