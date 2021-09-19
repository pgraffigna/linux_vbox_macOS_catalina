#!/bin/bash
#tweaks para que funcione macOS en VBox

VM_NAME="Catalina"

#Colores
greenColor="\e[0;32m\033[1m"
endColor="\033[0m\e[0m"

/usr/bin/vboxmanage modifyvm $VM_NAME --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
/usr/bin/vboxmanage modifyvm $VM_NAME --cpu-profile "Intel Core i7-6700K"
/usr/bin/vboxmanage setextradata $VM_NAME "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
/usr/bin/vboxmanage setextradata $VM_NAME "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
/usr/bin/vboxmanage setextradata $VM_NAME "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Hackboard"
/usr/bin/vboxmanage setextradata $VM_NAME "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
/usr/bin/vboxmanage setextradata $VM_NAME "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
/usr/bin/vboxmanage setextradata $VM_NAME VBoxInternal2/EfiGraphicsResolution 1280x800

echo -e "${greenColor}Configuración activada!! ${endColor}"

# diferentes tipos de procesadores para probar
#VBoxManage modifyvm "-----" --cpu-profile "Intel Xeon X5482 3.20GHz"
#VBoxManage modifyvm "-----" --cpu-profile "Intel Core i7-2635QM"
#VBoxManage modifyvm "-----" --cpu-profile "Intel Core i7-3960X"
#VBoxManage modifyvm "-----" --cpu-profile "Intel Core i5-3570"
#VBoxManage modifyvm "-----" --cpu-profile "Intel Core i7-5600U"
#VBoxManage modifyvm "-----" --cpu-profile "Intel Core i7-6700K"

