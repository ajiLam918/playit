# Tentukan URL untuk mengunduh playit.gg
$playitUrl = "https://playit.gg/downloads/playit-windows.zip"

# Tentukan direktori tujuan untuk mengunduh dan mengekstrak playit.gg
$destinationPath = "$env:USERPROFILE\playit"

# Buat direktori tujuan jika belum ada
if (-Not (Test-Path -Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath
}

# Tentukan path file zip sementara
$zipFilePath = "$destinationPath\playit-windows.zip"

# Unduh file zip
Invoke-WebRequest -Uri $playitUrl -OutFile $zipFilePath

# Ekstrak file zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath, $destinationPath)

# Hapus file zip setelah ekstraksi
Remove-Item -Path $zipFilePath

# Jalankan playit.gg
Start-Process -FilePath "$destinationPath\playit\playit.exe"
