# notas_macOS-sierra-virtualbox

## configuración macOS sierra en Virtualbox (AMD cpu)

cd "C:\Program Files\Oracle\VirtualBox\"

VBoxManage modifyvm "NOMBRE_VM" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff

VBoxManage setextradata "NOMBRE_VM" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"

VBoxManage setextradata "NOMBRE_VM" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"

VBoxManage setextradata "NOMBRE_VM" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "sykeyxam"

VBoxManage setextradata "NOMBRE_VM" "VBoxInternal/Devices/smc/0/Config/DeviceKey" 
"ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"

VBoxManage setextradata "NOMBRE_VM" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

VBoxManage modifyvm "NOMBRE_VM" --cpu-profile "Intel Core i7-2635QM"

VBoxManage setextradata "NOMBRE_VM" VBoxInternal2/EfiGraphicsResolution 1920x1080
