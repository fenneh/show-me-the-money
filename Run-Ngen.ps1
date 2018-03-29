# Originates from https://stackoverflow.com/questions/4208694/how-to-speed-up-startup-of-powershell-in-the-4-0-environment
function Run-Ngen {
    $env:path = [Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()
    [AppDomain]::CurrentDomain.GetAssemblies() | ForEach-Object {
        if(! $_.location) {
        continue 
        }
        $Name = Split-Path $_.location -leaf
        Write-Host -ForegroundColor Yellow "NGENing : $Name"
        ngen install $_.location | ForEach-Object {"`t$_"}
    }
}