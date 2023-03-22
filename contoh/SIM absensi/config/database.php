<?php

$connection = mysqli_connect("localhost", "root", "") or die("Kesalahan Koneksi... !!");
mysqli_select_db($connection, "rpl_absen") or die("Database error!");


?>