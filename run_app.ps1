# Levanta el backend PHP y la app Flutter al mismo tiempo.
# Uso:  .\run_app.ps1

$ErrorActionPreference = 'Stop'

$root    = $PSScriptRoot
$backend = Join-Path $root 'backend'
$app     = Join-Path $root 'app'
$puerto  = 8000
$urlBase = "http://127.0.0.1:$puerto"

# 1) Verifica que php este disponible
if (-not (Get-Command php -ErrorAction SilentlyContinue)) {
    throw 'No se encontro php en el PATH. Agrega C:\xampp\php al PATH.'
}

# 2) Verifica que el puerto este libre
$enUso = @(Get-NetTCPConnection -LocalPort $puerto -State Listen -ErrorAction SilentlyContinue)
if ($enUso.Count -gt 0) {
    throw "El puerto $puerto ya esta en uso (PID $($enUso[0].OwningProcess)). Cierralo y vuelve a intentar."
}

# 3) Arranca el backend desde backend\ (ahi esta el docroot correcto)
Write-Host "Iniciando backend en $urlBase ..." -ForegroundColor Green
$php = $null
$php = Start-Process -FilePath 'php' `
    -ArgumentList '-S', "0.0.0.0:$puerto" `
    -WorkingDirectory $backend `
    -NoNewWindow -PassThru

try {
    # Espera a que el puerto responda
    $listo = $false
    for ($i = 0; $i -lt 20; $i++) {
        if (Get-NetTCPConnection -LocalPort $puerto -State Listen -ErrorAction SilentlyContinue) {
            $listo = $true
            break
        }
        Start-Sleep -Milliseconds 300
    }
    if (-not $listo) { throw 'El backend no logro arrancar.' }

    # 4) Ejecuta Flutter en primer plano (asi funcionan las teclas r / R / q)
    Write-Host 'Iniciando Flutter (Windows)...' -ForegroundColor Cyan
    Push-Location $app
    try {
        flutter run -d windows
    } finally {
        Pop-Location
    }
}
finally {
    # Al cerrar Flutter, apaga el backend
    if ($php -and -not $php.HasExited) {
        Write-Host 'Deteniendo backend...' -ForegroundColor Yellow
        Stop-Process -Id $php.Id -Force -ErrorAction SilentlyContinue
    }
}
