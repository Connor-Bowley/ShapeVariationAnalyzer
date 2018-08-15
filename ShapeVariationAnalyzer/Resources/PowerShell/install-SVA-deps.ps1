trap { Write-Error $_; Exit 1 }

Remove-Item Env:\PYTHONPATH
Remove-Item Env:\PYTHONHOME

$scriptName = "install-python.ps1"
if (![System.IO.File]::Exists(".\$scriptName")) {
  Write-Host "Download $scriptName"
  $url = "https://raw.githubusercontent.com/DCBIA-OrthoLab/ShapeVariationAnalyzer/release/ShapeVariationAnalyzer/Resources/PowerShell/windows/$scriptName"
  $cwd = (Get-Item -Path ".\" -Verbose).FullName
  (new-object net.webclient).DownloadFile($url, "$cwd\$scriptName")
}

$pythonPrependPath = "1"
$pythonVersion = "3.5"
$pythonArch = "64"
Invoke-Expression ".\$scriptName"
