# Mengunggah website portofolio ke GitHub Pages (Disyaputri.github.io).
# Syarat: repo kosong bernama Disyaputri.github.io (Public) sudah dibuat di github.com/new
# Cara pakai: klik kanan folder ini > Open in Terminal > jalankan: .\deploy.ps1

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot            # pindah ke folder script ini

if (-not (Test-Path ".git")) { git init -b main }   # buat repo git jika belum ada

git add -A                            # masukkan semua file website
git commit -m "Deploy portfolio website" 2>$null    # simpan perubahan (diabaikan jika tidak ada yang baru)

$remote = "https://github.com/Disyaputri/Disyaputri.github.io.git"
if (-not (git remote)) { git remote add origin $remote }   # sambungkan ke repo GitHub

git push -u origin main               # unggah ke GitHub (login GitHub muncul sendiri jika diminta)

Write-Host ""
Write-Host "Selesai. Tunggu 1-2 menit, lalu buka: https://disyaputri.github.io" -ForegroundColor Green
