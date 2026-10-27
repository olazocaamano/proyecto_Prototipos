<?php
// Conexion a la base de datos en Aiven (MySQL)
// IMPORTANTE: PHP 8.1+ hace que mysqli LANCE EXCEPCIONES por defecto.
// Si no se desactiva, mysqli_real_connect nunca devuelve false y el cliente
// recibe un error 500 en HTML en lugar de nuestro JSON.
mysqli_report(MYSQLI_REPORT_OFF);

// Las credenciales viven en credenciales.php (ignorado por git).
$archivo_credenciales = __DIR__ . '/credenciales.php';

if (!is_file($archivo_credenciales)) {
    http_response_code(500);
    header("Content-Type: application/json; charset=UTF-8");
    echo json_encode([
        "status" => "error",
        "message" => "Falta config/credenciales.php. Copia config/credenciales.example.php y rellena los datos."
    ]);
    exit;
}

$config = require $archivo_credenciales;

$host = $config['host'];
$port = (int) $config['port'];
$user = $config['user'];
$pass = $config['pass'];
$db   = $config['db'];

// Crea un objeto de conexion e inicializa el certificado SSL requerido por Aiven.
// IMPORTANTE: asegurarse que el archivo ca.pem este en la misma ruta que este script.
$conn = mysqli_init();

if ($conn === false) {
    http_response_code(500);
    header("Content-Type: application/json; charset=UTF-8");
    echo json_encode([
        "status" => "error",
        "message" => "No se pudo inicializar mysqli."
    ]);
    exit;
}

mysqli_ssl_set($conn, NULL, NULL, __DIR__ . '/ca.pem', NULL, NULL);

// Establece la conexion con el flag MYSQLI_CLIENT_SSL
if (!mysqli_real_connect($conn, $host, $user, $pass, $db, $port, NULL, MYSQLI_CLIENT_SSL)) {
    http_response_code(503);
    header("Content-Type: application/json; charset=UTF-8");
    echo json_encode([
        "status" => "error",
        "message" => "No se pudo conectar a la base de datos: " . mysqli_connect_error(),
        "code" => mysqli_connect_errno()
    ]);
    exit;
}

// Establece el conjunto de caracteres
if (!mysqli_set_charset($conn, "utf8mb4")) {
    http_response_code(500);
    header("Content-Type: application/json; charset=UTF-8");
    echo json_encode([
        "status" => "error",
        "message" => "Error al establecer charset: " . mysqli_error($conn)
    ]);
    exit;
}
