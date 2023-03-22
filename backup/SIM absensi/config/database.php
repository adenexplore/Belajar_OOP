<?php

$connection = mysqli_connect("localhost", "root", "") or die("Kesalahan Koneksi... !!");
mysqli_select_db($connection, "db_absensi1") or die("Database error!");


?>