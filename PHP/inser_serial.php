<?php

session_start();

include 'conexion.php';

$ID = $_POST['ID'];


$validar_login = mysqli_query($conexion, "SELECT * FROM licencia WHERE
ID='$ID'");

if (mysqli_num_rows($validar_login) > 0) {
    $_SESSION['serial'] = $ID;
    header("location: prueba.php");
    exit;
} else {
    echo '
    <script>
        alert("Serial no existe, por favor verifique los datos introducidos");
        window.location = "../index.php";
    </script>
        ';
    exit;
}
