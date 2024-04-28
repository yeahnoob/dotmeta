
New-Alias -Name vv -Value nvim

Write-Output "Checking WSL status" 
wsl -l -v

function WSL-VPN-Kit-Restart {
	Write-Output "Restarting WSL VPN Kit(Adaptor)"
	wsl -d wsl-vpnkit service wsl-vpnkit stop
	wsl -d wsl-vpnkit service wsl-vpnkit start
	wsl -l -v
}

function WSL-VPN-Kit-Stop {
	Write-Output "Stopping WSL VPN Kit(Adaptor). It takes dozens of seconds."
	wsl -d wsl-vpnkit service wsl-vpnkit stop
}

$PSReadLineOptions = @{
    EditMode = "Vi"
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    PredictionViewStyle = "Listview"
    Colors = @{
        "Command" = "#6d6d6d"
    }
}
Set-PSReadLineOption @PSReadLineOptions

# Default shortkey binding of Set-PSReadLine
# DownArrow NextHistory             Replace the input with the next item in the history
# UpArrow   PreviousHistory         Replace the input with the previous item in the history
Set-PSReadLineKeyHandler -Function PreviousHistory -Chord Ctrl+p
Set-PSReadLineKeyHandler -Function NextHistory -Chord Ctrl+n
