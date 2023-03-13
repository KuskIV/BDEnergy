#NoEnv
SendMode Input  

RunAs, Administrator
  {
    WinWait, Windows PowerShell, 
    IfWinNotActive, Windows PowerShell, , WinActivate, Windows PowerShell, 
    WinWaitActive, Windows PowerShell, 
    Send, cd C:\Users\Mads Kusk\git\BDEnergy\bd-energy-framework\BDEnergyFramework\bin\Release\net6.0{Enter}
    Send, .\BdEnergyFramework.exe --config Json\Mhk\MhkValidConfig.json{Enter}
  }