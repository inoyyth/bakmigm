<div>
    <p>
        Dokumen <b><?php echo $document->DOC_NAMA;?></b> 
        yang dibuat oleh <b><?php echo $maker->FULL_NAME;?></b> 
        pada tanggal <b><?php echo date("d M Y", strtotime($document->DOC_DATE));?></b> 
        akan/sudah berakhir masa berlakunya pada tanggal <b><?php echo date("d M Y", strtotime($document->DOC_TGL_EXPIRED));?></b> 
    </p>
    <p>
        Atas perhatiannya kami ucapkan terima kasih.
    </p>
</div>