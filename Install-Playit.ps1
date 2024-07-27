# Mengunduh playit.gg
Invoke-WebRequest -Uri "https://playit.gg/downloads/playit-windows.zip" -OutFile "$env:USERPROFILE\playit-windows.zip"

# Membuat direktori tujuan jika belum ada
if (-Not (Test-Path -Path "$env:USERPROFILE\playit")) {
    New-Item -ItemType Directory -Path "$env:USERPROFILE\playit09"
}

# Ekstrak file zip ke direktori tujuan
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("$env:USERPROFILE\playit-windows.zip", "$env:USERPROFILE\playit09")

# Hapus file zip setelah ekstraksi
Remove-Item -Path "$env:USERPROFILE\playit-windows.zip"

# Jalankan playit.gg
Start-Process -FilePath "$env:USERPROFILE\playit\playit09\playit.exe"
