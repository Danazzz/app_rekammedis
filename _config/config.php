<?php
// koneksi ke database
$con=mysqli_connect('localhost','root','','rekam_medis');
if(mysqli_connect_errno()){
    echo mysqli_connect_error();
}
?>