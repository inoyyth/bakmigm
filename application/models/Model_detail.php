<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Model_detail extends CI_Model
{

    public function DB_GET_SEARCH_DATA_DOCUMENT_ARRAY($STATUS1, $STATUS2, $STATUS3, $JBLL_ID, $DN_ID, $DI_ID, $DT_ID)
    {
        $result = "";
        try {
            $query = $this->db->query('
			SELECT
			*
			FROM
			tb_document
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.NIP
			INNER JOIN tb_departemen ON tb_document.DOC_PEMILIK_PROSES = tb_departemen.DN_ID
			WHERE
			(
				tb_document.DOC_STATUS = "' . $STATUS1 . '" OR
				tb_document.DOC_STATUS = "' . $STATUS2 . '" OR
				tb_document.DOC_STATUS = "' . $STATUS3 . '"
			)
			AND tb_document.DOC_PENGGUNA LIKE "%' . $DN_ID . '%"
			');
            if ($query->num_rows() > 0) {
                return $query->result();
            }
        } catch (Exception $exc) {
            $error = $exc->getMessage();
            echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT_ARRAY]" . $error;
        }
        return $result;
    }

    public function search($keyword, $STATUS1, $STATUS2, $STATUS3, $JBLL_ID, $DN_ID, $DI_ID, $DT_ID)
    {
        $query = $this->db->query('
			SELECT
			*
			FROM
			tb_document
			INNER JOIN tb_document_detail ON tb_document_detail.DOC_ID = tb_document.DOC_ID
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.NIP
			INNER JOIN tb_departemen ON tb_document.DOC_PEMILIK_PROSES = tb_departemen.DN_ID
			WHERE
			(
				tb_document.DOC_STATUS = "' . $STATUS1 . '" OR
				tb_document.DOC_STATUS = "' . $STATUS2 . '" OR
				tb_document.DOC_STATUS = "' . $STATUS3 . '"
			)
            AND tb_document.DOC_PENGGUNA LIKE "%' . $DN_ID . '%"
			AND
			(
				tb_document.DOC_KATA_KUNCI LIKE "%' . $keyword . '%" OR
				tb_document.DOC_ABSTRAK LIKE "%' . $keyword . '%" OR
				tb_document.DOC_NOMOR LIKE "%' . $keyword . '%" OR
				tb_document.DOC_NAMA LIKE "%' . $keyword . '%" OR
                tb_document_detail.DOCD_SEARCH LIKE "%' . $keyword . '%"
            )
		');
        return $query->result();
    }

    public function pencarian($STATUS1, $STATUS2, $STATUS3, $si_doc_type, $ssa_dept_owner, $ssa_group_proces, $ssa_proces, $JBLL_ID, $DN_ID, $DI_ID, $DT_ID)
    {
        $query = $this->db->query("
			SELECT
			*
			FROM
			tb_document
			INNER JOIN tb_document_detail ON tb_document_detail.DOC_ID = tb_document.DOC_ID
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.NIP
			INNER JOIN tb_departemen ON tb_document.DOC_PEMILIK_PROSES = tb_departemen.DN_ID
			WHERE
			(
				tb_document.DOC_STATUS = '" . $STATUS1 . "' OR
				tb_document.DOC_STATUS = '" . $STATUS2 . "' OR
				tb_document.DOC_STATUS = '" . $STATUS3 . "'
			)
			AND tb_document.DOC_PEMILIK_PROSES LIKE '%" . $ssa_dept_owner . "%'
			AND tb_document.DOC_TIPE LIKE '%" . $si_doc_type . "%'
			AND tb_document.DOC_GROUP_PROSES LIKE '%" . $ssa_group_proces . "%'
			AND tb_document.DOC_PROSES LIKE '%" . $ssa_proces . "%'

		");
        return $query->result();
    }

    public function DB_GET_SEARCH_DATA_DOCUMENT_ARRAY_BOOKMARK($SESSION_ID)
    {
        $result = "";
        try {
            $query = $this->db->query('
			SELECT
			*
			FROM
			tb_document_bookmark
			INNER JOIN tb_document ON tb_document_bookmark.DOC_ID = tb_document.DOC_ID
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document.DOC_MAKER = tb_employee.NIP
			INNER JOIN tb_departemen ON tb_document.DOC_PEMILIK_PROSES = tb_departemen.DN_ID
			WHERE tb_document_bookmark.UR_ID = "' . $SESSION_ID . '"
			');
            if ($query->num_rows() > 0) {
                return $query->result_array();
            }
        } catch (Exception $exc) {
            $error = $exc->getMessage();
            echo "[ERROR][M_LIBRARY_DATABASE][DB_GET_SEARCH_DATA_DOCUMENT_ARRAY]" . $error;
        }
        return $result;
    }

    public function searchBookmark($keyword, $STATUS1, $STATUS2, $STATUS3, $SESSION_ID)
    {
        $query = $this->db->query('
			SELECT
			*
			FROM
			tb_document_bookmark
			INNER JOIN tb_document ON tb_document_bookmark.DOC_ID = tb_document.DOC_ID
			INNER JOIN tb_document_detail ON tb_document_detail.DOC_ID = tb_document.DOC_ID
			INNER JOIN tb_document_structure_kategori ON tb_document_structure_kategori.DTSEKI_ID = tb_document.DOC_KATEGORI
			INNER JOIN tb_document_structure_jenis ON tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS
			INNER JOIN tb_document_structure_tipe ON tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE
			INNER JOIN tb_document_form ON tb_document_form.DTFM_ID = tb_document.DOC_WUJUD
			INNER JOIN tb_distribution_method ON tb_distribution_method.DNMD_ID = tb_document.DOC_DISTRIBUSI
			INNER JOIN tb_confidential ON tb_confidential.CL_ID = tb_document.DOC_KERAHASIAAN
			INNER JOIN tb_employee ON tb_document_bookmark.UR_ID = tb_employee.NIP
			LEFT OUTER JOIN tb_departemen ON tb_employee.DEPCODE = tb_departemen.DN_ID
			LEFT OUTER JOIN tb_divisi ON (tb_employee.DEPCODE = tb_divisi.DI_ID OR tb_departemen.DI_ID = tb_divisi.DI_ID)
			LEFT OUTER JOIN tb_direktorat ON (tb_employee.DEPCODE = tb_direktorat.DT_ID OR tb_divisi.DT_ID = tb_direktorat.DT_ID)
			WHERE
			(
				tb_document.DOC_STATUS LIKE "%' . $STATUS1 . '%" OR
				tb_document.DOC_STATUS LIKE "%' . $STATUS2 . '%" OR
				tb_document.DOC_STATUS LIKE "%' . $STATUS3 . '%"
			)
			AND tb_document_bookmark.UR_ID LIKE "%' . $SESSION_ID . '%"
			AND
			(
				tb_document.DOC_KATA_KUNCI LIKE "%' . $keyword . '%" OR
				tb_document.DOC_ABSTRAK LIKE "%' . $keyword . '%" OR
				tb_document.DOC_NOMOR LIKE "%' . $keyword . '%" OR
				tb_document.DOC_NAMA LIKE "%' . $keyword . '%" OR
				tb_document_detail.DOCD_SEARCH LIKE "%' . $keyword . '%"
			)
		');
        return $query->result();
    }

    public function cek_book($si_key, $ur_id)
    {
        $this->db->where('DOC_ID', $si_key);
        $this->db->where('UR_ID', $ur_id);
        $query = $this->db->get('tb_document_bookmark');
        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function INSERT_LINK_TO_DB($data)
    {
        $this->db->insert('tb_document_link', $data);
    }

    public function DELETE_LINK_FROM_DB($LINK_ID)
    {
        $this->db->where('LINK_ID', $LINK_ID);
        $this->db->delete('tb_document_link');
    }

    public function GET_KODE_LINK($kode)
    {
        $this->db->select('*');
        $this->db->from('tb_document_link');
        $this->db->where('LINK_ID', $kode);
        $query = $this->db->get();
        $result = $query->result();
        return $result;
    }

    public function GET_DOC_BY_KODE($DOC_ID)
    {
        $this->db->select('*');
        $this->db->join('tb_document', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
        $this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
        $this->db->join('tb_document_structure_jenis', 'tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS', 'left');
        $this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
        $this->db->where('tb_document.DOC_ID', $DOC_ID);
        $q = $this->db->get('tb_document_detail');
        $result = $q->result_array();
        return $result;
    }

    public function getLevel($pengguna)
    {
        $this->db->select('UR_EMAIL');
        $this->db->from('tb_user');
        $this->db->where('RS_ID', $pengguna);
        $query = $this->db->get();
        // $result = $query->result_array();
        $result = $query->result_array();
        return $result;
    }

    public function getDokPengguna()
    {
        $this->db->select('DOC_PENGGUNA');
        $this->db->from('tb_document');
        $q = $this->db->get();
        return $q->result_array();
    }

    public function GET_DETAIL_SERCH($SESSION_DEPARTEMENT_ID, $SESSION_JOB_LEVEL_ID)
    {
        $this->db->select('*');
        $this->db->join('tb_document', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
        $this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
        $this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
        // $this->db->where('DOC_STATUS', 'DIPUBLIKASI');
        $this->db->like('tb_document.DOC_STATUS', 'DIPUBLIKASI', 'BOTH');
        // $this->db->or_like('tb_document.DOC_STATUS', 'array_diff_assoc(array1, array2)RSIPKAN', 'BOTH');
        $this->db->like('tb_document.DOC_AKSES_LEVEL', $SESSION_JOB_LEVEL_ID, 'BOTH');
        $this->db->like('tb_document.DOC_PENGGUNA', $SESSION_DEPARTEMENT_ID, 'BOTH');
        $q = $this->db->get('tb_document_detail');
        $result = $q->result_array();
        return $result;
    }

    public function GET_DOC_PENGGUNA($SESSION_DEPARTEMENT_ID, $SESSION_JOB_LEVEL_ID)
    {
        $this->db->select('*');
        $this->db->join('tb_document', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
        $this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
        $this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
        $this->db->where('tb_document.DOC_STATUS', 'DIPUBLIKASI');
        $this->db->like('tb_document.DOC_AKSES_LEVEL', $SESSION_JOB_LEVEL_ID, 'BOTH');
        $this->db->like('tb_document.DOC_PENGGUNA', $SESSION_DEPARTEMENT_ID, 'BOTH');
        $q = $this->db->get('tb_document_detail');
        $result = $q->result_array();
        return $result;
    }

    public function getDetail($SESSION_DEPARTEMENT_ID, $DOC_ID, $SESSION_JOB_LEVEL_ID)
    {
        $this->db->where('DOC_ID', $DOC_ID);
        $this->db->like('DOC_AKSES_LEVEL', $SESSION_JOB_LEVEL_ID, 'BOTH');
        $this->db->like('DOC_PENGGUNA', $SESSION_DEPARTEMENT_ID, 'BOTH');
        $q = $this->db->get('tb_document');
        $result = $q->result_array();
        return $result;
    }

    public function getDetailList($id)
    {
        $this->db->select('*');
        $this->db->join('tb_document', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
        $this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
        $this->db->join('tb_document_structure_jenis', 'tb_document_structure_jenis.DTSEJS_ID = tb_document.DOC_JENIS', 'left');
        $this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
        $this->db->where('tb_document.DOC_ID', $id);
        $q = $this->db->get('tb_document_detail');
        $result = $q->result_array();
        return $result;
    }

    public function DB_GET_EMAIL()
    {
        $result = "";
        try {
            $this->db->select('*');
            $this->db->from('tb_employee_detail');
            $this->db->join('tb_employee', 'tb_employee_detail.NIP = tb_employee.NIP', 'left');
            $query = $this->db->get();
            if ($query->num_rows() > 0) {
                return $query->result();
            }
        } catch (Exception $exc) {
            $error = $exc->getMessage();
            echo "[ERROR][Model_detail][DB_GET_EMAIL]" . $error;
        }
        return $result;
    }

    public function GET_EMAIL_PENGGUNA_BY_ID($pengirim)
    {
        $this->db->select('*');
        $this->db->from('tb_employee');
        $this->db->where('NIP', $pengirim);
        $query = $this->db->get();
        $result = $query->result();
        return $result;
    }

    public function GET_DOKUMEN_BY_ID($si_key)
    {
        $this->db->select('*');
        $this->db->from('tb_document');
        $this->db->where('DOC_ID', $si_key);
        $query = $this->db->get();
        $result = $query->result();
        return $result;
    }

    // MODEL BOOKMARK
    public function getBookmark($SESSION_ID)
    {
        $this->db->select('*');
        $this->db->join('tb_document', 'tb_document.DOC_ID = tb_document_bookmark.DOC_ID', 'left');
        $this->db->join('tb_document_detail', 'tb_document_detail.DOC_ID = tb_document.DOC_ID', 'left');
        $this->db->join('tb_departemen', 'tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES', 'left');
        $this->db->join('tb_document_structure_tipe', 'tb_document_structure_tipe.DTSETE_ID = tb_document.DOC_TIPE', 'left');
        $this->db->where('tb_document_bookmark.UR_ID', $SESSION_ID);
        $this->db->where('tb_document.DOC_STATUS', 'DIPUBLIKASI');
        $q = $this->db->get('tb_document_bookmark');
        $result = $q->result_array();
        return $result;
    }

    public function caribookmark($keyword)
    {
        $query = $this->db->query("SELECT * FROM tb_document
								   LEFT JOIN tb_document_detail
								   ON tb_document_detail.DOC_ID = tb_document.DOC_ID
								   JOIN tb_departemen
								   ON tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES
								   WHERE tb_document.DOC_STATUS = 'DIPUBLIKASI'
								   AND tb_document_detail.DOCD_SEARCH
								   LIKE '%" . $keyword . "%' ");
        $q = $query->result_array();
        return $q;
    }

    public function pencarianbookmark($si_doc_type, $ssa_dept_owner, $ssa_group_proces, $ssa_proces)
    {
        $query = $this->db->query("SELECT * FROM tb_document
								   LEFT JOIN tb_document_detail
								   ON tb_document_detail.DOC_ID = tb_document.DOC_ID
								   JOIN tb_departemen
								   ON tb_departemen.DN_ID = tb_document.DOC_PEMILIK_PROSES
								   WHERE tb_document.DOC_STATUS = 'DIPUBLIKASI'
								   AND tb_document.DOC_PEMILIK_PROSES LIKE '%" . $ssa_dept_owner . "%'
								   AND tb_document.DOC_TIPE LIKE '%" . $si_doc_type . "%'
								   AND tb_document.DOC_GROUP_PROSES LIKE '%" . $ssa_group_proces . "%'
								   AND tb_document.DOC_PROSES LIKE '%" . $ssa_proces . "%'");
        $q = $query->result_array();
        return $q;
    }

    public function getDOCD($ID)
    {
        $this->db->select('*');
        $this->db->from('tb_document_detail');
        $this->db->join('tb_document', 'tb_document.DOC_ID = tb_document_detail.DOC_ID', 'left');
        $this->db->where('tb_document_detail.DOC_ID', $ID);
        $query = $this->db->get();
        $result = $query->result();
        return $result;
    }

}

/* End of file Model_detail.php */
/* Location: ./application/models/Model_detail.php */