function Start-Numlock {
    if ([console]::NumberLock -eq $false) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }
}