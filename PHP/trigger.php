<?php
include "../conexion/db.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ID = $_POST["ID"];
    $password = $_POST["password"];

    // 1. Use prepared statements to prevent SQL injection
    $consulta = $conexion->prepare("SELECT * FROM triggers JOIN usuarios ON usuarios.ID = triggers.ID WHERE usuarios.ID = :ID AND usuarios.password = :password");
    $consulta->bindParam(":ID", $ID);
    $consulta->bindParam(":password", $password);
    $consulta->execute();

    // 2. Check if a user was found
    if ($consulta->rowCount() == 1) {
        // Inicio de sesión exitoso
        $_SESSION["ID"] = $ID;
        header("Location: update.php"); // Redirect to the successful login page
        exit; // Stop further execution
    } else {
        // Las credenciales son incorrectas
        echo '<script>
                alert("Credenciales incorrectas. Por favor, inténtelo nuevamente.");
              </script>';
    }
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"],
        .btn-success,
        .btn-danger {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        input[type="submit"]:hover,
        .btn-success:hover,
        .btn-danger:hover {
            background-color: #45a049;
        }

        .btn-danger {
            background-color: #dc3545;
        }
    </style>
</head>

<body>
    <form action="" method="post">
        <h2>Recuperar Contraseña</h2>
        <label for="ID">Documento:</label>
        <input type="text" name="ID" pattern="[0-9]{10}" maxlength="10" required>

        <label for="password">password:</label>
        <input type="password" name="password" required>

        <button type="submit" class="btn-success">Enviar</button>
        <a href="metodos.php" class="btn-danger">Volver Atrás</a>
    </form>
</body>

</html>