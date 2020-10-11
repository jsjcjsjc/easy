Start-Sleep –s 60 

if ([System.IO.File]::Exists("D:\net.bat"))
{
& "ipconfig.exe" '/all' > "D:\ip.txt"
$config = Get-Content "D:\net.bat"

$regex= [regex] 'ip=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$ip=  ( $matches[0].Groups[1].Value )

$regex= [regex] 'mask=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mask=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'gateway=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$gateway=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'mac=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mac =  ($matches[0].Value -replace "mac=",""  ).toUpper()  

$ipinfo = Get-Content "D:\ip.txt"
$regex2= [regex]"\u4ee5\u592a\u7f51\u9002\u914d\u5668\s(.*?):.*?\u7269\u7406\u5730\u5740.*?:\s(.*?)\s"
$matches = $regex2.Matches($ipinfo,[System.Text.RegularExpressions.RegexOptions]::Singleline)

foreach ($match in $matches)
{
$tmac = $match.Groups[2].Value -replace "-",":"
if ($tmac.contains($mac) )
{
$cmd = "int ipv4 set address name=""" + $match.Groups[1].Value + """ static " + $ip +" " + $mask +" " + $gateway 
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

$cmd = "int ipv4 set dns name=""" + $match.Groups[1].Value + """ static 8.8.8.8"
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;
            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

[System.IO.File]::Delete("D:\net.bat")
}
}
}


if ([System.IO.File]::Exists("E:\net.bat"))
{
& "ipconfig.exe" '/all' > "E:\ip.txt"
$config = Get-Content "E:\net.bat"

$regex= [regex] 'ip=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$ip=  ( $matches[0].Groups[1].Value )

$regex= [regex] 'mask=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mask=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'gateway=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$gateway=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'mac=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mac =  ($matches[0].Value -replace "mac=",""  ).toUpper()  

$ipinfo = Get-Content "E:\ip.txt"
$regex2= [regex]"\u4ee5\u592a\u7f51\u9002\u914d\u5668\s(.*?):.*?\u7269\u7406\u5730\u5740.*?:\s(.*?)\s"
$matches = $regex2.Matches($ipinfo,[System.Text.RegularExpressions.RegexOptions]::Singleline)

foreach ($match in $matches)
{
$tmac = $match.Groups[2].Value -replace "-",":"
if ($tmac.contains($mac) )
{
$cmd = "int ipv4 set address name=""" + $match.Groups[1].Value + """ static " + $ip +" " + $mask +" " + $gateway 
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

$cmd = "int ipv4 set dns name=""" + $match.Groups[1].Value + """ static 8.8.8.8"
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;
            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

[System.IO.File]::Delete("E:\net.bat")
}
}
}


if ([System.IO.File]::Exists("F:\net.bat"))
{
& "ipconfig.exe" '/all' > "F:\ip.txt"
$config = Get-Content "F:\net.bat"

$regex= [regex] 'ip=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$ip=  ( $matches[0].Groups[1].Value )

$regex= [regex] 'mask=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mask=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'gateway=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$gateway=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'mac=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mac =  ($matches[0].Value -replace "mac=",""  ).toUpper()  

$ipinfo = Get-Content "F:\ip.txt"
$regex2= [regex]"\u4ee5\u592a\u7f51\u9002\u914d\u5668\s(.*?):.*?\u7269\u7406\u5730\u5740.*?:\s(.*?)\s"
$matches = $regex2.Matches($ipinfo,[System.Text.RegularExpressions.RegexOptions]::Singleline)

foreach ($match in $matches)
{
$tmac = $match.Groups[2].Value -replace "-",":"
if ($tmac.contains($mac) )
{
$cmd = "int ipv4 set address name=""" + $match.Groups[1].Value + """ static " + $ip +" " + $mask +" " + $gateway 
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

$cmd = "int ipv4 set dns name=""" + $match.Groups[1].Value + """ static 8.8.8.8"
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;
            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

[System.IO.File]::Delete("F:\net.bat")
}
}
}


if ([System.IO.File]::Exists("G:\net.bat"))
{
& "ipconfig.exe" '/all' > "G:\ip.txt"
$config = Get-Content "G:\net.bat"

$regex= [regex] 'ip=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$ip=  ( $matches[0].Groups[1].Value )

$regex= [regex] 'mask=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mask=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'gateway=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$gateway=   ( $matches[0].Groups[1].Value )

$regex= [regex] 'mac=([\.\d\w:]*)'
$matches = $regex.Matches($config)
$mac =  ($matches[0].Value -replace "mac=",""  ).toUpper()  

$ipinfo = Get-Content "G:\ip.txt"
$regex2= [regex]"\u4ee5\u592a\u7f51\u9002\u914d\u5668\s(.*?):.*?\u7269\u7406\u5730\u5740.*?:\s(.*?)\s"
$matches = $regex2.Matches($ipinfo,[System.Text.RegularExpressions.RegexOptions]::Singleline)

foreach ($match in $matches)
{
$tmac = $match.Groups[2].Value -replace "-",":"
if ($tmac.contains($mac) )
{
$cmd = "int ipv4 set address name=""" + $match.Groups[1].Value + """ static " + $ip +" " + $mask +" " + $gateway 
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

$cmd = "int ipv4 set dns name=""" + $match.Groups[1].Value + """ static 8.8.8.8"
$Info = New-Object System.Diagnostics.ProcessStartInfo
            $Info.FileName = "C:\windows\system32\netsh.exe"
            $Info.Arguments = $cmd;
            
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $Info
$process.Start() 

[System.IO.File]::Delete("G:\net.bat")
}
}
}
