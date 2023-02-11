function global:prompt {
    $did_succeed = $?
    $exitcode = $LASTEXITCODE
    $esc = [char]27
    If (-Not $did_succeed) {$unixy_exit_code = If ($LASTEXITCODE -eq 0 -or $LASTEXITCODE -eq $null) {1} Else {$LASTEXITCODE}}
    Write-Host "$esc[0;1m[$esc[38;5;$(If ($did_succeed) {'46'} Else {'124'})m$(If ($did_succeed) {"0"} Else {$unixy_exit_code})$esc[39m] $esc[38;5;25m$(whoami)@$(hostname -s)$esc[39m:$esc[38;5;231m$(sodiumSierraStrawberry $PWD)$esc[39m»$esc[m" -NoNewLine
    $global:LASTEXITCODE = $exitcode
    return " " # needs to be a non-empty string, or else it defaults to 'PS>'
}
Set-UnixCompleter -ShellType bash
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -HistorySavePath "$HOME/.local/share/histfiles/pwsh"
Set-PSReadLineOption -Colors @{
    "Operator"          = [ConsoleColor]::Magenta
    "Parameter"         = [ConsoleColor]::Blue
    "InlinePrediction"  = [ConsoleColor]::DarkMagenta
}

# Aliases and functions
Set-Alias -Name bp -Value bpython
Set-Alias -Name bpy -Value bpython
Set-Alias -Name c -Value clear
Set-Alias -Name cl -Value clear
Set-Alias -Name cle -Value clear
Set-Alias -Name d -Value cd
Set-Alias -Name ls -Value lsd
Set-Alias -Name ipconfig -Value ifconfig
Set-Alias -Name man -Value batman

# region profile alias initialize
Import-Module -Name HackF5.ProfileAlias -Force -Global -ErrorAction SilentlyContinue
# end region
