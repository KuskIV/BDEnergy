$regpath = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583"
$value = "0"
New-ItemProperty -Path $regpath -Name Attributes -Value $value -PropertyType DWORD -Force | Out-Null