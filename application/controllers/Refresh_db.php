<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Refresh_db extends CI_Controller {

    function index() {
        $this->load->view('refresh_tables');
    }
    function refresh_tables() {
        $key = $this->input->post('key');
        $config_key = $this->config->item('refresh_table_key');
        if ($key === $config_key) {
            $tables = [
                'm_log',
                'tb_document_bookmark',
                'tb_document_comment',
                'tb_document_detail',
                'tb_document_detail_status',
                'tb_document_news',
                'tb_document_notification',
                'tb_document_template',
                'tb_document_versioning',
                'tb_notification_history',
                'tb_document',
            ];
            foreach ($tables as $k=>$v) {
                if ($v !== 'tb_document') {
                    $this->db->from($v)->truncate();
                } else {
                    $this->db->empty_table($v);
                }
            }

            echo "success clean data";
        } else {
            echo "gagal clean data <a href='".base_url('refresh-database')."'>silahkan ulangi</a>";
        }
    }
}