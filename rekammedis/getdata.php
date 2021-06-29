<?php
include_once('../_config/config.php');

$query = "SELECT * FROM tb_rekammedis INNER JOIN tb_poliklinik ON tb_rekammedis.id_poli = tb_poliklinik.id_poli INNER JOIN tb_pasien ON tb_rekammedis.id_pasien = tb_pasien.id_pasien INNER JOIN tb_dokter ON tb_rekammedis.id_dokter = tb_dokter.id_dokter ORDER BY tgl_periksa DESC";
$sql_rm = mysqli_query($con, $query) or die(mysqli_error($con));

$res=array();
while ($row=$sql_rm->fetch_assoc()){
    $res[]=$row;
}
echo json_encode($res);
?>