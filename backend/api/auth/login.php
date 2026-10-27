<?php
// Inicio de sesion de docentes.
// Responde siempre JSON con el codigo HTTP correcto.

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Nunca mostrar avisos de PHP en el cuerpo: romperian el JSON que lee Flutter.
// Los errores quedan en el log del servidor (ventana donde corre php -S).
ini_set('display_errors', '0');

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

require_once __DIR__ . '/../../config/conexion.php';

$data = json_decode(file_get_contents("php://input"));

if (!is_object($data)) {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => "El cuerpo de la peticion no es un JSON valido."
    ]);
    exit;
}

// Se puede iniciar sesion con username o con email
$identificador = trim((string) ($data->username ?? $data->email ?? ''));
$password = (string) ($data->password ?? '');

if ($identificador === '' || $password === '') {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => "Debes enviar usuario (o correo) y contrasena."
    ]);
    exit;
}

$query = "SELECT id, username, email, password, first_name, last_name
          FROM DOCENTES
          WHERE username = ? OR email = ?
          LIMIT 1";

if (!$stmt = mysqli_prepare($conn, $query)) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Error en la preparacion de la consulta."
    ]);
    mysqli_close($conn);
    exit;
}

// mysqli_stmt_bind_param exige variables por referencia: no se puede pasar una funcion
$identificador_email = mb_strtolower($identificador);
mysqli_stmt_bind_param($stmt, "ss", $identificador, $identificador_email);
mysqli_stmt_execute($stmt);

$resultado = mysqli_stmt_get_result($stmt);
$docente = $resultado ? mysqli_fetch_assoc($resultado) : null;

mysqli_stmt_close($stmt);
mysqli_close($conn);

// Mensaje generico: no revelamos si el usuario existe o si solo fallo la contrasena
if (!$docente || !password_verify($password, $docente['password'])) {
    http_response_code(401);
    echo json_encode([
        "status" => "error",
        "message" => "Usuario o contrasena incorrectos."
    ]);
    exit;
}

http_response_code(200);
echo json_encode([
    "status" => "success",
    "message" => "Sesion iniciada correctamente.",
    "usuario" => [
        "id" => (int) $docente['id'],
        "username" => $docente['username'],
        "email" => $docente['email'],
        "first_name" => $docente['first_name'],
        "last_name" => $docente['last_name']
    ]
]);
