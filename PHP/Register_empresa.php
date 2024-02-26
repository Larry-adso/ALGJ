<?php
include "../conexion/db.php";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $NIT = isset($_POST["NIT"]) ? $_POST["NIT"] : "";
    $Nombre = isset($_POST["Nombre"]) ? $_POST["Nombre"] : "";
    $Id_licencia = isset($_POST["ID_Licencia"]) ? $_POST["ID_Licencia"] : "";
    $password = isset($_POST["password"]) ? $_POST["password"] : "";
    $password = hash('sha512', $password);
    $Correo = isset($_POST["Correo"]) ? $_POST["Correo"] : "";
    $Telefono = isset($_POST["Telefono"]) ? $_POST["Telefono"] : "";
    // Verificar si el NIT ya existe en la base de datos 
    $verificarNIT = $conexion->prepare("SELECT * FROM empresas WHERE NIT = :NIT");
    $verificarNIT->bindParam(":NIT", $NIT);
    $verificarNIT->execute();
    $resultadoNIT = $verificarNIT->fetch(PDO::FETCH_ASSOC);

    if ($resultadoNIT) {
        // Mostrar alerta de que el NIT ya está registrado
        echo '<script>
        alert("El NIT ya está registrado. No se puede guardar el registro.");
    </script>';
    } else {
        // Insertar el nuevo registro en la tabla empresas
        $sentencia = $conexion->prepare("INSERT INTO empresas(NIT, Nombre, password, Correo, Telefono, ID_Licencia) VALUES (:NIT, :Nombre, :password, :Correo, :Telefono, :ID_Licencia)");
        $sentencia->bindParam(":NIT", $NIT);
        $sentencia->bindParam(":Nombre", $Nombre);
        $sentencia->bindParam(":password", $password);
        $sentencia->bindParam(":Correo", $Correo);
        $sentencia->bindParam(":Telefono", $Telefono);
        $sentencia->bindParam(":ID_Licencia", $Id_licencia);

        if ($sentencia->execute()) {
            $mensaje = "Registro creado correctamente";
            echo '<script>
        alert("Registro creado correctamente");
    </script>';

            // Actualizar el estado de la licencia a 2
            $actualizarEstado = $conexion->prepare("UPDATE licencia SET ID_Estado = 2 WHERE ID = :ID_Licencia");
            $actualizarEstado->bindParam(":ID_Licencia", $Id_licencia);
            $actualizarEstado->execute();
        } else {
            $mensaje = "Error al crear el registro";
            echo '<script>
        alert("Error al crear el registro");
    </script>';
        }
    }
}

$consultaLicencia = $conexion->prepare("SELECT * FROM licencia WHERE ID_estado = 3");
$consultaLicencia->execute();
$Tp_licencia = $consultaLicencia->fetchAll(PDO::FETCH_ASSOC);
?>

<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="css/empresa.css" />
    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>

    <header>
        <!-- place navbar here -->
    </header>
    <main>
        <div class="signupFrm">
            <form action="" class="form" method="POST">
                <h1 class="title">Registro De Empresa</h1>

                <div class="inputContainer">
                    <input type="text" name="NIT" class="input" placeholder="a">
                    <label for="" class="label">NIT</label>
                </div>

                <div class="inputContainer">
                    <input type="text" name="Nombre" class="input" placeholder="a">
                    <label for="" class="label">Nombre</label>
                </div>

                <div class="inputContainer">
                    <label for="" class="label">ID_Licencia</label>
                    <select class="form-select form-select-sm" name="ID_Licencia" id="id_licencia" required>
                        <option value=""></option>
                        <?php foreach ($Tp_licencia as $licencia_) { ?>
                            <option value="<?php echo $licencia_['ID']; ?>">
                                <?php echo "ID: " . $licencia_['ID'] . " - Serial: " . $licencia_['Serial']; ?>
                            </option>
                        <?php } ?>
                    </select>

                </div>

                <div class="inputContainer">
                    <input type="text" name="Correo" class="input" placeholder="a">
                    <label for="" class="label">Correo</label>
                </div>

                <div class="inputContainer">
                    <input type="text" name="Telefono" class="input" placeholder="a">
                    <label for="" class="label">Telefono</label>
                </div>

                <div class="inputContainer">
                    <input type="text" name="password" class="input" placeholder="a">
                    <label for="" class="label">Password</label>
                </div>

                <button type="submit" class="submitBtn">aqui</button>
                <a name="" id="" class="btn btn-danger" href="../desarrollador.php" role="button">Inicio</a>


            </form>
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