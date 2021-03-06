<style>
	.datepicker {
		z-index: 9999;
	}
</style>
<div class="row">
	<div class="widget-box">
		<div class="widget-header widget-header-blue widget-header-flat">
			<h4 class="smaller" style="font-weight: bold;">Registrasi Dokumen</h4>
		</div>
		<div class="widget-body">
			<div class="widget-main">
				<form action="<?php echo base_url('C_contribution/insert'); ?>" method="POST" id="contribusi_form" enctype="multipart/form-data">
					<div id="atr_doc">
						<p id="1" style="font-size:2.3rem;font-weight:bold;color:#669FC7;">1 Of 5</p>
						<h4>Atribut Dokumen</h4>
						<hr/>
						<div class="row">
							<div class="form-group">
								<label for="si_template_default_name" class="col-sm-3 control-label" style="text-align:left">Daftar Template</label>
								<div class="col-sm-5">
									<select id="si_template_default_name" name="si_template_default_name" class="form-control">
										<option value="">Pilih</option>
										<?php
											$is_continue = true;
											$get_data_ext = $this->M_library_database->DB_GET_DATA_DOCUMENT_TEMPLATE_EVO($this->session->userdata("session_bgm_edocument_id"));
											if(empty($get_data_ext)||$get_data_ext==""){
												$is_continue = false;
											}
											if($is_continue){
												foreach($get_data_ext as $data_row_ext){
											?>
											<option value="<?php echo $data_row_ext->DOCTEMP_ID; ?>"><?php echo $data_row_ext->DOCTEMP_NAME; ?></option>
											<?php
												}
											}
										?>
									</select>
								</div>
							</div>
						</div>
						<div class="row"><br/>
							<div id="accordion" class="panel-group col-sm-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h5>Template Baru</h5>
									</div>
									<div class="panel-collapse" id="collapse_new_template">
										<div class="panel-body">
											<div class="row">
												<div class="form-group">
													<label for="si_template_new_kategori" class="col-sm-3 control-label" style="text-align:left">Kategori Dokumen*</label>
													<div class="col-sm-5">
														<input type="hidden" name="watermark" id="watermark">
														<select id="si_template_new_kategori" name="si_template_new_kategori" class="form-control" />
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
														<select id="si_template_new_jenis" name="si_template_new_jenis" class="form-control" />
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
														<select id="si_template_new_tipe" name="si_template_new_tipe" class="form-control" />
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
														<select id="si_template_new_group_proses" name="si_template_new_group_proses" class="form-control">
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
														<select id="si_template_new_proses" name="si_template_new_proses" class="form-control">
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
										</div><!-- panelbody -->
									</div><!-- panel-collapse -->
								</div><!-- panel-default --><br/>
								<div class="form-group container">
									<button class="btn btn-info" disabled>Prev</button>
									<button class="btn btn-warning" id="btn_atr_doc">Next</button>
								</div>
							</div><!-- accordion -->
						</div><!-- Row -->
					</div><!-- Atr_Doc -->
					<div id="jud_doc" class="hide">
						<p style="font-size:2.3rem;font-weight:bold;color:#669FC7;" id="2">2 Of 5</p>
						<h4>Judul Dokumen</h4>
						<hr/>
						<div class="row container">
							<div class="form-group">
								<div class="row">
									<label for="si_header_no" class="col-sm-3 control-label" style="text-align:left">Nomor Dokumen*</label>
									<div class="col-sm-5">
										<input type="text" id="si_header_no" name="si_header_no" maxlength="40" class="form-control" />
										<span>Harap nomor sesuai yg tertera di hardcopy</span>
									</div>
									<span id="req_nomor" class="text-danger hide">Harap Isi Nomor Dokumen!</span>
									<span id="no_result"></span>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<label for="si_header_name" class="col-sm-3 control-label" style="text-align:left">Nama Dokumen*</label>
									<div class="col-sm-5">
										<input type="text" id="si_header_name" name="si_header_name" maxlength="100" class="form-control" />
									</div>
									<span id="req_nama" class="text-danger hide">Harap Isi Nama Dokumen!</span>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<label for="si_header_master" class="col-sm-3 control-label" style="text-align:left">Wujud Dokumen Master*</label>
									<div class="col-sm-5">
										<select id="si_header_master" name="si_header_master" class="form-control">
											<option value="">Pilih</option>
											<?php
											$is_continue = true;
											$get_data_ext = $this->M_library_database->DB_GET_DOCUMENT_FORM_EVO();
											if(empty($get_data_ext)||$get_data_ext==""){
											$is_continue = false;
											}
											if($is_continue){
											foreach($get_data_ext as $data_row_ext){
											?>
											<option value="<?php echo $data_row_ext->DTFM_ID; ?>"><?php echo $data_row_ext->DTFM_NAME; ?></option>
											<?php
											}
											}
											?>
										</select>
									</div>
									<span id="req_wujud" class="text-danger hide">Harap Isi Wujud Dokumen!</span>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<label for="si_header_distribution" class="col-sm-3 control-label" style="text-align:left">Metode Distribusi*</label>
									<div class="col-sm-5">
										<select id="si_header_distribution" name="si_header_distribution" class="form-control" />
											<option value="">Pilih</option>
											<?php
											$is_continue = true;
											$get_data_ext = $this->M_library_database->DB_GET_DISTRIBUTION_METHOD_EVO();
											if(empty($get_data_ext)||$get_data_ext==""){
											$is_continue = false;
											}
											if($is_continue){
											foreach($get_data_ext as $data_row_ext){
											?>
											<option value="<?php echo $data_row_ext->DNMD_ID; ?>"><?php echo $data_row_ext->DNMD_NAME; ?></option>
											<?php
											}
											}
											?>
										</select>
									</div>
									<span id="req_distribusi" class="text-danger hide">Harap Isi Distribusi Dokumen!</span>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<label for="si_header_confidential" class="col-sm-3 control-label" style="text-align:left">Standard Kerahasiaan*</label>
									<div class="col-sm-5">
										<select id="si_header_confidential" name="si_header_confidential" class="form-control" />
										<option value="">Pilih</option>
											<?php
											$is_continue = true;
											$get_data_ext = $this->M_library_database->DB_GET_CONFIDENTIAL_EVO();
											if(empty($get_data_ext)||$get_data_ext==""){
											$is_continue = false;
											}
											if($is_continue){
											foreach($get_data_ext as $data_row_ext){
											?>
											<option id="<?php echo $data_row_ext->CL_ID; ?>" value="<?php echo $data_row_ext->CL_ID; ?>"><?php echo $data_row_ext->CL_NAME; ?></option>
											<?php
											}
											}
											?>
										</select>
									</div>
									<span id="req_rahasia" class="text-danger hide">Harap Isi Standar Kerahasian Dokumen!</span>
								</div>
							</div>
							<div class="form-group container">
								<button class="btn btn-info" id="btn_jud_doc_prev">Prev</button>
								<button class="btn btn-warning" id="btn_jud_doc">Next</button>
							</div>
						</div>
					</div><!-- Jud_doc -->

					<div id="kepemilikan_doc" class="hide">
						<p style="font-size:2.3rem;font-weight:bold;color:#669FC7;" id="3">3 Of 5</p>
						<h4>Kepemilikan Dokumen <span class="sub-title"></span></h4> 
						<hr/>
						<div class="row container">
							<div class="form-group row">
								<label for="duallistbox_akses_level" class="col-sm-3 control-label" style="text-align:left">Akses Level*</label>
								<div class="col-sm-7">
									<select id="duallistbox_akses_level" multiple="multiple" size="5" name="duallistbox_akses_level[]" />
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="duallistbox_pengguna_dokumen" class="col-sm-3 control-label" style="text-align:left">Pengguna Dokumen*</label>
								<div class="col-sm-7">
									<select id="duallistbox_pengguna_dokumen" multiple="multiple" size="5" name="duallistbox_pengguna_dokumen[]" />
									<!-- <?php
									$is_continue = true;
									$get_data_ext = $this->M_library_database->DB_GET_DATA_DEPARTEMENT_ARRAY($this->session->userdata("session_bgm_edocument_departement_id"));
									if(empty($get_data_ext)||$get_data_ext==""){
									$is_continue = false;
									}
									if($is_continue){
									?>
									<option selected value="<?= $this->session->userdata("session_bgm_edocument_departement_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_departement_code"); ?> (<?= $this->session->userdata("session_bgm_edocument_departement_name"); ?>)</option>
									<?php
									foreach($get_data_ext as $data_row_ext){
									?>
									<option value="<?php echo $data_row_ext->DN_ID; ?>"><?php echo $data_row_ext->DN_CODE; ?> (<?php echo $data_row_ext->DN_NAME; ?>)</option>
									<?php
									}
									}
									?> -->
									</select>
								</div>
							</div><br/>

							<div class="form-group">
								<div class="row">
									<label for="si_owner_pemilik_proses" class="col-sm-3 control-label" style="text-align:left">Dept Pemilik Proses*</label>
									<div class="col-sm-5">
										<select id="si_owner_pemilik_proses" name="si_owner_pemilik_proses" class="form-control" />
											<option value="">Pilih</option>
											<option value="<?php echo $this->session->userdata("session_bgm_edocument_divisi_id"); ?>"><?php echo $this->session->userdata("session_bgm_edocument_divisi_name"); ?></option>
											<option value="<?php echo $this->session->userdata("session_bgm_edocument_departement_id"); ?>" selected><?php echo $this->session->userdata("session_bgm_edocument_departement_name"); ?></option>
										</select>
									</div>
									<span id="req_proses" class="text-danger hide">Harap Isi Departemen Pemilik Proses Dokumen!</span>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<label for="si_owner_dept_penyimpan" class="col-sm-3 control-label" style="text-align:left">Dept Penyimpan*</label>
									<div class="col-sm-5">
										<select id="si_owner_dept_penyimpan" name="si_owner_dept_penyimpan" class="form-control" />
											<option value="">Pilih</option>
											<!-- <option value="7550">BPI</option> -->
											<option value="<?php echo $this->session->userdata("session_bgm_edocument_divisi_id"); ?>"><?php echo $this->session->userdata("session_bgm_edocument_divisi_name"); ?></option>
											<option value="<?php echo $this->session->userdata("session_bgm_edocument_departement_id"); ?>"><?php echo $this->session->userdata("session_bgm_edocument_departement_name"); ?></option>
										</select>
									</div>
									<span id="req_penyimpan" class="text-danger hide">Harap Isi Departemen Penyimpan Dokumen!</span>
								</div>
							</div>

							<div class="form-group row">
								<label for="si_owner_dept_pendistribusi" class="col-sm-3 control-label" style="text-align:left">Dept Pendistribusi*</label>
								<div class="col-sm-5">
									<select id="si_owner_dept_pendistribusi" name="si_owner_dept_pendistribusi" class="form-control" />

									</select>
								</div>
								<span id="req_distribusi_dept" class="text-danger hide">Harap Isi Departemen Pendistribusi Dokumen!</span>
							</div>

							<div class="form-group container">
								<button class="btn btn-info" id="btn_kepemilikan_doc_prev">Prev</button>
								<button class="btn btn-warning" id="btn_kepemilikan_doc">Next</button>
							</div>

						</div>
					</div><!-- Kepemilikan -->

					<div id="sejarah_doc" class="hide">
						<p style="font-size:2.3rem;font-weight:bold;color:#669FC7;" id="4">4 Of 5</p>
						<h4 class="smaller">Sejarah Dokumen <span class="sub-title"></span></h4>
						<hr/>
						<div class="row container">
							<div class="form-group row">
								<label for="si_history_version" class="col-sm-3 control-label" style="text-align:left">Versi*</label>
								<div class="col-sm-1">
									<input type="number" id="si_history_version" name="si_history_version" placeholder="1.0" min="0" pattern="/^-?\d+\.?\d*$/-" onKeyPress="if(this.value.length==5) return false;" class="form-control" value="1.0" />
								</div>
								<span id="req_versi" class="text-danger hide">Harap Isi Versi Dokumen!</span>
							</div>

							<div class="form-group row">
								<label for="si_history_date" class="col-sm-3 control-label" style="text-align:left">Tanggal Efektif Berlaku*</label>
								<div class="col-sm-6">
									<div class="input-group">
										<input class="form-control date-picker" id="si_history_date" name="si_history_date" type="text" />
										<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
										</span>
										<input class="form-control" id="si_history_date2" name="si_history_date2" type="text" readonly />
									</div>
								</div>
								<span id="req_tgl_efektif" class="text-danger hide">Harap Isi Tanggal Efektif Berlaku Dokumen!</span>
							</div>

							<div class="form-group row">
								<label for="si_history_period" class="col-sm-3 control-label" style="text-align:left">Periode Review*</label>
								<div class="col-sm-3">
									<select id="si_history_period" name="si_history_period" class="form-control" />
									<option value="">Pilih</option>
									<?php
									$is_continue = true;
									$get_data_ext = $this->M_library_database->DB_GET_DATA_PERIODE_PREVIEW_EVO();
									if(empty($get_data_ext)||$get_data_ext==""){
									$is_continue = false;
									}
									if($is_continue){
									foreach($get_data_ext as $data_row_ext){
									?>
									<option value="<?php echo $data_row_ext->PEPW_ID; ?>"><?php echo $data_row_ext->PEPW_ID; ?> BULAN</option>
									<?php
									}
									}
									?>
									</select>
								</div>
								<div class="col-sm-3">
									<div class="input-group">
										<input type="text" class="form-control" id="si_history_date_final" name="si_history_date_final" readonly>
										<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
										</span>
									</div>
								</div>
								<span id="req_tgl_periode" class="text-danger hide">Harap Isi Periode Review Dokumen!</span>
							</div>

							<div class="form-group row">
								<label for="si_history_keyword" class="col-sm-3 control-label" style="text-align:left">Kata Kunci*</label>
								<div class="col-sm-5">
									<input type="text" id="si_history_keyword" name="si_history_keyword" maxlength="200" class="form-control" />
								</div>
								<span id="req_keyword" class="text-danger hide">Harap Isi Kata Kunci Dokumen!</span>
							</div>

							<div class="form-group row">
								<label for="si_history_abstract" class="col-sm-3 control-label" style="text-align:left">Abstrak (Max. 400 Karakter)*</label>
								<div class="col-sm-5">
									<textarea type="text" id="si_history_abstract" name="si_history_abstract" rows="3" maxlength="400" class="form-control" style="resize:none"></textarea>
								</div>
								<span id="req_abstrak" class="text-danger hide">Harap Isi Abstrak Dokumen!</span>
							</div>

							<div class="form-group container">
								<button class="btn btn-info" id="btn_sejarah_doc_prev">Prev</button>
								<button class="btn btn-warning" id="btn_sejarah_doc">Next</button>
							</div>
						</div>
					</div><!-- Sejarah Dokumen -->
					<div id="terkait_doc" class="hide">
						<p style="font-size:2.3rem;font-weight:bold;color:#669FC7;" id="5">5 Of 5</p>
						<h4 class="smaller">Dokumen Terkait <span class="sub-title"></span></h4>
						<hr/>
						<div class="row container">
							<div class="form-group row">
								<label for="duallistbox_dokumen_terkait" class="col-sm-10 control-label" style="text-align:left">Dokumen Terkait</label>
								<div class="col-sm-10">
									<select id="duallistbox_dokumen_terkait" multiple="multiple" size="5" name="duallistbox_dokumen_terkait[]" />
										<?php
										$is_continue = true;
										//$DOC_ID,$DOC_NOMOR,$DOC_NAMA,$DOC_MAKER,$DOC_APPROVE,$DOC_STATUS
										$get_data_ext = $this->M_contribution->GET_DOKUMEN_ARRAY($this->session->userdata("session_bgm_edocument_departement_id"),$this->session->userdata("session_bgm_edocument_job_level_id"));
										if(empty($get_data_ext)||$get_data_ext==""){
										$is_continue = false;
										}
										if($is_continue){
										foreach($get_data_ext as $data_row_ext){
										?>
										<option value="<?php echo $data_row_ext->DOC_ID; ?>"><?php echo $data_row_ext->DOC_NAMA; ?></option>
										<?php
										}
										}else{
										?>
										<option value="" disabled>Belum Ada Dokumen</option>
										<?php
										}
										?>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="si_template_new_name" class="col-sm-10 control-label" style="text-align:left">Apakah Ingin Disimpan Sebagai Template</label>
								<div class="col-sm-10">
									<a id="btn_modal" data-toggle="modal" data-target="#modal-save-template" class="ace-icon fa fa-save btn btn-sm btn-info" data-popup="tooltip" data-placement="top" title="Simpan Sebagai Template"></a>
									<input type="hidden" id="si_template_new_name" name="si_template_new_name" maxlength="100" class="form-control">
								</div>
							</div>

							<div class="row">
								<div class="col-sm-10">
									<input type="hidden" id="si_userid" name="si_userid" value="<?php echo $this->session->userdata("session_bgm_edocument_id"); ?>" class="form-control">
									<input type="hidden" id="si_code" name="si_code" value="<?php echo $this->M_library_module->GENERATOR_REFF(); ?>" class="form-control">
								</div>
							</div>

							<div class="form-group container">
								<button class="btn btn-info" id="btn_terkait_doc_prev">Prev</button>
								<button class="btn btn-warning hide" id="btn_terkait_doc">Next</button>
								<button type="submit" class="btn btn-warning" id="btn_terkait_doc_finish">Finish</button>
							</div>
						</div>
					</div><!-- Dokumen Terkait -->
					<div id="unggah_doc" class="hide">
						<p style="font-size:2.3rem;font-weight:bold;color:#669FC7;">6 Of 6</p>
						<h4>Unggah Dokumen <span class="sub-title"></span></h4>
						<hr/>
						<div class="row container">
							<div class="col-sm-12">
								<div class="widget-box">
									<div class="widget-body">
										<div class="widget-main">

											<div class="form-group row">
												<label for="dokumen_utama" class="col-sm-12 control-label" style="text-align:left">Dokumen Utama</label>
												<!-- <label for="dokumen_utama" class="col-sm-6 control-label" style="text-align:left">Di Unduh Dalam Format</label> -->
												<div class="col-xs-12">
													<input type="file" id="dokumen_utama" name="dokumen_utama"><br>
													<input name="dokumen_utama_on" type="checkbox" class="ace" id="dokumen_utama_dpdf" name="dokumen_utama_dpdf" />
													<span class="lbl"> .PDF (Di unduh dalam format PDF)</span>
												</div>
											</div>
											<hr>

											<div class="form-group row">
												<label for="dokumen_pelengkap_1" class="col-sm-12 control-label" style="text-align:left">Dokumen Pelengkap 1</label>
												<div class="col-xs-12">
													<input multiple="" type="file" id="dokumen_pelengkap_1" name="dokumen_pelengkap_1"><br>
													<input name="dokumen_pelengkap_1_on" type="checkbox" class="ace" id="dokumen_pelengkap_1_dpdf" name="dokumen_pelengkap_1_dpdf" />
													<span class="lbl"> .PDF (Di unduh dalam format PDF)</span>
												</div>
											</div>
											<hr>

											<div class="form-group row">
												<label for="dokumen_pelengkap_2" class="col-sm-12 control-label" style="text-align:left">Dokumen Pelengkap 2</label>
												<div class="col-xs-12">
													<input multiple="" type="file" id="dokumen_pelengkap_2" name="dokumen_pelengkap_2">
													<input name="dokumen_pelengkap_2_on" type="checkbox" class="ace" id="dokumen_pelengkap_2_dpdf" name="dokumen_pelengkap_2_dpdf" />
													<span class="lbl"> .PDF (Di unduh dalam format PDF)</span>
												</div>
											</div>
											<hr>

											<div class="form-group row">
												<label for="dokumen_persetujuan" class="col-sm-12 control-label" style="text-align:left">Dokumen Persetujuan (.pdf)</label>
												<div class="col-xs-12">
													<input type="file" id="dokumen_persetujuan" name="dokumen_persetujuan">
												</div>
											</div>

										</div>
									</div>
								</div><br/>
								<div class="form-group container">
									<button class="btn btn-info" id="btn_unggah_doc_prev">Prev</button>
									<button class="btn btn-warning" id="btn_unggah_doc">Finish</button>
								</div>
							</div>
						</div>
					</div><!-- Unggah Dokumen -->
				</form>
			</div>
		</div>
	</div>
