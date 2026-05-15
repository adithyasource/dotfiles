# New-Item -ItemType File -Path $PROFILE -Force
# nvim $PROFILE

function cdd {
  cd "D:\DEVELOP\"
}

function prompt {
  $p = $PWD.Path -replace '\\', '/'
  [Console]::Write("$([char]27)]7;file:///$p$([char]27)\")
  # call the original default prompt logic
  "PS $($PWD.Path)> "
}

function rmrf {
    param([string]$path)
    Remove-Item -Path $path -Recurse -Force
}

Set-Alias cdl cdd
