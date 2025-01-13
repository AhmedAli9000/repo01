# Script to run Sysprep on a VM
# Logging is handy when you need it!
try {
    if (-not (Test-Path 'C:\logfiles')) {
        New-Item -ItemType Directory -Path 'C:\logfiles' | Out-Null
    }
} catch {
    Write-Output "Error creating log directory: $_" | Out-File -Encoding utf8 "C:\Temp\script_errors.log" -Append
}

$logFile = "C:\logfiles\" + (Get-Date -Format 'yyyyMMdd') + '_softwareinstall.log'

# Logging function
function Write-Log {
    Param($message)
    $logEntry = "$(Get-Date -Format 'yyyyMMdd HH:mm:ss') $message"
    Write-Output $logEntry
    $logEntry | Out-File -Encoding utf8 $logFile -Append
}

# Run Sysprep
try {
    Write-Log "Sysprep Starting"
    Start-Process -FilePath 'C:\Windows\System32\sysprep\sysprep.exe' -ArgumentList '/generalize', '/oobe', '/shutdown' -ErrorAction Stop -Wait
    Write-Log "Sysprep completed successfully"
    exit 0
} catch {
    $ErrorMessage = $_.Exception.Message
    Write-Log "Error running Sysprep: $ErrorMessage"
    exit 1
}