</div>
<!-- modal simpan sebagai template -->
<div id="modal-save-template" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="blue bigger">Simpan Template Baru</h5>
				</div>
			<div class="modal-body">
				<div class="row">
					<div class="form-group">
						<label class="col-sm-12 control-label" style="text-align:left">Nama Template</label>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" id="si_template_new_name_temp" name="si_template_new_name_temp" maxlength="100" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-sm btn-info" data-dismiss="modal" id="save_template">
				<i class="ace-icon fa fa-save"></i>
				Save
				</button>
			</div>
		</div>
	</div>
</div>

<!-- Belum -->
<div class="row hide">
	<div class="">
		<form>
			<input type="text" name="nama_template" id="nama_template">
			<input type="text" name="kategori" id="kategori">
			<input type="text" name="jenis" id="jenis">
			<input type="text" name="tipe" id="tipe">
			<input type="text" name="grup_proses" id="grup_proses">
			<input type="text" name="proses" id="proses">
			<input type="text" name="nomor" id="nomor">
			<input type="text" name="nama" id="nama">
			<input type="text" name="wujud" id="wujud">
			<input type="text" name="metode" id="metode">
			<input type="text" name="rahasia" id="rahasia">
			<input type="text" name="user" id="user" value="<?php echo $this->session->userdata("session_bgm_edocument_id") ?>">
		</form>
	</div>
