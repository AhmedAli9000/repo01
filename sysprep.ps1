
#Script to run Sysprep on a VM
#Logging is handy when you need it!
if ((test-path c:\logfiles) -eq $false) {
    new-item -ItemType Directory -path 'c:\' -name 'logfiles' | Out-Null
} 
$logFile = "c:\logfiles\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'

# Logging function
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#Run Sysprep
try{
# Hashed the below to make it manually to avoid custom script issues.
    write-output "Sysprep Starting"
    # Start-Process -filepath 'c:\Windows\system32\sysprep\sysprep.exe' -ErrorAction Stop -ArgumentList '/generalize', '/oobe', '/mode:vm', '/shutdown'
    # Start-Process -filepath 'c:\Windows\system32\sysprep\sysprep.exe' -ErrorAction Stop -ArgumentList '/generalize', '/oobe', '/shutdown'
    # C:\Windows\System32\sysprep\sysprep.exe /oobe /generalize /shutdown
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error running Sysprep: $ErrorMessage"
}
