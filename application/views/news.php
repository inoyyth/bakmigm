<?php 
$count_news = 0;
$get_data_count = $this->M_notification->GET_NEWS_NEW($this->session->userdata("session_bgm_edocument_id"));
if(empty($get_data_count)||$get_data_count==""){

}else{
	$count_news = count($get_data_count);	
}
?>
<div class="row"><!-- Row -->
	<div class="widget-box">
		<div class="widget-header">
			<h4 class="smaller">
				News
				<span class="badge badge-primary"><?php echo $count_news; ?></span>
			</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<?php
			if($count_news > 0){
				foreach($get_data_count as $data_row){
			?>
			<div class="media search-media">
				<div class="media-body">
					<div>
						<h5 class="media-heading">
							<a class="black"><?= $data_row->FULL_NAME; ?></a>
						</h5>
					</div>
					<div class="space-1"></div>
					<p>
						Nomor Dokumen : <?= $data_row->DOC_NOMOR; ?>
						<br/>
						Nama Dokumen : <?= $data_row->DOC_NAMA; ?>
					</p>

					<div class="search-actions text-center">
						<span class="text-info"><?php echo date('d M Y', strtotime($data_row->DOC_DATE)); ?></span>
						<br/>
						<span class="text-info"><?php echo date('G:i', strtotime($data_row->DOC_DATE))." WIB"; ?></span>
						<a href="<?php echo base_url('document-details-'.$data_row->DOC_ID) ?>" class="search-btn-action btn btn-sm btn-block btn-info">Lihat</a>
					</div>
				</div>
			</div>
			<?php } } ?>
		</div>
	</div><!-- Row News -->
</div><!-- END Row -->
