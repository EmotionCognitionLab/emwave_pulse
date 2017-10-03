# Function to maximize/minimize/hide etc. a given window
# Modified version of https://gist.github.com/jakeballard/11240204
# Usage: Set-WindowStyle <Style> <ProcessId>
# Operates on whatever the MainWindowHandle of ProcessId is

﻿function Set-WindowStyle {
param(
    [Parameter()]
    [ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE', 
                 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED', 
                 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
    $Style = 'SHOW',

    [Parameter()]
    $ProcId,
    
    [Parameter()]
    $MainWindowHandle = (Get-Process –id $ProcId).MainWindowHandle
)
    $WindowStates = @{
        'FORCEMINIMIZE'   = 11
        'HIDE'            = 0
        'MAXIMIZE'        = 3
        'MINIMIZE'        = 6
        'RESTORE'         = 9
        'SHOW'            = 5
        'SHOWDEFAULT'     = 10
        'SHOWMAXIMIZED'   = 3
        'SHOWMINIMIZED'   = 2
        'SHOWMINNOACTIVE' = 7
        'SHOWNA'          = 8
        'SHOWNOACTIVATE'  = 4
        'SHOWNORMAL'      = 1
    }
    
    $Win32ShowWindowAsync = Add-Type –memberDefinition @” 
    [DllImport("user32.dll")] 
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); 
“@ -name “Win32ShowWindowAsync” -namespace Win32Functions –passThru
    
    $Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$Style]) | Out-Null
    Write-Verbose ("Set Window Style '{1} on '{0}'" -f $MainWindowHandle, $Style)

}

# start emWave, wait a little while for it to fire up, hide it, start our app
$emwv = start-process -PassThru "C:\Program Files (x86)\HeartMath\emWave\emwavepc.exe"
Start-Sleep 3
Set-WindowStyle HIDE $emwv.Id
start-process -WindowStyle Maximized -ArgumentList "$($emwv.Id)" "C:\Users\HRVT_7\Documents\Release\emwave_pulse_PC_App.exe"
