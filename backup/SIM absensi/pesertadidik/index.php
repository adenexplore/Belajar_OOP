<?php
session_start();

include '../config/database.php';

if (isset($_POST['login'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];

  $user = mysqli_query($koneksi, "SELECT * FROM tbl_siswa WHERE nis = '$username'");
  $b = mysqli_fetch_array($user);
  $cek = mysqli_num_rows($user);

  if($cek > 0){
      if($username != $password){
          echo "<script>alert('Katasandi Salah')</script>";
      }
      $_SESSION['userData'] = $b;
      $_SESSION['login'] = true;

      $nama = $b['nama'];
      echo "<script>alert('Selamat datang $nama!'); document.location.href='hal_peserta_didik.php?menu=home'</script>";
  }else{
      echo "<script>alert('Akun Anda Tidak Terdaftar')</script>";
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