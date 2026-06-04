# New-Item -ItemType File -Path $PROFILE -Force
# nvim $PROFILE

function cdd {
  cd "D:\DEVELOP\"
}

function rmrf {
    param([string]$path)
    Remove-Item -Path $path -Recurse -Force
}

Set-Alias cdl cdd
