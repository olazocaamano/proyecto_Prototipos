<?php
// Registro de docentes.
// Responde siempre JSON con el codigo HTTP correcto.

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Nunca mostrar avisos de PHP en el cuerpo: romperian el JSON que lee Flutter.
// Los errores quedan en el log del servidor (ventana donde corre php -S).
ini_set('display_errors', '0');

// El navegador manda un OPTIONS antes del POST cuando el Content-Type es JSON.
// Hay que contestarlo y salir, sin ejecutar la logica de registro.
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode([
        "status" => "error",
        "message" => "Metodo no permitido. Usa POST."
    ]);
    exit;
}

// Conexion a Aiven (__DIR__ evita depender del directorio desde donde se levante el servidor)
require_once __DIR__ . '/../../config/conexion.php';

// Lee los datos JSON enviados desde Flutter
$data = json_decode(file_get_contents("php://input"));

if (!is_object($data)) {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => "El cuerpo de la peticion no es un JSON valido."
    ]);
    exit;
}

// Verifica que se enviaron todos los campos requeridos para la tabla DOCENTES
$campos = ['username', 'email', 'password', 'first_name', 'last_name'];
$faltantes = [];

foreach ($campos as $campo) {
    if (!isset($data->$campo) || trim((string) $data->$campo) === '') {
        $faltantes[] = $campo;
    }
}

if (!empty($faltantes)) {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => "Faltan datos obligatorios para el registro.",
        "faltantes" => $faltantes
    ]);
    exit;
}

// Normaliza y valida los datos
$username = trim($data->username);
$email = trim(mb_strtolower($data->email));
$first_name = trim($data->first_name);
$last_name = trim($data->last_name);
$password = (string) $data->password;

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => "El correo electronico no es valido."
    ]);
    exit;
}

if (strlen($password) < 8) {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => "La contrasena debe tener al menos 8 caracteres."
    ]);
    exit;
}

if (strlen($username) > 50 || strlen($email) > 150 || strlen($first_name) > 100 || strlen($last_name) > 100) {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => "Uno de los campos excede el largo permitido."
    ]);
    exit;
}

// Encripta la contrasena de forma segura mediante un hash
$password_hash = password_hash($password, PASSWORD_DEFAULT);

// Consulta preparada para evitar inyecciones SQL
$query = "INSERT INTO DOCENTES (username, email, password, first_name, last_name) VALUES (?, ?, ?, ?, ?)";

if (!$stmt = mysqli_prepare($conn, $query)) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Error en la preparacion de la consulta."
    ]);
    mysqli_close($conn);
    exit;
}

mysqli_stmt_bind_param($stmt, "sssss", $username, $email, $password_hash, $first_name, $last_name);

if (mysqli_stmt_execute($stmt)) {
    http_response_code(201);
    echo json_encode([
        "status" => "success",
        "message" => "Docente registrado correctamente.",
        "id" => mysqli_insert_id($conn)
    ]);
} elseif (mysqli_stmt_errno($stmt) === 1062) {
    // 1062 = Duplicate entry (username o email ya registrados)
    http_response_code(409);
    echo json_encode([
        "status" => "error",
        "message" => "Ese usuario o correo ya esta registrado."
    ]);
} else {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Error al registrar: " . mysqli_stmt_error($stmt)
    ]);
}

mysqli_stmt_close($stmt);
mysqli_close($conn);
