<?php
include_once("../_config/config.php");
require "../_assets/libs/vendor/autoload.php";

use Ramsey\Uuid\Uuid;

$uuid = Uuid::uuid4()->toString();
$nama = trim(mysqli_real_escape_string($con, $_POST['nama']));
$spesialis = trim(mysqli_real_escape_string($con, $_POST['spesialis']));
$alamat = trim(mysqli_real_escape_string($con, $_POST['alamat']));
$telp = trim(mysqli_real_escape_string($con, $_POST['telp']));
mysqli_query($con, "INSERT INTO tb_dokter VALUES('$uuid', '$nama', '$spesialis', '$alamat', '$telp')");