@echo off
echo. Windows Updates remover, download unix utils (cut,sed,grep)
echo. in order to use this batch.
echo. Download from here: http://unxutils.sourceforge.net/
echo._________________________________________________________
echo. Getting the list of updates
@wmic qfe get |grep "Security Update" | sed "s/[\t ][\t ]*/ /g" | cut -d " " -f5 | cut -c 3- >remove.txt
echo. Prepairing the script...
@for /f %%i in ('type remove.txt') do echo wusa /quiet /uninstall /kb:%%i /norestart >>new.cmd
echo del %0 >>new.cmd
echo. Cleaning up...
del /f remove.txt
echo.Press any key to start the uninstall process..
pause >nul
call new.cmd
