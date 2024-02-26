<?php
include "../conexion/conexion.php";

// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir los datos del formulario
    $ID = isset($_POST["ID"]) ? $_POST["ID"] : "";
    $Nombre = isset($_POST["Nombre"]) ? $_POST["Nombre"] : "";
    $Apellido = isset($_POST["Apellido"]) ? $_POST["Apellido"] : "";
    $Correo = isset($_POST["Correo"]) ? $_POST["Correo"] : "";
    $Telefono = isset($_POST["Telefono"]) ? $_POST["Telefono"] : "";
    $Password = isset($_POST["Password"]) ? $_POST["Password"] : "";
    $password = hash('sha512', $Password);

    if (empty($ID) || empty($Nombre) || empty($Apellido) || empty($Correo) || empty($Telefono) || empty($Password)) {
        echo "Todos los campos son obligatorios.";
    } else {
        // Consultar si el ID ya existe en la base de datos
        $query = "SELECT * FROM usuarios WHERE ID = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            // Si el ID existe, permitir el registro
            $query = "UPDATE usuarios SET Nombre = ?, Apellido = ?, Correo = ?, Telefono = ?, Password = ? WHERE ID = ?";
            $statement = $conexion->prepare($query);

            // Enlazar los parámetros con los valores recibidos del formulario
            $statement->bind_param("sssssi", $Nombre, $Apellido, $Correo, $Telefono, $Password, $ID);

            // Ejecutar la consulta
            if ($statement->execute()) {
                echo "Información de usuario actualizada correctamente.";
            } else {
                echo "Error al actualizar la información del usuario.";
            }
        } else {
            // Si el ID no existe, mostrar un mensaje de error
            echo "No se puede actualizar la información porque el ID no está autorizado.";
        }

        // Cerrar la conexión
        $conexion->close();
    }
}
