To create a startup shortcut for start-exp.ps1, follow these steps:

1. Right-click on it and choose "Create shortcut".
2. Right-click on the newly-created shortcut and choose "Properties".
3. In the "Target" box, paste the below text IN FRONT OF the text that's already there. (Do NOT replace the text that's there. DO make sure that there is a space between the -File and the text that's already there.)

%SystemRoot%\syswow64\WindowsPowerShell\v1.0\powershell.exe -File 

4. Paste the below text into the "Start in" box:

%HOMEDRIVE%%HOMEPATH%

5. Click OK
6. Move the shortcut to the C:\Users\HRVT_7\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup directory.