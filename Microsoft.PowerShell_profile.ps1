# New-Item -ItemType File -Path $PROFILE -Force
# nvim $PROFILE

function cdd {
  cd "D:\DEVELOP\"
}

function pwsync {
  rclone copy D:\PASSWORDS\Passwords.kdbx passwords:passwords
}

function rmrf {
    param([string]$path)
    Remove-Item -Path $path -Recurse -Force
}

Set-Alias cdl cdd
