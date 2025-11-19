. "$PSScriptRoot\env.ps1"


#let lx open LiteXL
function lx { & "C:\Program Files\Lite XL\lite-xl.exe" $args }


#Fast Node Manager
#fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

#zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
