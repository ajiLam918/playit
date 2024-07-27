# Tentukan URL untuk mengunduh playit.gg MSI
$msiUrl = "https://github.com/playit-cloud/playit-agent/releases/download/v0.15.13/playit-windows-x86.msi"

# Tentukan path file MSI sementara
$msiFilePath = "$env:USERPROFILE\Downloads\playit-windows.msi"

# Unduh file MSI
Invoke-WebRequest -Uri $msiUrl -OutFile $msiFilePath

# Instal MSI
Start-Process msiexec.exe -ArgumentList "/i", $msiFilePath, "/quiet", "/norestart" -NoNewWindow -Wait

# Hapus file MSI setelah instalasi
Remove-Item -Path $msiFilePath

# Menjalankan playit.gg jika diperlukan (ubah path sesuai dengan lokasi instalasi playit.gg)
Start-Process -FilePath "C:\Program Files\playit\playit.exe"
