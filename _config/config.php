<?php
// setting default timezone 
date_default_timezone_set('asia/hong_kong');

// session start
session_start();

// koneksi ke database
$con=mysqli_connect('localhost','root','','rekam_medis');
if(mysqli_connect_errno()){
    echo mysqli_connect_error();
}

// function untuk tgl format indonesia
function tgl_indo($tgl){
	$tanggal = substr($tgl, 8, 2);
	$bulan = substr($tgl, 5, 2);
	$tahun = substr($tgl, 0, 4);

	return $tanggal."/".$bulan."/".$tahun;
}
?>