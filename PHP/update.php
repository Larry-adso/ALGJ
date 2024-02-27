<?php
include "../conexion/db.php";

session_start();
if (!isset($_SESSION['ID'])) {
    echo '
 <script>
        alert("Por favor inicie sesión e intente nuevamente");
        window.location = "login.php";
    </script>
    ';
    session_destroy();
    die();
}

// Obtener el ID del usuario actual
$id_usuario = $_SESSION['ID'];

// Verificar si se envió el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener la nueva contraseña del formulario
    $password = (isset($_POST["password"]) ? $_POST["password"] : "");

    // Preparar la consulta SQL
    $consulta = $conexion->prepare("UPDATE usuarios SET password = :password WHERE ID = :id_usuario");

    // Vincular los parámetros
    $consulta->bindParam(':password', $password, PDO::PARAM_STR);
    $consulta->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);

    // Ejecutar la consulta
    $consulta->execute();
}
?>

<!doctype html>
<html lang="en">

<head>
    <title>Actualizar Contraseña</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <header>
        <!-- place navbar here -->
    </header>
    <main>
        <div class="card text-center">
            <img class="card-img-top" src="holder.js/60px100/" alt="Title" />
            <div class="col-md-6">
                <div class="">
                    <h2>welcome</h2>
                    <p> usuario : <?php echo $_SESSION["ID"]; ?></p>
                </div>
            </div>
            <div class="card-body">
                <h4 class="card-title">Actualizar Contraseña</h4>
                <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <div class="mb-3">
                        <label for="password" class="form-label">Ingrese su nueva contraseña:</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Ingrese su nueva contraseña" required />
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar Contraseña</button>
                </form>
            </div>
            <a name="" id="" class="btn btn-primary" href="cerrar.php" role="button">call_user_func_array</a>

        </div>
    </main>
    <footer>
        <!-- place footer here -->
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>