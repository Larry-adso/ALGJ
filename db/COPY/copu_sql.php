<?php
// Configuración de la base de datos
$host = 'localhost'; // Cambia esto si tu base de datos no está en localhost
$username = 'root';
$password = '';
$database = 'n_algj';

// Ruta donde guardarás las copias de seguridad
$ruta_copia = '../db/'; // Cambia esto por la ruta deseada, asegúrate de que la carpeta exista y tenga permisos de escritura

// Nombre del archivo de copia de seguridad
$nombre_copia = 'backup_' . date('Y-m-d_H-i-s') . '.sql';

// Comando para crear la copia de seguridad utilizando mysqldump
$comando = "mysqldump --user={$username} --password={$password} --host={$host} {$database} > {$ruta_copia}{$nombre_copia}";

// Ejecutar el comando
$resultado = shell_exec($comando);

if ($resultado === null) {
    echo "<script>";
    echo "alert('La copia de seguridad se ha creado correctamente en {$ruta_copia}{$nombre_copia}');";
    echo "window.location = '../../desarrollador.php';"; // Cambia 'tu_pagina_destino.php' por la página a la que deseas redireccionar
    echo "</script>";
} else {
    echo "<script>";
    echo "alert('Ha ocurrido un error al crear la copia de seguridad: {$resultado}');";
    echo "window.history.back();"; // Regresar a la página anterior si ocurre un error
    echo "</script>";
}
