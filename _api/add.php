<?php
include_once("../_config/config.php");

$id = ($_POST['id']);
$nama = trim(mysqli_real_escape_string($con, $_POST['nama']));
$spesialis = trim(mysqli_real_escape_string($con, $_POST['spesialis']));
$alamat = trim(mysqli_real_escape_string($con, $_POST['alamat']));
$telp = trim(mysqli_real_escape_string($con, $_POST['telp']));
mysqli_query($con, "INSERT INTO tb_dokter VALUES('$id', '$nama', '$spesialis', '$alamat', '$telp')");