<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="Conetent-Type" content="text/html; charset=utf-8" />
  <title>SIM Absensi</title>
</head>
<body>
  <?php
    if (isset($_POST['admin'])){
        echo "<script>document.location.href='admin'</script>";
    }
    
    if (isset($_POST['pd'])){
        echo "<script>document.location.href='pesertadidik'</script>";
    }
  ?>

  <form action="" method="post">
    <table align="center">
      <tr>
        <td colspan="2" align="center">Login Sebagai: </td>
      </tr>
      <tr>
        <td><input type="submit" name="admin" value="Administator"></td>
        <td><input type="submit" name="pd" value="Peserta Didik"></td>
      </tr>
    </table>
  </form>
</body>
</html>