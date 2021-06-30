<?php
include_once("../_config/config.php");

mysqli_query($con, "DELETE FROM tb_dokter WHERE id_dokter = '$_GET[id]'");