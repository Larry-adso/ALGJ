<?php
include "conexion/db.php";
$consulta = $conexion->prepare("SELECT empresas.NIT, 
empresas.Nombre,
empresas.ID_Licencia,
empresas.Correo,
licencia.Serial,
tp_licencia.Tipo AS Tipo_Licencia,
estado.Estado
FROM empresas
INNER JOIN licencia ON empresas.ID_Licencia = licencia.ID
INNER JOIN tp_licencia ON licencia.TP_licencia = tp_licencia.ID
INNER JOIN estado ON licencia.ID_Estado = estado.ID;

");
$consulta->execute();
$consulta_ = $consulta->fetchAll(PDO::FETCH_ASSOC);




?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>


<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Logo</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Crear Nominas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PHP/Register_empresa.php">Registro Empresa</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PHP/serial.php">Sereales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PHP/login.php">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="PHP/registro_empleado.php">Empleados / prueba </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Menu 6</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<body>

    <div class="table-responsive">
        <table class="table table-primary">
            <thead>
                <tr>
                    <th scope="col">NIT</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">ID licencia </th>

                    <th scope="col">Correo</th>

                    <th scope="col">Seriales</th>

                    <th scope="col">Estado Licencia</th>
                    <th scope="col">Tipo licenia </th>


                    <th scope="col">Ajustes</th>

                </tr>
            </thead>
            <tbody>
                <tr class="">
                    <?php foreach ($consulta_ as $info) { ?>
                <tr>
                    <td scope="row"><?php echo $info['NIT']; ?></td>
                    <td><?php echo $info['Nombre']; ?></td>
                    <td><?php echo $info['ID_Licencia']; ?></td>
                    <td><?php echo $info['Correo']; ?></td>
                    <td><?php echo $info['Serial']; ?></td>
                    <td><?php echo $info['Estado']; ?></td>
                    <td><?php echo $info['Tipo_Licencia']; ?></td>
                </tr>
            <?php } ?>

            </tbody>
        </table>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
    </script>
</body>

</html>