$server = Get-Content Env:COMPUTERNAME
$ruta = 'c:\temp\' + $server + '.txt'
Get-WmiObject -Class Win32_QuickFixEngineering | Select-Object -Property "HotFixID", "InstalledOn", @{n='AppliedOn';e={$_.PSComputerName}} | Sort-Object InstalledOn -Descending | Out-File -FilePath $ruta 
