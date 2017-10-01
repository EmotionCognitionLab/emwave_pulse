$emwv = start-process -WindowStyle Hidden -PassThru "C:\Program Files (x86)\HeartMath\emWave\emwavepc.exe"

start-process -WindowStyle Maximized -ArgumentList "$($emwv.Id)" "C:\Users\HRVT_7\Documents\Executable_8_29\emwave_pulse_PC_App.exe"