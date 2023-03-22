<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIM ABSENSI</title>
</head>
    <body>
        <?php 
        if (isset ($_POST['admin'])) {
            echo "<script>document.location.href='pesertadidik'</script>";
        }
        if (isset($_POST['add'])) {
            echo "<script>document.location.href='add'</script>";
        }
        ?>
        <form meyhod="post">
            <table align="center">
                <tr>
                    <td colspan="2" align="center">Login Sebagai :</td>
                </tr>
                <tr>
                    <tr><input type="submit" name="admin" value="Administrator"></tr>
                    <tr><input type="submit" name="pd" value="Pesserta didik"></tr>
                </tr>
            </table>
        </form>
    </body>
</html>