# Levanta el backend PHP en http://127.0.0.1:8000
# Ejecutar desde esta carpeta:  .\iniciar_servidor.ps1
# Deja esta ventana abierta mientras pruebas la app Flutter.

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

Write-Host 'Servidor PHP escuchando en http://127.0.0.1:8000' -ForegroundColor Green
Write-Host 'Presiona Ctrl+C para detenerlo.' -ForegroundColor DarkGray

php -S 127.0.0.1:8000
