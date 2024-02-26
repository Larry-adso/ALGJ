<?php
include "../conexion/db.php";

if ($_POST) {
  $ID = isset($_POST["ID"]) ? $_POST["ID"] : "";
  $ID_puesto = isset($_POST["ID_puesto"]) ? $_POST["ID_puesto"] : "";
  $ID_Roll = isset($_POST["ID_Roll"]) ? $_POST["ID_Roll"] : "";
  $Password = isset($_POST["Password"]) ? $_POST["Password"] : "";


  // Verificar si el ID ya existe en la base de datos
  $stmt = $conexion->prepare("SELECT * FROM usuarios WHERE ID = :id");
  $stmt->bindParam(":id", $ID);
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

  if ($result) {
    // Si el ID ya existe, mostrar una alerta
    echo '<script>alert("El ID ya está en uso. No se puede crear el registro.");</script>';
  } else {
    // Si el ID no existe, proceder con la inserción
    $sentencia = $conexion->prepare("INSERT INTO usuarios(ID, ID_Roll, ID_puesto, Password) VALUES (:ID, :ID_Roll, :ID_puesto , :Password)");
    $sentencia->bindParam(":ID", $ID);
    $sentencia->bindParam(":ID_Roll", $ID_Roll);
    $sentencia->bindParam(":ID_puesto", $ID_puesto);
    $sentencia->bindParam(":Password", $Password);


    if ($sentencia->execute()) {
      $mensaje = "Registro creado correctamente";
    } else {
      $mensaje = "Error al crear el registro";
    }
  }
}

$consultaRoll = $conexion->prepare("SELECT * FROM roles");
$consultaRoll->execute();

$consultapuesto = $conexion->prepare("SELECT * FROM puestos");
$consultapuesto->execute();
?>


<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registro_empleado</title>
  <link rel="stylesheet" href="css/Registro_empleado.css">
</head>

<body>
  <form class="login-form" method="POST">
    <h3 style="color: red;">hola aquí se registran los usuarios que serán autorizados para poder crear una cuenta</h3>
    <?php if (!empty($mensaje)) : ?>
      <p><?php echo $mensaje; ?></p>
    <?php endif; ?>
    <p class="login-text">
      <span class="fa-stack fa-lg">
        <i class="fa fa-circle fa-stack-2x"></i>
        <i class="fa fa-lock fa-stack-1x"></i>
      </span>
    </p>
    <input type="number" class="login-username" autofocus="true" name="ID" required="true" placeholder="Documento" />
    <input type="Password" class="login-username" autofocus="true" name="Password" required="true" placeholder="pasword" />


    <label for="cargo">Cargo:</label>
    <select class="login-username" name="ID_puesto" id="ID_puesto" required>
      <option value="" disabled selected>Selecciona un Puesto</option>
      <?php foreach ($consultapuesto as $cargo) : ?>
        <option value="<?php echo $cargo['ID']; ?>">
          <?php echo "ID: " . $cargo['ID'] . " - Cargo: " . $cargo['cargo'] . " -Salario: " . $cargo['salario']; ?>
        </option>
      <?php endforeach; ?>
    </select>

    <label for="rol">Rol:</label>
    <select class="login-username" name="ID_Roll" id="ID_Roll" required>
      <option value="" disabled selected>Selecciona un Rol</option>
      <?php foreach ($consultaRoll as $roll) : ?>
        <option value="<?php echo $roll['ID']; ?>">
          <?php echo "ID: " . $roll['ID'] . " - Roll: " . $roll['TP_user']; ?>
        </option>
      <?php endforeach; ?>
    </select>

    <button type="submit" class="login-submit">Registrar</button>
  </form>
  <div class="underlay-photo"></div>
  <div class="underlay-black"></div>
</body>

</html>