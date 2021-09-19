#!/bin/bash
#script para la creación de VM en VBox

VM_NAME="Cata"
VM_FOLDER="/home/pgraffigna/datos/virtualbox"
VMDK="/home/pgraffigna/datos/isos/macOS_Catalina.vmdk"
CPU=8
MEM=8000
VRAM=128
OS=MacOS_64

#Colores
greenColor="\e[0;32m\033[1m"
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
endColor="\033[0m\e[0m"

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado ${endColor}"
        exit 0
}

echo -e "${yellowColor}Creando la VM ${endColor}\n"
/usr/bin/vboxmanage createvm --name $VM_NAME --ostype $OS --register &>/dev/null 

echo -e "${yellowColor}Habilitando EFI ${endColor}\n"
/usr/bin/vboxmanage modifyvm $VM_NAME --firmware efi

echo -e "${yellowColor}Configurando CPU, RAM y video RAM ${endColor}\n"
/usr/bin/vboxmanage modifyvm $VM_NAME --cpus $CPU --memory $MEM --vram $VRAM

echo -e "${yellowColor}Configurando el adaptador de red ${endColor}\n"
/usr/bin/vboxmanage modifyvm $VM_NAME --nic1 nat
#/usr/bin/vboxmanage modifyvm $VM_NAME --nic1 bridged --bridgeadapter1 eth0

echo -e "${yellowColor}Activando USB ${endColor}\n"
/usr/bin/vboxmanage modifyvm $VM_NAME --mouse usbtablet --usbxhci on 

echo -e "${yellowColor}Creando disco de tipo dinamico y agregando el ISO ${endColor}\n"
/usr/bin/vboxmanage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAhci

/usr/bin/vboxmanage storageattach $VM_NAME --storagectl "SATA Controller" --type hdd --port 0 --device 0 --medium $VMDK
/usr/bin/vboxmanage modifyvm $VM_NAME --boot1 disk --boot2 dvd --boot3 none --boot4 none

echo -e "${greenColor}La VM esta lista!! ${endColor}"



