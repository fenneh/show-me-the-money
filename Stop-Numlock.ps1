function Stop-Numlock {
    if ([console]::NumberLock -eq $true) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }
}