@echo off
echo === Changing RDP port to 61249 ===
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 61249 /f

echo === Opening firewall ===
netsh advfirewall firewall add rule name="RDP 61249" dir=in action=allow protocol=TCP localport=61249

echo === Setting password ===
net user runneradmin "Forenzyra#2026!Kx9mZ4pL"

echo === Verifying ===
reg query "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber
net user runneradmin | findstr /i "Password"

echo === Done ===
