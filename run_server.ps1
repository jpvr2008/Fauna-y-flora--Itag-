# Busca php.exe en PATH y en ubicaciones comunes, luego arranca el servidor embebido
$cmd = Get-Command php -ErrorAction SilentlyContinue
if ($cmd) {
    $php = $cmd.Path
} else {
    $candidates = @(
        "C:\php\php.exe",
        "C:\Program Files\PHP\php.exe",
        "C:\Program Files (x86)\PHP\php.exe",
        "C:\xampp\php\php.exe",
        "C:\wamp\bin\php\php.exe",
        "C:\wamp64\bin\php\php.exe"
    )
    $php = $null
    foreach ($p in $candidates) {
        if (Test-Path $p) {
            $php = $p
            break
        }
    }
}

if (-not $php) {
    Write-Host "`nERROR: No se encontró php.exe." -ForegroundColor Red
    Write-Host " - Instala PHP y añade la carpeta con php.exe al PATH, o instala XAMPP/WAMP."
    Write-Host " - Comprueba con: php -v  ó  Get-Command php"
    exit 1
}

Write-Host "Usando: $php"
Write-Host "Iniciando servidor en http://localhost:8000/ (CTRL+C para detener)"
& "$php" -S localhost:8000 -t admin
