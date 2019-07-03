<div class="row">
    <div class="col-lg-12">
        <div class="jumbotron">
            <h1>Error!</h1>
            <p>Dokumen ini<b> <?php echo $document;?></b> tidak didukung konversinya oleh aplikasi!</p>
            <p><a class="btn btn-primary btn-lg" href="<?php echo base_url('notification');?>" role="button">Kembali ke beranda</a> <a class="btn btn-primary btn-lg" href="<?php echo base_url('contribution');?>" role="button">Kembali ke kontribusi</a></p>
        </div>
    </div>
</div>

<?php die; ?>
