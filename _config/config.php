<?php
// koneksi ke database
$con=mysqli_connect('localhost','root','','dokter');
if(mysqli_connect_errno()){
    echo mysqli_connect_error();
}
?>