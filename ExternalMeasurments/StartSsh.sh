sudo service ssh start
echo "X11Forwarding yes" | sudo tee -a /etc/ssh/sshd_config
echo "X11UseLocalhost no" | sudo tee -a /etc/ssh/sshd_config
sudo service ssh restart

dotnet /home/rsp/Desktop/linux-armRsp/RspMeasuringDevice.dll
dotnet /home/rsp/Desktop/linux-armRsp/BBPlug.dll