</div>
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

	<script src="<?php echo base_url('template/backend/assets/js/wizard.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/jquery.validate.min.js'); ?>"></script>
	<script src="<?php echo base_url('template/backend/assets/js/jquery-additional-methods.min.js'); ?>"></script>

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
<script>
		$(document).ready(function(){
			$('#save_template').click(function(){
				if($('#si_template_new_name_temp').val() != ""){
					alert("Tersimpan");
				}
			});
		});
	</script>
	<?php if ($pesan = $this->session->flashdata('pesan')): ?>
	<script>
		swal("<?php echo $pesan; ?>", "Penambahan Data Berhasil!", "success");
	</script>
	<?php endif; ?>
	<?php if ($pesan_gagal = $this->session->flashdata('pesan_gagal')): ?>
	<script>
		swal("<?php echo $pesan_gagal; ?>", "Penambahan Data Gagal, Mohon Cek Kembali", "error");
	</script>
	<?php endif; ?>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#si_header_no').focus(function() {
				var si_header_no = $('#si_header_no').val();
				if(si_header_no != ''){
					$.ajax({
						url: "<?php echo base_url('C_contribution/cek_nomor'); ?>",
						method: "POST",
						data: {si_header_no:si_header_no},
						success: function(data){
							$('#no_result').html(data);
							if ($('#boleh_lanjut').val() != ""){
								$('#btn_jud_doc').removeAttr('disabled', true);
							}else{
								$('#btn_jud_doc').attr('disabled', true);
							}
						}
					});
				}
			});

			$('#si_history_version').keydown(function(e) {
				if(e.keyCode == 189 || e.keyCode == 69) {
			        return false;
			    }
			});

			$('#si_header_no').on('keyup', function(e){
				var si_header_no = $('#si_header_no').val();
				if(si_header_no != ''){
					$.ajax({
						url: "<?php echo base_url('C_contribution/cek_nomor'); ?>",
						method: "POST",
						data: {si_header_no:si_header_no},
						success: function(data){
							$('#no_result').html(data);
							if ($('#boleh_lanjut').val() != ""){
								$('#btn_jud_doc').removeAttr('disabled', true);
							}else{
								$('#btn_jud_doc').attr('disabled', true);
							}
						}
					});
				}
			});

			// $('#si_template_default_name').on('change', function() {
			// 	$("#btn_modal").attr('disabled', true);
			// });
			$('#si_header_distribution').on('change', function() {
				var optionsText = this.options[this.selectedIndex].value;
				var kat = $('#si_template_new_kategori').val();
				if (optionsText == 'EDOC' && kat != 'DTSEKI0004' && kat != 'DTSEKI0001') {
					console.log('x');
					$('#btn_terkait_doc').removeClass('hide');
					$('#btn_terkait_doc_finish').addClass('hide');
					$('#1').text('1 Of 6');
					$('#2').text('2 Of 6');
					$('#3').text('3 Of 6');
					$('#4').text('4 Of 6');
					$('#5').text('5 Of 6');
					var optionExists = ($('#si_owner_dept_penyimpan option[value=7550]').length > 0);
					if(!optionExists)
					{
						var optionExists = ($('#si_owner_dept_penyimpan option[value=7550]').length > 0);
						if(!optionExists)
						{
							$('#si_owner_dept_penyimpan').append('<option value="7550" selected>BPI</option>');
						}
					}
					return false;
				}else if(optionsText == 'EDOC' && kat == 'DTSEKI0004' || kat == 'DTSEKI0001'){
					console.log('b');
					$('#1').text('1 Of 6');
					$('#2').text('2 Of 6');
					$('#3').text('3 Of 6');
					$('#4').text('4 Of 6');
					$('#5').text('5 Of 6');
					$('#btn_terkait_doc').removeClass('hide');
					$('#btn_terkait_doc_finish').addClass('hide');
					$("#si_owner_dept_penyimpan option[value='7550']").remove();
					return false;
				}else{
					console.log('c');
					$('#1').text('1 Of 5');
					$('#2').text('2 Of 5');
					$('#3').text('3 Of 5');
					$('#4').text('4 Of 5');
					$('#5').text('5 Of 5');
					$('#btn_terkait_doc').addClass('hide');
					$('#btn_terkait_doc_finish').removeClass('hide');
					$("#si_owner_dept_penyimpan option[value='7550']").remove();
					return false;
				}
			});
			// On Change Atribut Dokumen
			$('#si_template_new_kategori').on('change', function() {
				var add = $(this).val();
				$("#req_kategori").addClass('hide');
				$("#kategori").val(add);
				if (add=='DTSEKI0004' || add=='DTSEKI0001') {
					$("#si_owner_dept_penyimpan option[value='7550']").remove();
					$("#si_owner_dept_pendistribusi option[value='7550']").remove();
				}else{
					var optionExists = ($('#si_owner_dept_penyimpan option[value=7550]').length > 0);
					if(!optionExists)
					{
							$('#si_owner_dept_penyimpan').append('<option value="7550" selected>BPI</option>');
					}

					var optionExistsDeptDistribusi = ($('#si_owner_dept_pendistribusi option[value=7550]').length > 0);
					if(!optionExistsDeptDistribusi)
					{
							$('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BPI</option>');
					}
				}
			});
			$('#si_template_new_jenis').on('change', function() {
				var add = $(this).val();
				$("#req_jenis").addClass('hide');
				$("#jenis").val(add);
			});
			$('#si_template_new_tipe').on('change', function() {
				var add = $(this).val();
				$("#req_tipe").addClass('hide');
				$("#tipe").val(add);
			});
			$('#si_template_new_group_proses').on('change', function() {
				var add = $(this).val();
				$("#grup_proses").val(add);
			});
			$('#si_template_new_proses').on('change', function() {
				var add = $(this).val();
				$("#proses").val(add);
			});
			// On Change Judul Dokumen
			$('#si_header_no').on('keyup', function(e){
				var add = $(this).val();
				$("#req_nomor").addClass('hide');
				$("#nomor").val(add);
			});
			$('#si_header_name').on('keyup', function(e){
				var add = $(this).val();
				$("#req_nama").addClass('hide');
				$("#nama").val(add);
			});
			$('#si_header_master').on('change', function() {
				var add = $(this).val();
				$("#req_wujud").addClass('hide');
				$("#wujud").val(add);
			});
			$('#si_header_distribution').on('change', function() {
				var add = $(this).val();
				$("#req_distribusi").addClass('hide');
				$("#metode").val(add);
			});
			$('#si_header_confidential').on('change', function() {
				var add = $(this).val();
				$("#req_rahasia").addClass('hide');
				$("#rahasia").val(add);
			});
			// Kepemilikan Dokumen
			$('#si_owner_dept_penyimpan').on('change', function() {
				$("#req_penyimpan").addClass('hide');
			});
			$('#si_owner_pemilik_proses').on('change', function() {
				$("#req_proses").addClass('hide');
			});
			$('#si_owner_dept_pendistribusi').on('change', function() {
				$("#req_distribusi_dept").addClass('hide');
			});
			// Sejarah Dokumen
			$('#si_history_version').on('keyup', function(e){
				$("#req_versi").addClass('hide');
			});
			$('#si_history_keyword').on('keyup', function(e){
				$("#req_keyword").addClass('hide');
			});
			$('#si_history_abstract').on('keyup', function(e){
				$("#req_abstrak").addClass('hide');
			});
			$('#si_history_date').on('changeDate', function() {
				$("#req_tgl_efektif").addClass('hide');
			});
			// $('#si_history_date_final').on('changeDate', function() {
			// 	$("#req_tgl_periode").addClass('hide');
			// });

			$('#si_template_new_name_temp').on('keyup', function(e){
				var add = $(this).val();
				$("#nama_template").val(add);
			});
			//Filter Size
			// $('input[type="file"]').on('change', function() {
			// 	if(this.files[0].size > 2000000) {
			// 		alert("File Terlalu Besar!");
			// 		$(this).val('');
			// 		return false;
			// 	}
			// });

			// filter dokumen utama
			$('#dokumen_utama').on('change', function() {
				var dokumen_utama = $('#dokumen_utama').val();
				var file = dokumen_utama.split('\\').pop();
				var jumlah = file.substr(0, file.lastIndexOf('.'));
				if (jumlah.length > 100) {
					alert("Nama File Harus Kurang dari 100 Karakter!");
					$(this).val('');
					return false;
				}
			});
			// filter dokumen pelengkap 1
			$('#dokumen_pelengkap_1').on('change', function() {
				var dokumen_pelengkap_1 = $('#dokumen_pelengkap_1').val();
				var file = dokumen_pelengkap_1.split('\\').pop();
				var jumlah = file.substr(0, file.lastIndexOf('.'));
				if (jumlah.length > 100) {
					alert("Nama File Harus Kurang dari 100 Karakter!");
					$(this).val('');
					return false;
				}
			});
			// filter dokumen pelengkap 2
			$('#dokumen_pelengkap_2').on('change', function() {
				var dokumen_pelengkap_2 = $('#dokumen_pelengkap_2').val();
				var file = dokumen_pelengkap_2.split('\\').pop();
				var jumlah = file.substr(0, file.lastIndexOf('.'));
				if (jumlah.length > 100) {
					alert("Nama File Harus Kurang dari 100 Karakter!");
					$(this).val('');
					return false;
				}
			});

			$( "#btn_atr_doc" ).click(function() {
				var kategori = $('#si_template_new_kategori').val();
				var jenis = $('#si_template_new_jenis').val();
				var tipe = $('#si_template_new_tipe').val();
				if (kategori == '' && jenis == '' && tipe == '') {
					$("#req_kategori").removeClass('hide');
					$("#req_jenis").removeClass('hide');
					$("#req_tipe").removeClass('hide');
					return false;
				}else if(jenis == '' && tipe == ''){
					$("#req_jenis").removeClass('hide');
					$("#req_tipe").removeClass('hide');
					return false;
				}else if(tipe == ''){
					$("#req_tipe").removeClass('hide');
					return false;
				}else{
					if (kategori == 'DTSEKI0004' || kategori == 'DTSEKI0001') {
						$("#si_owner_dept_penyimpan option[value='7550']").remove();
					}
					if ($('#watermark').val().length!=0) {
						$('#dokumen_utama_dpdf').prop('checked',true);
						$('#dokumen_pelengkap_1_dpdf').prop('checked',true);
						$('#dokumen_pelengkap_2_dpdf').prop('checked',true);
						$('#dokumen_utama_dpdf').prop('disabled',false);
						$('#dokumen_pelengkap_1_dpdf').prop('disabled',false);
						$('#dokumen_pelengkap_2_dpdf').prop('disabled',false);
					}else{
						$('#dokumen_utama_dpdf').prop('checked',false);
						$('#dokumen_pelengkap_1_dpdf').prop('checked',false);
						$('#dokumen_pelengkap_2_dpdf').prop('checked',false);
						$('#dokumen_utama_dpdf').prop('disabled',true);
						$('#dokumen_pelengkap_1_dpdf').prop('disabled',true);
						$('#dokumen_pelengkap_2_dpdf').prop('disabled',true);
					}
					$('#atr_doc').addClass('hide');
					$('#jud_doc').removeClass('hide');
					$('#si_header_no').focus();
					return false;
				}
			});

			$( "#btn_jud_doc" ).click(function() {
				$(".sub-title").text($("#si_header_name").val());
				var nomor = $('#si_header_no').val().length;
				var nama = $('#si_header_name').val().length;
				var wujud = $('#si_header_master').val();
				var distribusi = $('#si_header_distribution').val();
				var rahasia = $('#si_header_confidential').val();
				if (nomor == 0 && nama == 0 && wujud == '' && distribusi == '') {
					$('#req_nomor').removeClass('hide');
					$('#req_nama').removeClass('hide');
					$('#req_wujud').removeClass('hide');
					$('#req_distribusi').removeClass('hide');
					return false;
				}else if(nama == 0 && wujud == '' && distribusi == ''){
					$('#req_nama').removeClass('hide');
					$('#req_wujud').removeClass('hide');
					$('#req_distribusi').removeClass('hide');
					return false;
				}else if(wujud == '' && distribusi == ''){
					$('#req_wujud').removeClass('hide');
					$('#req_distribusi').removeClass('hide');
					return false;
				}else if(nomor == ''){
					$('#req_nomor').removeClass('hide');
					return false;
				}else if(nama == ''){
					$('#req_nama').removeClass('hide');
					return false;
				}else if(wujud == ''){
					$('#req_wujud').removeClass('hide');
					return false;
				}else if(distribusi == ''){
					$('#req_distribusi').removeClass('hide');
					return false;
				}else if(rahasia == ''){
					$('#req_rahasia').removeClass('hide');
					return false;
				}else{
					$('#jud_doc').addClass('hide');
					$('#kepemilikan_doc').removeClass('hide');
					return false;
				}
			});

			$( "#btn_kepemilikan_doc" ).click(function() {
				var level = $('#duallistbox_akses_level option:selected').length;
				var pengguna = $('#duallistbox_pengguna_dokumen option:selected').length;
				var penyimpan = $('#si_owner_dept_penyimpan').val();
				var pemilik = $('#si_owner_pemilik_proses').val();
				var pendis = $('#si_owner_dept_pendistribusi').val();
				if (!level) {
					alert('Harap Isi Level Akses Dokumen');
					return false;
				}else if(!pengguna){
					alert('Harap Isi Pengguna Dokumen');
					return false;
				}else if(pemilik == '' && penyimpan == '' && pendis == ''){
					$("#req_proses").removeClass('hide');
					$("#req_penyimpan").removeClass('hide');
					$("#req_distribusi_dept").removeClass('hide');
					return false;
				}else if(penyimpan == '' && pendis == ''){
					$("#req_penyimpan").removeClass('hide');
					$("#req_distribusi_dept").removeClass('hide');
					return false;
				}else if(pemilik == ''){
					$("#req_proses").removeClass('hide');
					return false;
				}else if(penyimpan == ''){
					$("#req_penyimpan").removeClass('hide');
					return false;
				}else if(pendis == ''){
					$("#req_distribusi_dept").removeClass('hide');
					return false;
				}else{
					$('#kepemilikan_doc').addClass('hide');
					$('#sejarah_doc').removeClass('hide');
					return false;
				}
			});

			$( "#btn_sejarah_doc" ).click(function() {
				var versi = $('#si_history_version').val().length;
				var tgl_efektif = $('#si_history_date').val();
				var periode_opt = $('#si_history_period').val();
				var tgl_periode = $('#si_history_date_final').val();
				var keyword = $('#si_history_keyword').val().length;
				var abstrak = $('#si_history_abstract').val().length;
				if (versi == 0  && tgl_efektif == '' && periode_opt == '' && tgl_periode == '' && keyword == 0 && abstrak == 0) {
					$("#req_versi").removeClass('hide');
					$("#req_tgl_efektif").removeClass('hide');
					$("#req_tgl_periode").removeClass('hide');
					$("#req_keyword").removeClass('hide');
					$("#req_abstrak").removeClass('hide');
					return false;
				}else if(tgl_efektif == '' && periode_opt == '' && tgl_periode == '' && keyword == 0 && abstrak == 0){
					$("#req_tgl_efektif").removeClass('hide');
					$("#req_tgl_periode").removeClass('hide');
					$("#req_keyword").removeClass('hide');
					$("#req_abstrak").removeClass('hide');
					return false;
				}else if(periode_opt == '' && tgl_periode == '' && keyword == 0 && abstrak == 0){
					$("#req_tgl_periode").removeClass('hide');
					$("#req_keyword").removeClass('hide');
					$("#req_abstrak").removeClass('hide');
					return false;
				}else if(keyword == 0 && abstrak == 0){
					$("#req_keyword").removeClass('hide');
					$("#req_abstrak").removeClass('hide');
					return false;
				}else if(versi == 0){
					$("#req_versi").removeClass('hide');
					return false;
				}else if(tgl_efektif == ''){
					$("#req_tgl_efektif").removeClass('hide');
					return false;
				}else if(periode_opt == ''){
					$("#req_tgl_periode").removeClass('hide');
					return false;
				}else if(tgl_periode == ''){
					$("#req_tgl_periode").removeClass('hide');
					return false;
				}else if(keyword == 0){
					$("#req_keyword").removeClass('hide');
					return false;
				}else if(abstrak == 0){
					$("#req_abstrak").removeClass('hide');
					return false;
				}else{
					$('#terkait_doc').removeClass('hide');
					$('#sejarah_doc').addClass('hide');
					return false;
				}
			});
			$( "#btn_terkait_doc" ).click(function() {
				$('#terkait_doc').addClass('hide');
				$('#unggah_doc').removeClass('hide');
				return false;
			});
			$( "#btn_terkait_doc_finish" ).click(function() {
				$('#contribusi_form').submit();
				$('#btn_terkait_doc_finish').attr('disabled', true);
			});
			$( "#btn_unggah_doc" ).click(function() {
				var utama = $('#dokumen_utama').val();
				var persetujuan = $('#dokumen_persetujuan').val();
				var file_ext = persetujuan.substr(persetujuan.lastIndexOf('.')+1,persetujuan.length);
				if (utama == '') {
					alert('Mohon Masukan Dokumen Utama!');
					return false;
				}else if(persetujuan == ''){
					alert('Mohon Sertakan Dokumen Persetujuan!');
					return false;
				}else if(file_ext != 'pdf'){
					alert('File Persetujuan Harus Bertipe PDF!');
					return false;
				}else{
					$('#contribusi_form').submit();
					$('#btn_unggah_doc').attr('disabled', true);
				}
			});

			// Previous Button
			$( "#btn_jud_doc_prev" ).click(function() {
				$('#atr_doc').removeClass('hide');
				$('#jud_doc').addClass('hide');
				return false;
			});
			$( "#btn_kepemilikan_doc_prev" ).click(function() {
				$('#jud_doc').removeClass('hide');
				$('#kepemilikan_doc').addClass('hide');
				return false;
			});
			$( "#btn_sejarah_doc_prev" ).click(function() {
				$('#kepemilikan_doc').removeClass('hide');
				$('#sejarah_doc').addClass('hide');
				return false;
			});
			$( "#btn_sejarah_doc_prev" ).click(function() {
				$('#kepemilikan_doc').removeClass('hide');
				$('#sejarah_doc').addClass('hide');
				return false;
			});
			$( "#btn_terkait_doc_prev" ).click(function() {
				$('#sejarah_doc').removeClass('hide');
				$('#terkait_doc').addClass('hide');
				return false;
			});
			$( "#btn_unggah_doc_prev" ).click(function() {
				$('#terkait_doc').removeClass('hide');
				$('#unggah_doc').addClass('hide');
				return false;
			});

			//Document size and type validation
			var allow_extention = new Array("doc","docx","xls","xlsx","ppt","pptx","vsd","vsdx","pdf");
			var size_limit = <?php echo $this->config->item('upload_size');?>;
			$('#dokumen_utama').on('change', function() {
				var filePath = $(this).val(); 
				var file_ext = filePath.substr(filePath.lastIndexOf('.')+1,filePath.length);
				var file_size = this.files[0].size / 1024;
				var iSize = (Math.round((file_size / 1024) * 100) / 100);
			
				if (allow_extention.indexOf(file_ext) != -1) {
					if (iSize > size_limit) {
						alert("Maksimal Ukuran File "+size_limit+"MB!");
						$(this).val('');

						return false;
					}

					return true;
				} else {
					alert("File Harus Doc, Docx, Xls, Xlsx, Ppt, Pptx, Vsd, Vsdx Atau Pdf!");
					$(this).val('');

					return false;
				}
			});

			$('#dokumen_pelengkap_1').on('change', function() {
				var filePath = $(this).val(); 
				var file_ext = filePath.substr(filePath.lastIndexOf('.')+1,filePath.length);
				var file_size = this.files[0].size / 1024;
				var iSize = (Math.round((file_size / 1024) * 100) / 100);
			
				if (allow_extention.indexOf(file_ext) != -1) {
					if (iSize > size_limit) {
						alert("Maksimal Ukuran File "+size_limit+"MB!");
						$(this).val('');

						return false;
					}

					return true;
				} else {
					alert("File Harus Doc, Docx, Xls, Xlsx, Ppt, Pptx, Vsd, Vsdx Atau Pdf!");
					$(this).val('');

					return false;
				}
			});

			$('#dokumen_pelengkap_2').on('change', function() {
				var filePath = $(this).val(); 
				var file_ext = filePath.substr(filePath.lastIndexOf('.')+1,filePath.length);
				var file_size = this.files[0].size / 1024;
				var iSize = (Math.round((file_size / 1024) * 100) / 100);
			
				if (allow_extention.indexOf(file_ext) != -1) {
					if (iSize > size_limit) {
						alert("Maksimal Ukuran File "+size_limit+"MB!");
						$(this).val('');

						return false;
					}

					return true;
				} else {
					alert("File Harus Doc, Docx, Xls, Xlsx, Ppt, Pptx, Vsd, Vsdx Atau Pdf!");
					$(this).val('');

					return false;
				}
			});

			$('#dokumen_persetujuan').on('change', function() {
				var filePath = $(this).val(); 
				var file_ext = filePath.substr(filePath.lastIndexOf('.')+1,filePath.length);
				var file_size = this.files[0].size / 1024;
				var iSize = (Math.round((file_size / 1024) * 100) / 100);
				var allow_extention = new Array("pdf");
				if (allow_extention.indexOf(file_ext) != -1) {
					if (iSize > size_limit) {
						alert("Maksimal Ukuran File "+size_limit+"MB!");
						$(this).val('');

						return false;
					}

					return true;
				} else {
					alert("File Harus Pdf!");
					$(this).val('');

					return false;
				}
			});

		});
	</script>
	
	<script type="text/javascript">
		//si_template_default_name
		$('#si_template_default_name').change(function(){
			var id_key = document.getElementById("si_template_default_name");
			id_key = id_key.options[id_key.selectedIndex].value;
			
			if(id_key==""){
				location.reload();
			}else{
				//AJAX Request
				let si_key;
				$.ajax({
					url: '<?=base_url('C_contribution/get_data_document_structure_kategori_jenis_tipe')?>',
					type: 'POST', 
					data: {id_key: id_key},
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						//Add Options
						$.each(response,function(index,data){
							$('#si_template_new_kategori').val(data['DTSEKI_ID']);
							$('#si_template_new_jenis').append('<option selected value="'+data['DTSEJS_ID']+'">'+data['DTSEJS_JENIS']+'</option>');
							$('#si_template_new_tipe').val(data['DTSETE_ID']);
							$('#si_template_new_group_proses').val(data['DOCTEMP_GROUP_PROSES']);
							$('#si_template_new_proses').val(data['DOCTEMP_PROSES']);

							$('#si_header_master').val(data['DOC_WUJUD']);
							$('#si_header_distribution').val(data['DOC_DISTRIBUSI']);
							$('#si_header_confidential').val(data['DOC_KERAHASIAAN']);
							si_key = data['DTSETE_ID'];
							console.log('e');
							if($('#si_header_distribution').val() == 'EDOC') {
								$('#btn_terkait_doc').removeClass('hide');
								$('#btn_terkait_doc_finish').addClass('hide');
								$('#1').text('1 Of 6');
								$('#2').text('2 Of 6');
								$('#3').text('3 Of 6');
								$('#4').text('4 Of 6');
								$('#5').text('5 Of 6');
								if ($('#si_template_new_kategori').val() != 'DTSEKI0001' || $('#si_template_new_kategori').val() != 'DTSEKI0004') {
									var optionExists = ($('#si_owner_dept_penyimpan option[value=7550]').length > 0);
									if(!optionExists)
									{
											$('#si_owner_dept_penyimpan').append('<option value="7550" selected>BPI</option>');
									}
								}
								return false;
							}else{
								$('#1').text('1 Of 5');
								$('#2').text('2 Of 5');
								$('#3').text('3 Of 5');
								$('#4').text('4 Of 5');
								$('#5').text('5 Of 5');
								$('#btn_terkait_doc').addClass('hide');
								$('#btn_terkait_doc_finish').removeClass('hide');
								$("#si_owner_dept_penyimpan option[value='7550']").remove();
								return false;
							}
						});
						var field_1,field_2,field_3,field_4,field_5;
						let nom;
						let access;
						let dist;
						// Request nomor
						$.ajax({
							url: '<?= base_url('C_contribution/nomor_doc'); ?>',
							type: 'GET',
							success: function(response){
								//Parsing Json
								console.log('a');
								response = $.parseJSON(response);
								nom = response[0].kode;
								$.ajax({
									url: '<?= base_url('C_contribution/get_nomor'); ?>',
									type: 'GET',
									success: function(response){
										//Parsing Json
										response = $.parseJSON(response);
										field_1 = response[0].field_1;
										field_2 = response[0].field_2;
										field_3 = response[0].field_3;
										field_4 = response[0].field_4;
										field_5 = response[0].field_5;
								let id_key = si_key;
								//AJAX Request
								$.ajax({
									url: '<?=base_url('C_contribution/get_data_document_structure_tipe_confidental')?>',
									type: 'POST', 
									data: {id_key: id_key},
									success: function(response){
										//Parsing Json
										response = $.parseJSON(response);
										//Add Options
										$.each(response,function(index,data){
											let singkatan = data['DTSETE_SINGKATAN'];
											var date_now = new Date();
											// Field_1
											if (field_1 == 'Table') {
												field_1 = singkatan
											}else if(field_1 == 'Year'){
												field_1 = date_now.getFullYear();
											}else if(field_1 == 'Month'){
												field_1 = ("0" + (date_now.getMonth() + 1)).slice(-2)
											}else if(field_1 == 'Delimeter'){
												field_1 = "/";
											}else if (field_1 == 'Free Text') {
												field_1 = nom;
											}else{
												field_1 = "";
											}
											// Field_2
											if (field_2 == 'Table') {
												field_2 = singkatan
											}else if(field_2 == 'Year'){
												field_2 = date_now.getFullYear();
											}else if(field_2 == 'Month'){
												field_2 = ("0" + (date_now.getMonth() + 1)).slice(-2)
											}else if(field_2 == 'Delimeter'){
												field_2 = "/";
											}else if (field_2 == 'Free Text') {
												field_2 = nom;
											}else{
												field_2 = "";
											}
											// Field_3
											if (field_3 == 'Table') {
												field_3 = singkatan
											}else if(field_3 == 'Year'){
												field_3 = date_now.getFullYear();
											}else if(field_3 == 'Month'){
												field_3 = ("0" + (date_now.getMonth() + 1)).slice(-2);
											}else if(field_3 == 'Delimeter'){
												field_3 = "/";
											}else if (field_3 == 'Free Text') {
												field_3 = nom;
											}else{
												field_3 = "";
											}
											// Field_4
											if (field_4 == 'Table') {
												field_4 = singkatan
											}else if(field_4 == 'Year'){
												field_4 = date_now.getFullYear();
											}else if(field_4 == 'Month'){
												field_4 = ("0" + (date_now.getMonth() + 1)).slice(-2)
											}else if(field_4 == 'Delimeter'){
												field_4 = "/";
											}else if (field_4 == 'Free Text') {
												field_4 = nom;
											}else{
												field_4 = "";
											}
											// Field_5
											if (field_5 == 'Table') {
												field_5 = singkatan
											}else if(field_5 == 'Year'){
												field_5 = date_now.getFullYear();
											}else if(field_5 == 'Month'){
												field_5 = ("0" + (date_now.getMonth() + 1)).slice(-2)
											}else if(field_5 == 'Delimeter'){
												field_5 = "/";
											}else if (field_5 == 'Free Text') {
												field_5 = nom;
											}else{
												field_5 = "";
											}
											var hasil = field_1 + field_2 + field_3 + field_4 + field_5;
											$('#si_header_no').val(hasil);
											$('#watermark').val(data['WATERMARK']);
											access = data['DTSETE_ACCESS'];
											dist = data['DTSETE_DISTRIBUTION'];
										});
										if (access == 'All') {
											$.ajax({
												url: '<?=base_url('C_contribution/AllDepartmen')?>',
												type: 'POST', 
												data: {id_key: id_key},
												success: function(response){
													//Parsing Json
													response = $.parseJSON(response);
													$('#duallistbox_pengguna_dokumen').find('option').remove();
													$.each(response,function(index,data){
														$('#duallistbox_pengguna_dokumen').append('<option value="'+data['DN_ID']+'">'+data['DN_CODE']+' ('+data['DN_NAME']+')</option>');
														$('#duallistbox_pengguna_dokumen option[value="<?=$this->session->userdata("session_bgm_edocument_departement_id");?>"]').attr('selected','selected');
														$('#duallistbox_pengguna_dokumen option[value="7550"]').attr('selected','selected');
														$('#duallistbox_pengguna_dokumen option[value="7924"]').attr('selected','selected');
														$('#duallistbox_pengguna_dokumen option[value="7559"]').attr('selected','selected');
													});
													$('#duallistbox_pengguna_dokumen').bootstrapDualListbox('refresh', true);
												}
											});
										}else{
											$.ajax({
												url: '<?=base_url('C_contribution/GetDepatemenAccess')?>',
												type: 'POST', 
												data: {id_key: id_key},
												success: function(response){
													//Parsing Json
													response = $.parseJSON(response);
													$('#duallistbox_pengguna_dokumen').find('option').remove();
													$.each(response,function(index,data){
														$('#duallistbox_pengguna_dokumen').append('<option value="'+data['DN_ID']+'">'+data['DN_CODE']+' ('+data['DN_NAME']+')</option>');
														$('#duallistbox_pengguna_dokumen option[value="<?=$this->session->userdata("session_bgm_edocument_departement_id");?>"]').attr('selected','selected');
														$('#duallistbox_pengguna_dokumen option[value="7550"]').attr('selected','selected');
														$('#duallistbox_pengguna_dokumen option[value="7924"]').attr('selected','selected');
														$('#duallistbox_pengguna_dokumen option[value="7559"]').attr('selected','selected');
													});
													$('#duallistbox_pengguna_dokumen').bootstrapDualListbox('refresh', true);
												}
											});
										}
										if (dist == 'Available') {
											$.ajax({
												url: '<?=base_url('C_contribution/GetDepatemenDistribution')?>',
												type: 'POST', 
												data: {id_key: id_key},
												success: function(response){
												console.log('y');
												var add = $('#si_template_new_kategori').val();
													//Parsing Json
													response = $.parseJSON(response);
													$('#si_owner_dept_pendistribusi').find('option').not(':first').remove();
													// $('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BUSINESS PROCESS IMPROVEMENT</option>');
													$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_divisi_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_divisi_name"); ?></option>');
													$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_departement_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_departement_name"); ?></option>');
													if (add=='DTSEKI0004' || add=='DTSEKI0001') {
														// $("#si_owner_dept_penyimpan option[value='7550']").remove();
														$("#si_owner_dept_pendistribusi option[value='7550']").remove();
													}else{
														// $("#si_owner_dept_penyimpan").append('<option value="7550" selected>BPI</option>');
														console.log('f');
														var optionExists = ($('#si_owner_dept_pendistribusi option[value=7550]').length > 0);
														if(!optionExists)
														{
																$('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BPI</option>');
														}
													}
													$.each(response,function(index,data){
														$('#si_owner_dept_pendistribusi').append('<option value="'+data['DN_ID']+'">'+data['DN_NAME']+'</option>');
													});
												}
											});
										}else{
											console.log('x');
											var add = $('#si_template_new_kategori').val();
											$('#si_owner_dept_pendistribusi').find('option').not(':first').remove();
											$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_divisi_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_divisi_name"); ?></option>');
											$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_departement_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_departement_name"); ?></option>');
											if (add=='DTSEKI0004' || add=='DTSEKI0001') {
														// $("#si_owner_dept_penyimpan option[value='7550']").remove();
												$("#si_owner_dept_pendistribusi option[value='7550']").remove();
											}else{
												var optionExists = ($('#si_owner_dept_pendistribusi option[value=7550]').length > 0);
												if(!optionExists)
												{
														$('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BPI</option>');
												}
											
											}
										}
									}
								});
								}
								}); // End get tipe
							}
						});
					}
				});
			}
		});
		
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

		//si_template_new_tipe
		$('#si_template_new_tipe').change(function(){
			var id_key = document.getElementById("si_template_new_tipe");
			id_key = id_key.options[id_key.selectedIndex].value;

			var field_1,field_2,field_3,field_4,field_5,nom;
			let access;
			let dist;
			// Request nomor
			$.ajax({
				url: '<?= base_url('C_contribution/nomor_doc'); ?>',
				type: 'GET',
				success: function(response){
					//Parsing Json
					console.log('b');
					response = $.parseJSON(response);
					nom = response[0].kode;
					$.ajax({
						url: '<?= base_url('C_contribution/get_nomor'); ?>',
						type: 'GET',
						success: function(response){
							//Parsing Json
							response = $.parseJSON(response);
							field_1 = response[0].field_1;
							field_2 = response[0].field_2;
							field_3 = response[0].field_3;
							field_4 = response[0].field_4;
							field_5 = response[0].field_5;
							//AJAX Request Tipe
							$.ajax({
								url: '<?=base_url('C_contribution/get_data_document_structure_tipe_confidental')?>',
								type: 'POST', 
								data: {id_key: id_key},
								success: function(response){
									//Parsing Json
									response = $.parseJSON(response);
									//Add Options
									$.each(response,function(index,data){
										$('#si_template_new_jenis').append('<option value="'+data['DTSEJS_ID']+'" selected>'+data["DTSEJS_JENIS"]+'</option>');
										$('#si_template_new_kategori').val(data['DTSEKI_ID']);
										$('#si_header_confidential').val(data['CL_ID']);
										let singkatan = data['DTSETE_SINGKATAN'];
										var date_now = new Date();
										// Field_1
										if (field_1 == 'Table') {
											field_1 = singkatan
										}else if(field_1 == 'Year'){
											field_1 = date_now.getFullYear();
										}else if(field_1 == 'Month'){
											field_1 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_1 == 'Delimeter'){
											field_1 = "/";
										}else if (field_1 == 'Free Text') {
											field_1 = nom;
										}else{
											field_1 = "";
										}
										// Field_2
										if (field_2 == 'Table') {
											field_2 = singkatan
										}else if(field_2 == 'Year'){
											field_2 = date_now.getFullYear();
										}else if(field_2 == 'Month'){
											field_2 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_2 == 'Delimeter'){
											field_2 = "/";
										}else if (field_2 == 'Free Text') {
											field_2 = nom;
										}else{
											field_2 = "";
										}
										// Field_3
										if (field_3 == 'Table') {
											field_3 = singkatan
										}else if(field_3 == 'Year'){
											field_3 = date_now.getFullYear();
										}else if(field_3 == 'Month'){
											field_3 = ("0" + (date_now.getMonth() + 1)).slice(-2);
										}else if(field_3 == 'Delimeter'){
											field_3 = "/";
										}else if (field_3 == 'Free Text') {
											field_3 = nom;
										}else{
											field_3 = "";
										}
										// Field_4
										if (field_4 == 'Table') {
											field_4 = singkatan
										}else if(field_4 == 'Year'){
											field_4 = date_now.getFullYear();
										}else if(field_4 == 'Month'){
											field_4 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_4 == 'Delimeter'){
											field_4 = "/";
										}else if (field_4 == 'Free Text') {
											field_4 = nom;
										}else{
											field_4 = "";
										}
										// Field_5
										if (field_5 == 'Table') {
											field_5 = singkatan
										}else if(field_5 == 'Year'){
											field_5 = date_now.getFullYear();
										}else if(field_5 == 'Month'){
											field_5 = ("0" + (date_now.getMonth() + 1)).slice(-2)
										}else if(field_5 == 'Delimeter'){
											field_5 = "/";
										}else if (field_5 == 'Free Text') {
											field_5 = nom;
										}else{
											field_5 = "";
										}
										var hasil = field_1 + field_2 + field_3 + field_4 + field_5;
										$('#si_header_no').val(hasil);
										$('#watermark').val(data['WATERMARK']);
										access = data['DTSETE_ACCESS'];
										dist = data['DTSETE_DISTRIBUTION'];
									});
									if (access == 'All') {
										$.ajax({
											url: '<?=base_url('C_contribution/AllDepartmen')?>',
											type: 'POST', 
											data: {id_key: id_key},
											success: function(response){
												//Parsing Json
												response = $.parseJSON(response);
												$('#duallistbox_pengguna_dokumen').find('option').remove();
												$.each(response,function(index,data){
													$('#duallistbox_pengguna_dokumen').append('<option value="'+data['DN_ID']+'">'+data['DN_CODE']+' ('+data['DN_NAME']+')</option>');
												});
												$('#duallistbox_pengguna_dokumen option[value="<?=$this->session->userdata("session_bgm_edocument_departement_id");?>"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7550"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7924"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7559"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen').bootstrapDualListbox('refresh', true);
											}
										});
									}else{
										$.ajax({
											url: '<?=base_url('C_contribution/GetDepatemenAccess')?>',
											type: 'POST', 
											data: {id_key: id_key},
											success: function(response){
												//Parsing Json
												response = $.parseJSON(response);
												$('#duallistbox_pengguna_dokumen').find('option').remove();
												$.each(response,function(index,data){
													$('#duallistbox_pengguna_dokumen').append('<option value="'+data['DN_ID']+'">'+data['DN_CODE']+' ('+data['DN_NAME']+')</option>');
												});
												$('#duallistbox_pengguna_dokumen option[value="<?=$this->session->userdata("session_bgm_edocument_departement_id");?>"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7550"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen option[value="7924"]').attr('selected','selected');
												$('#duallistbox_pengguna_dokumen').bootstrapDualListbox('refresh', true);
											}
										});
									}
									if (dist == 'Available') {
										$.ajax({
											url: '<?=base_url('C_contribution/GetDepatemenDistribution')?>',
											type: 'POST', 
											data: {id_key: id_key},
											success: function(response){
												var add = $('#si_template_new_kategori').val();
												//Parsing Json
												response = $.parseJSON(response);
												$('#si_owner_dept_pendistribusi').find('option').not(':first').remove();
												// $('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BUSINESS PROCESS IMPROVEMENT</option>');
												$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_divisi_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_divisi_name"); ?></option>');
												$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_departement_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_departement_name"); ?></option>');
												if (add=='DTSEKI0004' || add=='DTSEKI0001') {
														$("#si_owner_dept_pendistribusi option[value='7550']").remove();
													}else{
														$('#si_owner_dept_pendistribusi').val('7550');
														var optionExists = ($('#si_owner_dept_pendistribusi option[value=7550]').length > 0);
														if(!optionExists)
														{
																$('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BPI</option>');
														}
													}
												$.each(response,function(index,data){
													$('#si_owner_dept_pendistribusi').append('<option value="'+data['DN_ID']+'">'+data['DN_NAME']+'</option>');
												});
											}
										});
									}else{
										var add = $('#si_template_new_kategori').val();
										$('#si_owner_dept_pendistribusi').find('option').not(':first').remove();
										$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_divisi_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_divisi_name"); ?></option>');
										$('#si_owner_dept_pendistribusi').append('<option value="<?= $this->session->userdata("session_bgm_edocument_departement_id"); ?>"><?= $this->session->userdata("session_bgm_edocument_departement_name"); ?></option>');
										if (add=='DTSEKI0004' || add=='DTSEKI0001') {
											// $("#si_owner_dept_penyimpan option[value='7550']").remove();
											$("#si_owner_dept_pendistribusi option[value='7550']").remove();
										}else{
											var optionExists = ($('#si_owner_dept_pendistribusi option[value=7550]').length > 0);
											if(!optionExists)
											{
													$('#si_owner_dept_pendistribusi').append('<option value="7550" selected>BPI</option>');
											}
										}
									}
								}
							});
						}
					});

				}
			});
		});

		$('#si_template_default_name').change(function(){
			var id_key = document.getElementById("si_template_default_name");
			id_key = id_key.options[id_key.selectedIndex].value;
			if(id_key!=""){
				//AJAX Request 1
				var JBLL_ID,JBLL_NAME,JBLL_INDEX;
				$.ajax({
					url: '<?=base_url('C_contribution/get_data_document_template_or_document_structure_tipe')?>',
					type: 'POST',
					data: {id_key: id_key},
					async: false,
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						
						//Add Options
						$.each(response,function(index,data){
							JBLL_ID = data['JBLL_ID'];
							JBLL_NAME = data['JBLL_NAME'];
							JBLL_INDEX = data['JBLL_INDEX'];
						});
					}
				});
				
				$("#duallistbox_akses_level").children().remove();
				//AJAX Request 2
				$.ajax({
					url: '<?=base_url('C_contribution/get_data_job_level_evo')?>',
					type: 'POST',
					async: false,
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						//Add Options
						$.each(response,function(index,data){
							//LOOP
							if(JBLL_INDEX>=(data['JBLL_INDEX'])){
								$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'" selected>'+data['JBLL_NAME']+'</option>');
							}else{
								$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'">'+data['JBLL_NAME']+'</option>');
							}
							//LOOP
						});
					}
				});
				$("#duallistbox_akses_level").bootstrapDualListbox('refresh', true);
			}
		});
		$('#si_template_new_tipe').change(function(){
			var id_key = document.getElementById("si_template_new_tipe");
			id_key = id_key.options[id_key.selectedIndex].value;
			if(id_key!=""){
				//AJAX Request 1
				var JBLL_ID,JBLL_NAME,JBLL_INDEX;
				$.ajax({
					url: '<?=base_url('C_contribution/get_data_document_template_or_document_structure_tipe')?>',
					type: 'POST',
					data: {id_key: id_key},
					async: false,
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						
						//Add Options
						$.each(response,function(index,data){
							JBLL_ID = data['JBLL_ID'];
							JBLL_NAME = data['JBLL_NAME'];
							JBLL_INDEX = data['JBLL_INDEX'];
						});
					}
				});
				
				$("#duallistbox_akses_level").children().remove();
				//AJAX Request 2
				$.ajax({
					url: '<?=base_url('C_contribution/get_data_job_level_evo')?>',
					type: 'POST',
					async: false,
					success: function(response){
						//Parsing Json
						response = $.parseJSON(response);
						//Add Options
						$.each(response,function(index,data){
							//LOOP
							if(JBLL_INDEX>=(data['JBLL_INDEX'])){
								$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'" selected>'+data['JBLL_NAME']+'</option>');
							}else{
								$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'">'+data['JBLL_NAME']+'</option>');
							}
							//LOOP
						});
					}
				});
				$("#duallistbox_akses_level").bootstrapDualListbox('refresh', true);
			}
		});
		// $("#duallistbox_akses_level").change(function(){
		// 	var JBLL_ID = $("#duallistbox_akses_level").val();
		// 	if(JBLL_ID!=null){
		// 		var JBLL_ID,JBLL_NAME,JBLL_INDEX;
		// 		//AJAX Request 1
		// 		$.ajax({
		// 			url: '<?=base_url('C_contribution/get_data_job_level_evo_ext')?>',
		// 			type: 'POST',
		// 			data: {id_key: JBLL_ID},
		// 			async: false,
		// 			success: function(response){
		// 				//Parsing Json
		// 				response = $.parseJSON(response);
		// 				//Add Options
		// 				$.each(response,function(index,data){
		// 					JBLL_ID = data['JBLL_ID'];
		// 					JBLL_NAME = data['JBLL_NAME'];
		// 					JBLL_INDEX = data['JBLL_INDEX'];
		// 				});
		// 			}
		// 		});
				
		// 		$("#duallistbox_akses_level").children().remove();
		// 		//AJAX Request 2
		// 		$.ajax({
		// 			url: '<?=base_url('C_contribution/get_data_job_level_evo')?>',
		// 			type: 'POST',
		// 			async: false,
		// 			success: function(response){
		// 				//Parsing Json
		// 				response = $.parseJSON(response);
		// 				//Add Options
		// 				$.each(response,function(index,data){
		// 					//LOOP
		// 					if(JBLL_INDEX>=(data['JBLL_INDEX'])){
		// 						$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'" selected>'+data['JBLL_NAME']+'</option>');
		// 					}else{
		// 						$('#duallistbox_akses_level').append('<option value="'+data['JBLL_ID']+'">'+data['JBLL_NAME']+'</option>');
		// 					}
		// 					//LOOP
		// 				});
		// 			}
		// 		});
		// 		$("#duallistbox_akses_level").bootstrapDualListbox('refresh', true);
		// 	}
		// });

		$('#si_history_date').on('changeDate', function() {
			var tgl_awal = $('#si_history_date').val();
			$('#si_history_date2').val(moment(tgl_awal).format("DD/MMM/YYYY"));
		});
		
		$('#si_history_period').change(function(){
			var period = document.getElementById("si_history_period");
			period = period.options[period.selectedIndex].value;

			var date_start = document.getElementById("si_history_date").value;
			if(date_start==""){
				alert("Mohon Isi Tanggal Efektif Berlaku");
				document.getElementById("si_history_period").selectedIndex = 0;
			}else{
				var tgl_awal = $('#si_history_date').val();
				var tgl_priod = $('#si_history_period').val();
				a = moment(tgl_awal).add(tgl_priod, 'month').calendar();
				b = moment(a).subtract(1, 'days').calendar();
				c = moment(b).format("DD/MMM/YYYY");
				// $('#si_history_date2').val(moment(tgl_awal).format("DD/MMM/YYYY"));
				$('#si_history_date_final').val(c);
				// $('#si_history_keyword').val(a);
				// $('#si_history_date_final').each(function() {    
				// 	$(this).datepicker('setDate', b);
				// });
			}
		});
		$('.date-picker').datepicker({
				format: 'mm/dd/yyyy',
				// format: 'dd/mm/yyyy',
				autoclose: true,
				todayHighlight: true
		})
		//show datepicker when clicking on the icon
		.next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		$('#si_template_new_name_temp').change(function(){
			var values = document.getElementById("si_template_new_name_temp").value;
			document.getElementById("si_template_new_name").value = values;
		});
		
		//function getTextUsingJavascript(){
		//	//si_template_new_kategori
		//	//si_attributes_kategori
		//	var cbo = document.getElementById("si_template_new_kategori");
		//	alert("The selected text is " + cbo.options[cbo.selectedIndex].text);
		//}
		//function getValueUsingJavascript(){
		//	//si_template_new_kategori
		//	//si_attributes_kategori
		//	var cbo = document.getElementById("si_template_new_kategori");
		//	alert("The selected value is " + cbo.options[cbo.selectedIndex].value);
		//}
		//------------------------------------------------------------------------------------------------//
		//------------------------------------------------------------------------------------------------//
		//------------------------------------------------------------------------------------------------//
		//------------------------------------------------------------------------------------------------//
		//------------------------------------------------------------------------------------------------//
		jQuery(function($) {
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
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			window.prettyPrint && prettyPrint();
			$('#id-check-horizontal').removeAttr('checked').on('click', function(){
				$('#dt-list-1').toggleClass('dl-horizontal').prev().html(this.checked ? '&lt;dl class="dl-horizontal"&gt;' : '&lt;dl&gt;');
			});
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
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
			
			//"jQuery UI Slider"
			//range slider tooltip example
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
				// read initial values from markup and remove that
				var value = parseInt( $( this ).text(), 10 );
				$( this ).empty().slider({
					value: value,
					range: "min",
					animate: true
					
				});
			});
			
			$("#slider-eq > span.ui-slider-purple").slider('disable');//disable third item
			
			$('#id-input-file-1 , #id-input-file-2').ace_file_input({
				no_file:'No File ...',
				btn_choose:'Choose',
				btn_change:'Change',
				droppable:false,
				onchange:null,
				thumbnail:false //| true | large
				//whitelist:'gif|png|jpg|jpeg'
				//blacklist:'exe|php'
				//onchange:''
				//
			});
			//pre-show a file name, for example a previously selected file
			//$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])
			
			$('#upload_file_input').ace_file_input({
				style: 'well',
				btn_choose: 'Drop files here or click to choose',
				btn_change: null,
				no_icon: 'ace-icon fa fa-cloud-upload',
				droppable: true,
				thumbnail: 'small'//large | fit
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
			
			//$('#upload_file_input')
			//.ace_file_input('show_file_list', [
				//{type: 'image', name: 'name of image', path: 'http://path/to/image/for/preview'},
				//{type: 'file', name: 'hello.txt'}
			//]);
			
			//dynamically change allowed formats by changing allowExt && allowMime function
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
					
					whitelist_ext = null;//all extensions are acceptable
					whitelist_mime = null;//all mimes are acceptable
				}
				var file_input = $('#upload_file_input');
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
					//console.log(info.file_count);//number of selected files
					//console.log(info.invalid_count);//number of invalid files
					//console.log(info.error_list);//a list of errors in the following format
					
					//info.error_count['ext']
					//info.error_count['mime']
					//info.error_count['size']
					
					//info.error_list['ext']  = [list of file names with invalid extension]
					//info.error_list['mime'] = [list of file names with invalid mimetype]
					//info.error_list['size'] = [list of file names with invalid size]
					
					/**
					if( !info.dropped ) {
						//perhapse reset file field if files have been selected, and there are invalid files among them
						//when files are dropped, only valid files will be added to our file array
						e.preventDefault();//it will rest input
					}
					*/
					
					//if files have been selected (not dropped), you can choose to reset input
					//because browser keeps all selected files anyway and this cannot be changed
					//we can only reset file field to become empty again
					//on any case you still should check files with your server side script
					//because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
				});
				
				/**
				file_input
				.off('file.preview.ace')
				.on('file.preview.ace', function(e, info) {
					console.log(info.file.width);
					console.log(info.file.height);
					e.preventDefault();//to prevent preview
				});
				*/
			
			});
			
			$('#spinner1').ace_spinner({value:0,min:0,max:200,step:10, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
			.closest('.ace-spinner')
			.on('changed.fu.spinbox', function(){
				//console.log($('#spinner1').val())
			}); 
			$('#spinner2').ace_spinner({value:0,min:0,max:10000,step:100, touch_spinner: true, icon_up:'ace-icon fa fa-caret-up bigger-110', icon_down:'ace-icon fa fa-caret-down bigger-110'});
			$('#spinner3').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
			$('#spinner4').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus', icon_down:'ace-icon fa fa-minus', btn_up_class:'btn-purple' , btn_down_class:'btn-purple'});
			
			//$('#spinner1').ace_spinner('disable').ace_spinner('value', 11);
			//or
			//$('#spinner1').closest('.ace-spinner').spinner('disable').spinner('enable').spinner('value', 11);//disable, enable or change value
			//$('#spinner1').closest('.ace-spinner').spinner('value', 0);//reset to 0
			
			//datepicker plugin
			//link
			
			//or change it into a date range picker
			$('.input-daterange').datepicker({autoclose:true});
			
			//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
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
			
			var tag_input = $('#si_history_keyword');
			tag_input.tag();
			// try{
			// 	tag_input.tag();
			// }
			// catch(e) {
				
			// }
			
			$('#modal-form input[type=file]').ace_file_input({
				style:'well',
				btn_choose:'Drop files here or click to choose',
				btn_change:null,
				no_icon:'ace-icon fa fa-cloud-upload',
				droppable:true,
				thumbnail:'large'
			});
			
			$('#modal-form').on('shown.bs.modal', function () {
				if(!ace.vars['touch']) {
					$(this).find('.chosen-container').each(function(){
						$(this).find('a:first-child').css('width' , '210px');
						$(this).find('.chosen-drop').css('width' , '210px');
						$(this).find('.chosen-search input').css('width' , '200px');
					});
				}
			});
			
			$(document).one('ajaxloadstart.page', function(e) {
				autosize.destroy('textarea[class*=autosize]')
				
				$('.limiterBox,.autosizejs').remove();
				$('.daterangepicker.dropdown-menu,.colorpicker.dropdown-menu,.bootstrap-datetimepicker-widget.dropdown-menu').remove();
			});

			var demo1 = $('select[name="duallistbox_akses_level[]"]').bootstrapDualListbox({
				nonSelectedListLabel: 'Dipilih',
  			selectedListLabel: 'Diberikan',
				infoText: false,
				infoTextFiltered: false,
				infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>',
				moveOnSelect: false
			});
			var container1 = demo1.bootstrapDualListbox('getContainer');
			container1.find('.move').html('Move');
			container1.find('.remove').html('Remove');
			container1.find('.moveall').html('All');
			container1.find('.removeall').html('All');
			// container1.find('.btn').addClass('btn-white btn-info btn-bold').html('All');

			var demo2 = $('select[name="duallistbox_pengguna_dokumen[]"]').bootstrapDualListbox({
				nonSelectedListLabel: 'Dipilih',
  			selectedListLabel: 'Diberikan',
				infoText: false,
				infoTextFiltered: false,
				infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>',
				moveOnSelect: false
			});
			var container2 = demo2.bootstrapDualListbox('getContainer');
			container2.find('.btn').addClass('btn-white btn-info btn-bold');
			container2.find('.move').html('Move');
			container2.find('.remove').html('Remove');
			container2.find('.moveall').html('All');
			container2.find('.removeall').html('All');

			// var demo3 = $('select[name="duallistbox_dept_pendistribusi[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
			// var container3 = demo3.bootstrapDualListbox('getContainer');
			// container3.find('.btn').addClass('btn-white btn-info btn-bold').html('All');;
			
			var demo4 = $('select[name="duallistbox_dokumen_terkait[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
			var container4 = demo4.bootstrapDualListbox('getContainer');
			container4.find('.btn').addClass('btn-white btn-info btn-bold').remove();
			
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
				 
					// iterate through the pool of strings and for any string that
					// contains the substring `q`, add it to the `matches` array
					$.each(strs, function(i, str) {
						if (substrRegex.test(str)) {
							// the typeahead jQuery plugin expects suggestions to a
							// JavaScript object, refer to typeahead docs for more info
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
				$('select[name="duallistbox_akses_level[]"]').bootstrapDualListbox('destroy');
				$('select[name="duallistbox_pengguna_dokumen[]"]').bootstrapDualListbox('destroy');
				$('select[name="duallistbox_dept_pendistribusi[]"]').bootstrapDualListbox('destroy');
				$('select[name="duallistbox_dokumen_terkait[]"]').bootstrapDualListbox('destroy');
				$('.rating').raty('destroy');
				$('.multiselect').multiselect('destroy');
			});
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			//------------------------------------------------------------------------------------------------//
			$('[data-rel=tooltip]').tooltip();
			
			$('.select2').css('width','200px').select2({allowClear:true})
			.on('change', function(){
				$(this).closest('form').validate().element($(this));
			}); 
			
			var $validation = false;
			$('#fuelux-wizard-container')
			.ace_wizard({
				//step: 2 //optional argument. wizard will jump to step "2" at first
				//buttons: '.wizard-actions:eq(0)'
			})
			.on('actionclicked.fu.wizard' , function(e, info){
				if(info.step == 1 && $validation) {
					if(!$('#validation-form').valid()) e.preventDefault();
				}
			})
			.on('finished.fu.wizard', function(e) {
				$('#auto_wizard_form').submit();//!!!
			}).on('stepclick.fu.wizard', function(e){
				//e.preventDefault();//this will prevent clicking and selecting steps
			});
			
			//jump to a step
			/**
			var wizard = $('#fuelux-wizard-container').data('fu.wizard')
			wizard.currentStep = 3;
			wizard.setState();
			*/
			
			//determine selected step
			//wizard.selectedItem().step
			
			//hide or show the other form which requires validation
			//this is for demo only, you usullay want just one form in your application
			$('#skip-validation').removeAttr('checked').on('click', function(){
				$validation = this.checked;
				if(this.checked) {
					$('#auto_wizard_form').hide();
					$('#validation-form').removeClass('hide');
				}
				else {
					$('#validation-form').addClass('hide');
					$('#auto_wizard_form').show();
				}
			})
			
			//documentation : http://docs.jquery.com/Plugins/Validation/validate
			
			$.mask.definitions['~']='[+-]';
			$('#phone').mask('(999) 999-9999');
			
			jQuery.validator.addMethod("phone", function (value, element) {
				return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
			}, "Enter a valid phone number.");
			
			$('#validation-form').validate({
				errorElement: 'div',
				errorClass: 'help-block',
				focusInvalid: false,
				ignore: "",
				rules: {
					upload_file_input: {
						required: true,
						email:true
					},//!!!

					email: {
						required: true,
						email:true
					},
					password: {
						required: true,
						minlength: 5
					},
					password2: {
						required: true,
						minlength: 5,
						equalTo: "#password"
					},
					name: {
						required: true
					},
					phone: {
						required: true,
						phone: 'required'
					},
					url: {
						required: true,
						url: true
					},
					comment: {
						required: true
					},
					state: {
						required: true
					},
					platform: {
						required: true
					},
					subscription: {
						required: true
					},
					gender: {
						required: true,
					},
					agree: {
						required: true,
					}
				},
			
				messages: {
					email: {
						required: "Please provide a valid email.",
						email: "Please provide a valid email."
					},
					password: {
						required: "Please specify a password.",
						minlength: "Please specify a secure password."
					},
					state: "Please choose state",
					subscription: "Please choose at least one option",
					gender: "Please choose gender",
					agree: "Please accept our policy"
				},
			
				highlight: function (e) {
					$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
				},
			
				success: function (e) {
					$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
					$(e).remove();
				},
			
				errorPlacement: function (error, element) {
					if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
						var controls = element.closest('div[class*="col-"]');
						if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
						else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
					}
					else if(element.is('.select2')) {
						error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
					}
					else if(element.is('.chosen-select')) {
						error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
					}
					else error.insertAfter(element.parent());
				},
			
				submitHandler: function (form) {
				},
				invalidHandler: function (form) {
				}
			});
			
			$('#modal-wizard-container').ace_wizard();
			$('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
			
			/**
			$('#date').datepicker({autoclose:true}).on('changeDate', function(ev) {
				$(this).closest('form').validate().element($(this));
			});
			
			$('#mychosen').chosen().on('change', function(ev) {
				$(this).closest('form').validate().element($(this));
			});
			*/
			
			$(document).one('ajaxloadstart.page', function(e) {
				//in ajax mode, remove remaining elements before leaving page
				$('[class*=select2]').remove();
			});			
		});
	</script>