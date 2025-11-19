
#npm cache
$env:Path += ";C:\npm-cache\node-modules\"

# Oh My Posh config path
$ompConfig = Join-Path $env:XDG_CONFIG_HOME "oh-my-posh/huvixx.omp.json"

oh-my-posh init pwsh --config $ompConfig | Invoke-Expression
