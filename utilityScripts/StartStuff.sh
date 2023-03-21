rm * ~/Desktop/Scope
nohup dotnet Desktop/linux-armRsp/RspMeasuringDevice.dll &> /dev/null &
nohup dotnet Desktop/linux-armPlug/BBPlug.dll  &>/dev/null &