@echo off
:: Отключение вывода команд
title Очистка системы от временных файлов и кэша
color 0A

:: Вывод сообщения о начале процесса очистки
echo Начинается очистка временных файлов и кэша...
echo.

:: Очистка временных файлов системы
echo Очистка системного кэша...
del /s /q %TEMP%\*
for /d %%p in (%TEMP%\*) do @rd /s /q "%%p"

del /s /q %SystemRoot%\Temp\*
for /d %%p in (%SystemRoot%\Temp\*) do @rd /s /q "%%p"

:: Очистка кэша браузера Google Chrome
echo Очистка кэша Google Chrome...
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
    del /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*"
    for /d %%p in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*") do @rd /s /q "%%p"
)

:: Очистка кэша Mozilla Firefox
echo Очистка кэша Mozilla Firefox...
if exist "%APPDATA%\Mozilla\Firefox\Profiles" (
    for /d %%p in ("%APPDATA%\Mozilla\Firefox\Profiles\*\cache2") do @rd /s /q "%%p"
)

:: Очистка кэша Microsoft Edge
echo Очистка кэша Microsoft Edge...
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
    del /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*"
    for /d %%p in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*") do @rd /s /q "%%p"
)

:: Очистка временных файлов Internet Explorer
echo Очистка временных файлов Internet Explorer...
if exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache" (
    del /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*"
    for /d %%p in ("%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*") do @rd /s /q "%%p"
)

:: Очистка временных файлов программ
echo Очистка временных файлов программ...
if exist "%USERPROFILE%\AppData\Local\Temp" (
    del /s /q "%USERPROFILE%\AppData\Local\Temp\*"
    for /d %%p in ("%USERPROFILE%\AppData\Local\Temp\*") do @rd /s /q "%%p"
)

:: Очистка журнала установок Windows
echo Очистка журнала установок Windows...
if exist "%SystemRoot%\SoftwareDistribution\Download" (
    del /s /q "%SystemRoot%\SoftwareDistribution\Download\*"
    for /d %%p in ("%SystemRoot%\SoftwareDistribution\Download\*") do @rd /s /q "%%p"
)

:: Очистка старых версий Windows
echo Очистка старых версий Windows...
if exist "%SystemRoot%\WinSxS\Backup" (
    del /s /q "%SystemRoot%\WinSxS\Backup\*"
    for /d %%p in ("%SystemRoot%\WinSxS\Backup\*") do @rd /s /q "%%p"
)

:: Очистка журнала событий Windows
echo Очистка журнала событий Windows...
wevtutil el | For %%X in ('more') Do wevtutil cl "%%X"

:: Завершение процесса очистки
echo.
echo Очистка завершена!
pause
exit