# build.ps1 — compila o mashup e coloca em dist/ TUDO que vai no .zip (o build.yml empacota a pasta dist/).
# Roda igual no seu PC (pwsh ./build.ps1) e no GitHub.
#
# Como o Hub usa as pastas do .zip (ver "mapear" no hub.json):
#   BepInEx/...  → vai pra pasta do jogo (o Hub tira quando a pessoa desinstala)
#   mods/...     → mods do Minecraft
#   o resto      → fica na pasta do mashup ({pasta})
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
Remove-Item dist -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory dist | Out-Null

# 1) Arquivos prontos (configs, perfil mashup.me3 do Elden Ring, etc.): o que estiver em pacote/ vai como está.
if (Test-Path pacote) { Copy-Item pacote/* dist -Recurse }

# 2) Exemplo: plugin do BepInEx em C# (descomente o setup-dotnet no build.yml)
# dotnet build src/MeuPlugin/MeuPlugin.csproj -c Release
# New-Item -ItemType Directory -Force dist/BepInEx/plugins | Out-Null
# Copy-Item src/MeuPlugin/bin/Release/*/MeuPlugin.dll dist/BepInEx/plugins/

# 3) Exemplo: mod Fabric do Minecraft em Java (descomente o setup-java no build.yml)
# Push-Location mod-minecraft; ./gradlew.bat build; Pop-Location
# New-Item -ItemType Directory -Force dist/mods | Out-Null
# Get-ChildItem mod-minecraft/build/libs/*.jar | Where-Object Name -notmatch 'sources' | Copy-Item -Destination dist/mods/

Write-Host "dist/ pronto:"
Get-ChildItem dist -Recurse -File | ForEach-Object { Write-Host ('  ' + $_.FullName.Substring((Resolve-Path dist).Path.Length + 1)) }
