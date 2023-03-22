<?php
session_start();

include '../config/database.php';

$user = @$_POST['user'];

$a = mysqli_query($connection, "SELECT * FROM tbl_siswa WHERE nis = '$user'");
$b = mysqli_fetch_array($a);
$c = mysqli_num_rows($a);
$nama = $b['nama'];

if (isset($_POST['login'])) {
    if ($_POST['pass'] == $_POST['user']) {
      $_SESSION['username'] = $_POST['user'];
      $_SESSION['password'] = $_POST['pass'];
      echo "<script>alert('Selamat datang {$nama}!!'); document.location.href='hal_peserta_didik.php?menu=home'</script>";
    } else {
      echo "<script>alert('Username dan Password Tidak Sesuai!!'); document.location.href='index.php'</script>";
    }
}

if (isset($_POST['batal'])) {
  header("location:../");
}

?>

<title>Login</title>
<form action="" method="post">
  <table align="center">
    <tr>
      <td>Username</td>
      <td>:</td>
      <td><input type="text" name="user"></td>
    </tr>
    <tr>
      <td>Password</td>
      <td>:</td>
      <td><input type="text" name="pass"></td>
    </tr>
    <tr>
      <td colspan=3><em>Ket: Username & Password adalah NIS siswa</em></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td>
        <input type="submit" name="login" value="LOGIN">
        <input type="submit" name="batal" value="BATAL">
      </td>
    </tr>
  </table>
</form>