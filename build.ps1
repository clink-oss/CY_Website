# ASCII-only runner - reads UTF-8 gen-index.ps1
$genPath = Join-Path $PSScriptRoot "gen-index.ps1"
$gen = [System.IO.File]::ReadAllText($genPath, [System.Text.Encoding]::UTF8)
Invoke-Expression $gen
